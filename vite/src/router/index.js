import { createRouter, createWebHistory } from "vue-router";
import LandingPage from "../views/pages/LandingPage.vue";
import LoginPage from "../views/pages/LoginPage.vue";

const routes = [
    { path: "/", component: LandingPage },
    { path: "/login", component: LoginPage },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
