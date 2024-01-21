<template>
    <main>
        <nav class="navbar">
            <router-link to="/">
                <h3 class="app-name">Zaiten</h3>
            </router-link>

            <h5 class="menu-title">{{ $t('contest') }}</h5>

            <a class="menu-item" href="#contest-new">
                <img src="/images/icons/add-circle_300.svg"/>
                <span class="material-icons">{{ $t('new') }}</span>
            </a>

            <a class="menu-item disabled" href="#contest-stats">
                <img src="/images/icons/leaderboard_200.svg"/>
                <span class="material-icons">{{ $t('statistics') }}</span>
            </a>

            <h5 class="menu-title">{{ $t('club') }}</h5>

            <a class="menu-item disabled" href="#clubs-manage">
                <img src="/images/icons/supervisor-account_200.svg"/>
                <span class="material-icons">{{ $t('manage') }}</span>
            </a>
        </nav>

        <div class="page-content" v-if="currentHash === 'contest-new'">
            <h3 class="page-title">{{ $t('newContest') }}</h3>

            <form class="new-contest-form" type="POST">
                <div class="form-input-group">
                    <label for="theme">{{ $t('theme') }}</label>
                    <input type="text" name="theme" maxlength="60" required/>
                </div>

                <div class="form-input-group">
                    <label for="description">{{ $t('description') }}</label>
                    <textarea name="description" maxlength="2500" required/>
                </div>

                <div class="date-container">
                    <div class="form-input-group">
                        <label for="startDate">{{ $t('startDate') }}</label>
                        <input type="date" name="startDate" required/>
                    </div>

                    <div class="form-input-group">
                        <label for="endDate">{{ $t('endDate') }}</label>
                        <input type="date" name="endDate" required/>
                    </div>
                </div>

                <div class="form-input-group">
                    <label for="president">{{ $t('president') }}</label>
                    <select name="president" required>
                        <option value="" selected disabled>{{ $t('choose') }}</option>
                        <option v-for="member in members" :key="member.id" :value="member.id">
                            {{ member.firstname }} {{ member.lastname }} -
                        </option>
                        <!-- Ajoutez d'autres options selon vos besoins -->
                    </select>
                </div>

                <div class="button-list">
                    <button class="submit-button" type="submit">{{ $t('validate') }}</button>
                </div>
            </form>
        </div>

        <div class="page-content" v-else-if="currentHash === 'contest-stats'">
            <h3 class="page-title">Contest Stats</h3>
        </div>

        <div class="page-content" v-else-if="currentHash === 'clubs-manage'">
            <h3 class="page-title">Manage Clubs</h3>
        </div>

        <div class="page-content" v-else>
            <h3 class="page-title">Welcome to the Dashboard</h3>
            <ul>
                <li>
                    <a href="#contest-new">New Contest</a>
                </li>
            </ul>
        </div>
    </main>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
</script>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                currentHash: window.location.hash ? window.location.hash.substring(1) : '',
                members: []
            };
        },
        mounted() {
            axios.get(`/dev_members.php`).then((response) => {
                this.members = response.data;
                console.log(this.members);
            }).catch((error) => {
                console.error(error);
            });
        },
        watch: {
            $route: {
                handler(newRoute) {
                    this.currentHash = newRoute.hash.substring(1);
                },
                immediate: true
            }
        }
    };
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";
    @import "@/styles/partials/breakpoints.scss";

    main {
        display: flex;
        flex-direction: row;
        width: 100%;
        height: 100%;
        background-color: white;
    }

    .navbar {
        flex: 0 0 280px;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        gap: 24px;
        padding: 24px 36px;
        border-right: 1px solid rgba(0, 0, 0, 0.15);
        background-color: $background-color;

        @media (max-width: $view-lg) {
            flex-basis: 200px;
        }
    }

    .menu-title {
        color: rgba($text-color, 80%);
        font-weight: 500;
        margin-top: 48px;
    }

    .menu-item {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 12px;
        color: $text-color;

        &.disabled {
            pointer-events: none;
            opacity: 0.5;
        }

    }

    .page-content {
        flex: 1 1 auto;
        display: flex;
        flex-direction: column;
        padding: 5rem 96px 5rem 96px;
        overflow-x: hidden;
        overflow-y: auto;

        @media (max-width: $view-lg) {
            padding: 3rem 64px 3rem 64px;
        }
    }

    .page-title {
        margin-bottom: 64px;
    }

    .new-contest-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 32px;
        width: 100%;

        @media (max-width: $view-lg) {
            margin-bottom: 64px;
        }

        .form-input-group {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 8px;

            textarea {
                resize: none;
                min-height: 180px;
            }

            input {
                &:disabled {
                    padding: .5rem 0;
                    border: none;
                    background-color: transparent;
                    color: $text-color;
                }
            }
        }

        .date-container {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            gap: 32px;
            width: 100%;

            .form-input-group {
                flex: 1 1 auto;
                width: auto;
                min-width: 180px;
            }
        }

        .button-list {
            display: flex;
            flex-direction: row;
            gap: 16px;
            width: 100%;
            justify-content: space-around;
        }

        .submit-button, .cancel-button {
            margin-top: 1.5rem;
            height: 38px;
            min-width: 100px;
            padding: 0 22px;
            border-radius: 10px;
            line-height: 2.25rem;
        }

        .submit-button {
            background-color: $primary-color;
            color: $background-color;
        }

        .cancel-button {
            background-color: rgba($text-color, 50%);
            color: $background-color;
        }
    }

</style>
