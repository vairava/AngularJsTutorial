/**
 * 
 */

angular.module('actorsApp').controller('resultsController',ResultsController);

ResultsController.$inject=['quizMetrics','dataService'];

function ResultsController(quizMetrics,dataService){
	var vm=this;
	vm.quizMetrics=quizMetrics;
	vm.dataService=dataService;
	vm.getAnswerClass=getAnswerClass;
	vm.activeQuiz=0;
	vm.setActiveQuestion=setActiveQuestion;
	vm.calculatePerc=calculatePerc;
	vm.resetQuiz=resetQuiz;
	function calculatePerc(){
		return (quizMetrics.numCorrect/dataService.questions.length)*100;
	}
	function getAnswerClass(index){
		if(index===quizMetrics.correctAnswers[vm.activeQuiz]){
			return 'bg-success';
		}
		else if(index===dataService.questions[vm.activeQuiz].selected){
			return 'bg-danger';
		}
		
	}
	
	function setActiveQuestion(index){
		vm.activeQuiz=index;
	}
	
	function resetQuiz(){
		quizMetrics.changeState("results",false);
		quizMetrics.numCorrect=0;
		for(var i=0;i<dataService.questions.length;i++){
			var data=dataService.questions[i];
			data.selected=null;
			data.correct=null;
		}
	}
	
}