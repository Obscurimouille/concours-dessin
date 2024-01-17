<template>
    <div>
        <button class="dropdown-button" @click="toggle()">
            <span data-i18n="language"></span>
            <img class="icon" src="/images/icons/expand-down_200.svg">
        </button>
        <div class="dropdown-content">
            <button class="dropdown-item" @click="changeLanguage('en')">English</button>
            <button class="dropdown-item" @click="changeLanguage('fr')">Français</button>
        </div>
    </div>
</template>

<script setup>
    import i18n from "i18next";
    import Cookies from 'js-cookie';

    const changeLanguage = async (language) => {
        await i18n.changeLanguage(language);
        Cookies.set("lang", language);
        i18n.updateDOM();
    };

    const toggle = () => {
        const content = document.querySelector(".dropdown-content");
        if (!content) return;
        content.classList.toggle("show");
    };

    // Close the dropdown menu if the user clicks outside of it
    window.onclick = (event) => {
        if (event.target.closest(".dropdown-button")) return;
        const dropdowns = document.getElementsByClassName("dropdown-content");
        for (let dropdown of dropdowns) {
            if (dropdown.classList.contains("show")) {
                dropdown.classList.remove("show");
            }
        }
    };
</script>

<style lang="scss" scoped>
    @import "../styles/partials/colors.scss";

    .dropdown-button {
        position: relative;
        display: flex;
        align-items: center;

        transition: opacity 0.3s ease;
        &:hover {
            opacity: 0.6;
        }
    }

    .icon {
        width: 24px;
        height: 24px;
    }

    .dropdown-content {
        display: flex;
        visibility: hidden;
        opacity: 0;
        flex-direction: column;
        position: absolute;
        top: 98%;
        border-radius: 10px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        padding: 0.2em;
        background-color: $background-color;
        transition: visibility .15s linear, opacity .15s linear;

        &.show {
            visibility: visible;
            opacity: 1;
        }
    }

    .dropdown-item {
        text-align: left;
        padding: 8px 16px;
        border-radius: 6px;
        transition: background .15s linear;

        &:hover {
            background: rgba($primary-color, 8%)
        }
    }
</style>
