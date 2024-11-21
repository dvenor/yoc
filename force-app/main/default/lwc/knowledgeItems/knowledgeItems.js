import { LightningElement, wire, track } from 'lwc';
import getCards from '@salesforce/apex/KnowledgeItemController.getCards';

export default class MyCards extends LightningElement {
    @track groupedData = [];
    isLoading = true;

    @wire(getCards)
    wiredCards({ error, data }) {
        if (data) {
            this.groupedData = this.groupByCategory(data);
            this.isLoading = false;
            console.log(data);
            console.log(data.length);
        } else if (error) {
            console.error('Error fetching card data:', error);
            this.isLoading = false;
        }
    }

    /**
     * Groups the card data by category.
     * @param {Array} data - The raw data returned from the Apex method.
     * @return {Array} An array of grouped data, each with a `category` and `items` property.
     */
    groupByCategory(data) {
        const grouped = {};
        data.forEach(item => {
            const category = item.category || 'Uncategorized';
            if (!grouped[category]) {
                grouped[category] = [];
            }
            grouped[category].push({ label: item.label, url: item.url });
        });

        // Convert the grouped object into an array for easy iteration in the template
        return Object.keys(grouped).map(category => ({
            category,
            items: grouped[category]
        }));
    }
}