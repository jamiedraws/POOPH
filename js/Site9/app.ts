// components
import Carousel from "Shared/ts/components/carousel";
import Accordion from "Shared/ts/components/accordion";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";

// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import Disclosure from "Shared/ts/utils/disclosure";
import {
    initializeBase,
    initializeMicrosite,
    initializeToolTip
} from "Shared/ts/applications/template";
import {
    initializeModalDialogIframe,
    initializeValidateCommon
} from "Shared/ts/applications/form";
import AmazonBWPExpressCheckout from "ts/components/amazon-bwp-express-checkout";
import StatusScreen from "Shared/ts/components/status-screen";
import { importScrollableHeightByElement } from "Shared/ts/applications/navigation";

initializeBase();
initializeMicrosite();

initializeModalDialogIframe();

const initializeScrollableHeight = () => {
    const container = document.querySelector<HTMLElement>(".promo-header");
    if (!container) return;

    importScrollableHeightByElement(container);
};

initializeScrollableHeight();

const initializeExpressCheckout = (root?: HTMLElement): void => {
    addEventListener("ECDrawFormComplete", (event) => {
        const ec = new AmazonBWPExpressCheckout(root);

        ec.createCheckoutButtonGUI();

        initializeToolTip();
    });
};

initializeExpressCheckout();

const initializeCheckoutForm = (): void => {
    const validateCommon = initializeValidateCommon();
    if (!validateCommon.form) return;

    const statusScreen = new StatusScreen("checkout-form", validateCommon.form);
    statusScreen.update("Verifying payment options");

    let closeConnection = false;
    let timeout: NodeJS.Timeout;

    const initializeTimeout = (time: number) =>
        setTimeout(() => {
            closeConnection = true;

            clearTimeout(timeout);

            statusScreen.update("Ready for use");
        }, time);

    addEventListener("load", (event) => initializeTimeout(0));
};

initializeCheckoutForm();

const disclosure = new Disclosure();

disclosure.controllers.forEach((controller) => {
    controller.addEventListener("click", (event) => {
        disclosure.toggleElementsByController(controller);
    });
});

observer(".slide--carousel", {
    inRange: (element) => {
        const carousel = new Carousel(new SlideCarouselAdapter(element));

        carousel.enablePrevNextControls();
    }
});

observer(".accordion", {
    inRange: (element) => new Accordion(element)
});
