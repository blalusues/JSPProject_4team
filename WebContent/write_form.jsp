<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/result-light.css">

<!-- 다음 에디터 사용 -->
<link rel="stylesheet"
   href="/JSPProject_4team/daumeditor/css/editor.css" type="text/css"
   charset="utf-8" />
<script
   src="/JSPProject_4team/daumeditor/js/editor_loader.js?environment=development"
   type="text/javascript" charset="utf-8"></script>

<style type="text/css">
input {
   font: 14px sans-serif;
}
</style>

<title>후기 작성</title>

<script type="text/javascript">
   // 수정하려면 mouseClick 위치 인식해서 그 부분의 input 열어주고 
   // 안에 text로 기존 값 넣고 하면 될 듯 
   // 원을 클릭하면 요약이 뜨고, 텍스트박스를 클릭하면 수정 삭제 할 수 있게 
   // 시간 남으면 수정하겠씁니당,,,

   window.onload = function() {
      var canvas = document.getElementById('myCanvas'), ctx = canvas
            .getContext('2d'), font = '14px sans-serif', hasInput = false, btn = document
            .getElementById('btn'),
      // count 는 추가 버튼을 누른 횟수 
      count = 0;

      var texts = [];

      // 기본 시작점과 출발점
      ctx.beginPath();
      ctx.arc(100, 100, 3, Math.PI * 1.5, Math.PI * 4);
      ctx.arc(100, 700, 3, Math.PI * 1.5, Math.PI * 4);
      ctx.fill();
      ctx.stroke();
      addInput(120, 100 - 6);
      addInput(120, 700 - 6);

      // 추가 버튼을 누르면 원과 텍스트 박스가 그려짐  
      // 추가 버튼을 누르면 다 지우고 그 전 텍스트는 한 칸 위로 올리고 원 + 텍스트박스 추가 
      btn.onclick = function(e) {
         if (hasInput)
            return;
         count++;
         var y = 600 / (count + 1) + 100;
         ctx.clearRect(0, 0, canvas.width, canvas.height);
         // 경로 그리기 
         drawPath(y);
      }

      function drawPath(y) {
         ctx.beginPath();
         ctx.arc(100, 100, 3, Math.PI * 1.5, Math.PI * 4);
         ctx.arc(100, 700, 3, Math.PI * 1.5, Math.PI * 4);
         ctx.fill();
         ctx.stroke();
         var textY = 100;

         // 텍스트 위로 땡기기
         for (var i = 0; i < texts.length; i++) {
            var text = texts[i].text;
            drawText(text, 120, textY - 6);
            textY += 600 / (count + 1);
         }
         // 원, 텍스트 박스 추가 
         for (var i = 0; i < count; i++) {
            ctx.beginPath();
            ctx.arc(100, y, 3, Math.PI * 1.5, Math.PI * 4);
            ctx.fill();
            ctx.stroke();
            y += 600 / (count + 1);
         }
         addInput(120, 700 - 6);
      }

      function addInput(x, y) {
         // input element 생성 
         var input = document.createElement('input');

         input.type = 'text';
         input.style.position = 'fixed';
         input.style.left = (x + 870) + 'px';
         input.style.top = y + 'px';

         // 사용자가 키보드의 키를 누를 때 발생 
         input.onkeydown = handleEnter;

         // body에 input 넣기 
         document.body.appendChild(input);

         input.focus();

         hasInput = true;
      }

      // 키보드의 키를 눌렀을 때 
      function handleEnter(e) {
         var keyCode = e.keyCode;
         // 만약 사용자가 엔터 누르면 drawText 하게 
         if (keyCode === 13) {
            // 텍스트를 그리고 텍스트박스는 지우는
            drawText(this.value, parseInt(this.style.left, 10) - 870,
                  parseInt(this.style.top, 10));
            // texts 배열에 값 넣기
            texts.push({
               text : this.value
            });
            document.body.removeChild(this);
            hasInput = false;
         }
      }

      // canvas에 text 그리기 
      function drawText(txt, x, y) {
         ctx.textBaseline = 'top';
         ctx.textAlign = 'left';
         ctx.font = font;
         ctx.fillText(txt, x - 4, y - 4);
      }

      ///////////////////////////////////////
      //daum Editor (다음 에디터)
      function setConfig() {
         var config = {
            txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
            txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
            txService : 'sample', /* 수정필요없음. */
            txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
            initializedId : "", /* 대부분의 경우에 빈문자열 */
            wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
            form : 'tx_editor_form' + "", /* 등록하기 위한 Form 이름 */
            txIconPath : "/JSPProject_4team/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
            txDecoPath : "/JSPProject_4team/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
            canvas : {
               styles : {
                  color : "#123456", /* 기본 글자색 */
                  fontFamily : "굴림", /* 기본 글자체 */
                  fontSize : "10pt", /* 기본 글자크기 */
                  backgroundColor : "#fff", /*기본 배경색 */
                  lineHeight : "1.5", /*기본 줄간격 */
                  padding : "8px" /* 위지윅 영역의 여백 */
               },
               showGuideArea : false
            },
            events : {
               preventUnload : false
            },
            sidebar : {
               attachbox : {
                  show : true,
                  confirmForDeleteAll : true
               }
            },
            size : {
            /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
            }
         };
         EditorJSLoader.ready(function(Editor) {
            editor = new Editor(config);
         });
      }
      // 마지막으로 jquery ajax를 이용하여 template html 파일을 load 후 setConfig 함수를 호출

      $(function() {
         $.ajax({
            type : "POST",
            url : "/JSPProject_4team/daumeditor/editor_template.html",
            success : function(data) {
               $("#editorTd").html(data);
               setConfig();
            },
            error : function(request, status, error) {
               alert("에러");
            }
         });
      })

   }
</script>
</head>
<body>
   <div class="row">
      <div class="col-md-8">
         <form name="tx_editor_form" id="tx_editor_form" action="/servlet"
            method="post">
            <table>
               <tr>
                  <td>제목</td>
                  <td><input type="text" id="title" name="title" /></td>

               </tr>
               <tr>
                  <td>내용</td>
                  <td id="editorTd"></td>
               </tr>
               <tr>
                  <td colspan="2"><input type="submit" value="작성" /> <input
                     type="button" value="취소" /></td>
               </tr>
            </table>
         </form>
      </div>

      <div class="col-md-4">
         <canvas id="myCanvas" width="400" height="800"></canvas>
         <button id="btn" type="button" class="btn btn-default btn-lg">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 경로
            추가
         </button>
      </div>
   </div>
</body>
</html>