var haha=document.createElement('div');
haha.style='height:8ex; width:100%; background-color:olive; opacity:0; position:fixed;';
document.body.appendChild(haha);

document.body.addEventListener('mousemove',function(event){
  haha.style.top=(event.clientY+1)+'px';
});
document.body.addEventListener('click',function(event){//show/hide
  if(event.ctrlKey){
    haha.style.opacity=0.5-haha.style.opacity;
  }
});
