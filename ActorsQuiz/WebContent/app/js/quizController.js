
angular.module("actorsApp")
.controller("quizController",QuizController);

QuizController.$inject=['quizMetrics','dataService'];


function QuizController(quizMetrics,dataService){
	var vm=this;
	vm.quizMetrics=quizMetrics;
	vm.dataService=dataService;
	vm.activeQuiz=0;
	vm.questionAnswered=questionAnswered;
	var numQuestionAnswered=0;
	vm.setActiveQuestion=setActiveQuestion;
	vm.setSelectedAnswer=setSelectedAnswer;
	vm.setActiveByProgress=setActiveByProgress;
	vm.error=false;
	vm.finaliseQuiz=false;
	vm.finaliseAnswers=finaliseAnswers;
	
	function setActiveByProgress(index){
		vm.activeQuiz=index;
		
	}
	function setSelectedAnswer(index){
		dataService.questions[vm.activeQuiz].selected=index;
	}
	
	function setActiveQuestion(){
		var breakloop=false;
		var quizLength=dataService.questions.length-1;
		while(!breakloop){
			vm.activeQuiz=vm.activeQuiz < quizLength?++vm.activeQuiz:0;
			if(vm.activeQuiz===0){
				vm.error=true;
			}
			if(dataService.questions[vm.activeQuiz].selected===null){
				breakloop=true;
			}
		}
	}
	function questionAnswered(){
		var quizLength=dataService.questions.length;
	
		if(dataService.questions[vm.activeQuiz].selected!==null){
			numQuestionAnswered++;
			if(numQuestionAnswered>=quizLength){
				
				for(var i=0;i<quizLength;i++){
					if(dataService.questions[vm.activeQuiz].selected===null){
						vm.setActiveByProgress(i);
						return;
					}
					
				}
				vm.error=false;
				vm.finaliseQuiz=true;
				return;
			}
			
		}
		vm.setActiveQuestion();
	}
	
	function finaliseAnswers(){
		vm.finaliseQuiz=false;
		numQuestionAnswere=0;
		vm.activeQuiz=0;
		quizMetrics.markQuiz();
		quizMetrics.changeState("quiz",false);
		quizMetrics.changeState("results",true);
	}

}