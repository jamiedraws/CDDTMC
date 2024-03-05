<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<link rel="stylesheet" href="https://use.typekit.net/ynw1zvh.css">

<style>
.l-header,
#content_top {
    font-family: "proxima-nova", sans-serif;
    font-weight: 500;
}

.l-header__in {
    margin: 0 auto;
    max-width: 980px;
    position: relative;
}

.banner {
    text-transform: uppercase;
    background: #d2b17b;
    color: #0f2243;
    text-align: center;
    font-size: 2.6rem;
}

.banner .banner__group {
    justify-content: space-around;
    align-items: center;
    display: flex;
    padding: 0.5em;
}

.tag {
    background: #0f2243;
    color: white;
    font-weight: 800;
    padding: 0.4em;
    position: relative;
    margin-right: 0.7em;
}

.tag::after {
    content: "";
    width: 0; 
    height: 0; 
    border-top: 0.9em solid transparent;
    border-bottom: 0.9em solid transparent;
    border-left: 0.7em solid #0f2243;
    position: absolute;
    right: -0.7em;
    top: 0;
}

@media all and (max-width: 980px) {
    .banner {
        font-size: 4vw;
    }
    .banner .tag {
        width: 63vw;
    }
}

.dtm--index body {
    background: url(/images/bg.jpg) center 3rem repeat-x;
}

@media all and (min-width: 1500px) {
    .dtm--index .dtm__in--dv main::before,
    .dtm--index .dtm__in--dv main::after {
        content: "";
        background: black;
        height: 650px;
        width: calc((100% - 1500px) / 2);
        display: block;
        position: absolute;
        top: 0;
    }

    .dtm--index .dtm__in--dv main::before {
        left: 0;
    }

    .dtm--index .dtm__in--dv main::after {
        right: 0;
    }
}

.dtm .dtm__in--mv {
    background: white;
}

.dtm__in--mv #content_top {
    margin: 0;
}

.l-header .l-header__main {
    padding: 2.5rem 1rem;
}

.\@b .l-header,
.dtm--subpage .l-header {
    background: #031128;
    padding: 1rem;
}

.dtm--subpage .l-header {
    padding: 0;
}

.dtm--index #content_top {
    border: none;
    padding: 0;
    box-shadow: none;
}

.hero {
    font-size: 2.4rem;
}

.hero__group {
    display: flex;
    align-items: stretch;
    justify-content: space-between;
    min-height: 20em;
}

.hero__inner {
    max-width: 980px;
    margin: 0 auto;
}

.hero__offer {
    flex: 0 1 465px;
    overflow: hidden;
}

.hero__image {
    flex: 1 1 auto;
    position: relative;
    align-self: flex-end;
    padding-bottom: 1em;
}

.hero__image img {
    position: absolute;
    right: 0;
    bottom: 0;
    height: auto;
}

.offer {
    background: black;
    color: white;
    position: relative;
    padding: 1em;
    font-size: 1em;
}

.hero__offer::after {
    background: radial-gradient(circle, #0b3d92 0%, transparent 60%);
    content: "";
    position: absolute;
    width: 29em;
    height: 29em;
    right: -13em;
    top: -13em;
    z-index: 0;
}

.hero__offer * {
    position: relative;
    z-index: 1;
}

.hero__title {
    text-transform: uppercase;
    font-family: "proxima-nova-extra-condensed", "proxima-nova", sans-serif;
    font-size: 2em;
    font-weight: 900;
}

.hero__list {
    list-style: none;
}

.hero__list b {
    color: #e0c18b;
    font-family: "proxima-nova-extra-condensed", "proxima-nova", sans-serif;
    font-weight: 900;
    font-size: 1.33em;
}

.hero__price {
    display: block;
    text-align: center;
    font-family: "proxima-nova-extra-condensed", "proxima-nova", sans-serif;
    font-weight: 900;
    font-size: 4em;
    color: #e0c18b;
    margin: 0.1em 0;
}

.btn {
    display: block;
    margin: 0.5em auto;
    font-weight: 900;
    text-transform: uppercase;
    color: white;
    background: #0c51c7;
    border-radius: 1.2em;
    text-align: center;
    text-decoration: none;
    font-size: 1.33em;
    padding: 0.6em;
    max-width: 8.5em;
    transition: background 0.25s, border-color 0.25s;
    border: 2px solid transparent;
}
.btn:hover,
.btn:focus {
    background: #0f2243;
    border-color: white;
}

.btn--submit {
    font-size: 3rem;
    max-width: 12em;
    border-radius: 1.5em;
    font-family: 'proxima-nova';
    font-weight: 900;
}

.hero__btn {
    margin-bottom: 0;
}

.hero__disclaimer {
    color: white;
    display: block;
    text-align: center;
    font-size: 0.75em;
}

@media all and (max-width: 980px) {
    .hero {
        font-size: 2.4vw
    }
    .hero__offer {
        flex-basis: 50vw;
    }
    .hero__image img {
        right: 3%;
        width: 115%;
    }
}

@media all and (max-width: 980px) {
    .dtm .l-header {
        background: #06214f;
        padding: 0;
    }
    .l-header .l-header__main {
        padding: 1rem;
    }
    .dtm .l-header img[src*=logo] {
        width: 47vw;
        height: auto;
        margin: 0;
    }
    .dtm--index #content_top,
    .hero__offer,
    .hero__offer::after {
        background: none;
    }
    .hero {
        font-size: 2.4vw;
        background: radial-gradient(circle, #0b3d92 0%, #000 100%);
        padding: 1rem 0;
    }
    .dtm--index main,
    .dtm--index #content_top,
    .dtm--index #content_top > *,
    .hero,
    .hero * {
        overflow: visible;
    }
    .dtm--index main {
        position: relative;
        z-index: 3;
    }
    .hero__offer {
        flex-basis: 50vw;
    }
    .hero__image img {
        right: 3%;
        width: 115%;
    }
}

.ft {
    font: 500 2.5rem/1.2 "proxima-nova", sans-serif;
}

.ft > * {
    display: block;
}

.ft__first {
    font-weight: 900;
    font-size: 1.8em;
    color: #d2b17b;
}

.ft__second {

}

.ft__second strong {
    font-weight: bold;
    color: #0c51c7;
}

.dtm__in--dv .l-footer {
    background: black;
    color: white;
}

#content_bottom,
.\@b #content_top,
.dtm--subpage #content_top {
    max-width: 980px;
    margin: 0 auto;
    box-shadow: none;
    border: none;
}

[class*="c-brand--table"] th, .table th, .c-brand--table__th, .dtm .c-brand--table--cart--oswe th, .orderItemsTable th {
    background: #0c51c7;
}



.dtm--subpage .hero {
    background: black;
    font-size: 1.2rem;
    padding: 0.5rem;
    position: relative;
}
.dtm--subpage .hero__group {
    flex-wrap: wrap;
}
.dtm--subpage .hero__group > * {
    flex: 0 1 100%;
    width: 100%;
}

.dtm--subpage .hero__image {
    order: -1;
}

.dtm--subpage .hero__image img {
    width: 100%;
    position: static;
}

.dtm--subpage .hero__offer,
.dtm--subpage .hero__offer::after {
    background: none;
}

.dtm--subpage .hero__offer {
    position: absolute;
    left: 0;
    top: 0;
}

.dtm--subpage .hero__price, .dtm--subpage .hero__btn {
    display: inline-block;
    vertical-align: middle;
    margin: 0 0.7em;
}

.dtm--subpage .hero__list {
    margin-bottom: 17em;
}

.dtm--subpage .hero__disclaimer {
    margin-top: 2em;
}

#offerBottom .hero {
    font-size: 3vw;
    line-height: 1.1;
}
</style>

<% Html.RenderSnippet("STYLE-BLOCK-HEAD"); %>