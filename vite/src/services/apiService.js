import axios from "axios";

const ApiService = {

    /**
     * Make a request to the API
     * @param {string} endpoint The endpoint to request
     * @param {string} method The HTTP method to use
     * @param {object} data The data to send
     */
    async request(endpoint, method = "get", data = null) {
        try {
            const response = await axios({
                method,
                url: endpoint,
                data,
            });

            return response.data;
        }
        catch (error) {
            // Handle errors
            if (error.response && error.response.status === 401) {
                // Redirect to unauthorized page
                window.location.href = "/unauthorized";
                return;
            }
            // Handle other errors
            window.location.href = "/notFound";
            throw error;
        }
    },
};

export default ApiService;
