<template>
    <div class="modal-overlay" @click="closeModal">
        <div class="modal-container" @click.stop>
            <slot></slot>
            <!-- <button @click="closeModal">Close</button> -->
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Modal',
        methods: {
            closeModal() {
                this.$emit("close");
            }
        },
    };
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";

    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 9999;
        background-color: rgba(0, 0, 0, 0.3);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal-container {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        background: white;
        display: flex;
    }
</style>
