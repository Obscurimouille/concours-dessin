import { createRouter, createWebHistory } from "vue-router";
import axios from "axios";
import LandingPage from "../views/pages/LandingPage.vue";
import LoginPage from "../views/pages/LoginPage.vue";
import ClubPage from "../views/pages/ClubPage.vue";
import NotFoundPage from "../views/pages/NotFoundPage.vue";

const routes = [
    { path: "/", component: LandingPage },
    { path: "/login", component: LoginPage },
    {
        path: "/club/:clubId",
        component: ClubPage,
        beforeEnter: (to, from, next) => {
            const clubId = to.params.clubId;
            // Make an Axios request to check if the club with this ID exists
            axios
                .get(`/club.php?id=${clubId}`)
                .then((response) => {
                    // If the club exists, proceed to the route
                    next();
                })
                .catch((error) => {
                    // If the club doesn't exist, redirect to a 404 page or any other page
                    next({ name: "NotFound" });
                });
        },
    },
    { path: "/:pathMatch(.*)*", name: "NotFound", component: NotFoundPage },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
