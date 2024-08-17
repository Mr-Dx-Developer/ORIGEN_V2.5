
$(function(){
	window.onload = (e) => {
		
		const bcaminfo = document.getElementById('top-right-text');
		bcaminfo.style.display = 'none';
		showing = false;
		CURRTIME = "";
		CURRINFO = "";
		var today = new Date();

		var day = today.getDate();
		var month = today.getMonth() + 1;
		var year = today.getFullYear();
		function showinfo(yes){
			bcaminfo.style.display = 'flex';
			showing = true;
			CURRINFO = yes;
			bcaminfo.innerHTML = "<p>" + year + '/' + day  + '/' +  month 
			+ " " + CURRTIME + 
			"<br/>" + yes.fname + " " + yes.lname + "</p>";
		}
		function hideinfo(){
			showing = false;
			bcaminfo.style.display = 'none';
		}
				
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
            
			var item = event.data;
			if (item !== undefined && item.type === "show") {
                showinfo(item.info)
			}
			if (item !== undefined && item.type === "hide") {
                hideinfo()
			}
			if (item !== undefined && item.type === "time") {
                CURRTIME = item.time;
				if (showing) {
					month = today.getMonth() + 1;
					if(month < 10){month = "0" + month}
					bcaminfo.innerHTML = "<p>" + "<p>" + today.getFullYear() + '/' + month  + '/' +  today.getDate() 
					+ " " + CURRTIME + "<br/>" + CURRINFO.fname + " " + CURRINFO.lname + "</p>"
				}
			}
			
		});
	};
});