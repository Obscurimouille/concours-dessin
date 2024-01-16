import i18n from "i18next";
import HttpBackend from "i18next-http-backend";

i18n.use(HttpBackend)
    .init({
        fallbackLng: "en",
        debug: process.env.NODE_ENV == "development",
        interpolation: {
            escapeValue: false,
        },
        backend: {
            loadPath:
                process.env.NODE_ENV == "production"
                    ? "/dist/locales/{{lng}}.json"
                    : import.meta.env.VITE_SERVER_URL + "/locales/{{lng}}.json",
        },
    })
    .then(() => {
        i18n.updateDOM();
    });

/**
 * Update DOM with the current translation
 */
i18n.updateDOM = () => {
    document.body.querySelectorAll("[data-i18n]").forEach((element) => {
        element.textContent = i18n.t(element.getAttribute("data-i18n"));
    });
};

export default i18n;
