import Carousel from "shared/ts/components/carousel";

import SlideCarouselAdapter from "shared/ts/api/carousel/slide/adapters/slide-carousel";

import { observer } from "shared/ts/observers/intersection";

import VimeoManager from "Shared/ts/utils/vimeo-manager";

observer(".reviews", {
    inRange: (record) => {
        const carousel = new Carousel(new SlideCarouselAdapter(record));

        carousel.enablePrevNextControls();
    }
});
