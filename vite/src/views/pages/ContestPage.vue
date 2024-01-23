<template>
    <app-header></app-header>
    <main>
        <div class="banner" :class="{ 'disabled': contest.etat === 'EVALUE' }">
            <h2 class="contest-theme">{{ contest.theme }}</h2>
            <div class="banner-content">
                <div class="tooltip" :class="{ 'disabled': contest.etat === 'EVALUE' }">
                    <small>{{ getTooltipContent() }}</small>
                </div>
            </div>
        </div>

        <!-- Liste des dessins à évaluer -->
        <section>
            
        </section>

        <!-- Depos dessin -->
        <section>

        </section>

        <!-- Infos générales -->
        <section>

        </section>
    </main>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
</script>

<script>
    import ApiService from '@/services/apiService';
    import TimeService from '@/services/timeService';

    export default {
        data() {
            return {
                userRole: undefined,
                contest: {
                    numConcours: undefined,
                    theme: undefined,
                    dateDebut: undefined,
                    dateFin: undefined,
                    etat: undefined,
                },
                isModalVisible: false
            }
        },
        mounted() {
            const contestId = this.$route.params.contestId;

            if (!contestId) this.$router.push({ name: 'NotFound' });

            ApiService.request(`/dev_contest.php?id=${contestId}`).then((result) => {
                console.log(result);
                this.contest = result;
            });
        },
        methods: {
            getTooltipContent() {
                'PAS_COMMENCE', 'EN_COURS', 'ATTENTE', 'RESULTAT', 'EVALUE'
                switch (this.contest.etat) {
                    case 'PAS_COMMENCE': return this.$t('contestNotStarted');
                    case 'EN_COURS': return TimeService.formatTimeLeft(this.$t, this.contest.dateFin)
                    case 'ATTENTE': return this.$t('contestPending');
                    case 'RESULTAT': return this.$t('contestEvaluated');
                    case 'EVALUE': return this.$t('contestClosed');
                }
            }
        }
    };
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";
    @import "@/styles/partials/breakpoints.scss";
    @import "@/styles/partials/patterns.scss";

    main {
        display: flex;
        width: 100%;
        height: 100%;
        margin: 0 0 3rem 0;
        gap: 32px;
    }

    .banner {
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        width: 100%;
        height: 180px;
        padding: 0 12%;
        border-bottom: 1px solid rgba(0, 0, 0, 0.15);
        background-color: $primary-color;
        @extend %topography-pattern;
        color: white;

        &.disabled {
            background-color: rgba(black, 50%);
        }

        .banner-content {
            position: absolute;
            bottom: 0;
            left: 10%;
            width: 80%;
            transform: translateY(50%);
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
        }

        .contest-theme {
            text-shadow: 0 0 6px rgba(0, 0, 0, 40%);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .tooltip {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            background-color: $background-color;
            color: $primary-color;
            border-radius: 12px;
            height: 24px;
            padding: 0 12px;
            width: auto;

            &.disabled {
                color: rgba(black, 50%);
            }
        }
    }

</style>
