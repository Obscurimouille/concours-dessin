import ApiService from "./apiService";

const DrawingService = {
    getAllForEvaluatorForContest(evaluatorId, contestId) {
        return ApiService.request(`/getDrawingEvaluatorFromContest.php?id_user=${evaluatorId}&id_contest=${contestId}`);
    }
};

export default DrawingService;
