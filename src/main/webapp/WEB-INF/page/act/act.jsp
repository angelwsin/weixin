<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width" />
  
  <title>Websanova :: wScratchPad</title>

  <!-- filestart -->
 
  <link rel="Stylesheet" type="text/css" href="${root}/css/demo.css" />
  <script type="text/javascript" src="${root }/js/bootstrap/jquery-1.11.2.js"></script>
  <!-- fileend -->

  
</head>
<body>
  <!-- headstart -->
  <header>
    <a id="header-logo" href="http://websanova.com"></a>

    <div id="header-links">
      <a href="http://websanova.com">Blog</a>
      <a href="http://websanova.com/plugins">Plugins</a>
      <a href="http://websanova.com/extensions">Extensions</a>
      <a href="http://websanova.com/services">Services</a>
    </div>
  </header>
  <!-- headend -->

  <div id="content">
    <h1 id="plugin-name">wScratchPad.js</h1>

    <div class="content-box">

      <div id="demo1" class="scratchpad"></div>
      <div id="demo1-percent">&nbsp;</div>
      <input type="button" value="Reset" onclick="$('#demo1').wScratchPad('reset');"/>
      <input type="button" value="Clear" onclick="$('#demo1').wScratchPad('clear');"/>
      <input type="button" value="Enable" onclick="$('#demo1').wScratchPad('enable', true);"/>
      <input type="button" value="Disable" onclick="$('#demo1').wScratchPad('enable', false);"/>

      <h3>Clear After 70 Percent Scratched</h3>
      <div id="demo2" class="scratchpad"></div>
      <div id="demo2-percent">&nbsp;</div>
      <input type="button" value="Reset" onclick="$('#demo2').wScratchPad('reset');"/>
      <input type="button" value="Clear" onclick="$('#demo2').wScratchPad('clear');"/>
      <input type="button" value="Enable" onclick="$('#demo2').wScratchPad('enable', true);"/>
      <input type="button" value="Disable" onclick="$('#demo2').wScratchPad('enable', false);"/>
      
      <style>
        .scratchpad{
          width: 35%;
          height: 100px;
          border: solid 1px;
        }

        @media (max-width: 500px) {
          .scratchpad {
            width: 65%;
          }

        }
		div span{
		   fonrt-size:40px;
		}
      </style>

      <script type="text/javascript" src="${root}/js/wScratchPad.js"></script>
      <script type="text/javascript">
        var x = 0;
        $('#demo1').wScratchPad({
		  text:"${card}",
          bg: '#fff',
          fg: '${root}/images/scratch-to-win.png',
          'cursor': 'url("${root}/images//cursors/coin.png") 5 5, default',
          scratchMove: function (e, percent) {
            $('#demo1-percent').html(percent);
            if (percent > 70) {
            	x++;
            	if(x==1){
            		$.post("${root}/act/active",{"id":'${id}'},function(data){
             		   var msg = $.parseJSON(data); 
         	    	   alert(msg.message)
         	    	 
         	    	   return ;
             	})
            	}
            	
                this.clear();
              }
          }
        });

        $('#demo2').wScratchPad({
			 text:"",
          bg: '${root}/images/winner.png',
          fg: '${root}/images/scratch-to-win.png',
          'cursor': 'url("${root}/images/cursors/coin.png") 5 5, default',
          scratchMove: function (e, percent) {
            $('#demo2-percent').html(percent);

            if (percent > 70) {
              this.clear();
            }
          }
        });
      </script>
      
    </div>
  </div>

  <!-- footstart -->
  <!-- <footer>
    <div id="footer-icons">
      a id="youtube-icon" href="http://websanova.com/youtube" target="_blank"></a
      <a id="stumbleupon-icon" href="http://websanova.com/stumbleupon" target="_blank"></a>
      <a id="linkedin-icon" href="http://websanova.com/linkedin" target="_blank"></a>
      <a id="facebook-icon" href="http://websanova.com/facebook" target="_blank"></a>
      <a id="googleplus-icon" href="http://websanova.com/googleplus" target="_blank"></a>
      <a id="twitter-icon" href="http://websanova.com/twitter" target="_blank"></a>
      <a id="github-icon" href="http://websanova.com/github" target="_blank"></a>
      <a id="rss-icon" href="http://websanova.com/feed" target="_blank"></a>
    </div>
  </footer> -->
  <!-- footend -->
</body>
</html>