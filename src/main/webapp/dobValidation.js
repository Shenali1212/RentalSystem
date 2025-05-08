/**
 * 
 */

window.onload = function() {
        // Get today's date in yyyy-mm-dd format
        var today = new Date().toISOString().split('T')[0];
        // Set the max attribute of the dob input to today's date
        document.getElementById('dob').setAttribute('max', today);
		
		
};
	
