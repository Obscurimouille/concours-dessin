<template>
    <app-header></app-header>
    <main>
        <div class="section-list left">
            <section>
                En cours
            </section>
            <section>
                Vous avez deux dessins en attente d'évaluation
            </section>
        </div>
        <div class="section-list right">
            <section>
                Historique
            </section>
        </div>
    </main>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";

    main {
        display: flex;
        flex-direction: row;
        gap: 24px;
        margin: 5rem 0 2rem 0;
        padding: 0 6%;
        width: 100%;
        height: 100%;
    }

    .section-list {
        display: flex;
        flex-direction: column;
        gap: 24px;
        height: 100%;

        &.left {
            flex-basis: 50%;
        }

        &.right {
            flex-basis: 50%;
        }
    }

    section {
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        padding: 36px;
    }

</style>
