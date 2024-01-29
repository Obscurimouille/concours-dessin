import ApiService from "./apiService";

const ClubService = {

    /**
     * Get the club a manager manages
     */
    getByManager(managerId) {
        return ApiService.request(`/club.php?managerId=${managerId}`);
    },

    /**
     * Get a club by its id
     */
    getById(clubId) {
        return ApiService.request(`/club.php?id=${clubId}`);
    },

    /**
     * Get all clubs
     */
    getAll() {
        return ApiService.request("/club.php");
    },

    /**
     * Get all members of a club
     */
    getMembers(clubId) {
        return ApiService.request(`/clubMembers.php?id=${clubId}`);
    }
}

export default ClubService;