<template>
    <div class="invisibleRelativePosOuterHeader"></div>
    <div class="outerHeader">
        <div class="colorPalet">
            <div class="mainColor"></div>
            <div class="secondaryColor"></div>
            <div class="optionalColor"></div>
        </div>
        <div class="websiteName"><span v-on:click="ShowHome()">SPinPort</span><span style="color: var(--main-color);">></span></div>
        <div class="spinheader">
            <div class="spinnav" v-on:click="ShowHome()" >🏠 Home</div>
            <div class="spinnav" v-on:click="ShowResume()">📜 Resume</div>
            <div class="spinnav" v-on:click="ShowProject()">📃Projects</div>
            <div class="spinnav" v-on:click="ShowContact()">📩 Contact</div>
        </div>
    </div>
    <div>
        <Transition name="slide" mode="out-in">
            <div v-if="isShowHome" class="Page">
                <Spin-port-home-desktop ></Spin-port-home-desktop>
                <Spin-port-footer></Spin-port-footer>
            </div>
            <div v-else-if="isShowResume" class="Page" >
                <Spin-port-resume-desktop></Spin-port-resume-desktop>
                <Spin-port-footer></Spin-port-footer>
            </div>
            <div v-else-if="isShowProject" class="Page" >
                <Spin-port-project-desktop></Spin-port-project-desktop>
                <Spin-port-footer></Spin-port-footer>
            </div>
            <div v-else="isShowContact" class="Page" >
                <Spin-port-contact-desktop></Spin-port-contact-desktop>
                <Spin-port-footer></Spin-port-footer>
            </div>
        </Transition>
    </div>
    
</template>

<script lang="ts" setup>
    import { ref } from 'vue';
    let isShowHome = ref<boolean>(true);
    const isShowResume = ref<boolean>(false);
    const isShowProject = ref<boolean>(false);
    const isShowContact = ref<boolean>(false);

    const delay = (ms: number | undefined) => new Promise(res => setTimeout(res, ms));

    const ShowHome = async () =>{
        isShowHome.value = true;
        isShowResume.value = false;
        isShowProject.value = false;
        isShowContact.value = false;
    }
    const ShowResume = async () =>{
        isShowHome.value = false;
        isShowResume.value = true;
        isShowProject.value = false;
        isShowContact.value = false;
    }
    const ShowProject = async () =>{
        isShowHome.value = false;
        isShowResume.value = false;
        isShowProject.value = true;
        isShowContact.value = false;
    }
    const ShowContact = async () =>{
        isShowHome.value = false;
        isShowResume.value = false;
        isShowProject.value = false;
        isShowContact.value = true;
    }
    
</script>

<style>
    :root {
            --background-color: white;
            --text-color: var(--secondary-color);
            --main-color: rgb(255, 0, 0);
            --secondary-color: rgb(54, 54, 54);
            --optional-color: rgb(0, 255, 242);
            --main-font1: 'Californian FB';
            --main-font2: 'Consolas';
            --main-font: 'Malgun Gothic';
        }
</style>

<style scoped>
    
    .slide-enter-active{
        opacity: 0;
        transform: translateY(100%);
    }
    .slide-enter{
        opacity: 100;
        transform: translateY(0%);
    }
    .slide-leave-to {
        transform: translateY(40%);
        opacity: 0;
    }
    .Page{
        transition: ease-in-out 0.4s;
    }
    .spinheader{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content:flex-end;
        gap: 30px;
        margin-right: 30px;
    }
    .spinnav{
        font-family: var(--main-font);
        font-size: 23px;
        font-weight: bold;
        color: var(--text-color);
        height: 25px;
        padding: 5px 10px;
        transition: color 0.1s, font-size 0.5s;
    }
    .spinnav:hover{
        color: var(--main-color);
        cursor: pointer;
        font-size: 27px;
    }
    .spinnav:active{
        color: var(--main-color);
        font-size: 23px;
    }
    .websiteName{
        font-family: var(--main-font);
        font-size: 30px;
        font-weight: bold;
        color: var(--text-color);
    }
    .websiteName span {
        margin-right: 0px;
        transition: margin-right 0.7s, font-size 0.7s;
    }
    .websiteName span:hover{
        cursor: pointer;
        margin-right: 15px;
        font-size: 40px;
    }
    .outerHeader{
        position: absolute;
        display: flex;
        gap: 30px;
        left: 0;
        top: 50px;
        right: 0;
        height: 100px;
    }
    .invisibleRelativePosOuterHeader{
        position: relative;
        margin-top: 50px;
        width: 100%;
        height: 100px;
    }
    .colorPalet{
        display: flex;
        flex-direction: column;
        height: 100%;
        width: 1.5%;
        background-color: var(--main-color);
    }
    .mainColor{
        width: 100%;
        height: 50%;
        background-color: var(--main-color);
    }
    .secondaryColor{
        width: 100%;
        height: 25%;
        background-color: var(--secondary-color);
    }
    .optionalColor{
        width: 100%;
        height: 25%;
        background-color: var(--optional-color);
    }
</style>