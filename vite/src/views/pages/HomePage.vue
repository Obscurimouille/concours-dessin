<template>
    <app-header></app-header>
    <main>
        <div class="section-list">
            <section>
                <h4>{{ $t('currently') }}</h4>
                <hr>
                <p v-if="!currentContest">{{ $t('noContest') }}</p>
                <div v-else class="current-contest-card">
                    <div class="current-contest-card-header">
                        <h5>{{ currentContest.theme }}</h5>
                        <div class="time-left">
                            <small>{{ TimeService.formatTimeLeft($t, currentContest.dateFin) }}</small>
                        </div>
                    </div>
                    <a
                        v-if="currentContest.role == 'None'"
                        class="participate-button" :href="'/contest/' + currentContest.numConcours"
                    >
                        {{ $t('participate') }}
                    </a>
                    <a
                        v-if="currentContest.role != 'None'"
                        class="participate-button" :href="'/contest/' + currentContest.numConcours"
                    >
                        {{ $t('see') }}
                    </a>
                </div>
            </section>
            <section v-if="currentContest.role == 'Evaluateur' && evaluatorDrawings.length" class="evaluate-section">
                Vous avez {{ evaluatorDrawings.length }} dessins à évaluer
                <a class="evaluate-button" :href="'/contest/' + currentContest.numConcours">
                    <small>{{ $t('see') }}</small>
                </a>
            </section>
        </div>
        <div class="section-list">
            <section>
                <h4>{{ $t('history') }}</h4>
                <p v-if="!contestHistory.length">{{ $t('noContestHistory') }}</p>
                <div v-else class="contest-history-list">
                    <a class="contest-history-card" v-for="contest in contestHistory" :key="contest.id" :href="'/contest/' + contest.numConcours">
                        <div class="contest-history-card-banner" :class="contest.etat">
                            <p class="contest-history-card-title">{{ contest.theme }}</p>
                        </div>
                        <div class="contest-history-card-content">
                            <small v-if="contest.etat == 'ATTENTE'">{{ $t('contestPending') }}</small>
                            <small v-if="contest.etat == 'EVALUE'">{{ TimeService.formatTimeDifference($t, contest.dateFin) }}</small>
                        </div>
                    </a>
                </div>
            </section>
        </div>
    </main>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
</script>

<script>
    import AuthService from '@/services/authService';
    import TimeService from '@/services/timeService';
    import ContestService from "@/services/contestService";
    import UserService from "@/services/userService";
    import DrawingService from "@/services/drawingService";

    export default {
        data() {
            return {
                currentContest: {},
                contestHistory: [],
                evaluatorDrawings: []
            };
        },
        async mounted() {
            this.isAuthenticated = await AuthService.isAuthenticated();
            if (!this.isAuthenticated) return;

            this.isClubPresident = await AuthService.isClubPresident();
            if (this.isClubPresident) return;

            this.userInfos = await AuthService.getSelfInfos();
            console.log(this.userInfos);
            await this.fetchData();

            this.isAdmin = await AuthService.isAdmin();
        },
        methods: {
            async fetchData() {
                this.currentContest = await ContestService.getCurrent();
                this.currentContest['role'] = await UserService.getRoleForContest(
                    this.userInfos.numUtilisateur,
                    this.currentContest.numConcours,
                );
                console.log(this.userInfos.numUtilisateur);
                console.log(this.currentContest.role);

                this.contestHistory = await ContestService.getHistory();
                if (this.currentContest.role == 'Evaluateur') {
                    this.evaluatorDrawings = await DrawingService.getAllForEvaluatorForContest(
                        this.userInfos.numUtilisateur,
                        this.currentContest.numConcours,
                    );
                    console.log(this.evaluatorDrawings);
                }
            }
        }
    };
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";
    @import "@/styles/partials/patterns.scss";
    @import "@/styles/partials/scrollbar.scss";

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
        flex: 1 1 0;
        width: 0;
    }

    section {
        border: 1px solid rgba(0, 0, 0, 0.15);
        border-radius: 10px;
        padding: 36px;
        display: flex;
        gap: 24px;
        flex-direction: column;
        background-color: white;
    }

    .evaluate-section {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    .evaluate-button {
        display: flex;
        align-items: center;
        justify-content: center;
        align-self: center;
        text-align: center;
        background-color: $primary-color;
        color: white;
        border-radius: 12px;
        height: 24px;
        padding: 0 12px;
        width: auto;
    }

    .current-contest-card {
        display: flex;
        gap: 12px;
        flex-direction: column;
        align-items: flex-start;
    }

    .current-contest-card-header {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    .time-left {
        display: flex;
        align-items: center;
        justify-content: center;
        align-self: center;
        text-align: center;
        background-color: $primary-color;
        color: white;
        border-radius: 12px;
        height: 24px;
        padding: 0 12px;
        width: auto;
    }

    .contest-history-list {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        gap: 24px;
        overflow-x: auto;
        @extend %hide-scrollbar;
    }

    .contest-history-card {
        flex: 1 1 280px;
        display: flex;
        flex-direction: column;
        border-radius: 10px;
        border: 1px solid rgba(0, 0, 0, 0.15);
        min-width: 160px;
        transition: transform 0.15s ease-in-out;

        &:hover {
            transform: scale(98%);
        }
    }

    .participate-button {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 96px;
        align-self: center;
        background-color: $primary-color;
        color: $background-color;
        height: 38px;
        min-width: 100px;
        padding: 0 22px;
        border-radius: 19px;
        line-height: 2.25rem;
    }

    .contest-history-card-banner {
        border-radius: 10px 10px 0 0;
        position: relative;
        width: 100%;
        height: 50px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        @extend %topography-pattern;

        &.ATTENTE {
            background-color: $primary-color;
        }

        &.EVALUE {
            background-color: rgba(black, 50%);
        }
    }

    .contest-history-card-title {
        position: absolute;
        text-align: center;
        bottom: 0;
        left: 50%;
        color: white;
        text-shadow: 0 0 6px rgba(0, 0, 0, 40%);
        transform: translate(-50%, -25%);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        width: 100%;
        padding: 0 20px;
    }

    .contest-history-card-content {
        width: 100%;
        display: flex;
        flex-direction: column;
        padding: 16px 20px;

        & > * {
            overflow: hidden;
        }

    }

</style>
