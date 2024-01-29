import ApiService from "./apiService";

const UserService = {

    /**
     * Get the role of a user for a contest
     */
    async getRoleForContest(userId, contestId) {
        const res = await ApiService.request(`/getUserRoleForContest.php?id_user=${userId}&id_contest=${contestId}`);
        return res.TypePersonne;
    }
}

export default UserService;