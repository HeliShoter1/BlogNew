
setInterval(()=>{
	var btn_save = document.getElementById("save_btn_user")
	var username = document.getElementById("user_field");
	var des = document.getElementById("des_field");
	var username_hide = document.getElementById("username_field_hide")
	var user_des_hide = document.getElementById("user_des_field")
	
	if(username.value === username_hide.value && des.value === user_des_hide.value){
		btn_save.disabled = true
	}else{
		btn_save.disabled = false
	}
}, 700)

function submit_save(id){
	var username = document.getElementById("user_field");
	var des = document.getElementById("des_field");
	$.ajax({
		url : "/BTL/View/Userpage/user",
		type : "POST",
		data : {
			req : "save_info",
			id : id,
			username : username.value,
			descript : des.value,
		},
		success : function(data){
			if(data.status === 200){
				alert("Save success!")
				document.getElementById("username_field_hide").value = username.value
				document.getElementById("user_des_field").value = des.value
				document.getElementById("name_tt_text").innerText = username.value
				document.getElementById("name_text").innerText = username.value
				document.getElementById("des_text").innerText = `"${des.value}"`
			}else if(data.status === 500){
				alert("Save failed!")
			}
		},
		error: function(err){
			console.log(err)
		}
		
	})
}


function editUserRole(userId, userRole) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
		var data = JSON.parse(this.responseText);
      document.getElementById("role_" + userId).innerHTML = data.role;
    }
  };
  xhr.open('GET', '/BTL/View/Homepage/admin?user_id=' + encodeURIComponent(userId) + '&role=' + encodeURIComponent(userRole), true);
  xhr.send();
}

function DeleteUser(userId) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
		location.reload();
      console.log(this.responseText);
    }
  };
  xhr.open('POST', '/BTL/View/Homepage/admin?user_id=' + encodeURIComponent(userId) , true);
  xhr.send();
}



