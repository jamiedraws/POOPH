<%@ Page Language="C#" MasterPageFile="~/VersionViews/6.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script runat="server">
    public class FAQ
    {
        public string Question { get; set; }
        public string Answer { get; set; }
    }
</script>

<main aria-labelledby="main-title" class="view content content--sub-page section">
    <div id="main" class="view__anchor"></div>
    <article class="view__in content__in section__in">
        <div class="section__block content__text">
            <h1 id="main-title" class="content__title">Frequently Asked Questions</h1>
            <%
                var productName = SettingsManager.ContextSettings["Label.ProductName"];

                var faqs = new List<FAQ>
                {
                    new FAQ
                    {
                        Question = @"What kinds of surfaces can I use {{ProductName}} on?",
                        Answer = @"<p>{{ProductName}} can be used on any type of surface! Customers use {{ProductName}} to get rid of odors on everything from concrete driveways, garden beds, wood floors, carpets, sofa fabric, bed linens, towels, car seats, clothes, and everything in between. {{ProductName}} has NO harsh chemicals and is gentle on surfaces while being tough on odors.</p>"
                    },
                    new FAQ
                    {
                        Question = @"Is {{ProductName}} safe?",
                        Answer = @"
                            <p>YES! {{ProductName}} is completely non-toxic and safe to use around people (of all ages!), pets, plants, and the planet. {{ProductName}}&rsquo;s proprietary formula has been Vetted thoroughly by State Air Quality Management Authorities in CA, FL, GA, NY, PA, and TX. The CDPR: California EPA stated non-pesticide. It is Approved non-toxic and meets GRAS Standards according to the US Code of Federal Registrar Section 21. It is Approved by OSHA PEL (Permissible Exposure Limits) - all ingredients are approved as direct and indirect food additives well below PEL at full concentration.</p>
                            <p>No VOCs (Volatile Organic Compounds) or HAPs (Hazardous Air Pollutants) unlike fragrances (which are in most odor eliminators) that have VOCs and HAPs.</p>
                        "
                    },
                    new FAQ
                    {
                        Question = @"Can I use {{ProductName}} in my carpet shampooer?",
                        Answer = @"<p>YES! You can use {{ProductName}}&rsquo;s concentrate refill in your carpet shampooer (the full 32 oz bottle of {{ProductName}} Pet Odor Eliminator is too diluted). Just mix 10 oz or water to each ounce of concentrated refill and shampoo away!</p>"
                    },
                    new FAQ
                    {
                        Question = @"What does {{ProductName}} smell like?",
                        Answer = @"<p>{{ProductName}} is completely colorless, odorless, and non-staining. It smells like nothing! We don&rsquo;t add any fragrances because {{ProductName}} actually WORKS and fragrances are how other products hide the fact that they don&rsquo;t actually get rid of the odor. Plus fragrances are often made of Volatile Organic Compounds (VOCs) or Hazardous Air Pollutants (HAPs) and those aren&rsquo;t safe at all!</p>"
                    },
                    new FAQ
                    {
                        Question = @"Can I use POOPH on my pet?",
                        Answer = @"<p>Please don&rsquo;t spray {{ProductName}} directly onto your pet, nobody likes getting sprayed at! {{ProductName}} is not intended to treat your pet directly, but if a stinky smells gets on your pet, it is safe to use to remove that stink. We recommend spraying it on a soft towel and wiping down the area that stinks. It won&rsquo;t hurt your pet because it is 100% safe and non-toxic but it will get rid of any stink!</p>"
                    },
                    new FAQ
                    {
                        Question = @"Where can I buy {{ProductName}}?",
                        Answer = @"<p>At this time, {{ProductName}} can only be purchased direct at <a href=""https://www.pooph.com"">www.pooph.com</a> or through our amazon store.</p>"
                    },
                    new FAQ
                    {
                        Question = @"What is your return policy?",
                        Answer = @"<p>We offer a 30 day 100% no questions asked money back guarantee! If you don&rsquo;t like {{ProductName}} for any reason, simply email us at <a href=""mailto:help@pooph.com"">help@pooph.com</a> and ask for a refund and we will take care of it right away!</p>"
                    },
                    new FAQ
                    {
                        Question = @"My {{ProductName}} arrived frozen solid, is it still good?",
                        Answer = @"<p>YES! {{ProductName}}&rsquo;s effectiveness won&rsquo;t be impaired by freezing, but we do recommend letting it thaw out completely before you try to use it!</p>"
                    },
                    new FAQ
                    {
                        Question = @"If {{ProductName}} has been around for over a decade, how come I&rsquo;ve never heard of it before?",
                        Answer = @"<p>{{ProductName}}&rsquo;s exact formula has been used for over 10 years getting rid of odors in North America&rsquo;s top municipal waste management facilities. It has removed the odors from landfills, recycling plants, waste-water treatment facilities, and other industrial and government facilities like farms and hospitals. Only now this formula is being made available to consumers through {{ProductName}}!</p>"
                    },
                    new FAQ
                    {
                        Question = @"How much {{ProductName}} should I use?",
                        Answer = @"<p>{{ProductName}} requires a 1:1 ratio of the odor creating molecule to {{ProductName}}&rsquo;s odor eliminating molecule. So if you&rsquo;re using {{ProductName}} on a fresh accident by your pet, you will use less {{ProductName}} than you would on an old accident (and maybe an accident your pet has had multiple times in the same place). As long as {{ProductName}} can reach the source of the odor and there&rsquo;s as much {{ProductName}} as there is stink, {{ProductName}} will get it and dismantle the odor.</p>"
                    },
                    new FAQ
                    {
                        Question = @"What&rsquo;s in {{ProductName}}?",
                        Answer = @"<p>{{ProductName}} is a proprietary blend of minerals all of which each can be found in your average daily multivitamin. There are NO harsh chemicals and it is approved non-toxic and meets GRAS Standards according to the US Code of Federal Registrar Section 21.</p>"
                    },
                    new FAQ
                    {
                        Question = @"Does {{ProductName}} only work on pet odors?",
                        Answer = @"<p>{{ProductName}} works on any organic odor, so it works on much more than pet odors. However, each {{ProductName}} product is specially formulated to treat different types of odors. Our Kitty Litter Box Deodorizer was designed with cat-related offenses in mind. We were careful to make sure that it also wouldn&rsquo;t affect the clumping of the litter, so while you could use our general pet odor eliminator for the litter box, the specialized formula for the litter box will be better.</p>"
                    }
                };

            if (faqs.Count > 0) { %>
            <div id="accordion" class="accordion" data-accordion-toggle data-accordion-many-containers>
                <% foreach (var faq in faqs) { 
                    var index = faqs.IndexOf(faq);      
                %>     
                <div class="card">
                    <div class="accordion__header card__header">
                        <button class="accordion__button card__button" aria-controls="faq-section-<%= index %>" id="faq-controller-<%= index %>">
                          <%= faq.Question.Replace("{{ProductName}}", productName) %>
                        </button>
                    </div>
                    <section aria-labelledby="faq-controller-<%= index %>" id="faq-section-<%= index %>" class="card__section accordion__section">
                        <div class="card__content">
                            <%= faq.Answer.Replace("{{ProductName}}", productName) %>		
                        </div>
                    </section>
                </div>
                <% } %>
            </div>
           <% } %>
        </div>
    </article>
</main>

</asp:Content>