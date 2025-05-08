/**
 * 
 */

// Function to validate username
function validateSearch() {
    var searchInput = document.getElementById("search-input").value;
    var loggedInUsername = document.getElementById("loggedInUsername").value;
    var errorMessage = document.getElementById("error-message");

    if (searchInput === "") {
        errorMessage.textContent = "Please enter a username.";
        return false; // Prevent form submission
    } else if (searchInput !== loggedInUsername) {
        errorMessage.textContent = "You can only search for vehicles registered under your username.";
        return false; // Prevent form submission
    }

    errorMessage.textContent = ""; // Clear any previous error message
    return true; // Allow form submission
}