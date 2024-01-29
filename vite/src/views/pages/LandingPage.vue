<template>
    <app-header></app-header>
    <main>
        <h2>Landing Page</h2>
    </main>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";

    main {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        gap: 8em;
        margin: 5rem 0;
        width: 100%;
    }
</style>
