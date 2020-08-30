---
layout: page
title: Hessian-Driven Unequal Protection of DNN Parameters for Robust Inference
description: Algorithmic approach to designing robust NVM based PIM architectures
img: /assets/img/overview.png
---

This work presents an algorithmic approach to design reliable deep neural networks (DNN) in the presence of stochastic variations in he network parameters induced by process variations in the bit-cells in a processing-in-memory (PIM) architecture. We propose and derive a Hessian based sensitivity metric that can be computed without computing or storing the full Hessian to identify and protectthe “important" network parameters while allowing large variations in unprotected parameters. Experiments on modern DNNs like ResNet, MobileNetv2, DenseNet on CIFAR10 demonstrates thatby shielding only a small (1%−5%) fraction of parameters one can achieve less than 1% accuracy degradation even under large (50%)stochastic variations in other parameters.

The report can be found [here](){:target="\_blank"}.

<div style="text-align: center"><img src="/assets/img/overview.png" width="700" height="auto" /></div>
<div class="col three caption">
    Overview
</div>

<!-- The codes can be found [here](https://github.com/saurabhdash/CompNeuroProject4){:target="\_blank"}. -->

<!-- 
Every project has a beautiful feature shocase page. It's easy to include images, in a flexible 3-column grid format. Make your photos 1/3, 2/3, or full width.

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
