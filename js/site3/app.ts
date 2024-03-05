// components
import Nav from "Shared/ts/components/nav";
import Carousel from "Shared/ts/components/carousel";
import ToolTip from "Shared/ts/components/tooltip";
import Accordion from "Shared/ts/components/accordion";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";

// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import LoadItem from "Shared/ts/utils/load-item";
import ValidateCommon from "Shared/ts/api/validate/validate-common";

// applications
import { initializeValidateEventWithPromoCode } from "Shared/ts/applications/form";

const nav = new Nav("nav");

observer("[data-nav-controller]", {
    inRange: () => {
        nav.root?.classList.remove("nav--is-fixed");
    },
    outRange: () => {
        nav.root?.classList.add("nav--is-fixed");
    },
    unObserve: false
});

const viewHeaderNav = document.querySelector(".view--header-nav");

observer("[data-viewport]", {
    inRange: () => {
        viewHeaderNav?.classList.add("view--is-hidden");
    },
    outRange: () => {
        viewHeaderNav?.classList.remove("view--is-hidden");
    },
    unObserve: false,
    options: {
        threshold: 0.25
    }
});

observer(".slide--carousel", {
    inRange: (element) => {
        const carousel = new Carousel(new SlideCarouselAdapter(element));

        carousel.enablePrevNextControls();
    }
});

observer("[data-src-iframe]", {
    inRange: (record) =>
        new LoadItem(record, { tag: "iframe", src: "data-src-iframe" })
});

addEventListener("load", () => {
    new ToolTip(document.querySelectorAll(".link"), "link--is-active");
});

observer('[data-validate-form="promocode"]', {
    inRange: (form) => {
        const submit = form.querySelector('[type="button"]');
        if (!submit) return;

        initializeValidateEventWithPromoCode(
            form as HTMLFormElement,
            submit as HTMLButtonElement
        );
    }
});

observer("form", {
    inRange: (form) => {
        const validateCommon = new ValidateCommon({
            form: form as HTMLFormElement,
            attribute: "data-required",
            inputEvents: ["keyup", "blur", "change"],
            comboboxEvents: ["change", "blur"]
        });

        validateCommon.validateOnSubmit();

        validateCommon.processInputEvents();
        validateCommon.processComboboxEvents();
    }
});

observer(".accordion", {
    inRange: (element) => new Accordion(element)
});
