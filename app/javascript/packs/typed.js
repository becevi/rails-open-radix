import Typed from "typed.js";

const loadDynamicBannerText = () => {
  new Typed('#typed', {
    strings: ["open_radix"],
    typeSpeed: 250,
    backDelay: 5000,
    backSpeed: 100,
    loop: true,
    showCursor: true
  });
}
export { loadDynamicBannerText };
