<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="actorsApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Angular Quiz</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
<script src="app/js/app.js"></script>
<script src="app/js/actorsListController.js"></script>
<script src="app/js/quizMetrics.js"></script>
<script src="app/js/dataService.js"></script>
<script src="app/js/quizController.js"></script>
<script src="app/js/resutls.js"></script>
<link href="css/bootstrap-theme.min.css" rel="stylesheet"></style>
<link href="css/bootstrap.min.css" rel="stylesheet"></style>
<link href="app/css/actors.css" rel="stylesheet"></style>


</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>Actors Quiz</h1>
			<p>
				Below data shows information about your favourite actors. Read the
				information and take <strong>Actor Quiz</strong>
			</p>
		</div>

		<div class="container"
			ng-controller="actorsListController as listCtrl"
			ng-hide="listCtrl.quizMetrics.quizActFlag || listCtrl.quizMetrics.resultsActive">
			<form class="form-inline well well-sm">
				<span class="glyphicon glyphicon-search"></span> <input type="text"
					ng-model="listCtrl.search" class="form-control"
					placeholder="search..." />
				<button class="btn btn-warning pull-right"
					ng-click="listCtrl.activateQuiz()">Start Quiz</button>
			</form>
			<div class="row">
				<div class="col-sm-6"
					ng-repeat="actData in listCtrl.data | filter : listCtrl.search">
					<div class="well well=sm">
						<div class="row">
							<div class="col-sm-6">
								<img ng-src="{{actData.image}}" class="img-rounded  act-image"
									alt="{{actData.name}}">
							</div>
							<div class="col-md-6">
								<h3>{{actData.name}}</h3>
								<p>Job: {{actData.title}}</p>
								<p>Pet Name: {{actData.peopleCall}}</p>
								<p>First Movie:{{actData.firstMovie}}</p>
								<p>Awards: {{actData.award}}</p>

							</div>
							<button class="btn btn-primary pull-right" data-toggle="modal"
								data-target="#actors-Info"
								ng-click="listCtrl.changeActiveActors(actData)">Learn
								more</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="actors-Info">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-header">
							<!-- more usage of angular data binding -->
							<h2>{{listCtrl.activeActor.name}}</h2>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-xs-8 col-xs-offset-2">
									<!-- ng-src used again instead of src -->
									<img ng-src="{{listCtrl.activeActor.image}}"
										class="img-rounded img-responsive">
								</div>
							</div>
							<div class="row top-buffer">
								<div class="col-md-6">
									<!-- angular data binding -->
									<p>
										<strong>Job:</strong> {{listCtrl.activeActor.title}}
									</p>
									<p>
										<strong>Pet Name: </strong>{{listCtrl.activeActor.peopleCall}}
									</p>
									<p>
										<strong>First Movie:</strong>{{listCtrl.activeActor.firstMovie}}
									</p>
									<p>
										<strong>Awards: </strong>{{listCtrl.activeActor.award}}
									</p>
								</div>
								<div class="col-xs-12 top-buffer">
									<!-- angular data binding and data-dismiss for bootstrap -->
									<p>{{listCtrl.activeActor.description}}</p>
									<button class="btn btn-danger pull-right" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Quiz controller start -->
		<div ng-controller="quizController as quizCtrl"
			ng-show=quizCtrl.quizMetrics.quizActFlag>
			<h1>Quiz</h1>
			<div class="alert alert-danger" ng-show="quizCtrl.error">
			You have not answered all questions.
			<button class="close" ng-click="quizCtrl.error=false">&times</button>
			</div>
			<div class="row">
				<div class="col-xs-8">
				<h2>Progress:</h2>
					<div class="btn-toolbar">
						<button class="btn"
							ng-repeat="questions in quizCtrl.dataService.questions"
							ng-class="{'btn-info':questions.selected!==null,'btn-danger':questions.selected===null}" ng-click="quizCtrl.setActiveByProgress($index)">
							<span class="glyphicon"
								ng-class="{'glyphicon-pencil':questions.selected!==null,'glyphicon-question-sign':questions.selected===null}"></span>
						</button>
					</div>
				</div>
				  <div class="col-xs-4">
                    <div class="row">
                        <h4>Legend:</h4>
                        <div class="col-sm-4">
                            <button class="btn btn-info">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                            <p>Answered</p>
                        </div>
                        <div class="col-sm-4">
                            <button class="btn btn-danger">
                                <span class="glyphicon glyphicon-question-sign"></span>
                            </button>
                            <p>Unanswered</p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="row"  ng-hide="quizCtrl.finaliseQuiz">
				<h3>Questions:</h3>
				<div class="well well-sm">
					<div class="row">
						<div class="col-xs-12">
							<h4>{{quizCtrl.activeQuiz+1 +". "+
								quizCtrl.dataService.questions[quizCtrl.activeQuiz].text}}</h4>
						
						<div class="row" ng-if="quizCtrl.dataService.questions[quizCtrl.activeQuiz].type==='text'">
							<div class="col-sm-6"
								ng-repeat="answers in quizCtrl.dataService.questions[quizCtrl.activeQuiz].possibilities" 
								>
								<h4 class="answer" ng-class="{'bg-info':$index===quizCtrl.dataService.questions[quizCtrl.activeQuiz].selected}" ng-click="quizCtrl.setSelectedAnswer($index)">{{answers.answer}}</h4>
							</div>
						</div>
						<div class="row" ng-if="quizCtrl.dataService.questions[quizCtrl.activeQuiz].type==='image'">
							<div class="col-sm-6"
								ng-repeat="answers in quizCtrl.dataService.questions[quizCtrl.activeQuiz].possibilities"
								>
								<div class="img-answer" 
								ng-class="{'img-answered':$index===quizCtrl.dataService.questions[quizCtrl.activeQuiz].selected}" 
								ng-click="quizCtrl.setSelectedAnswer($index)">
								<img ng-src="{{answers.answer}}">
							</div>
						</div>
						
						</div>
						<button class="btn btn-warning" ng-click="quizCtrl.questionAnswered()">Continue</button>
					</div>

				</div>
			</div>

		</div>
		<div class="well well-sm" ng-show="quizCtrl.finaliseQuiz">
		<h2>Are you sure you want to submit your answers?</h2>
		<button class="btn btn-success" ng-click="quizCtrl.finaliseAnswers()">Yes
		</button>
		<button class="btn btn-danger" ng-click="quizCtrl.finaliseQuiz=false">No</button>
		</div>
	</div>
	
	
	<div ng-controller="resultsController as resCtrl" ng-show="resCtrl.quizMetrics.resultsActive">
	<div class="row">
               <div class="col-xs-8">
                   <h2>Results:</h2>
                   <div class="btn-toolbar">
                       <button class="btn"
                           ng-repeat="question in resCtrl.dataService.questions"
                           ng-class="{'btn-success': question.correct, 'btn-danger': !question.correct}"
                           ng-click="resCtrl.setActiveQuestion($index)">
                            <span class="glyphicon"
                                ng-class="{'glyphicon-thumbs-up': question.correct, 'glyphicon-thumbs-down': !question.correct}"></span>
                       </button>
                   </div>
               </div>
               <div class="col-xs-4">
                   <div class="row">
                       <h4>Legend:</h4>
                       <div class="col-sm-4">
                           <button class="btn btn-success">
                               <span class="glyphicon glyphicon-thumbs-up"></span>
                           </button>
                           <p>Correct</p>
                       </div>
                       <div class="col-sm-4">
                           <button class="btn btn-danger">
                               <span class="glyphicon glyphicon-thumbs-down"></span>
                           </button>
                           <p>Incorrect</p>
                       </div>
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="col-xs-12 top-buffer">
                    <h2>You Scored {{resCtrl.quizMetrics.numCorrect}} / {{resCtrl.dataService.questions.length}}</h2>
                    <h2><strong>{{resCtrl.calculatePerc() | number:2}}%</strong></h2>
               </div>
           </div>
            <div class="row">
               <h3>Questions:</h3>
               <div class="well well-sm">
                   <div class="row">
                       <div class="col-xs-12">
                           <h4>{{resCtrl.activeQuiz+1 +". "+resCtrl.dataService.questions[resCtrl.activeQuiz].text}}</h4>
                           <div class="row"
                               ng-if="resCtrl.dataService.questions[resCtrl.activeQuiz].type === 'text'">
                               <!-- ng-repeat being utilised again -->
                               <div class="col-sm-6" ng-repeat="answer in resCtrl.dataService.questions[resCtrl.activeQuiz].possibilities">
                                   <h4 class="answer"
                                       ng-class="resCtrl.getAnswerClass($index)">
                                       {{answer.answer}}
                                       <!-- more usage of the ng-show directive to selectively show the elements on condition -->
                                       <p class="pull-right"
                                            ng-show="$index !== resCtrl.quizMetrics.correctAnswers[resCtrl.activeQuiz] && $index ===resCtrl.dataService.questions[resCtrl.activeQuiz].selected">Your Answer</p>
                                       <p class="pull-right"
                                            ng-show="$index === resCtrl.quizMetrics.correctAnswers[resCtrl.activeQuiz]">Correct Answer</p>
                                   </h4>
                               </div>
                           </div><!-- row -->
                             <div class="row"
                               ng-if="resCtrl.dataService.questions[resCtrl.activeQuiz].type === 'image'">
                               <!-- more ng-repeat -->
                               <div class="col-sm-6" ng-repeat="answer in resCtrl.dataService.questions[resCtrl.activeQuiz].possibilities">
                               		<!-- ng-class and ng-src -->
                                   <div class="img-answer"
                                       ng-class="resCtrl.getAnswerClass($index)">
                                       <img ng-src="{{answer.answer}}">
                                   </div>
                               </div>
                           </div>
                           <button class="btn btn-primary" ng-click="resCtrl.resetQuiz()">Goto Facts</button>
	</div>
</body>
</html>