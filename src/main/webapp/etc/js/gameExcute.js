var agent = navigator.userAgent.toLowerCase();

if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
    /*alert("Internet Explorer"); */
    function gameExcute()
    {
    var objWSH = new ActiveXObject("WScript.Shell");
    alert("test1");
    var retval = objWSH.run("C:\\Users\\John\\Desktop\\yutnoriGame\\yutnori.exe",1,true);
    }
}
 
else if (agent.indexOf("chrome") != -1) {
  function gameExcute()
  {
    /*alert("HAVE TO INSTALL."); */
    var objWSH = new ActiveXObject("WScript.Shell");
    var retval = objWSH.Run("C:/Windows/SysWOW64/notepad.exe",1,true);
  }
}
