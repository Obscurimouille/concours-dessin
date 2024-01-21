<template>
    <div class="header">
        <div class="logo">
            <img class="app-logo" src="/images/logos/favicon-32.png">
            <router-link to="/">
                <h5 class="app-name">Zaiten</h5>
            </router-link>
        </div>

        <div class="menu">
            <a v-if="isClubPresident" class="menu-item" href="/club/12345">Club</a>
            <a v-if="isAdmin" class="menu-item" href="/home">Admin</a>

            <language-dropdown></language-dropdown>
            <router-link v-if="!isAuthenticated" class="menu-item" to="/login">{{ $t('login') }}</router-link>
            <a v-else class="menu-item" href="/logout.php">{{ $t('logout') }}</a>
        </div>
    </div>
</template>

<script setup>
    import LanguageDropdown from "./LanguageDropdown.vue";
</script>

<script>
    import ApiService from '@/services/apiService';

    export default {
        data() {
            return {
                isAuthenticated: false,
                isAdmin: false,
                isClubPresident: false,
            };
        },
        mounted() {
            ApiService.request(`/isAuthenticated.php`).then((result) => {
                console.log(result);
                this.isAuthenticated = result.isAuthenticated;
                if (!this.isAuthenticated) return;
                console.log('isAuthenticated');

                ApiService.request(`/isClubPresident.php`).then((result) => {
                    console.log(result);
                    this.isClubPresident = result.isClubPresident;
                    if (this.isClubPresident) return;
                    console.log('isClubPresident');

                    ApiService.request(`/isAdmin.php`).then((result) => {
                        console.log(result);
                        this.isAdmin = result.isAdmin;
                        console.log('isAdmin');
                    });
                });
            });
        },
    };
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
        z-index: 999;
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
