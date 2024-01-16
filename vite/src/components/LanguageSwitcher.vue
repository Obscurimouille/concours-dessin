<template>
    <div>
        <button @click="changeLanguage('en')">English</button>
        <button @click="changeLanguage('fr')">Français</button>
    </div>
</template>

<script setup>
    import i18n from "i18next";

    const changeLanguage = async (language) => {
        await i18n.changeLanguage(language);
        i18n.updateDOM();
    };
</script>

<style scoped>
/* Ajoutez vos styles ici si nécessaire */
</style>
