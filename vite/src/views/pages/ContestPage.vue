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
        <section v-if="userRole=='evaluator'">

        </section>

        <!-- Depos dessin -->
        <section v-if="userRole=='participant'">
            <div class="section-header">
                <h5>Déposer un dessin </h5><span>({{ drawings.length }}/{{ nbMaxDrawings }})</span>
            </div>

            <div class="drawing-list">
                <div class="drawing" v-for="(drawing, index) in drawings" :key="index">
                    <p>{{ (index+1) + '. ' + drawing.commentaire }}</p>
                    <p>Déposé le {{ drawing.dateRemise }}</p>
                </div>
            </div>

            <button class="upload-drawing-button" :disabled="drawings.length == nbMaxDrawings">Déposer</button>
        </section>

        <!-- Infos générales -->
        <section v-if="userRole=='president'">

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
                userRole: 'participant',
                drawings: [
                    {
                        commentaire: "Mon dessin",
                        dateRemise: "2021-06-01",
                    },
                    {
                        commentaire: "Plus dans unstyle croustillant",
                        dateRemise: "2021-06-02",
                    },
                    {
                        commentaire: "T'as les croustis?",
                        dateRemise: "2021-06-04",
                    }
                ],
                nbMaxDrawings: 3,
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

            ApiService.request(`/contest.php?id=${contestId}`).then((result) => {
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
        flex-direction: column;
        width: 100%;
        height: 100%;
        margin: 0 0 3rem 0;
        gap: 32px;
    }

    section {
        min-height: 200px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        margin: 0 20%;
        border: 1px solid rgba(0, 0, 0, 0.15);
        border-radius: 12px;
        padding: 28px 36px 32px 36px;
        gap: 24px;
        background-color: white;
    }

    .drawing-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
        width: 100%;
        height: 100%;
        overflow-y: auto;
    }

    .drawing {
        padding: 20px 24px;
        border-radius: 12px;
        background-color: rgba($primary-color, 15%);
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .upload-drawing-button {
        background-color: $primary-color;
        color: $background-color;
        height: 38px;
        min-width: 100px;
        padding: 0 22px;
        border-radius: 19px;
        line-height: 2.25rem;

        &:disabled {
            cursor: not-allowed;
            color: rgba(white, 75%);
            background-color: rgba(black, 35%);
            &:hover {
                opacity: 1;
            }
        }
    }

    .section-header {
        width: 100%;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .banner {
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        width: 100%;
        height: 180px;
        padding: 0 20%;
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
            left: 20%;
            width: 60%;
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
