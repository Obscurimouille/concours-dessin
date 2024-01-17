<template>
    <div class="header">
        <div class="logo">
            <img class="app-logo" src="/images/logos/favicon-32.png">
            <a href="/">
                <h4 class="app-name">Zaiten</h4>
            </a>
        </div>

        <div class="menu">
            <language-dropdown></language-dropdown>
            <a class="menu-item">{{ $t('login') }}</a>
        </div>
    </div>
</template>

<script setup>
    // Component logics
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";
</style>
