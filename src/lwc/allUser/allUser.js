import {LightningElement, track, wire} from "lwc";
import getUsers from '@salesforce/apex/UserController.getUsers';

export default class allUser extends LightningElement {

    @track userData;
    @track error;

    @wire (getUsers) wiredUser({data,error}){
        if (data) {
            this.userData = data;
            this.error = undefined;
            console.log(`Data returned: + ${this.userData}`);
        } else if (error) {
            this.error = error;
            this.userData = undefined;
        }
    }
}