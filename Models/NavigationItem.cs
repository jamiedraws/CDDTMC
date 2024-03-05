using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDDTMC.Models
{
    public class NavigationItem
    {

        public string Id { get; set; }
        public string Name { get; set; }
        public string Page { get; set; }
        public string Label { get; set; }
        public string Hash { get; set; }
        public bool IsExternal { get; set; }
        public bool IsDropDown { get; set; }
        public bool ApplyHash { get; set; }

        public NavigationItem()
        {
            Id = string.Empty;
            Name = string.Empty;
            Page = string.Empty;
            Label = string.Empty;
            Hash = string.Empty;
            IsExternal = false;
            IsDropDown = false;
            ApplyHash = false;
        }

    }
}