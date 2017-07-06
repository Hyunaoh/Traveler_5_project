<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>여행가 - 여행을 더하다</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

	<style>
		/* For demo purpose only */
		/* For Demo Purposes Only ( You can delete this anytime :-) */
		#colour-variations {
			padding: 10px;
			-webkit-transition: 0.5s;
		  	-o-transition: 0.5s;
		  	transition: 0.5s;
			width: 140px;
			position: fixed;
			left: 0;
			top: 100px;
			z-index: 999999;
			background: #fff;
			/*border-radius: 4px;*/
			border-top-right-radius: 4px;
			border-bottom-right-radius: 4px;
			-webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			-moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			margin-left: -140px;
		}
		#colour-variations.sleep {
			margin-left: 0px;
		}
		#colour-variations h3 {
			text-align: center;;
			font-size: 11px;
			letter-spacing: 2px;
			text-transform: uppercase;
			color: #777;
			margin: 0 0 10px 0;
			padding: 0;;
		}
		#colour-variations ul,
		#colour-variations ul li {
			padding: 0;
			margin: 0;
		}
		#colour-variations li {
			list-style: none;
			display: block;
			margin-bottom: 5px!important;
			float: left;
			width: 100%;
		}
		#colour-variations li a {
			width: 100%;
			position: relative;
			display: block;
			overflow: hidden;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			-ms-border-radius: 4px;
			border-radius: 4px;
			-webkit-transition: 0.4s;
			-o-transition: 0.4s;
			transition: 0.4s;
		}
		#colour-variations li a:hover {
		  	opacity: .9;
		}
		#colour-variations li a > span {
			width: 33.33%;
			height: 20px;
			float: left;
			display: -moz-inline-stack;
			display: inline-block;
			zoom: 1;
			*display: inline;
		}
		
		.option-toggle {
			position: absolute;
			right: 0;
			top: 0;
			margin-top: 5px;
			margin-right: -30px;
			width: 30px;
			height: 30px;
			background: #f64662;
			text-align: center;
			border-top-right-radius: 4px;
			border-bottom-right-radius: 4px;
			color: #fff;
			cursor: pointer;
			-webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			-moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
			box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		}
		.option-toggle i {
			top: 2px;
			position: relative;
		}
		.option-toggle:hover, .option-toggle:focus, .option-toggle:active {
			color:  #fff;
			text-decoration: none;
			outline: none;
		}
	</style>
	<!-- End demo purposes only -->
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	
	<section id="fh5co-home" style="background-image: url(<c:url value='/resources/images/bg.jpg' />);" data-section="home">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate">쉽게 가이드 받고, 편하게 여행하자!</h1>
							<h2 class="to-animate">여행을 하면서 길을 잃거나, 자세한 정보를 얻고 싶지는 않았나요?<br><a href="find/findListForm.go" target="_blank">가이드를 찾아보거나</a> <a href="find/findListForm.go" target="_blank">도움을 요청하세요!</a></h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>
	
	<section id="fh5co-intro">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<div class="fh5co-block to-animate" style="background-image: url(<c:url value='/resources/images/img_7.jpg' />);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon icon-bulb"></i>
						<h2>Plan</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
						<p><a href="#" class="btn btn-primary">Get In Touch</a></p>
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(<c:url value='/resources/images/img_8.jpg' />);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon icon-wrench"></i>
						<h2>Develop</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
						<p><a href="#" class="btn btn-primary">Click Me</a></p>
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(<c:url value='/resources/images/img_10.jpg' />);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon icon-rocket"></i>
						<h2>Launch</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
						<p><a href="#" class="btn btn-primary">Why Us?</a></p>
					</div>
				</div>
			</div>
			<div class="row watch-video text-center to-animate">
				<span>Watch the video</span>
				<a href="https://www.youtube.com/watch?v=5vMKmUkiLeI" class="popup-vimeo btn-video"><i class="icon-play2"></i></a>
			</div>
		</div>
	</section>

	<section id="fh5co-work" data-section="work">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">Work</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-bottom-padded-sm">
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_1.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_1.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 1</h2>
							<span>Branding</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_2.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_2.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 2</h2>
							<span>Web</span>
						</div>
					</a>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_3.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_3.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 3</h2>
							<span>Web</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_4.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_4.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 4</h2>
							<span>UI/UX</span>
						</div>
					</a>
				</div>
				
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_5.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_5.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 1</h2>
							<span>Photography</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_6.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_6.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 2</h2>
							<span>Illustration</span>
						</div>
					</a>
				</div>
				
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_7.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_7.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 3</h2>
							<span>Web</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_8.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_8.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 4</h2>
							<span>Sketch</span>
						</div>
					</a>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_1.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_1.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 2</h2>
							<span>Illustration</span>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center to-animate">
					<p>* Demo images from <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-testimonials" data-section="testimonials">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">Testimonials</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="<c:url value="/resources/images/person1.jpg" />" alt="Person"></figure>
							<p>
							Jean Doe, CEO <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.&rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src=<c:url value="/resources/images/person2.jpg" /> alt="Person"></figure>
							<p>
							John Doe, Senior UI <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. &rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="<c:url value="/resources/images/person3.jpg" />" alt="Person"></figure>
							<p>
							Chris Nash, Director <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</section>


	<section id="fh5co-services" data-section="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-left">
					<h2 class=" left-border to-animate">Services</h2>
					<div class="row">
						<div class="col-md-8 subtext to-animate">
							<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-anchor"></i>
					<h3>Brand &amp; Strategy</h3>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
				</div>
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-layers2"></i>
					<h3>Web &amp; Interface</h3>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-video2"></i>
					<h3>Photo &amp; Video</h3>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
				</div>
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-monitor"></i>
					<h3>CMS &amp; eCommerce</h3>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean</p>
				 </div>
			</div>
		</div>
	</section>
	
	<section id="fh5co-about" data-section="about">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">About</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="fh5co-person text-center to-animate">
						<figure><img src="<c:url value="/resources/images/person1.jpg" />" alt="Image"></figure>
						<h3>Jean Smith</h3>
						<span class="fh5co-position">Web Designer</span>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
						<ul class="social social-circle">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="fh5co-person text-center to-animate">
						<figure><img src="<c:url value="/resources/images/person2.jpg" />" alt="Image"></figure>
						<h3>Rob Smith</h3>
						<span class="fh5co-position">Web Developer</span>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
						<ul class="social social-circle">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-github"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="fh5co-person text-center to-animate">
						<figure><img src="<c:url value="/resources/images/person3.jpg" />" alt="Image"></figure>
						<h3>Larry Ben</h3>
						<span class="fh5co-position">Web Designer</span>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
						<ul class="social social-circle">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="fh5co-counters" style="background-image: url(<c:url value='/resources/images/full_image_1.jpg' />);" data-stellar-background-ratio="0.5">
		<div class="fh5co-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center to-animate">
					<h2>Fun Facts</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-briefcase to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="89" data-speed="5000" data-refresh-interval="50">89</span>
						<span class="fh5co-counter-label">Finished projects</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-code to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="2343409" data-speed="5000" data-refresh-interval="50">2343409</span>
						<span class="fh5co-counter-label">Line of codes</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-cup to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="1302" data-speed="5000" data-refresh-interval="50">1302</span>
						<span class="fh5co-counter-label">Cup of coffees</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-people to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="52" data-speed="5000" data-refresh-interval="50">52</span>
						<span class="fh5co-counter-label">Happy clients</span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-contact" data-section="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">Get In Touch</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-bottom-padded-md">
				<div class="col-md-6 to-animate">
					<h3>Contact Info</h3>
					<ul class="fh5co-contact-info">
						<li class="fh5co-contact-address ">
							<i class="icon-home"></i>
							5555 Love Paradise 56 New Clity 5655, <br>Excel Tower United Kingdom
						</li>
						<li><i class="icon-phone"></i> (123) 465-6789</li>
						<li><i class="icon-envelope"></i>info@freehtml5.co</li>
						<li><i class="icon-globe"></i> <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></li>
					</ul>
				</div>

				<div class="col-md-6 to-animate">
					<h3>Contact Form</h3>
					<div class="form-group ">
						<label for="name" class="sr-only">Name</label>
						<input id="name" class="form-control" placeholder="Name" type="text">
					</div>
					<div class="form-group ">
						<label for="email" class="sr-only">Email</label>
						<input id="email" class="form-control" placeholder="Email" type="email">
					</div>
					<div class="form-group ">
						<label for="phone" class="sr-only">Phone</label>
						<input id="phone" class="form-control" placeholder="Phone" type="text">
					</div>
					<div class="form-group ">
						<label for="message" class="sr-only">Message</label>
						<textarea name="" id="message" cols="30" rows="5" class="form-control" placeholder="Message"></textarea>
					</div>
					<div class="form-group ">
						<input class="btn btn-primary btn-lg" value="Send Message" type="submit">
					</div>
					</div>
				</div>
			</div>
		<div id="map" class="to-animate"></div>
	</section>
	
	<footer id="footer" role="contentinfo">
		<a href="#" class="gotop js-gotop"><i class="icon-arrow-up2"></i></a>
		<div class="container">
			<div class="">
				<div class="col-md-12 text-center">
					<p>&copy; Elate Free HTML5. All Rights Reserved. <br>Created by <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> Images: <a href="http://pexels.com/" target="_blank">Pexels</a>, <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="social social-circle">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-youtube"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	
	<!-- For demo purposes Only ( You may delete this anytime :-) -->
	<div id="colour-variations">
		<a class="option-toggle"><i class="icon-gear"></i></a>
		<h3>Preset Colors</h3>
		<ul>
			<li>
				<a href="javascript: void(0);" data-theme="style">
					<span style="background: #3f95ea;"></span>
					<span style="background: #52d3aa;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			<li>
				<a href="javascript: void(0);" data-theme="style2">
					<span style="background: #329998;"></span>
					<span style="background: #6cc99c;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			<li>
				<a href="javascript: void(0);" data-theme="style3">
					<span style="background: #9f466e;"></span>
					<span style="background: #c24d67;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			<li>
				<a href="javascript: void(0);" data-theme="style4">
					<span style="background: #21825C;"></span>
					<span style="background: #A4D792;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			
		</ul>
	</div>
	<!-- End demo purposes only -->

	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"/>"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.easing.1.3.js"/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"/>"></script>
	<!-- Waypoints -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.waypoints.min.js"/>"></script>
	<!-- Stellar Parallax -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.stellar.min.js"/>"></script>
	<!-- Counter -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.countTo.js"/>"></script>
	<!-- Magnific Popup -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap/magnific-popup-options.js"/>"></script>

	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="<c:url value="/resources/js/bootstrap/google_map.js"/>"></script>

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.style.switcher.js"/>"></script>

	
	<h4><a href="review/logintest.go">logintest</a></h4>
	
</body>
	<script>
		$(function(){
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
		});
	</script>
	<!-- End demo purposes only -->

	</body>

	<h4><a href="find/findListForm.go">find</a></h4>
	<a href="review/writeform.go">testReview</a>
</body>

</html>
