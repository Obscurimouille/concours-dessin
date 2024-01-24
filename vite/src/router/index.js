import { createRouter, createWebHistory } from "vue-router";
import ApiService from '@/services/apiService';
import AuthService from '@/services/authService';
import LandingPage from "../views/pages/LandingPage.vue";
import LoginPage from "../views/pages/LoginPage.vue";
import ClubPage from "../views/pages/ClubPage.vue";
import AdminDashboardPage from "../views/pages/AdminDashboardPage.vue";
import HomePage from "../views/pages/HomePage.vue";
import NotFoundPage from "../views/pages/NotFoundPage.vue";
import UnauthorizedPage from "../views/pages/UnauthorizedPage.vue";
import ContestPage from "../views/pages/ContestPage.vue";

const routes = [
    {
        path: "/",
        component: LandingPage,
        beforeEnter: async (to, from, next) => {
            // Check if the user is already logged in
            const isAuthenticated = await AuthService.isAuthenticated();
            if (!isAuthenticated) return next();

            // Check if the user is a club president
            const isClubPresident = await AuthService.isClubPresident();
            if (isClubPresident) return next("/club/12345");

            // Check if the user is an admin
            const isAdmin = await AuthService.isAdmin();
            if (isAdmin) return next("/admin");

            // Redirect to home page
            next("/home");
        },
    },
    { path: "/login", component: LoginPage },
    {
        path: "/club/:clubId",
        component: ClubPage,
        beforeEnter: (to, from, next) => {
            const clubId = to.params.clubId;
            // Check if the club exists
            ApiService.request(`/dev_club.php?id=${clubId}`).then(() => {
                next();
            });
        },
    },
    {
        path: "/contest/:contestId",
        component: ContestPage,
        beforeEnter: (to, from, next) => {
            const contestId = to.params.contestId;
            // Check if the contest exists
            ApiService.request(`/dev_contest.php?id=${contestId}`).then(() => {
                next();
            });
        },
    },
    { path: "/home", component: HomePage },
    { path: "/admin", component: AdminDashboardPage },
    { path: "/:pathMatch(.*)*", redirect: "/notFound" },
    { path: "/notFound", name: "NotFound", component: NotFoundPage },
    { path: "/unauthorized", name: "Unauthorized", component: UnauthorizedPage },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
