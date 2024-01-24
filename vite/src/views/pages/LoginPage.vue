<template>
    <main>
        <section class="login-section">
            <router-link to="/">
                <h2 class="app-name">Zaiten</h2>
            </router-link>

            <p>{{ $t('loginToYourAccount') }}</p>

            <form class="form" method="POST" action="login.php">
                <div class="form-input-group">
                    <label for="username">{{ $t('username') }}</label>
                    <input type="text" name="username" required/>
                </div>

                <div class="form-input-group">
                    <label for="password">{{ $t('password') }}</label>
                    <input type="password" name="password" required/>
                    <a class="forgot-password">
                        <small>{{ $t('forgotPassword') }}</small>
                    </a>
                </div>

                <button class="submit-button" type="submit">{{ $t('login') }}</button>
            </form>

            <div class="separator">
                <hr/>
                <span>{{ $t('orSeparator') }}</span>
                <hr/>
            </div>

            <p class="new-user">{{ $t('newToTheSite') }}</p>
        </section>
    </main>
</template>

<script setup>
    // Component setup script
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";
    @import "@/styles/partials/breakpoints.scss";
    @import "@/styles/partials/patterns.scss";

    main {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 100%;
        height: 100%;
        background-color: $primary-color;
        @extend %topography-pattern;
    }

    .login-section {
        flex: 0 0 40%;
        height: 100%;
        background-color: $background-color;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 56px;

        @media (max-width: $view-xl) {
            flex: 0 0 60%;
        }

        @media (max-width: $view-lg) {
            flex: 0 0 80%;
        }

        @media (max-width: $view-md) {
            flex: 0 0 100%;
        }
    }

    .app-name {
        font-weight: 700;
        font-family: 'Sacramento', cursive;
        color: rgba($text-color, 80%);
        margin-bottom: 2rem;
    }

    .form {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 24px;
        width: 320px;
    }

    .form-input-group {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }

    .forgot-password {
        text-align: right;
        color: rgba($text-color, 60%);

        &:hover {
            color: rgba($text-color, 80%);
        }
    }

    .submit-button {
        margin-top: 1.5rem;
        background-color: $primary-color;
        color: $background-color;
        height: 38px;
        min-width: 100px;
        padding: 0 22px;
        border-radius: 19px;
        line-height: 2.25rem;
    }

    .separator {
        display: flex;
        align-items: center;
        gap: 1rem;

        hr {
            min-width: 100px;
        }
    }

    .new-user {
        max-width: 320px;
        text-align: center;
    }
</style>
