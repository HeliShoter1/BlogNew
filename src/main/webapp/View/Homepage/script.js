
function fetchDataAndPopulate() {
    var elements = document.getElementsByClassName('btn btn-light');
    Array.from(elements).forEach(function(element) {
		var selecter = document.getElementsByClassName('btn btn-light Cate-Select')
        element.addEventListener('click', function(event) {
			var indexs = document.getElementsByClassName('btn btn-secondary index');
			document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
			indexs[0].classList.add('Color_text')
            event.preventDefault();
            selecter[0].classList.remove('Cate-Select')
            element.classList.add('Cate-Select')         
			var value = element.getAttribute('value');
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var data = JSON.parse(this.responseText);
                    populateItems(data);
                }
            };
            xhr.open('POST', './', true); 
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');  // Thiết lập kiểu dữ liệu gửi đi
            var data = 'value=' + encodeURIComponent(value); 
            xhr.send(data);
        });
    });	
}



function fetchDataIndex(){
    var indexs = document.getElementsByClassName('btn btn-secondary index');
    for(let i = 0;i<indexs.length;i++){
		indexs[i].addEventListener('click', (event) => {
			var cate = (document.querySelector(".btn.btn-light.Cate-Select").value);
		if(i === 0){
			document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
			indexs[0].classList.add('Color_text');
		}else if(i == indexs.length-1){
			document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
			indexs[i].classList.add('Color_text');
		}else{
			indexs[1].innerHTML = parseInt(indexs[i].textContent) +"";
			indexs[0].innerHTML = parseInt(indexs[i].textContent)- 1 +"";
			indexs[2].innerHTML = parseInt(indexs[i].textContent) +1+ "";
			document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
			indexs[1].classList.add('Color_text');
		}
            event.preventDefault();
            var selector = indexs[i].textContent;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                   var data = JSON.parse(this.responseText);
                    populateItems(data);
                }
            };
            
            xhr.open('POST', './Index', true)
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            var data = 'index=' + encodeURIComponent(selector);
            var select = 'cate=' + encodeURIComponent(cate);
            xhr.send(data + '&' + select);
        })
			
	}

}

function Next(){
    var indexs = document.getElementsByClassName('btn btn-secondary index ');
    Array.from( document.getElementsByClassName('btn btn-secondary Button next')).forEach((item)=>{
		item.addEventListener('click', (event) => {
			var cate = (document.querySelector(".btn.btn-light.Cate-Select").value);
				var k = parseInt(document.querySelector(".btn.btn-secondary.index.Color_text ").textContent);
				if(k > indexs.length-1){
					return;
				}
			for(let i = 0;i<indexs.length;i++){
				if(k == indexs.length-1){
					document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
					indexs[indexs.length-1].classList.add('Color_text');
				}else{
					indexs[1].innerHTML = k +"";
					indexs[0].innerHTML = k-1 +"";
					indexs[2].innerHTML = k + 1+ "";
					document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
					indexs[1].classList.add('Color_text');
				}
			}
			event.preventDefault();
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                   var data = JSON.parse(this.responseText);
                    populateItems(data);
                }
            };
            xhr.open('POST', './Index', true)
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            var data = 'index=' + encodeURIComponent(k+1)
            var select = 'cate=' + encodeURIComponent(cate);
            xhr.send(data + '&' + select);
		})
	})
}

function Prev(){
    var indexs = document.getElementsByClassName('btn btn-secondary index');
    Array.from( document.getElementsByClassName('btn btn-secondary Button pre')).forEach((item)=>{
		item.addEventListener('click', (event) => {
			var cate = (document.querySelector(".btn.btn-light.Cate-Select").value);
				var k = parseInt(document.querySelector(".btn.btn-secondary.index.Color_text ").textContent);
				if(k-1 <= 0){
					return;
				}
				
			for(let i = 0;i<indexs.length;i++){
				if(k-1 <= 1){
					document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
					indexs[0].classList.add('Color_text');
				}else{
					console(k)
					indexs[1].innerHTML = k +"";
					indexs[0].innerHTML = k-1 +"";
					indexs[2].innerHTML = k+1 + "";
					document.querySelector(".btn.btn-secondary.index.Color_text ").classList.remove("Color_text");
					indexs[1].classList.add('Color_text');
				}
			}
			event.preventDefault();
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                   var data = JSON.parse(this.responseText);
                    populateItems(data);
                }
            };
            xhr.open('POST', './Index', true)
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            var data = 'index=' + encodeURIComponent(k-1)
             var select = 'cate=' + encodeURIComponent(cate);
            xhr.send(data + '&' + select);
		})
	})
}

function populateItems(data) {
    var items = data; 
    var arr = document.getElementsByClassName('col-lg-3 col-md-3 col-sm-3 col-xs-12')
    for (var i = 0; i < arr.length; i++) {
		if(i < items.length){
			arr[i].classList.remove('hide');
    	    document.getElementById("title-" + i).innerHTML = items[i].title;
	        document.getElementById("description-" + i).innerHTML = items[i].description;
	        document.getElementById("link-" + i).href = "./Page?id=" + items[i].id;
	        document.getElementById("img-" + i).src = items[i].img; 
	        document.getElementById("link-" +i).href = "./Page?id=" + items[i].id;
	        if(document.getElementById("hide id-post-" + i) != null){
		        document.getElementById("hide id-post-" + i).value = items[i].id		
			}
		}else{
			arr[i].classList.add('hide');
		}
    }
   	
}

  function Refresh(){
		var ref = document.querySelector('.refresh');
		ref.addEventListener('click',(e)=>{
			e.preventDefault();
			
			 var xhr = new XMLHttpRequest();
	            xhr.onreadystatechange = function() {
	                if (this.readyState == 4 && this.status == 200) {
	                    var data = JSON.parse(this.responseText);
	                    populateItems(data);
	                }
	            };
	            xhr.open('POST', './Index', true)
	            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	            var data = 'index=' + encodeURIComponent(1);
	            xhr.send(data);
		})
	}
	
	
function logOut(){
	var logout = document.getElementById('logout');
	logout.addEventListener("click",(e)=>{
		document.cookie = "email=; expires=Thu, 01 Jan 1970 00:00:00 UTC;"
		document.cookie = "role=; expires=Thu, 01 Jan 1970 00:00:00 UTC;"
		document.cookie = "fullName=; expires=Thu, 01 Jan 1970 00:00:00 UTC;"
		document.cookie = "emailUser=; expires=Thu, 01 Jan 1970 00:00:00 UTC;"
	})
}


document.addEventListener("DOMContentLoaded", fetchDataAndPopulate);
document.addEventListener("DOMContentLoaded", fetchDataIndex);
document.addEventListener("DOMContentLoaded", Refresh);
document.addEventListener("DOMContentLoaded", logOut);

window.addEventListener('scroll',(e)=>{
	var top = document.getElementById('carouselExampleControls').offsetHeight;
	var mid = document.querySelector('.blog-section.paddingTB60').offsetHeight;
    if(window.pageYOffset + top >= top){
                document.querySelector('.row.text-center').classList.add('content1');
        	}
        }
     
  	);