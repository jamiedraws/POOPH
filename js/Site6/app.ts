// components
import Modal from "Shared/ts/components/modal";
import Carousel from "Shared/ts/components/carousel";
import Accordion from "Shared/ts/components/accordion";
import ToolTip from "Shared/ts/components/tooltip";
import FingerPrintNav from "Shared/ts/components/fingerprint-nav";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";

// api
import ValidateCommon from "Shared/ts/api/validate/validate-common";
import ExpressCheckout from "Shared/ts/api/express-checkout/express-checkout";

// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import { renderTemplate } from "Shared/ts/utils/html";
import CaptureElement from "Shared/ts/utils/capture-element";
import LoadItem from "Shared/ts/utils/load-item";
import Disclosure from "Shared/ts/utils/disclosure";

const disclosure = new Disclosure();

disclosure.controllers.forEach((controller) => {
    controller.addEventListener("click", (event) => {
        disclosure.toggleElementsByController(controller);
    });
});

const fp = new FingerPrintNav();
fp.hideWhenElementsInView("form");

const validateCommon = new ValidateCommon({
    attribute: "data-required",
    inputEvents: ["blur", "change"],
    invalidInputEvents: ["keyup", "blur", "change"],
    comboboxEvents: ["change", "blur"]
});

validateCommon.validateOnSubmit();
validateCommon.processInputEvents();
validateCommon.processComboboxEvents();

const orderReview = document.querySelector("#orderReview");
const billingStreet = document.querySelector(
    "#BillingStreet"
) as HTMLInputElement;
const shippingStreet = document.querySelector(
    "#ShippingStreet"
) as HTMLInputElement;

addEventListener("load", (event) => {
    if (orderReview) {
        orderReview.classList.remove("c-brand--table");
    }

    if (billingStreet) {
        const captureBillingStreet = new CaptureElement(billingStreet);

        captureBillingStreet.subscribe("attributes", (record) => {
            if (
                record.attributeName === "autocomplete" &&
                billingStreet.autocomplete === "off"
            ) {
                billingStreet.setAttribute(
                    "autocomplete",
                    "billing address-line1"
                );
            }
        });
    }

    if (shippingStreet) {
        const captureShippingStreet = new CaptureElement(shippingStreet);

        captureShippingStreet.subscribe("attributes", (record) => {
            if (
                record.attributeName === "autocomplete" &&
                shippingStreet.autocomplete === "off"
            ) {
                shippingStreet.setAttribute(
                    "autocomplete",
                    "shipping address-line1"
                );
            }
        });
    }
});

addEventListener("ECDrawFormComplete", (event) => new ExpressCheckout());

const getModalDialogControllerId = (controller: Element): string | null => {
    const id = controller.getAttribute("data-modal-dialog-id");

    if (!id) {
        console.error({
            message: `An id value was not found for the attribute [data-modal-dialog-id].`,
            controller
        });
    }

    return id;
};

const getModalDialogControllerTitle = (controller: Element): string | null => {
    const title = controller.getAttribute("data-modal-dialog-title");

    if (!title) {
        console.error({
            message: `A title value was not found for the attribute [data-modal-dialog-title].`,
            controller
        });
    }

    return title;
};

const getModalDialogControllerSource = (controller: Element): string | null => {
    const source =
        controller.getAttribute("href") ??
        controller.getAttribute("data-modal-dialog-iframe");

    if (!source) {
        console.error({
            message: `A src value was not found for the attribute [href] or [data-modal-dialog-iframe].`,
            controller
        });
    }

    return source;
};

const createModalDialogIframeContainerFragment = (
    id: string,
    title: string,
    source: string
): DocumentFragment => {
    return renderTemplate(`
        <section id="${id}" aria-label="${title}" class="view section">
            <div class="view__in section__in">
                <div class="defer modal-dialog__iframe">
                    <iframe src="${source}" title="${title}" tabindex="0"></iframe>
                </div>
            </div>
        </section>
    `);
};

const processModalDialogIframeByController = (
    controller: Element,
    controllerContainerMap: WeakMap<Element, Element>
): void => {
    if (!controllerContainerMap.has(controller)) {
        const id = getModalDialogControllerId(controller);
        const title = getModalDialogControllerTitle(controller);
        const source = getModalDialogControllerSource(controller);

        if (id && title && source) {
            const fragment = createModalDialogIframeContainerFragment(
                id,
                title,
                source
            );

            document.body.appendChild(fragment);

            const container = document.getElementById(id);
            if (!container) return;

            controllerContainerMap.set(controller, container);

            const modal = new Modal(container, {
                ariaLabel: container.getAttribute("aria-label") ?? ""
            });

            addEventListener("message", (event) => {
                try {
                    const message = JSON.parse(event.data);

                    if (
                        message.id === id &&
                        message.title === title &&
                        message.source === source &&
                        message.actor === "close"
                    ) {
                        modal.close();
                    }
                } catch (e: unknown) {
                    if (e instanceof Error) {
                        console.warn(e.message);
                    }
                }
            });
        }
    }
};

observer("[data-modal-dialog-iframe][data-modal-dialog-actor=open]", {
    inRange: (controller) => {
        const controllerContainerMap = new WeakMap<Element, Element>();

        controller.addEventListener("click", (event) => {
            event.preventDefault();

            processModalDialogIframeByController(
                controller,
                controllerContainerMap
            );
        });
    }
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

new ToolTip(document.querySelectorAll(".link"), "link--is-active");

observer("[data-src-iframe]", {
    inRange: (element) =>
        new LoadItem(element, {
            src: "data-src-iframe",
            tag: "iframe"
        })
});
