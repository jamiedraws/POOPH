<%@ Page Language="C#" MasterPageFile="~/VersionViews/14.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script runat="server">
	public class Review
    {
		public string Blockquote { get; set; }
		public string Name { get; set; }
    }
</script>
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];		
%>

<main aria-label="Main offer" class="view main-offer main-offer--container section">
	<div class="main-offer__bkg">
		<img src="/images/Site6/main-offer-bkg.jpg" alt="">
	</div>
	<div id="main" class="view__anchor"></div>
	<div class="view__in main-offer__in section__in">
		<div class="main-offer__group">
			<div class="main-offer__offer">
				<b class="main-offer__banner banner banner--ribbon">
				  <span>Limited Time Offer</span>
				</b>
				<div class="main-offer main-offer--offer-product">
					<div class="main-offer__group">
						<div class="main-offer__offer">
							<div class="main-offer__group">
								<div class="main-offer__price">
									<div class="sr">
										<div class="sr__text">Now Only $24.95</div>
										  <div class="offer" aria-hidden="true" role="presentation">
											<span class="offer__standfirst">Now Only</span>
											<span class="offer__currency">$</span>
											<span class="offer__amt">24</span>
											<span class="offer__follow">
												  <span class="offer__cent">95</span>
												  <span class="offer__disclaimer">32 oz. bottle</span>
											</span>
										  </div>
									</div>
								</div>
								<b class="main-offer__shipping">Free Shipping</b>
								<a href="#order" class="button">
									<span>Order Now</span>
								</a>
								<div class="main-offer__payment">
									<%= Html.Partial("GetPaymentIcons") %>
								</div>
								<div class="main-offer__bonus">
									<figure class="bonus-text-product">
										<div class="bonus-text-product__group">
											<figcaption class="bonus-text-product__text">
												<b class="bonus-text-product__title">Bonus</b>
												<span><%= productName %> Laundry Additive</span>
												<b class="bonus-text-product__call-out">Absolutely Free!</b>
											</figcaption>
											<div class="bonus-text-product__product">
												<img src="/images/Site6/bonus-product.png" style="mix-blend-mode: lighten;" alt="" width="238" height="416">
											</div>
										</div>
									</figure>
								</div>
							</div>
						</div>
						<div class="main-offer__product">
							<img src="/images/Site14/product.png" alt="100% money back guaranteed on this offer of <%= productName %>" width="226" height="411">
						</div>
					</div>
				</div>
			</div>
			<div class="main-offer__content">
				<div id="video" data-src-iframe="https://player.vimeo.com/video/719251775" data-attr='{ "width" : "392", "height" : "220", "title" : "Commercial", "allow" : "fullscreen" }' class="contain contain--video"></div>
				<div class="main-offer main-offer--benefits">
					<div class="main-offer__group">
						<figure class="main-offer__figure">
							<img src="/images/Site6/non-toxic.svg" alt="" width="" height="">
							<figcaption>Safe &<br> Non-Toxic</figcaption>
						</figure>
						<figure class="main-offer__figure">
							<img src="/images/Site6/fragrance-free.svg" alt="" width="" height="">
							<figcaption>Fragrance Free</figcaption>
						</figure>
						<figure class="main-offer__figure">
							<img src="/images/Site6/commercial-grade.svg" alt="" width="" height="">
							<figcaption>Commercial Grade</figcaption>
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<section aria-labelledby="features-benefits-title" class="view content content--picture-text section">
	<div id="features-benefits" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block content__block">
			<div class="content__group">
				<div class="content__picture">
					<figure class="figure-picture-text">
						<img src="/images/Site14/in-use.jpg" alt="A person spraying Pooph on the kitchen floor while a dog nearby is watching" loading="lazy" width="473" height="380">
						<figcaption>Eliminates Pet Odors INSTANTLY!</figcaption>
					</figure>
				</div>
				<div class="content__text">
					<div class="features-benefits">
						<h2 id="features-benefits-title" class="features-benefits__title">Features & Benefits</h2>
						<ul class="features-benefits__list">
							<li>Instantly dismantles odors on a molecular level &mdash; so they never return!</li>
							<li>Eliminates odors that cause pets to urinate in the same spot over and over</li>
							<li>Fragrance-free (non-sensitizing), No VOCs (Volatile Organic Compounds) or HAPs (Hazardous Air Pollutants)</li>
							<li>Safe for people, pets, plants, and the planet</li>
							<li>Clear, Odorless, Non-staining</li>
							<li>Works instantly</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="in-use-title" class="view content content--in-use section">
	<div id="in-use" class="view__anchor"></div>
	<div class="view__in section__in">
		<h2 id="in-use-title" class="content__title">Complete and Permanent Odor Removal</h2>
		<div class="section__block">
			<div class="content__group">
				<figure class="content__figure content__text">
					<img src="/images/Site14/messes.jpg" alt="" loading="lazy" width="313" height="192">
					<figcaption>Messes</figcaption>
				</figure>
				<figure class="content__figure content__text">
					<img src="/images/Site14/toys.jpg" alt="" loading="lazy" width="313" height="192">
					<figcaption>Toys</figcaption>
				</figure>
				<figure class="content__figure content__text">
					<img src="/images/Site14/litter-boxes.jpg" alt="" loading="lazy" width="313" height="192">
					<figcaption>Litter Boxes</figcaption>
				</figure>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="pooph-science-title" class="view content content--text-video section">
	<div class="content__bkg">
		<img src="/images/Site6/science-bkg.jpg" alt="" loading="lazy">
	</div>
	<div id="pooph-science" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block">
			<div class="content__group">
				<div class="content__text">
					<h2 id="pooph-science-title" class="content__title">Pooph&trade; Science</h2>
					<p><span class="color-accent"><%= productName %></span> <em>takes &ldquo;stink&rdquo; out of the equation</em> &mdash; completely and permanently dismantling odors on a molecular level. Unlike enzymatic formulas that work slowly and leave odors behind, <span class="color-accent"><%= productName %></span> works instantly to eliminate odors at the source &mdash; so there is no stink OR fragrance... when you use <span class="color-accent"><%= productName %></span>, it's as if the odor was never there! And as amazingly powerful as it is, <span class="color-accent"><%= productName %></span> is safe for people, pets and the planet!</p>
				</div>
				<div class="content__video">
					<div data-src-iframe="https://player.vimeo.com/video/647342487?background=1" data-attr='{ "width" : "472", "height" : "266", "title" : "Pooph Animation", "allow" : "fullscreen" }' class="contain contain--video"></div>
				</div>
				<div class="content__footer">
					<a href="#order" class="button">
						<span>Click here to order now</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="communities-title" class="view content content--communities section">
	<div class="content__bkg">
		<img src="/images/Site6/industrial-bkg.jpg" alt="" loading="lazy">
	</div>
	<div id="communities" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block">
			<h2 id="communities-title" class="content__title">Used by the 5 largest Waste Treatment companies in the country to eliminate odor and improve the quality of life in the surrounding communities</h2>
		</div>
		<div class="section__block">
			<div class="content__group">
				<div class="content__picture">
					<img src="/images/Site6/landfills.png" alt="Landfills" loading="lazy" width="311" height="209">
				</div>
				<div class="content__picture">
					<img src="/images/Site6/recycling-centers.png" alt="Recycling Centers" loading="lazy" width="311" height="209">
				</div>
				<div class="content__picture">
					<img src="/images/Site6/compositing-facilities.png" alt="Compositing Facilities" loading="lazy" width="311" height="209">
				</div>
			</div>
		</div>
	</div>
</section>

<section aria-labelledby="customer-reviews-title" class="view content content--customer-reviews section">
	<div id="customer-reviews" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block">
			<h2 id="customer-reviews-title" class="content__title">Real Users <span data-content-title-icon="&bull;"></span> Real Results</h2>
		</div>

		<%
			var reviews = new List<Review>
            {
				new Review
                {
					Blockquote = @"<p>&ldquo;Hi there!! No pun intended, but holy Pooph!! This stuff is beyond amazing! I always see these type products advertised all over the place, and shamefully most of them get me, but EVERY TIME, they FAIL!!!</p>
					
					<p {{ShowMore}}>It's always a waste of money, time, and work. I cannot even begin to tell you the situation we've gotten ourselves into trying to help a friend, but our house did not smell good! I literally got my order yesterday, and I went to spraying!! First of all, the Pooph spray bottle is great! Second, I used almost the entire bottle on the house, spraying everywhere! Finally, third, I'm here, writing you this email, because I've just placed a second order for two MORE bottles of Pooph for our house for FUTURE use!!! Pooph works SO well, that we cannot even smell not one single particle of nasty smelling stuff! As a matter of fact, we can't smell anything. Not only is the bad smell gone, but they're all gone! It's amazing! I watched the video in the advertisement over and over, thinking there is no way he sprayed straight ammonia on that cloth! Then, as I was spraying everything, and I realized I didn't smell anything, I even thought to myself, what if this is just water, and we've all been had? But, NOPE!!! I am seriously IN SHOCK!!!! Your product actually, for real, no crap, no pun, no joke, absolutely, without a doubt, WORKS!!! Please, do NOT go out of business!!!! Seriously, how do I buy more in a larger quantity?&rdquo;</p>
					",
					Name = "Lauren B."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;My cat loves to roll around in dead stuff and the stink is unbearable! In the past it has been a nightmare trying to get him in the bath, but with POOPH, its so easy! I just spray a towel and wipe him down, no more drama!&rdquo;</p>",
					Name = "Mark R."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;I accidentally stepped in poop and tracked it into the carpet and oh my god, the smell was so bad. We POOPH'd it and it was amazing, not only did the odor disappear, but the stain was gone too! This stuff really does dismantle the source of the odor!&rdquo;</p>",
					Name = "Jane P."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;Our dog Timmy goes to potty on his own in his private bathroom we set up for him. Although it's 100% great with Timmy's potty habits, the stinky smell doesn't really go away itself. With Pooph, we spray the area, viola! Can't smell a thing anymore. It's wonderful with Pooph in between changing pads.&rdquo;</p>",
					Name = "Serena W."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;My daughter's dog visit the house and peed on the area rug in the living room. I was freaking out about the stain and the smell. Then I sprayed Pooph, few minutes later, the smell is gone, and I can't see any stains on the rug either. It's like a brand new rug again. Amazing results. Pooph saved me from trashing the rug that I just bought.&rdquo;</p>",
					Name = "Heidi Y."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;I have a cat that is 14 years old and gets mad at me when I go away. So, he likes to spray in the guest room where the fur-nanny sleeps. She graciously tries to get the smell out but it just never really went away. So, I decided to try Pooph and it and whadda know, it's gone. I will definitely be buying this again....and again.&rdquo;</p>",
					Name = "Cindy B."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;We live in a high-rise apartment building with a patio. Since we can't always trudge all the way downstairs for a quick potty break for our pup, we invested in a nice potty pad for Benji to use. The smell is supposed to go away after you hose it off however, when we sit out on our patio in the evening, we still have this unpleasant smell and weren't enjoying our evenings outside anymore. So, we thought we'd give this Pooph a try and it actually worked, the smell is gone! It works like a charm.&rdquo;</p>",
					Name = "Gina F."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;We have two large mountain dogs, every now and then one will have an accident. We've used other products like Natures Miracle to clean up, but we always end up opening the windows because the caustic stench of the product is almost as bad as the accident itself. Using Pooph allowed for a tidy clean up without having to open windows and ""air the room"". The smell after a couple of spritzes immediately dissipated.&rdquo;</p>",
					Name = "Mike G."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;Cleans up after our Pyrenees like a charm. Kills the odors from the messes and I don't have to worry about any toxins. I'm using something safe for the doggos and the kids. It's replaced the other pet odor products in my home.&rdquo;</p>",
					Name = "Diana P."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;The Pooph odor spray quickly dissipated the smell after my dog had an accident in the house without leaving behind any artificial scents. Awesome product that works really well!&rdquo;</p>",
					Name = "Russell Y."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;My sweet dachshund Violet loves rolling in anything that smells like death on our daily walks. Nothing worse than snuggling with a pup that smells, so I was told to try Pooph, I did and literally ""pooph"" the stink is gone!! Amazing, I will always keep this product on hand.&rdquo;</p>",
					Name = "Stephanie V."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;My wife loves your product, First it cut the cats litter box smell completely, 2nd an opossum found it's way in our outside shelter for the cat and his food dish, and the stench from this animal is eye watering but the pooph wiped out that odor, I'll say this is the best product on the market for sure.&rdquo;</p>",
					Name = "Jeff C."
                },
				new Review
                {
					Blockquote = @"<p>&ldquo;This product is SO amazing! I just happen to see a commercial for it & thought, I'm gonna try that. I thought maybe it would take some odor out but it surpassed my expectations by totally erasing the odor.</p>
					
					<p {{ShowMore}}>I don't know how it works, it just WORKS! It's absolutely AMAZING! I use it in my indoor & outdoor garbage cans, floors, carpet, bedding, anywhere I want an odor to go pooph. And I love that it's safe to use around my dogs. That's important to me. I can't wait till the laundry version of this product comes out. I'm a faithful customer for life. Thank you for coming out with this amazing spray that has changed my life.&rdquo;</p>",
					Name = "Sandra W."
                }
            };
 
			if (reviews.Count > 0) {
		%>
		<div class="section__block slide slide--carousel">
			<div class="slide__into element-controller" aria-live="polite" tabindex="0" id="carousel">
				<% foreach (var review in reviews) { 
					var index = reviews.IndexOf(review);
					var showMoreContent = review.Blockquote.Contains("{{ShowMore}}");		
				%>
				<div class="slide__item">
					<figure class="content__figure content__text">
						<blockquote class="content__text">
							<%= review.Blockquote.Replace("{{ShowMore}}", string.Format(@"id=""review-content-{0}"" class=""element-controller__element""", index)) %>
							<% if (showMoreContent) { %>
							<button class="disclosure element-controller__controller" id="review-content-button-<%= index %>" aria-controls="review-content-<%= index %>" aria-expanded="false">
								<span class="disclosure__text-collapsed">Show More</span>
								<span class="disclosure__text-expanded">Show Less</span>
							</button>
							<% } %>
						</blockquote>
						<div class="content__picture">
							<img src="/images/Site6/stars.svg" alt="5 out of 5 stars" loading="lazy" width="300" height="52">
						</div>
						<figcaption><%= review.Name %></figcaption>
					</figure>
				</div>
				<% } %>
			</div>
			<div class="slide__nav">
				<button aria-label="Previous" class="slide__prev" type="button">
					   <svg class="icon">
						 <use href="#icon-chevron"></use>
					  </svg>
				  </button>
				<button aria-label="Next" class="slide__next" type="button">
					  <svg class="icon">
						   <use href="#icon-chevron"></use>
					  </svg>
				</button>
			</div>
		</div>
		<% } %>
		
		<!-- <div id="BVSellerRatingsContainer"></div>
		<script>
			addEventListener("load", function () {
				BV.seller_ratings.render();
			});
		</script> -->
		<!-- <div 
			data-bv-show="reviews"
			data-bv-product-id="POOS-32">
		</div> -->
	</div>
</section>
</asp:Content>