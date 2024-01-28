import ApiService from "./apiService";

const ContestService = {

    /**
     * Get the current contest
     */
    getCurrent() {
        return ApiService.request("/currentContest.php");
    },

    /**
     * Get the history of contests
     */
    getHistory() {
        return ApiService.request("/oldContests.php");
    },

    /**
     * Get a contest by its id
     */
    getById(contestId) {
        return ApiService.request(`/contest.php?id=${contestId}`);
    },

    /**
     * Get all contests
     */
    getAll() {
        return ApiService.request("/contest.php");
    }
}

export default ContestService;