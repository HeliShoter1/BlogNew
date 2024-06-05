/**
 * 
 */

function delete_post(id_post){
	$.ajax({
		url : "/BTL/View/Postmanapage/Post",
		type: "POST",
		data : {
			req : "delete_post",
			id : id_post
		},
		success : function(data){
			if(data.status === 200){
				alert("Delete successful!")
				$(`#wrap_post_tab #post_id_${id_post}`).remove()
			}else if(data.status === 500){
				alert("Delete post failed!")
			}
		},
		error : function(err){
			alert("Delete post failed!");
			console.log(err);
		}
	})
}