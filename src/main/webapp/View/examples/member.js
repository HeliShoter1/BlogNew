info = [
	{
		first_name:"Lê Mạnh ",
		Last_Name:"Hùng",
		Address:"Ha Noi, Viet Nam",
		City: "Ha Noi",
		Country:"Viet Nam",
		About_me : "123",
		Image: "https://s.pro.vn/3Eeg",
		Email:"123@com.vn"
	},
	{
		first_name:"Lê Thanh ",
		Last_Name:"Tùng",
		Address:"Ha Noi, Viet Nam",
		City: "Ha Noi",
		Country:"Viet Nam",
		About_me : "123",
		Image: "https://s.pro.vn/aolO",
		Email:"123@com.vn"
	},
	{
		first_name:"Cao Trường ",
		Last_Name:"Phúc",
		Address:"Ha Noi, Viet Nam",
		City: "Ha Noi",
		Country:"Viet Nam",
		About_me : "123",
		Image: "https://s.pro.vn/nz1g",
		Email:"123@com.vn"
	},
	{
		first_name:"Nguyễn Doãn ",
		Last_Name:"Hải",
		Address:"Ha Noi, Viet Nam",
		City: "Ha Noi",
		Country:"Viet Nam",
		About_me : "123",
		Image: "https://s.pro.vn/3Eeg",
		Email:"123@com.vn"
	},
	{
		first_name:"Dương Hà ",
		Last_Name:"Ly",
		Address:"Ha Noi, Viet Nam",
		City: "Ha Noi",
		Country:"Viet Nam",
		About_me : "123",
		Image: "https://s.pro.vn/3Eeg",
		Email:"123@com.vn"
	},
	{
		first_name:"Phạm Thị ",
		Last_Name:"Lan",
		Address:"Ha Noi, Viet Nam",
		City: "Ha Noi",
		Country:"Viet Nam",
		About_me : "123",
		Image: "https://s.pro.vn/3Eeg",
		Email:"123@com.vn"
	}
]


function ChoseMember(){
	var member = document.querySelectorAll("li.active a");
	console.log(member)
	for(let i = 0;i<member.length;i++){
		member[i].addEventListener('click',(e)=>{
			document.querySelector(".content").classList.add('content1');
			document.querySelectorAll(".form-group p")[0].textContent = info[i].first_name;
			document.querySelectorAll(".form-group p")[1].textContent = info[i].Last_Name;
			document.querySelectorAll(".form-group p")[2].textContent = info[i].Address;
			document.querySelectorAll(".form-group p")[3].textContent = info[i].City;
			document.querySelectorAll(".form-group p")[4].textContent = info[i].Country;
			document.querySelector(".author a h5").textContent = info[i].first_name + info[i].Last_Name;
			document.querySelector(".author a img").src = info[i].Image
			document.querySelector(".author p ").textContent = info[i].Email
			setTimeout(function() {
  				document.querySelector(".content").classList.remove('content1');
			}, 1000);
			
		})
	}
}

document.addEventListener("DOMContentLoaded", ChoseMember);