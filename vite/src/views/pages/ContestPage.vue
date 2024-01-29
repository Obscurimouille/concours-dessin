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

        <section v-if="contest.etat === 'PAS_COMMENCE'">
            <p>{{ $t('noStartedYet') }}</p>
        </section>

        <section v-if="userRole=='Président' || contest.etat === 'EVALUE'">
            <div class="section-header">
                <h5>{{ $t('results') }} </h5>
            </div>

            <div class="drawing-list" v-if="results.length">
                <div class="result-drawing" v-for="(drawing, index) in results" :key="index">
                    <p>{{ (index+1) + '. ' + drawing.prenom + ' ' + drawing.nom + ' - ' + drawing.commentaire }}</p>
                    <p>{{ average(drawing.evaluations) }}</p>
                </div>
            </div>

            <p v-else>{{ $t('noData') }}</p>
        </section>

        <section v-if="contest.etat === 'ATTENTE'">
            <p>{{ $t('waitingForEvaluation') }}</p>
        </section>

        <!-- Liste des dessins à évaluer -->
        <section v-if="contest.etat === 'EN_COURS' && userRole=='Evaluateur'">
            <div class="section-header">
                <h5>{{ $t('pendingEvaluation') }}</h5>
            </div>

            <div class="drawing-list" v-if="toEvaluateDrawings.length">
                <div class="to-evaluate-drawing" v-for="(drawing, index) in toEvaluateDrawings" :key="index">
                    <p>{{ (index+1) + '. ' + drawing.commentaire }}</p>

                    <input type="text" name="evaluatorId" :value="userInfos.numUtilisateur" hidden/>
                    <input type="text" name="drawingId" :value="drawing.numDessin" hidden/>

                    <label for="comment">{{ $t('comment') }}</label>
                    <input type="text" class="comment-input" v-model="drawing.comment" name="comment"/>

                    <label for="mark">{{ $t('mark') }} (/20)</label>
                    <input type="number" class="mark-input" v-model="drawing.mark" name="mark" min="0" max="20" required/>

                    <button @click="postEvaluation(drawing.numDessin, drawing.mark, drawing.comment)">Envoyer</button>
                </div>
            </div>
            <p v-else>{{ $t('noDrawingsToEvaluate') }}</p>
        </section>

        <!-- Depos dessin -->
        <section v-if="userRole=='Compétiteur'">
            <div class="section-header">
                <h5>{{ $t('submitADrawing') }} </h5><span>({{ drawings.length }}/{{ nbMaxDrawings }})</span>
            </div>

            <div class="drawing-list" v-if="drawings">
                <div class="drawing" v-for="(drawing, index) in drawings" :key="index">
                    <p>{{ (index+1) + '. ' + drawing.commentaire }}</p>
                    <p>{{ $t('submitedOn') }} {{ drawing.dateRemise }}</p>
                </div>
            </div>

            <button class="upload-drawing-button" :disabled="drawings.length == nbMaxDrawings">Déposer</button>
        </section>
    </main>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
</script>

<script>
    import TimeService from '@/services/timeService';
    import ContestService from "@/services/contestService";
    import AuthService from "@/services/authService";
    import UserService from "@/services/userService";
    import DrawingService from "@/services/drawingService";

    export default {
        data() {
            return {
                contestId: undefined,
                userRole: '',
                drawings: [],
                toEvaluateDrawings: [],
                nbMaxDrawings: 3,
                contest: {},
                isModalVisible: false,
                results: []
            }
        },
        async mounted() {
            this.contestId = this.$route.params.contestId;
            if (!this.contestId) this.$router.push({ name: 'NotFound' });

            this.userInfos = await AuthService.getSelfInfos();
            this.userRole = await UserService.getRoleForContest(this.userInfos.numUtilisateur, this.contestId);

            await this.fetchData();
        },
        methods: {

            async fetchData() {
                this.contest = await ContestService.getById(this.contestId);
                if (this.contest.etat == 'EVALUE') {
                    this.results = await DrawingService.getDrawingsAndEvaluationForContest(this.contestId);
                    this.results = [...this.results, ...this.results]
                    return;
                }

                if (this.userRole == 'Compétiteur') {
                    this.drawings = await DrawingService.getByParticipantAndContest(
                        this.userInfos.numUtilisateur, this.contestId
                    );
                    return;
                }

                if (this.userRole == 'Evaluateur') {
                    this.toEvaluateDrawings = await DrawingService.getAllForEvaluatorAndContest(
                        this.userInfos.numUtilisateur, this.contestId
                    );
                    return;
                }
            },
            getTooltipContent() {
                // 'PAS_COMMENCE', 'EN_COURS', 'ATTENTE', 'EVALUE'
                switch (this.contest.etat) {
                    case 'PAS_COMMENCE': return this.$t('contestNotStarted');
                    case 'EN_COURS': return TimeService.formatTimeLeft(this.$t, this.contest.dateFin)
                    case 'ATTENTE': return this.$t('contestPending');
                    case 'EVALUE': return this.$t('contestClosed');
                }
            },
            async postEvaluation(drawingId, mark, comment = '') {
                const res = await DrawingService.postEvaluation(
                    this.userInfos.numUtilisateur, drawingId, mark, comment
                );
                window.location.reload();
            },
            average(evaluations) {
                let sum = 0;
                for (const evaluation of evaluations) sum += +evaluation.note;
                return sum / evaluations.length;
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
        min-height: 120px;
        max-height: 70%;
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

        @media (max-width: $view-xl) {
            margin: 0 5%;
        }
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

    .to-evaluate-drawing {
        padding: 20px 24px;
        border-radius: 12px;
        background-color: rgba(black, 5%);
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        overflow: hidden;
        flex-wrap: wrap;
        gap: 18px;

        .comment-input {
            flex: 1 0 25%;
        }

        .mark-input {
            flex: 0 0 80px;
        }
    }

    .result-drawing {
        min-height: 62px;
        padding: 20px 24px;
        border-radius: 12px;
        background-color: rgba(black, 5%);
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        overflow: hidden;
        flex-wrap: wrap;
        gap: 18px;
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

        @media (max-width: $view-xl) {
            padding: 0 5%;
        }

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

            @media (max-width: $view-xl) {
                left: 5%;
                width: 90%;
            }
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
