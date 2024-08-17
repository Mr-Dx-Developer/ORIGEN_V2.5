window.addEventListener('message', function(event){
  let temp = document.createElement('textarea');
  let selection = document.getSelection();
  

  console.log(event.data.copy)

  temp.textContent = event.data.copy;
  document.body.appendChild(temp);

  selection.removeAllRanges();
  temp.select();
  document.execCommand('copy');

  selection.removeAllRanges();
  document.body.removeChild(temp);
});