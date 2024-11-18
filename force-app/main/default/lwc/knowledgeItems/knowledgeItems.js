import { LightningElement, wire } from 'lwc';
import getCards from '@salesforce/apex/KnowledgeItemController.getCards';

export default class KnowledgeItems extends LightningElement {
    data;

    @wire(getCards)
    wiredCards({ error, data }) {
        if (data) {
            this.data = data.map((item, index) => ({
                ...item,
                id: index + 1 // Assign unique keys for rendering
            }));
        } else if (error) {
            console.error('Error fetching cards:', error);
        }
    }
}