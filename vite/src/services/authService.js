import ApiService from "./apiService";

const AuthService = {

    /**
     * Check if the user is authenticated
     */
    async isAuthenticated() {
        const data = await ApiService.request(`/isAuthenticated.php`);
        return data.isAuthenticated;
    },

    /**
     * Check if the user is a club president
     */
    async isClubPresident() {
        const data = await ApiService.request(`/isClubPresident.php`);
        return data.isClubPresident;
    },

    /**
     * Check if the user is an admin
     */
    async isAdmin() {
        const data = await ApiService.request(`/isAdmin.php`);
        return data.isAdmin;
    },

    getSelfInfos() {
        return ApiService.request(`/self.php`);
    }

};

export default AuthService;
