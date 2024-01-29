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
    }
};

export default DrawingService;
