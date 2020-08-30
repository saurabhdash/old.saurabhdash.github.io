---
layout: page
title: Physics-Incorporated Convolutional Recurrent Neural Networks for Source Identification and Forecasting of Dynamical Systems
description: Efficient learning in Dynamical Systems with physics prior.
img: /assets/img/phicnet.png
---

Spatio-temporal dynamics of physical processes are generally modeled using partial differential equations (PDEs). Though the core dynamics follows some principles of physics, real-world physical processes are often driven by unknown external sources. In such cases, developing a purely analytical model becomes very difficult and data-driven modeling can be of assistance. In this paper, we present a hybrid framework combining physics-based numerical models with deep learning for source identification and forecasting of spatio-temporal dynamical systems with unobservable time-varying external sources. We formulate our model PhICNet as a convolutional recurrent neural network (RNN) which is end-to-end trainable for spatio-temporal evolution prediction of dynamical systems and learns the source behavior as an internal state of the RNN. Experimental results show that the proposed model can forecast the dynamics for a relatively long time and identify the sources as well. 

The report can be found [here](https://arxiv.org/pdf/2004.06243.pdf){:target="\_blank"}.

<div style="text-align: center"><img src="/assets/img/phicnet-res.png" width="700" height="auto" /></div>
<div class="col three caption">
    Results
</div>

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
