import { createRouter, createWebHistory } from "vue-router";
import ApiService from '@/services/apiService';
import LandingPage from "../views/pages/LandingPage.vue";
import LoginPage from "../views/pages/LoginPage.vue";
import ClubPage from "../views/pages/ClubPage.vue";
import AdminDashboardPage from "../views/pages/AdminDashboardPage.vue";
import NotFoundPage from "../views/pages/NotFoundPage.vue";
import UnauthorizedPage from "../views/pages/UnauthorizedPage.vue";

const routes = [
    { path: "/", component: LandingPage },
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
    { path: "/home", component: AdminDashboardPage },
    { path: "/:pathMatch(.*)*", redirect: "/notFound" },
    { path: "/notFound", name: "NotFound", component: NotFoundPage },
    { path: "/unauthorized", name: "Unauthorized", component: UnauthorizedPage },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
