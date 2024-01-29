<template>
    <app-header></app-header>
    <main>
        <section class="club-section">
            <div class="banner">
                <h4 class="club-name">{{ club.nomClub }}</h4>
            </div>

            <form class="club-infos-form" type="POST">
                <div class="form-input-group">
                    <label for="address">{{ $t('address') }}</label>
                    <input type="text" v-model="club.adresseClub" name="address" disabled/>
                </div>

                <div class="form-input-group">
                    <label for="city">{{ $t('city') }}</label>
                    <input type="text" v-model="club.ville" name="city" disabled/>
                </div>

                <div class="form-input-group">
                    <label for="department">{{ $t('department') }}</label>
                    <input type="text" v-model="club.departement" name="department" disabled/>
                </div>

                <div class="form-input-group">
                    <label for="region">{{ $t('region') }}</label>
                    <input type="text" v-model="club.region" name="region" disabled/>
                </div>

                <div class="form-input-group">
                    <label for="phone">{{ $t('phone') }}</label>
                    <input type="phone" v-model="club.numTelephone" name="phone" disabled/>
                </div>
            </form>
        </section>

        <section class="members-section">
            <div class="section-header">
                <h4>
                    {{ $t('members') }}
                    <span class="member-number">({{ members.length }})</span>
                </h4>

                <button @click="showModal">{{ $t('addMember') }}</button>
            </div>

            <div class="member-list">
                <div class="member" v-for="(member, index) in members" :key="index">
                    {{ member.nom + ' ' + member.prenom + ', ' + member.dateAdhesion }}
                </div>
            </div>
        </section>
    </main>

    <modal v-if="isModalVisible" @close="hideModal">
        <div class="modal-content">
            <div class="modal-header">
                <h4>{{ $t('addMember') }}</h4>
                <button @click="hideModal">
                    <img src="/images/icons/close_200.svg" alt="Close icon" />
                </button>
            </div>

            <form class="add-user-form" type="POST">
                <div class="form-input-group">
                    <label for="firstname">{{ $t('firstName') }}</label>
                    <input type="text" name="firstname" required/>
                </div>

                <div class="form-input-group">
                    <label for="lastname">{{ $t('lastName') }}</label>
                    <input type="text" name="lastname" required/>
                </div>

                <div class="form-input-group">
                    <label for="address">{{ $t('address') }}</label>
                    <input type="text" name="address" required/>
                </div>

                <div class="button-list">
                    <button class="cancel-button" type="button">{{ $t('cancel') }}</button>
                    <button class="submit-button" type="submit">{{ $t('validate') }}</button>
                </div>
            </form>
        </div>
    </modal>
</template>

<script setup>
    import AppHeader from "@/views/components/AppHeader.vue";
    import Modal from '@/views/components/Modal.vue';
</script>

<script>
    import ClubService from "@/services/clubService";

    export default {
        data() {
            return {
                club: {},
                members: [],
                isModalVisible: false
            }
        },
        components: {
            Modal
        },
        async mounted() {
            const clubId = this.$route.params.clubId;
            if (!clubId) this.$router.push({ name: 'NotFound' });

            this.club = await ClubService.getById(clubId);
            this.members = await ClubService.getMembers(clubId);
        },
        methods: {
            showModal() {
                this.isModalVisible = true;
            },
            hideModal() {
                this.isModalVisible = false;
            }
        },
    };
</script>

<style lang="scss" scoped>
    @import "@/styles/partials/colors.scss";
    @import "@/styles/partials/breakpoints.scss";
    @import "@/styles/partials/patterns.scss";

    main {
        display: flex;
        width: 100%;
        height: 100%;
        margin: 6rem 0 3rem 0;
        padding: 0 8%;
        gap: 32px;
    }

    .club-section, .members-section {
        display: flex;
        background-color: white;
        border-radius: 12px;
        border: 1px solid rgba(0, 0, 0, 0.15);
        overflow: hidden;
    }

    .club-section {
        flex: 0 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-width: 380px;
        gap: 32px;
    }

    .members-section {
        flex: 1 1 auto;
        display: flex;
        flex-direction: column;
        padding: 32px;
        gap: 32px;
        overflow: hidden
    }

    .banner {
        position: relative;
        width: 100%;
        height: 116px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        background-color: $primary-color;
        @extend %topography-pattern;
    }

    .club-name {
        position: absolute;
        bottom: 0;
        left: 50%;
        color: white;
        text-shadow: 0 0 6px rgba(0, 0, 0, 40%);
        transform: translate(-50%, -25%);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 80%;
    }

    .club-infos-form {
        display: flex;
        flex-direction: column;
        gap: 24px;
        width: 100%;
        padding: 0 32px;

        .form-input-group {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 2px;

            label {
                font-weight: 700;
            }

            input {
                &:disabled {
                    padding: .5rem 0;
                    border: none;
                    background-color: transparent;
                    color: $text-color;
                }
            }
        }
    }

    .section-header {
        display: flex;
        align-items: center;
        justify-content: space-between;

        .member-number {
            font-weight: 500;
            line-height: 1.5rem;
        }
    }

    .member-list {
        display: flex;
        flex-direction: column;
        gap: 16px;
        overflow-y: auto;
        height: 510px;
    }

    .member {
        width: calc(100% - 8px);
        padding: 16px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    .modal-content {
        width: 360px;
        display: flex;
        flex-direction: column;
        gap: 40px;
        padding: 12px 12px;
    }

    .modal-header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        gap: 16px;
    }

    .add-user-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 16px;
        width: 100%;

        .form-input-group {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 8px;

            input {
                &:disabled {
                    padding: .5rem 0;
                    border: none;
                    background-color: transparent;
                    color: $text-color;
                }
            }
        }

        .button-list {
            display: flex;
            flex-direction: row;
            gap: 16px;
            width: 100%;
            justify-content: space-around;
        }

        .submit-button, .cancel-button {
            margin-top: 1.5rem;
            height: 38px;
            min-width: 100px;
            padding: 0 22px;
            border-radius: 10px;
            line-height: 2.25rem;
        }

        .submit-button {
            background-color: $primary-color;
            color: $background-color;
        }

        .cancel-button {
            background-color: rgba($text-color, 50%);
            color: $background-color;
        }
    }

</style>
