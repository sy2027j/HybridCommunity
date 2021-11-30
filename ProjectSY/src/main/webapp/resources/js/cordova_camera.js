$( document ).ready(function() {
        document.addEventListener("deviceready", onDeviceReady, false);
		function onDeviceReady() {}
    });
    
//사진찍기
function cameraf(){
navigator.camera.getPicture(onSuccess, onFail, { 
	quality: 100,
    destinationType: Camera.DestinationType.DATA_URL,
    sourceType: Camera.PictureSourceType.CAMERA,
    allowEdit: false,
    encodingType:Camera.EncodingType.JPEG,
    saveToPhotoAlbum:true, //갤러리에 사진 저장할지 여부
	});
}

//갤러리열기
function camerag(){
navigator.camera.getPicture(onSuccess, onFail, { 
	quality: 100,
    destinationType: Camera.DestinationType.DATA_URL,
    sourceType: Camera.PictureSourceType.PHOTOLIBRARY,
    allowEdit: false,
    encodingType:Camera.EncodingType.JPEG,
    saveToPhotoAlbum:true,
	});
}

//성공
function onSuccess(imageData) {
    var image = document.getElementById('coimg');
    image.src = "data:image/jpeg;base64," + imageData;
	document.getElementById("imageData").value=imageData; //id가imageData인객체에imageData값value로넣어주기
	console.log(imageData);
}

//실패
function onFail(message) {
    alert('Failed because: ' + message);
}
