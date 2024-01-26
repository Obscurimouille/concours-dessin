import ApiService from "./apiService";

const UserService = {
    async getRoleForContest(userId, contestId) {
        const res = await ApiService.request(`/getUserRoleForContest.php?id_user=${userId}&id_contest=${contestId}`);
        return res.TypePersonne;
    }
}

export default UserService;