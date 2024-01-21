import axios from "axios";

const ApiService = {

    // Function to make an API request and handle errors
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
