<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/JSPProject_4team/daumeditor/css/editor.css" type="text/css" charset="utf-8" />

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- ���� ������ ��� -->
<script src="/JSPProject_4team/daumeditor/js/editor_loader.js"
	type="text/javascript" charset="utf-8"></script>

<style type="text/css">
input {
	font: 14px sans-serif;
}
</style>

<title>�ı� �ۼ�</title>

<script type="text/javascript">
	// �����Ϸ��� mouseClick ��ġ �ν��ؼ� �� �κ��� input �����ְ� 
	// �ȿ� text�� ���� �� �ְ� �ϸ� �� �� 
	// ���� Ŭ���ϸ� ����� �߰�, �ؽ�Ʈ�ڽ��� Ŭ���ϸ� ���� ���� �� �� �ְ� 
	// �ð� ������ �����ϰھ��ϴ�,,,

	window.onload = function() {
		var canvas = document.getElementById('myCanvas'), ctx = canvas
				.getContext('2d'), font = '14px sans-serif', hasInput = false, btn = document
				.getElementById('btn'),
		// count �� �߰� ��ư�� ���� Ƚ�� 
		count = 0;

		var texts = [];

		// �⺻ �������� �����
		ctx.beginPath();
		ctx.arc(100, 100, 3, Math.PI * 1.5, Math.PI * 4);
		ctx.arc(100, 700, 3, Math.PI * 1.5, Math.PI * 4);
		ctx.fill();
		ctx.stroke();
		addInput(120, 100 - 6);
		addInput(120, 700 - 6);

		// �߰� ��ư�� ������ ���� �ؽ�Ʈ �ڽ��� �׷���  
		// �߰� ��ư�� ������ �� ����� �� �� �ؽ�Ʈ�� �� ĭ ���� �ø��� �� + �ؽ�Ʈ�ڽ� �߰� 
		btn.onclick = function(e) {
			if (hasInput)
				return;
			count++;
			var y = 600 / (count + 1) + 100;
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			// ��� �׸��� 
			drawPath(y);
		}

		function drawPath(y) {
			ctx.beginPath();
			ctx.arc(100, 100, 3, Math.PI * 1.5, Math.PI * 4);
			ctx.arc(100, 700, 3, Math.PI * 1.5, Math.PI * 4);
			ctx.fill();
			ctx.stroke();
			var textY = 100;

			// �ؽ�Ʈ ���� �����
			for (var i = 0; i < texts.length; i++) {
				var text = texts[i].text;
				drawText(text, 120, textY - 6);
				textY += 600 / (count + 1);
			}
			// ��, �ؽ�Ʈ �ڽ� �߰� 
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
			// input element ���� 
			var input = document.createElement('input');

			input.type = 'text';
			input.style.position = 'fixed';
			input.style.left = (x + 870) + 'px';
			input.style.top = y + 'px';

			// ����ڰ� Ű������ Ű�� ���� �� �߻� 
			input.onkeydown = handleEnter;

			// body�� input �ֱ� 
			document.body.appendChild(input);

			input.focus();

			hasInput = true;
		}

		// Ű������ Ű�� ������ �� 
		function handleEnter(e) {
			var keyCode = e.keyCode;
			// ���� ����ڰ� ���� ������ drawText �ϰ� 
			if (keyCode === 13) {
				// �ؽ�Ʈ�� �׸��� �ؽ�Ʈ�ڽ��� �����
				drawText(this.value, parseInt(this.style.left, 10) - 870,
						parseInt(this.style.top, 10));
				// texts �迭�� �� �ֱ�
				texts.push({
					text : this.value
				});
				document.body.removeChild(this);
				hasInput = false;
			}
		}

		// canvas�� text �׸��� 
		function drawText(txt, x, y) {
			ctx.textBaseline = 'top';
			ctx.textAlign = 'left';
			ctx.font = font;
			ctx.fillText(txt, x - 4, y - 4);
		}
	}
	///////////////////////////////////////
	//daum Editor (���� ������)
$(function() {
		$.ajax({
			url : "/WebTest/daumeditor/editor_frame.html",
			success : function(data) {
				$("#editor_frame").html(data);
				// ������UI load
				var config = {
					/* ��Ÿ�� �� ���ҽ����� �ε��� �� �ʿ��� �κ�����, ��ΰ� ����Ǹ� �� �κ� ������ �ʿ�. ex) http://xxx.xxx.com */
					txHost : '',
					/* ��Ÿ�� �� ���ҽ����� �ε��� �� �ʿ��� �κ�����, ��ΰ� ����Ǹ� �� �κ� ������ �ʿ�. ex) /xxx/xxx/ */
					txPath : '',
					/* �����ʿ����. */
					txService : 'sample',
					/* �����ʿ����. ������Ʈ�� �������� ��츸 �����Ѵ�. */
					txProject : 'sample',
					/* ��κ��� ��쿡 ���ڿ� */
					initializedId : "",
					/* �����͸� �ѷ��ΰ� �ִ� ���̾� �̸�(������ �����̳�) */
					wrapper : "tx_trex_container",
					/* ����ϱ� ���� Form �̸� */
					form : "frm",
					/*�����Ϳ� ���Ǵ� �̹��� ���͸�, �ʿ信 ���� �����Ѵ�. */
					txIconPath : "/daumeditor/images/icon/editor/",
					/*������ ���Ǵ� �̹��� ���͸�, ���񽺿��� ����� ���� �ϼ��� �������� �����Ǳ� ���� �����η� �����Ѵ�. */
					txDecoPath : "/daumeditor/images/deco/contents/",
					canvas : {
						styles : {
							/* �⺻ ���ڻ� */
							color : "#123456",
							/* �⺻ ����ü */
							fontFamily : "����",
							/* �⺻ ����ũ�� */
							fontSize : "10pt",
							/*�⺻ ���� */
							backgroundColor : "#fff",
							/*�⺻ �ٰ��� */
							lineHeight : "1.5",
							/* ������ ������ ���� */
							padding : "8px"
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
						/* ������ ���������� ���̰� ���� ��쿡 ���� */
						contentWidth : 700
					}
				};

				//�����ͳ��� ȯ�漳�� �����ϱ�
				new Editor(config);
			}
		});

		//form submit ��ư Ŭ��
		$("#save_button").click(function() {
			//���������Ͱ� ���Ե� form submit
			Editor.save();
		})
	})

	//Editor.save() ȣ�� �� ������ validation ������ ���� �Լ�
	//validation üũ���� �Է������� �� �Լ��� �߰� �������ݴϴ�.
	function validForm(editor) {
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('������ �Է��ϼ���');
			return false;
		}
		return true;
	}

	//validForm �Լ����� true���� ������ �̾ form submit�� �����ִ�  setForm�Լ�
	function setForm(editor) {
		var content = editor.getContent();
		$("#daumeditor").val(content)
		return true;
	}
</script>
</head>
<body>
	<form class="form-horizontal">
		<fieldset>
			<!-- Form Name -->
			<legend class="text-center">Day 1</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="title">����</label>
				<div class="col-md-9">
					<input id="title" name="title" type="text" placeholder="������ �Է����ּ���"
						class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="place">���</label>
				<div class="col-md-3">
					<select id="place" name="place" class="form-control">
						<option value="1">����</option>
						<option value="2">����</option>
						<option value="3">�뱸</option>
						<option value="4">�λ�</option>
						<option value="5">��õ</option>
						<option value="6">������</option>
						<option value="7">��û��</option>
						<option value="8">����</option>
						<option value="9">���ֵ�</option>
					</select>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="article_date">��¥</label>
				<div class="col-md-9">
					<input id="article_date" name="article_date" type="text"
						placeholder="article date of publication "
						class="form-control input-md">

				</div>
			</div>

			<!-- File Button -->
			<div class="form-group">
				<label class="col-md-2 control-label" for="source_image">��ǥ
					����</label>
				<div class="col-md-9">
					<input id="main_image" name="main_image" class="input-file"
						type="file">
				</div>
			</div>

			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-2 control-label" for="source_tags">����</label>
				<div class="col-md-9">
					<div>
						<!-- ������������ȣ�� ���� -->
						<div id="editor_frame"></div>
						<!-- ���� ���� ������� �Ѿ textarea �±� -->
						<textarea name="daumeditor" id="daumeditor" rows="10" cols="100"
							style="width: 766px; height: 412px; display: none;"></textarea>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>