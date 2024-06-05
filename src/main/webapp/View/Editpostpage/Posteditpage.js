/**
 * 
 */
setInterval(()=>{
	var btn_save = document.getElementById("save_btn_post")
	var tt = document.getElementById("tt_field");
	var des = document.getElementById("des_field");
	var tt_hide = document.getElementById("title_hide")
	var des_hide = document.getElementById("des_hide")
	
	if(tt.value === tt_hide.value && des_hide.value === des.value){
		btn_save.disabled = true
	}else{
		btn_save.disabled = false
	}
}, 700)

function submit_save(id){
	var tt = document.getElementById("tt_field");
	var des = document.getElementById("des_field");
	var cont = document.getElementById("cont_field");
	$.ajax({
		url : "/BTL/View/Editpostpage/PostEdit",
		type : "POST",
		data : {
			req : "save_post",
			id : id,
			title : tt.value,
			descript : des.value,
			cont : cont.value
		},
		success : function(data){
			if(data.status === 200){
				alert("Save success!")
				document.getElementById("cont_hide").value = cont.value
				document.getElementById("title_hide").value = username.value
				document.getElementById("des_hide").value = des.value
			}else if(data.status === 500){
				alert("Save failed!")
			}
		},
		error: function(err){
			console.log(err)
		}
		
	})
}