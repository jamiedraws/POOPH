// api
import ExpressCheckout from "Shared/ts/api/express-checkout/express-checkout";

// utils
import CaptureElement from "Shared/ts/utils/capture-element";
import { createElement } from "Shared/ts/utils/html";

export default class AmazonBWPExpressCheckout extends ExpressCheckout {
    private static iframeRepository: WeakMap<
        AmazonBWPExpressCheckout,
        HTMLIFrameElement
    > = new WeakMap<AmazonBWPExpressCheckout, HTMLIFrameElement>();

    constructor(root?: HTMLElement) {
        super(root);

        this.reassignComponent();
    }

    private reassignComponent() {
        this.getStoredIframeOrCapture()
            .then((iframe) => {
                const insertionContainer = this.checkoutOptions.shift();
                if (!insertionContainer) return;

                const checkoutOption = createElement("div", {
                    class: "checkout-option express-checkout__checkout-option express-checkout__checkout-bwp"
                });

                checkoutOption.append(iframe);

                insertionContainer.insertAdjacentElement(
                    "beforebegin",
                    checkoutOption
                );
            })
            .catch((error) => console.debug(error));
    }

    private getStoredIframeOrCapture(): Promise<HTMLIFrameElement> {
        return new Promise<HTMLIFrameElement>((resolve, reject) => {
            const storedIframe =
                AmazonBWPExpressCheckout.iframeRepository.get(this);
            if (storedIframe) resolve(storedIframe);

            this.getIframe().then((iframe) => {
                AmazonBWPExpressCheckout.iframeRepository.set(this, iframe);

                resolve(iframe);
            });
        });
    }

    private getIframe(): Promise<HTMLIFrameElement> {
        return new Promise<HTMLIFrameElement>((resolve, reject) => {
            const pattern = "https://order.buywithprime.amazon.com";

            const iframe = document.querySelector<HTMLIFrameElement>(
                `iframe[src^="${pattern}"]`
            );
            if (iframe) resolve(iframe);

            const captureBody = new CaptureElement(document.body);

            captureBody.subscribe("childList", (record) => {
                const nodes = Array.from(record.addedNodes).filter(
                    (node): node is Element =>
                        node.nodeType === Node.ELEMENT_NODE
                );

                captureBody.disconnect();

                const iframe = nodes
                    .filter(
                        (node): node is HTMLIFrameElement =>
                            node.nodeName.toLowerCase() === "iframe"
                    )
                    .find((node) => node.getAttribute("src")?.match(pattern));

                if (iframe) resolve(iframe);

                captureBody.connect();
            });
        });
    }
}
