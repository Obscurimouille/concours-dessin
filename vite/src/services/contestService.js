import ApiService from "./apiService";

const ContestService = {
    getCurrent() {
        return ApiService.request("/currentContest.php");
    },
    getHistory() {
        return ApiService.request("/oldContests.php");
    },
    getById(contestId) {
        return ApiService.request(`/contest.php?id=${contestId}`);
    },
    getAll() {
        return ApiService.request("/contest.php");
    }
}

export default ContestService;