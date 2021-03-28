
function ajaxLogOut(){
	
	const prefix = "/wymarket/logout";

	let uri = prefix;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() { 
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {

		}
	}

	xhttp.open('GET', uri, true); 

	xhttp.send(); 

}


