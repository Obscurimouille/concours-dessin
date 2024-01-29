import ApiService from "./apiService";

const DrawingService = {

    /**
     * Get all drawings an evaluator has to evaluate for a contest
     * @param {number} evaluatorId The id of the evaluator
     * @param {number} contestId The id of the contest
     * @param {boolean} onlyNotEvaluated If true, only drawings that have not been evaluated yet will be returned
     */
    getAllForEvaluatorAndContest(evaluatorId, contestId, onlyNotEvaluated = false) {
        return ApiService.request(`/getDrawingForEvaluatorAndContest.php?id_user=${evaluatorId}&id_contest=${contestId}&onlyNotEvaluated=${onlyNotEvaluated}`);
    },

    /**
     * Get all drawings a participant has submitted for a contest
     * @param {number} participantId The id of the participant
     * @param {number} contestId The id of the contest
     */
    getByParticipantAndContest(participantId, contestId) {
        return ApiService.request(`/getDrawingFromUserForContest.php?id_user=${participantId}&id_contest=${contestId}`);
    },

    /**
     * Get all drawings and evaluations for a contest
     * @param {number} contestId The id of the contest
     */
    getDrawingsAndEvaluationForContest(contestId) {
        return ApiService.request(`/getDrawingsAndEvaluationForContest.php?id_contest=${contestId}`);
    },

    /**
     * Post an evaluation for a drawing
     * @param {number} evaluatorId The id of the evaluator
     * @param {number} drawingId The id of the drawing
     * @param {number} mark The mark given to the drawing
     * @param {string} comment The comment given to the drawing
     */
    postEvaluation(evaluatorId, drawingId, mark, comment = '') {
        return ApiService.request(`/postEvaluation.php`, "POST", {
            evaluatorId,
            drawingId,
            mark,
            comment,
        });
    }
};

export default DrawingService;
