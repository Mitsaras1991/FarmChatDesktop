/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function send_post(){
    var hr=XMLHttpRequest();
    var url="send_post.jsp";
    var fn=document.getElementById("post").value;
    var vars="post="+fn;
    hr.open("POST",url,true);
    hr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    hr.onreadystatechange=function(){
        
        if(hr.readyState==4 && hr.status==200){
            
            var return_data=hr.responseText;
            document.getElementById("status").innerHTML=return_data;
        }
        
    }
    
    
    
   hr.send(vars);
   document.getElementById("status").innerHTML="processing.....";
    
    
    
}

