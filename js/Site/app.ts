// components
import Carousel from "Shared/ts/components/carousel";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";

// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import Disclosure from "Shared/ts/utils/disclosure";

observer(".reviews", {
    inRange: (record) => {
        const carousel = new Carousel(new SlideCarouselAdapter(record));

        carousel.enablePrevNextControls();
    }
});

const disclosure = new Disclosure();

disclosure.controllers.forEach((controller) => {
    controller.addEventListener("click", (event) => {
        disclosure.toggleElementsByController(controller);
    });
});
