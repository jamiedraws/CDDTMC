using CDDTMC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDDTMC.Navigation
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

            // Ingredients
            SitemapList.AddItem(new NavigationItem
            {
                Id = "ingredients",
                Name = "Ingredients",
                Page = "Ingredients",
                Hash = "#main"
            });

            // Instructions
            SitemapList.AddItem(new NavigationItem
            {
                Id = "instructions",
                Name = "Instructions",
                Page = "Instructions",
                Hash = "#main"
            });

            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQ",
                Page = "FAQ",
                Hash = "#main"
            });

            // Customer Reviews
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-reviews",
                Name = "Testimonials",
                Page = "Index",
                Hash = "#customer-reviews",
                ApplyHash = true
            });

            // Products
            SitemapList.AddItem(new NavigationItem
            {
                Id = "products",
                Name = "Products",
                Page = "Index",
                Hash = "#trojan-man-care-products",
                ApplyHash = true
            });

            // Customer Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-service",
                Name = "Contact Us",
                Page = "https://www.trojanbrands.com/en/contact-us",
                IsExternal = true
            });

            // Shipping and Return Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-return-policy",
                Name = "Shipping and Return Policy",
                Page = "ShippingReturnPolicy",
                Hash = "#main"
            });

            // Privacy Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "privacy-policy",
                Name = "Privacy Policy",
                Page = "https://churchdwight.com/privacy-policy.aspx",
                IsExternal = true
            });

            // Terms of Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "terms",
                Name = "Terms of Service",
                Page = "Terms",
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
                Name = "Buy Now",
                Page = "Checkout",
                Hash = "#main"
            });

            // Facebook
            SitemapList.AddItem(new NavigationItem
            {
                Id = "facebook",
                Name = "Facebook",
                Page = "https://www.facebook.com",
                IsExternal = true
            });

            // Instagram
            SitemapList.AddItem(new NavigationItem
            {
                Id = "instagram",
                Name = "Instagram",
                Page = "https://www.instagram.com",
                IsExternal = true
            });

            // YouTube
            SitemapList.AddItem(new NavigationItem
            {
                Id = "youtube",
                Name = "YouTube",
                Page = "https://www.youtube.com",
                IsExternal = true
            });
        }

    }
}