---
layout: page
title: Deep Generative Models
description: Deep generative models are fascinating. This project attemps to study and contrast the various approaches for generative modelling.
img: /assets/img/GAN_celeba_30.png
---

Generative Modelling is the method of learning data distributions in an unsupervised manner which could be used to generate new data-points. Leveraging recent advances in deep learning, generative modelling when carried out on images leads to extremely realistic looking synthetic examples. In this project, we study 3 frameworks that are popularly used for this purpose: Generative Adversarial Networks (GANs) , Variational Auto-encoders (VAEs) and Normalizing Flows (NFs).


The codes for Generative Adversarial Networks and its variations can be found [here](https://github.com/saurabhdash/DeepGenerativeModels-GANandWGAN){:target="\_blank"}.
The report can be found [here]({{ site.baseurl }}{{post.url}}/assets/pdf/Stat_ML_Report.pdf){:target="\_blank"}.

To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: Project
    description: a project with a background image. 
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
</div>
