import { createI18n } from "vue-i18n";
import Cookies from "js-cookie";
import en from "../locales/en.json";
import fr from "../locales/fr.json";

const languageCodes = ["en", "fr"];
let languageCode = "en";

// Get the language code from the cookie
const languagePreference = Cookies.get("locale");
if (languagePreference && languageCodes.includes(languagePreference)) {
    languageCode = languagePreference;
}

// Get the language code from the user's browser
else {
    const userLanguage = navigator.language || navigator.userLanguage;

    if (userLanguage) {
        const languageParts = userLanguage.split("-");
        const code = languageParts[0];
        if (languageCodes.includes(code)) languageCode = code;
    }
}


const i18n = createI18n({
    locale: languageCode,
    fallbackLocale: "en",
    messages: {
        en,
        fr,
    },
});

export default i18n;