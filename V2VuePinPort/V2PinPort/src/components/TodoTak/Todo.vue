<template>
    <table>
        <thead>
            <tr>
                <th>Task</th>
                <th>Description</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="item in ITaskItems">
                <td>{{ item.name }}</td>
                <td>{{ item.description }}</td>
                <td v-if="item.status == 'Todo'">
                    <div class="todo-button">{{ item.status }}</div>
                </td>
                <td v-else-if="item.status == 'InProgress'">
                    <div class="inprogress-button">{{ item.status }}</div>
                </td>
                <td v-else>
                    <div class="done-button">{{ item.status }}</div>
                </td>
            </tr>
        </tbody>
    </table>
</template>

<script lang="ts">
import axios from 'axios'
interface ITaskItem {
    name: string;
    description: string;
    status: string;
}
export default {
    props: {
    status: {
      type: String,
      default: "Todo",
    }
  },
    data() {
        return {
            name: 'SKA',
            message: "do it do it!",
            ITaskItems: Array<ITaskItem>()
        }
    },
    methods: {
        async GetData(){
            const request = {
                status: this.status
            }
            const response = await axios.post("https://spinport.ddns.net/Todo/get-all-task",request);
            this.ITaskItems = response.data;
        }
    },
    created() {
    this.GetData()
  }
}

</script>

<style>
:root {
    --main-background-color: white;
    --main-text-color: rgb(82, 72, 109);
    --sup-background-color: rgb(255, 94, 0);
    --sup-text-color: rgb(255, 255, 255);
    --main-font: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    --line-color: rgba(54, 54, 54, 0.096);
    --todo-color: gray;
    --inprogess-color: rgb(56, 124, 212);
    --done-color: rgb(0, 255, 21);
}

body {
    font-family: var(--main-font);
}

.table {
    display: flex;
    flex-direction: column;
}

.header {
    display: flex;
    background-color: var(--sup-background-color);
    justify-content: space-around;
    height: 50px;
    text-align: left;
    border-bottom: 2px solid var(--line-color);
}

.body {
    display: flex;
    background-color: var(--sup-background-color);
    justify-content: space-around;
    background-color: var(--main-background-color);
    color: var(--main-text-color);
}

table {
    margin-top: 10px;
    width: 90%;
    border-collapse: collapse;
}

thead {
    background-color: var(--main-background-color);
    color: var(--main-text-color);
}

thead th {
    text-align: left;
    height: 50px;
    padding-left: 40px;
    border-bottom: 2px solid var(--line-color);
}

tbody {
    background-color: var(--main-background-color);
    color: var(--main-text-color);
}
tbody tr:hover{
    background-color: var(--sup-background-color);
    color: var(--sup-text-color);
}
tbody td {
    text-align: left;
    height: 40px;
    padding-left: 40px;
    border-bottom: 1px solid var(--line-color);
}

.todo-button {
    text-align: center;
    background-color: var(--todo-color);
    color: var(--sup-text-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
}

.inprogress-button {
    text-align: center;
    background-color: var(--inprogess-color);
    color: var(--sup-text-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
}

.done-button {
    text-align: center;
    background-color: var(--done-color);
    width: fit-content;
    padding: 5px 15px;
    border-radius: 5px;
}</style>