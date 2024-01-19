<template>
    <div class="header">
        <div class="logo">
            <img class="app-logo" src="/images/logos/favicon-32.png">
            <router-link to="/">
                <h4 class="app-name">Zaiten</h4>
            </router-link>
        </div>

        <div class="menu">
            <a class="menu-item" href="/club/12345">Club</a>

            <language-dropdown></language-dropdown>
            <router-link class="menu-item" to="/login">{{ $t('login') }}</router-link>
        </div>
    </div>
</template>

<script setup>
    import LanguageDropdown from "./LanguageDropdown.vue";
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";

    .header {
        padding: 0.5rem 12%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        width: 100%;
        height: 60px;
        position: fixed;
        z-index: 9999;
        background-color: $background-color;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .logo {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 1em;
    }

    .app-logo {
        width: 24px;
        height: 24px;
    }

    .app-name {
        font-weight: 700;
    }

    .menu {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 10%;
        justify-content: flex-end;
    }

    .menu-item {
        padding: 0 1rem;
        transition: opacity 0.3s ease;
        &:hover {
            opacity: 0.6;
        }
    }
</style>
