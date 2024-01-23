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
                        <h5>{{ currentContest.name }}</h5>
                        <div class="time-left">
                            <small>{{ formatTimeLeft(currentContest.endDate) }}</small>
                        </div>
                    </div>
                    <p>{{ $t('theme') }}: {{ currentContest.theme }}</p>
                    <button class="participate-button">{{ $t('see') }}</button>
                </div>
            </section>
        </div>
        <div class="section-list">
            <section>
                <h4>{{ $t('history') }}</h4>
                <p v-if="!contestHistory.length">{{ $t('noContestHistory') }}</p>
                <div v-else class="contest-history-list">
                    <div class="contest-history-card" v-for="contest in contestHistory" :key="contest.id">
                        <div class="contest-history-card-banner">
                            <p class="contest-history-card-title">{{ contest.name }}</p>
                        </div>
                        <div class="contest-history-card-content">
                            <small>{{ formatTimeDifference(contest.endDate) }}</small>
                        </div>
                    </div>
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

    export default {
        data() {
            return {
                currentContest: {
                    id: 5,
                    name: "Soleil d'été",
                    theme: "Beauté du soleil",
                    startDate: new Date(Date.now() - (86400000 * 3)),
                    endDate: new Date(Date.now() + (86400000 * 14)),
                },
                contestHistory: [
                    {
                        id: 1,
                        name: "Concours 1",
                        endDate: new Date(Date.now() - (86400000 * 14)),
                    },
                    {
                        id: 9,
                        name: "Concours 2",
                        endDate: new Date(Date.now() - 86400000),
                    },
                    {
                        id: 7,
                        name: "Concours 3",
                        endDate: new Date("2023-09-10"),
                    },
                    {
                        id: 81,
                        name: "Concours 4",
                        endDate: new Date("2023-01-10"),
                    },
                    {
                        id: 54,
                        name: "Concours 5",
                        endDate: new Date("2023-12-16"),
                    },
                    {
                        id: 32,
                        name: "Concours 6",
                        endDate: new Date("2023-08-24"),
                    },
                    {
                        id: 31,
                        name: "Concours 7",
                        endDate: new Date("2023-08-24"),
                    },
                    {
                        id: 24,
                        name: "Concours 8",
                        endDate: new Date("2023-08-24"),
                    }
                ]
            };
        },
        async mounted() {
            this.isAuthenticated = await AuthService.isAuthenticated();
            if (!this.isAuthenticated) return;

            this.isClubPresident = await AuthService.isClubPresident();
            if (this.isClubPresident) return;

            this.isAdmin = await AuthService.isAdmin();
        },
        methods: {
            getDeltaTime(date) {
                const currentDate = new Date();
                const givenDate = new Date(date);
                return currentDate - givenDate;
            },
            getDeltaDays(date) {
                const timeDifference = this.getDeltaTime(date)
                const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
                return daysDifference;
            },
            formatTimeDifference(date) {
                const daysDifference = this.getDeltaDays(date)

                // Format the result
                if (daysDifference === 0) return this.$t('closedDateFormatToday');
                else if (daysDifference === 1) return this.$t('closedDateFormatYesterday');
                else return this.$t('closedDateFormatDays', { days: daysDifference });
            },
            formatTimeLeft(endDate) {
                const timeDifference = -this.getDeltaTime(endDate);
                const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
                const hoursDifference = Math.floor(timeDifference / (1000 * 60 * 60));
                const minutesDifference = Math.floor(timeDifference / (1000 * 60));
                const secondsDifference = Math.floor(timeDifference / (1000));

                // Format the result
                if (daysDifference > 0) return this.$t('timeLeftFormatDays', { days: daysDifference });
                else if (hoursDifference > 0) return this.$t('timeLeftFormatHours', { hours: hoursDifference });
                else if (minutesDifference > 0) return this.$t('timeLeftFormatMinutes', { minutes: minutesDifference });
                else if (secondsDifference > 0) return this.$t('timeLeftFormatSeconds', { seconds: secondsDifference });
                else return this.$t('timeLeftFormatNow');
            },
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
    }

    .participate-button {
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
        background-color: rgba(black, 50%);
        @extend %topography-pattern;
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
