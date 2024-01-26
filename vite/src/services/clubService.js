import ApiService from "./apiService";

const ClubService = {
    getByManager(managerId) {
        return ApiService.request(`/club.php?managerId=${managerId}`);
    },
    getById(clubId) {
        return ApiService.request(`/club.php?id=${clubId}`);
    },
    getAll() {
        return ApiService.request("/club.php");
    },
    getMembers(clubId) {
        return ApiService.request(`/clubMembers.php?id=${clubId}`);
    }
}

export default ClubService;