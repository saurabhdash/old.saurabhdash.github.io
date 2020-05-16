---
layout: page
title: Circuit Partitioning using Deep Learning
description: This project leverages Graph Convolutional Networks to partition a circuit hypergraph.
img: /assets/img/partiton.png
---

This project attempts to solve the problem of circuit partitioning. Due to the combinatorial nature of the problem, it is an NP Hard problem which is usually solved approximately with the help of Heuristics. In contrast to these approaches, we follow the framework [GAP](https://arxiv.org/pdf/1903.00614.pdf/){:target="\_blank"} which is a deep learning based approach to the above problem by using [Graph Convolutional Networks](https://arxiv.org/pdf/1609.02907.pdf){:target="\_blank"}.

The Code for this implementation can be found [here](https://github.com/saurabhdash/GCN_Partitioning/tree/PDAproject){:target="\_blank"}.

### Problem Formulation ###
Circuits can be represented as hypergraphs, where the hyperedges connect the various nodes in the circuits. The advantage of such a representation is that unlike their graph counterparts a single hyperedge can connect multiple (more than 2) nodes which makes it a powerful tool to represent wires with multiple fan outs. 
In such a scenario, the partitioning objective is to divide the circuit into g (greater than or equal to 2) equal parts such that the hyperedge-cut is minimized. 

Due to the availability of powerful graph operations, we convert the hypergraph to a graph and introduce a proxy objective – minimize the edge-cut in the converted graph. We employ a k clique-based conversion to convert a hyperedge that connects multiple nodes to multiple edges whose weights are given by:
$$w(edge)=   \frac{1}{(k-1)}$$
Where k is the number of nodes in a hyperedge. 

This conversion gives us an equivalent adjacency matrix that is used by our algorithm to assign nodes to partitions. Minimizing the edge-cut for this equivalent graph, strongly corresponds to reduction in hyperedge cuts. 


### Deep Learning Model ###

The deep learning model can be divided into 2 components:

•	Graph Embedding Module

•	Graph Partitioning Module

<div style="text-align: center"><img src="/assets/img/GAP.png" width="700" height="auto" /></div>
<div class="col three caption">
Model Architecture
</div>

#### Graph Embedding Module ####
The idea behind using a Graph Embedding module is to act as feature extractor that could be used to decide which partition to assign the node to. These embeddings would need to be both a function of node features and the local geometry of the graph. This is where [Graph Convolutional Networks](https://arxiv.org/pdf/1609.02907.pdf){:target="\_blank"} (GCN) are used to learn the graph representations. 

A single layer of GCN implements the following function:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace X^{i+1} = \tanh(\hat{A}X^{i}W^{i})
\end{alignedat}
$$

Where $$X^i$$ is an $$n \times d$$ matrix that represents the embeddings learnt in the $$i^{th}$$ layer. $$W^i$$ is a learnable parameter that represents how to weight the embeddings in $$X^i$$. $$\hat{A} = D^{-1/2} \tilde{A} D^{-1/2}$$.  $$\tilde{A} = A+ I_n$$ where $$A$$ is the adjacency matrix and $$I_n$$ is the identity matrix. $$D$$ is a diagonal matrix whose diagonal term $$D_i = \sum_{j} \tilde{A}_{ij}$$.

(An intuition to how the above propagation rule works can be found in [this](https://tkipf.github.io/graph-convolutional-networks/){:target="\_blank"} amazing post by Thomas Kipf.)


#### Graph Partitioning Module ####
Once the node embeddings are generated for all nodes, all that is needed is to use these embeddings/ features to predict which partition a particular node belongs to. This can be done using a simple fully-connected neural network which take the embeddings as inputs and outputs the partition probabilities $$Y$$ - probability of a node belonging to a partition. This is implemented using the function:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace Y = softmax(W^{T} X)
\end{alignedat}
$$

#### Loss Function ####
We relax the graph partitioning problem which is combinatorial in nature and make it continuous and differentiable by defining an appropriate loss function that captures edge-cut objective. 

Let the converted graph be represented as $$G(V,E)$$ with nodes $$V= \{v_i \}$$ and edges $$ E = \{e(v_i,v_j) \mid v_i \in V, v_j \in V \}$$. Let the disjoint partitions of the graph be $$ S_1,S_2, \dots S_g $$.
 
The Normalized cut, $$ncut(S_k,\bar{S_k})$$ can be defined as:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace ncut(S_k,\bar{S_k}) = \sum_{k=1}^{g} \frac{cut(S_k, \bar{S_k})}{vol(S_k , V)}
\end{alignedat}
$$
 
Where, $$cut(S_k, \bar{S_k})= \sum_{v_i \in S_k, v_j \in \bar{S_k}} e(v_i,v_j)$$ . This is the total weight of edges that are going out of a partition.
and $$vol(S_k, V) = \sum_{v_i \in S_k, v_j \in V} e(v_i, v_j)$$. This is the total degree of nodes in $$S_k$$.

If, $$Y_{ik}$$ represent the probability that node $$i$$ belongs to partition $$k$$, then the expected value of the cut can be represented as:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \mathbb{E} [cut(S_k,\bar{S_k})] = \sum_{v_i \in S_k , v_j \in \mathcal{N}(v_i)} \sum_{z=1}^{g} Y_{iz} (1 - Y_{jz})
\end{alignedat}
$$


$$\mathcal{N}(v_i)$$ represents to nodes adjacent to $$v_i$$. This information can be retrieved by using a Hadamard product with the adjacency matrix $$A$$. Thus, the above equation can be simplified as:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \mathbb{E} [cut(S_k,\bar{S_k})] = \sum_{reduce-sum} Y_{:,k} (1 - Y_{:,k})^{T} \odot A
\end{alignedat}
$$

Let $$D$$ be a column vector of size $$n$$ where $$D_i$$ is the degree of node $$i$$. Then,

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \Gamma = Y^T D
\end{alignedat}
$$

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \Gamma_k = \mathbb{E}[vol(S_k,V)]
\end{alignedat}
$$

$$\Gamma$$ is a column vector of length $$g$$. Combining the above two equations, 

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \mathcal{L}_{Ncut} = \mathbb{E} [Ncut(S_k,\bar{S_k})] = \sum_{reduce-sum} (Y/ \Gamma) (1 - Y)^{T} \odot A
\end{alignedat}
$$

/ represents element-wise division. To further enforce balanced partition, we enforce an additional balance penalty term defined as:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \mathcal{L}_{bal} = \sum_{reduce-sum} \| \frac{1}{n} \mathbf{1}^{T} Y - \frac{1}{g} \|_{2}^{2}
\end{alignedat}
$$

Thus, the final loss function that the model tries to minimize is:

$$
\begin{alignedat}{2}
    \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\; \enspace \mathcal{L} = \mathcal{L}_{Ncut} + \beta \mathcal{L}_{bal}
\end{alignedat}
$$

Where $$\beta$$ allows us to control the tradeoff between balance and edge-cut minimization.



#### Implementation and Issues ####
The entire framework was implemented in python using the pytorch deep learning framework. We ran the model on an NVIDIA GTX1080ti GPU. The model that we implemented had the following specifications:

***Graph Embedding Module*** : 2 Layer GCN that takes in 1024 length feature vector per node.

Layer1: 1024 -> 256

Layer2: 256 -> 16

The first layer converts 1024 features per node to 256 which is then converted to 16 by the next layer. 

***Graph Partitioning Module*** : 1 Layer fully-connected neural network, that takes in 16 features per node and outputs the probability of the node being in one of the $$g$$ partitions.

The value of $$\beta$$ was set to be 1 unless otherwise specified.

For large circuits, the adjacency matrices are massive which requires them to be implemented in sparse matrix format. This proves to be a considerable challenge as the deep learning framework – pytorch which is used to implement the algorithm does not support automatic differentiation of sparse matrices. The loss function had to be implemented from scratch by deriving the derivatives and manually defining the backwards() method in pytorch. Although this overcame the memory bottleneck, this comes at a substantial hit to the speed of the implementation as the reduce-sum operation must be done by looping over non-zero A values. An attempt was made to parallelize this using the numba library but could not be implemented due to the lack of time. This could be an interesting avenue for future work. 
As the model was made deeper and wider by adding more layers and increasing the size of the embeddings, the model simply attributed all the nodes to a single partition to reduce the cut-size to 0. Increasing $$\beta$$ also had no affect as the model set all values of $$Y$$ to 0.5 to satisfy this constraint as well. 
As the nodes are featureless, initial node embeddings were generated using from a Normal distribution. This makes the model susceptible to the random seed and sometimes requires the training to be done multiple times to get a good result. 

#### Results ####

<br/>
<div style="text-align: center"><img src="/assets/img/traincut.png" width="700" height="auto" /></div>
<div class="col three caption">
    Progression of HyperEdge Cut as the training progresses
</div>
<br/>
<br/>


The table below shows the results for Circuit bi-partitioning. Edge weight cut refers to the ratio of the sum of weights of intersected graph edges by total weight of all graph edges.

|-------|--------|---------|-------|--------|---------|-------|--------|---------|---------|
| Circuit | Nodes | Hyper Edges | Partition 1 | Partition 2 | # Hyper-edges Cut | % Hyper-edges Cut | Edge weight Cut | Imbalance | Time |
|-------|--------|---------|-------|--------|---------|-------|--------|---------|---------|
|   Fract	|   149	|   147	|   75	|   74	|   11	|   7.4%	|   9.3%	|   0.366%	|   1.52s
|   Industry2	|   12637	|   13419	|   6651	|   5986	|   1773	|   13.2%	|   9.93%	|   2.63%	|   85.3s
|   Industry3	|   15406	|   21923	|   8329	|   7077	|   3744	|   17.2%	|   13.37%	|   4.06%	|   131s
|   P2	|   3014	|   3029	|   1582	|   1432	|   413	|   13.6%	|   8.65%	|   2.48%	|   18.4s
|   StructP	|   1952	|   1920	|   983	|   969	|   223	|   11.6%	|   11.71%	|   0.359%	|   11.6s
|   IBM01	|   12752	|   14111	|   6107	|   6645	|   2253	|   15.9%	|   11.78%	|   2.1%	|   84.8s
|-------|--------|---------|-------|--------|---------|-------|--------|---------|---------|



<!-- 
To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: Project
    description: a project with a background image
    img: /assets/img/12.jpg
    ---


<div class="img_row">
    <img class="col one left" src="{{ site.baseurl }}/assets/img/1.jpg" alt="" title="example image"/>
    <img class="col one left" src="{{ site.baseurl }}/assets/img/2.jpg" alt="" title="example image"/>
    <img class="col one left" src="{{ site.baseurl }}/assets/img/3.jpg" alt="" title="example image"/>
</div>
<div class="col three caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="img_row">
    <img class="col three left" src="{{ site.baseurl }}/assets/img/5.jpg" alt="" title="example image"/>
</div>
<div class="col three caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images. Say you wanted to write a little bit about your project before you posted the rest of the images. You describe how you toiled, sweated, *bled* for your project, and then.... you reveal it's glory in the next row of images.


<div class="img_row">
    <img class="col two left" src="{{ site.baseurl }}/assets/img/6.jpg" alt="" title="example image"/>
    <img class="col one left" src="{{ site.baseurl }}/assets/img/11.jpg" alt="" title="example image"/>
</div>
<div class="col three caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>


<br/><br/>


The code is simple. Just add a col class to your image, and another class specifying the width: one, two, or three columns wide. Here's the code for the last row of images above:

<div class="img_row">
    <img class="col two left" src="/img/6.jpg"/>
    <img class="col one left" src="/img/11.jpg"/>
</div> -->
