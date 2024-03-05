using POOPH.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POOPH.Navigation
{
    public class Sitemap
    {

        public NavigationList SitemapList;
        public Sitemap()
        {
            SitemapList = new NavigationList();

            // Home
            SitemapList.AddItem(new NavigationItem
            {
                Id = "home",
                Name = "Home",
                Page = "Index",
                Hash = "#main"
            });

            // Customer Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-service",
                Name = "Customer Service",
                Page = "CustomerService",
                Hash = "#main"
            });

            // How To Use
            SitemapList.AddItem(new NavigationItem
            {
                Id = "how-to-use",
                Name = "How To Use",
                Page = "/images/How-To-Use.pdf",
                IsExternal = true
            });
            
            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQs",
                Page = "FAQ",
                Hash = "#main"
            });

            // Reviews
            SitemapList.AddItem(new NavigationItem
            {
                Id = "reviews",
                Name = "Reviews",
                Page = "Reviews",
                Hash = "#main"
            });

            // Shipping Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-policy",
                Name = "Shipping Policy",
                Page = "ShippingPolicy",
                Hash = "#main"
            });

            // Return Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "return-policy",
                Name = "Return Policy",
                Page = "ReturnPolicy",
                Hash = "#main"
            });

            // Security Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "security-policy",
                Name = "Security Policy",
                Page = "SecurityPolicy",
                Hash = "#main"
            });

            // Privacy Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "privacy-policy",
                Name = "Privacy Policy",
                Page = "PrivacyPolicy",
                Hash = "#main"
            });

            // Site Map
            SitemapList.AddItem(new NavigationItem
            {
                Id = "sitemap",
                Name = "Site Map",
                Page = "SiteMap",
                Hash = "#main"
            });

            // Order Now
            SitemapList.AddItem(new NavigationItem
            {
                Id = "order-now",
                Name = "Order Now",
                Hash = "#order"
            });
        }

    }
}