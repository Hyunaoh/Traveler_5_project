<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Alram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
@import "lesshat";

@distance:40px; /* distance between stacked modals*/

@modal-translate-z: -340px; /* The first modal translateZ value*/

.transform(@translateZ) {
  -webkit-transform: scale(0.8) rotateY(45deg) translateZ(@translateZ);
  -ms-transform: scale(0.8) rotateY(45deg) translateZ(@translateZ);
  -o-transform: scale(0.8) rotateY(45deg) translateZ(@translateZ);
  transform: scale(0.8) rotateY(45deg) translateZ(@translateZ);
}

.preserve-3d(){
  -webkit-transform-style:preserve-3d;
  -ms-transform-style:preserve-3d;
  -o-transform-style:preserve-3d;
  transform-style:preserve-3d;
}

.perspective(@perspective){
  -webkit-perspective:@perspective;
  -moz-perspective:@perspective;
  -ms-perspective:@perspective;
  -o-perspective:@perspective;
  perspective:@perspective;
}
.container{
  margin:5em auto;
}

.modal.in{
  .perspective(2000px);
  
  .modal-dialog{
    &.aside{
      .transform(@modal-translate-z);
      .preserve-3d();
      
      &.aside-1{
        .transform(calc(@modal-translate-z + @distance));
      }
      &.aside-2{
        .transform(calc(@modal-translate-z + (@distance * 2)));
      }
      &.aside-3{
        .transform(calc(@modal-translate-z + (@distance * 3)));
      }
      &.aside-4{
        .transform(calc(@modal-translate-z + (@distance * 4)));
      }   
      &.aside-5{
        .transform(calc(@modal-translate-z + (@distance * 5)));
      }
    }
  }
}
</style>

<style type="text/css">

	.container {
		margin: 5em auto;
	}
	
	.modal.in {
		-webkit-perspective: 2000px;
		-moz-perspective: 2000px;
		-ms-perspective: 2000px;
		-o-perspective: 2000px;
		perspective: 2000px;
	}
	
	.modal.in .modal-dialog.aside {
		-webkit-transform: -340px;
		-moz-transform: -340px;
		-ms-transform: -340px;
		-o-transform: -340px;
		transform: -340px;
		-webkit-transform: scale(0.8) rotateY(45deg) translateZ(-340px);
		-ms-transform: scale(0.8) rotateY(45deg) translateZ(-340px);
		-o-transform: scale(0.8) rotateY(45deg) translateZ(-340px);
		transform: scale(0.8) rotateY(45deg) translateZ(-340px);
		-webkit-transform-style: preserve-3d;
		-ms-transform-style: preserve-3d;
		-o-transform-style: preserve-3d;
		transform-style: preserve-3d;
	}
	
	.modal.in .modal-dialog.aside.aside-1 {
		-webkit-transform: calc(-300px);
		-moz-transform: calc(-300px);
		-ms-transform: calc(-300px);
		-o-transform: calc(-300px);
		transform: calc(-300px);
		-webkit-transform: scale(0.8) rotateY(45deg) translateZ(calc(-300px));
		-ms-transform: scale(0.8) rotateY(45deg) translateZ(calc(-300px));
		-o-transform: scale(0.8) rotateY(45deg) translateZ(calc(-300px));
		transform: scale(0.8) rotateY(45deg) translateZ(calc(-300px));
	}
	
	.modal.in .modal-dialog.aside.aside-2 {
		-webkit-transform: calc(-260px);
		-moz-transform: calc(-260px);
		-ms-transform: calc(-260px);
		-o-transform: calc(-260px);
		transform: calc(-260px);
		-webkit-transform: scale(0.8) rotateY(45deg) translateZ(calc(-260px));
		-ms-transform: scale(0.8) rotateY(45deg) translateZ(calc(-260px));
		-o-transform: scale(0.8) rotateY(45deg) translateZ(calc(-260px));
		transform: scale(0.8) rotateY(45deg) translateZ(calc(-260px));
	}
	
	.modal.in .modal-dialog.aside.aside-3 {
		-webkit-transform: calc(-220px);
		-moz-transform: calc(-220px);
		-ms-transform: calc(-220px);
		-o-transform: calc(-220px);
		transform: calc(-220px);
		-webkit-transform: scale(0.8) rotateY(45deg) translateZ(calc(-220px));
		-ms-transform: scale(0.8) rotateY(45deg) translateZ(calc(-220px));
		-o-transform: scale(0.8) rotateY(45deg) translateZ(calc(-220px));
		transform: scale(0.8) rotateY(45deg) translateZ(calc(-220px));
	}
	
	.modal.in .modal-dialog.aside.aside-4 {
		-webkit-transform: calc(-180px);
		-moz-transform: calc(-180px);
		-ms-transform: calc(-180px);
		-o-transform: calc(-180px);
		transform: calc(-180px);
		-webkit-transform: scale(0.8) rotateY(45deg) translateZ(calc(-180px));
		-ms-transform: scale(0.8) rotateY(45deg) translateZ(calc(-180px));
		-o-transform: scale(0.8) rotateY(45deg) translateZ(calc(-180px));
		transform: scale(0.8) rotateY(45deg) translateZ(calc(-180px));
	}
	
	.modal.in .modal-dialog.aside.aside-5 {
		-webkit-transform: calc(-140px);
		-moz-transform: calc(-140px);
		-ms-transform: calc(-140px);
		-o-transform: calc(-140px);
		transform: calc(-140px);
		-webkit-transform: scale(0.8) rotateY(45deg) translateZ(calc(-140px));
		-ms-transform: scale(0.8) rotateY(45deg) translateZ(calc(-140px));
		-o-transform: scale(0.8) rotateY(45deg) translateZ(calc(-140px));
		transform: scale(0.8) rotateY(45deg) translateZ(calc(-140px));
	}
</style>
<script type="text/javascript">

		  var $btn = $(this);
		  var currentDialog = $btn.closest('.modal-dialog'),
		  targetDialog = $($btn.attr('data-target'));;
		  if (!currentDialog.length)
		    return;
		  targetDialog.data('previous-dialog', currentDialog);
		  currentDialog.addClass('aside');
		  var stackedDialogCount = $('.modal.in .modal-dialog.aside').length;
		  if (stackedDialogCount <= 5){
		    currentDialog.addClass('aside-' + stackedDialogCount);
		  }
		  
		$('.modal').on('hide.bs.modal', function() {
			var $dialog = $(this);
			var previousDialog = $dialog.data('previous-dialog');
			
			if (previousDialog) {
				previousDialog.removeClass('aside');
				$dialog.data('previous-dialog', undefined);
			}
			
		});


</script>

</head>
<body bgcolor="buttonface" onload="">
	<div class="container">
	
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Modal title 1</h4>
				</div>
				<div class="modal-body">
					<p>dd&hellip;</p>
					<button class="btn btn-default" data-toggle="modal" data-target="#test-modal-2">Launch Modal 2</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->

		<!-- /.modal -->


		<!-- <div class="modal fade" id="test-modal-2" data-modal-index="2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">Modal title 2</h4>
					</div>
					<div class="modal-body">
						<p>One fine body&hellip;</p>
						<button class="btn btn-default" data-toggle="modal" data-target="#test-modal-3">Launch Modal 3</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
				/.modal-content
			</div>
			/.modal-dialog
		</div> -->
	</div>
</body>
</html>


