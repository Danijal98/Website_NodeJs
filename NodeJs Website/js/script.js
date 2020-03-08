let link = document.getElementById('pocetna');
let user_id = document.location.href.substring(location.href.lastIndexOf('=')+1);
link.href = '/index.html/id='+user_id;