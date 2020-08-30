---
layout: page
title: Low Power Implantable Spike Sorting Scheme based on Neuromorphic Classifier with Supervised Training Engine
description: Developing implantable neural spike sorting circuits.
img: /assets/img/spikesorting.png
---
An ultra-low power neural spike sorting technique for implantable, multi-channel neural implant is proposed. It involves a spiking neural network (SNN) with binary weights as an energy and area efficient classifier, along with a suitable frontend for spike encoding of the recorded neuro-potential. The proposed scheme employs   two step training to implement supervised learning for the classifier, in order to achieve appreciable classification accuracy, along with low power dissipation. During the 1st phase a k-mean clustering module is trained with the real-time input data. In the 2nd phase, the trained means are used to perform supervised learning  for the SNN classifier. After the training process, the low power SNN  module is used for the classification task. In the proposed scheme, the K-means training module can be shared among large number of channels for training the dedicated SNN modules, which are relatively compact and can operate with ~4x lower power (as compared to the K-means sorter), while preserving the classification accuracy. Algorithm and architecture level optimizations for the proposed system are presented.

The report can be found [here](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7987530){:target="\_blank"}.

<!-- <div style="text-align: center"><img src="/assets/img/ss.png" width="700" height="auto" /></div>
<div class="col three caption">
    Architecture
</div> -->

<div class="img_row">
    <img class="col one left" src="{{ site.baseurl }}/assets/img/ss.png" alt="" title="example image"/>
    <img class="col one left" src="{{ site.baseurl }}/assets/img/spikesorting.png" alt="" title="example image"/>
    <img class="col one left" src="{{ site.baseurl }}/assets/img/ss2.png" alt="" title="example image"/>
    <!-- <img class="col one left" src="{{ site.baseurl }}/assets/img/3.jpg" alt="" title="example image"/> -->
</div>
<div class="col three caption">
    Algorithm. Architecture. CCO to SNN encoding.
</div>

<!-- Every project has a beautiful feature shocase page. It's easy to include images, in a flexible 3-column grid format. Make your photos 1/3, 2/3, or full width.

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
