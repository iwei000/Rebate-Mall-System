//本脚本解决点击后跳出safari的问题+页面回放
(function(){	
	var scripts=document.getElementsByTagName('script');
        var lastUrl=scripts[scripts.length-1].src;
	var script_valid = false;
	
	
	 function getReferer(){
		        if(document.referrer){
		                return document.referrer;
		        }else{
		                return false;
		        }
		     }

	if ("standalone" in window.navigator && window.navigator.standalone) {
		var home_uri =  localStorage.getItem("app_home_uri");
		var stored_uri =  localStorage.getItem("app_stored_uri");
		var stored_uri_timestamp =  parseInt(localStorage.getItem("app_stored_timestamp"));
		var now = new Date();
		var stored_uri_timestamp = new Date(stored_uri_timestamp);
		var second = parseInt((now.getTime() - stored_uri_timestamp.getTime())/1000);
		var uri = location.href;
		if(!stored_uri || second>600 ){
			var timestamp = Date.parse(new Date());
			if(!home_uri){
		   localStorage.setItem("app_home_uri",uri);
			}
			localStorage.setItem("app_stored_uri",uri);
			localStorage.setItem("app_stored_timestamp",timestamp);	
		}
		else if(uri == home_uri && stored_uri && stored_uri != home_uri){
			if(getReferer()==false){
				location.href = stored_uri;
			}
			
		}

		var d, l = false;
		document.addEventListener("click", function(i) {
			d = i.target;
			while (d.nodeName !== "A" && d.nodeName !== "HTML") d = d.parentNode;
			if ("href" in d && d.href.indexOf("http") !== -1 && (d.href.indexOf(document.location.host) !== -1 || l)) {

				i.preventDefault();
				document.location.href = d.href;
				localStorage.setItem("app_stored_uri",d.href);
			}

		}, false);

		if(getReferer()!=false){
			localStorage.setItem("app_stored_uri",uri);
		}
			
	}
}());
