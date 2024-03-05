<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDTMC.Navigation" %>

<asp:Content ID="Content0" ContentPlaceHolderID="preload" runat="server">
	<link rel="preload" href="/images/2.0000/offer.webp" as="image">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];

	var sitemap = new Sitemap();
	var orderEntry = sitemap.SitemapList.GetItemById("order-now");

	Func<string> getOrderButton = (() =>
    {
		var html = @"<a href=""{{Page}}"" class=""button"">
			<span>{{Name}}</span>
		</a>";

		return html.Replace("{{Page}}", orderEntry.Page).Replace("{{Name}}", orderEntry.Name);
    });

	Func<string, string, string> renderLinkTemplateById = ((string id, string template) =>
    {
		var entry = sitemap.SitemapList.GetItemById(id);

		return template.Replace("{{Page}}", entry.Page).Replace("{{Name}}", entry.Name);
    });

	Func<string, string> getLinkById = ((string id) =>
    {
		return renderLinkTemplateById(id, @"<a href=""{{Page}}"">{{Name}}</a>");
    });
%>

<section aria-label="Deodorizing Cleanser, Body Spray & Ball Deodorant" class="view main-offer section">
	<div id="main" class="view__anchor"></div>
	<div class="view__in main-offer__in section__in">
		<div class="main-offer__group">
			<div class="main-offer__content">
				<div class="main-offer__header">
					<img src="/images/1.0000/man-care-for-your-man-parts.svg" alt="Man Care for your Man Parts&trade;" width="600" height="224">
				</div>
				<div class="main-offer__offer">
					<ul class="main-offer__title">
						<li>Deodorizing Cleanser</li>
						<li>Body Spray</li>
						<li>Ball Deodorant</li>
					</ul>
					<div class="main-offer__text">
						<p>Plus <b>FREE</b> Toiletry bag*</p>
						<small>*while supplies last</small>
					</div>
					<div class="main-offer__price">$29.99</div>
					<div class="main-offer__shipping">FREE SHIPPING</div>
					<div class="main-offer__button">
						<%= getOrderButton() %>
					</div>
				</div>
			</div>
			<picture class="main-offer__picture">
				<source srcset="/images/2.0000/offer.webp" type="image/webp">
				<img src="/images/2.0000/offer.png" alt="3 bottles of Trojan Man Care and 1 toiletry bag" width="800" height="692">
			</picture>
		</div>
	</div>
</section>

<section aria-labelledby="down-with-care-title" class="view content content--down-with-care section">
	<div id="down-with-care" class="view__anchor"></div>
	<div class="view__in content__in section__in">
		<div class="content__group">
			<div class="content__picture">
				<img src="/images/1.0000/naked-man-wo-shadow.png" alt="" width="779" height="598" loading="lazy">
				<small class="content__disclaimer">*data on file</small>
			</div>
			<div class="content__text">
				<h2 id="down-with-care-title" class="content__title">
					Let's Get Down With <em>Care Down There</em>
				</h2>
				<p>TROJAN Man Care&trade; products cleanse, deodorize and refresh skin for confidence above and below the belt.</p>
				<b class="content__caption">From America's #1 Trusted Condom Brand*</b>
				<small class="content__disclaimer">*data on file</small>
			</div>
		</div>
	</div>
</section>

<section aria-label="Trojan Man Care Products" class="view content content--product-info section">
	<div id="trojan-man-care-products" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block">
			<div class="content__group">
				<figure class="content__figure">
					<img class="content__picture" src="/images/1.0000/ball-deodorant.png" alt="" width="74" height="275" loading="lazy">
					<figcaption class="content__text">
						<div class="content__title">
							<em>Keep 'Em Dry</em> Ball Deodorant
						</div>
						<p>Fast-drying <b>ball deodorant</b> infused with Vitamin E helps keep your boys soothed and odor-free without the rub. Unscented and alcohol-free.</p>
					</figcaption>
				</figure>
				<figure class="content__figure">
					<img class="content__picture" src="/images/1.0000/deodorizing-cleanser.png" alt="" width="88" height="368" loading="lazy">
					<figcaption class="content__text">
						<div class="content__title">
							<em>Below the Belt</em> Deodorizing Cleanser
						</div>
						<p>In-shower foaming <b>body cleanser</b> deep cleans and moisturizes, above and below the belt, with
	natural hydrators like coconut oil and Vitamin E.</p>
					</figcaption>
				</figure>
				<figure class="content__figure">
					<img class="content__picture" src="/images/1.0000/deodorizing-body-spray.png" alt="" width="99" height="292" loading="lazy">
					<figcaption class="content__text">
						<div class="content__title">
							<em>Total Package</em> Deodorizing Body Spray
						</div>
						<p>Deodorizing <b>body spray</b> with long-lasting Cool Woods scent keeps you odor-free and confident knowing you smell great <em>everywhere</em>.</p>
					</figcaption>
				</figure>
			</div>
		</div>
		<div class="section__block">
			<div class="icon-text">
				<div class="icon-text__group">
					<figure class="icon-text__figure">
						<picture class="contain contain--square">
							<img src="/images/1.0000/cruelty-free.svg" alt="" loading="lazy" width="30" height="30">
						</picture>
						<figcaption>Cruelty Free</figcaption>
					</figure>
					<figure class="icon-text__figure">
						<picture class="contain contain--square">
							<img src="/images/1.0000/paraben-free.svg" alt="" loading="lazy" width="30" height="30">
						</picture>
						<figcaption>Paraben Free</figcaption>
					</figure>
					<figure class="icon-text__figure">
						<picture class="contain contain--square">
							<img src="/images/1.0000/vegan.svg" alt="" loading="lazy" width="30" height="30">
						</picture>
						<figcaption>Vegan</figcaption>
					</figure>
					<figure class="icon-text__figure">
						<picture class="contain contain--square">
							<img src="/images/1.0000/dry-free.svg" alt="" loading="lazy" width="30" height="30">
						</picture>
						<figcaption>Dye Free</figcaption>
					</figure>
				</div>
				<div class="icon-text__row icon-text__text">
					<%= renderLinkTemplateById("ingredients", @"<a href=""{{Page}}"">Ingredient Details</a>") %>
				</div>
				<div class="icon-text__row icon-text__button">
					<%= getOrderButton() %>
				</div>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="cool-woods-title" class="view content content--cool-woods section background-image">
	<div id="cool-woods" class="view__anchor"></div>
	<picture class="background-image__image">
		<img src="/images/1.0000/bg-mountain.jpg" alt="" loading="lazy">
	</picture>

	<div class="view__in content__in section__in">
		<div class="content__group">
			<figure class="content__picture picture-card-caption">
				<img src="/images/1.0000/naked-man-w-sign.png" alt="" width="395" height="567" loading="lazy">
				<figcaption class="picture-card-caption__caption">
					<span>It Takes Balls</span> 
					<em>To Smell</em> 
					<span>This Good</span>
				</figcaption>
			</figure>
			<div class="content__text">
				<div class="shadow-text">
					<div class="content__text shadow-text__text">
						<h2 class="content__title">
							The Scent of Confidence is <em>Cool Woods</em>
						</h2>
						<p>Imagine - you are guiding your partner through a mossy forest at dusk. Alongside you runs a stream; a crag of stormy blue frothy water. Mist hugs the trees and obscures the path ahead. You inhale the clean, crisp aquatic notes layered over oakmoss and the scent of wood. Deeply masculine. Deeply alluring.<br>
						Deeply sniffworthy.</p>
					</div>
				</div>
				<dl class="description-list">
					<div class="description-list__group">
						<dt>Top</dt>
						<dd>Aquatic</dd>
					</div>
					<div class="description-list__group">
						<dt>Mid</dt>
						<dd>Oakmoss</dd>
					</div>
					<div class="description-list__group">
						<dt>Bottom</dt>
						<dd>Musk</dd>
					</div>
				</dl>
			</div>
		</div>
	</div>
</section>

<section aria-label="Statistics" class="view content content--stats section">
	<div id="statistics" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="content__group">
			<div class="content__text">
				<figure class="stats-info">
					<p class="stats-info__text">
						<em class="stats-info__number">92%</em>
						of men regularly groom below the belt
					</p>
					<figcaption>Research Study</figcaption>
				</figure>
				<figure class="stats-info">
					<p class="stats-info__text">
						<em class="stats-info__number">81%</em>
						of partners prefer a man who is groomed below the belt
					</p>
					<figcaption>Research Study</figcaption>
				</figure>
				<figure class="stats-info">
					<p class="stats-info__text">
						<em class="stats-info__number">73%</em>
						of men groom before sex
					</p>
					<figcaption>Research Study</figcaption>
				</figure>
			</div>
			<div class="content__picture">
				<img src="/images/1.0000/deodorizing-cleanser-close-up.png" alt="Bottle of the Trojan Man Care Below the Belt deodorizing cleanser" width="234" height="783" loading="lazy">
			</div>
		</div>
	</div>
</section>

<section aria-label="Lifestyle photos" class="view slide slide--picstrip section">
	<div id="lifestyle-photos" class="view__anchor"></div>
	<div class="slide slide--picstrip">
		<div class="slide__into" tabindex="0" id="lifestyle-carousel">
			<div class="slide__item">
				<picture class="contain contain--picstrip">
					<img loading="lazy" src="/images/1.0000/picstrip/1.jpg" alt="Man sitting down and pulling a water bottle out of a gymbag" width="638" height="478">
				</picture>
			</div>
			<div class="slide__item">
				<picture class="contain contain--picstrip">
					<img loading="lazy" src="/images/1.0000/picstrip/2.jpg" alt="Two pairs of feet sticking out from under the bed covers" width="641" height="478">
				</picture>
			</div>
			<div class="slide__item">
				<picture class="contain contain--picstrip">
					<img loading="lazy" src="/images/1.0000/picstrip/3.jpg" alt="Display of the bottles on a bathroom counter-top" width="641" height="478">
				</picture>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="customer-reviews-title" class="view content content--customer-reviews section background-image">
	<div id="customer-reviews" class="view__anchor"></div>
	<picture class="background-image__image">
		<img loading="lazy" src="/images/1.0000/bg-swirl.svg" alt="">
	</picture>
	<div class="view__in section__in">
		<div class="section__block">
			<div class="callout-price">
				<div class="callout-price__group">
					<h2 id="customer-reviews-title" class="callout-price__callout">
						<b>The Ultimate</b> Man Care Experience
					</h2>
					<div class="callout-price__offer">
						<div class="callout-price__price">$29.99</div>
						<div class="callout-price__shipping">FREE SHIPPING</div>
					</div>
					<div class="callout-price__button">
						<%= getOrderButton() %>
					</div>
				</div>
			</div>
		</div>

		<div class="section__block">
			<div class="slide slide--carousel">
				<h3 class="content__title">Everybody's doing it... before they do it.</h3>
				<div class="slide__into" tabindex="0" id="customer-reviews-carousel">
					<div class="slide__item">
						<figure class="content__figure">
							<picture class="content__picture">
								<img src="/images/stars.svg" alt="5 Star Rating" width="300" height="52">
							</picture>
							<blockquote class="content__text">
								<p>&ldquo;My husband has sensitive skin and was thrilled these products not only left him smelling clean and feeling rejuvenated &ndash; they did not irritate his skin like most products.&rdquo;</p>
							</blockquote>
							<figcaption class="content__caption">Cathy, Stockton</figcaption>
						</figure>
					</div>
					<div class="slide__item">
						<figure class="content__figure">
							<picture class="content__picture">
								<img src="/images/stars.svg" alt="5 Star Rating" width="300" height="52">
							</picture>
							<blockquote class="content__text">
								<p>&ldquo;LOVE these products and my husband has never smelled better.&rdquo;</p>
							</blockquote>
							<figcaption class="content__caption">Kelley, Newtown</figcaption>
						</figure>	
					</div>
					<div class="slide__item">
						<figure class="content__figure">
							<picture class="content__picture">
								<img src="/images/stars.svg" alt="5 Star Rating" width="300" height="52">
							</picture>
							<blockquote class="content__text">
								<p>&ldquo;Loved all 3 products. Body Cleanser was gentle, foamed very well, and left a clean fragrance. Dry Deodorizing spray and Anti-chaffing Ball Deodorant were a bit cold on the application, but fragrance was great and long lasting. Just the thing for after the gym workout.&rdquo;</p>
							</blockquote>
							<figcaption class="content__caption">Todd, Holland</figcaption>
						</figure>	
					</div>
				  </div>
				  <div class="slide__nav">
					<button aria-label="Previous" class="slide__button slide__prev" type="button">
						   <svg class="slide__icon icon">
							 <use href="#icon-chevron"></use>
						  </svg>
					  </button>
					<button aria-label="Next" class="slide__button slide__next" type="button">
						  <svg class="slide__icon icon">
							   <use href="#icon-chevron"></use>
						  </svg>
					  </button>
				  </div>
			</div>
		</div>
	</div>
</section>

</asp:Content>