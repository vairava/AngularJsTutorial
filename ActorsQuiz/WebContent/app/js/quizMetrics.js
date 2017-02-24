/**
 * 
 */

angular.module('actorsApp').factory('quizMetrics',QuizMetrics);

QuizMetrics.$inject=['dataService']; 
function QuizMetrics(dataService){
	var quizObj={
			quizActFlag:false,
			resultsActive:false,
			changeState:changeState,
			markQuiz:markQuiz,
			correctAnswers:[],
			numCorrect:0
	};
	return quizObj;
	
	function changeState(metric,state){
		if(metric==='quiz'){
		quizObj.quizActFlag=state;
		}else
			if(metric==='results'){
				quizObj.resultsActive=state;
			}else{
				return false;
			}
		
	}
	
	function markQuiz(){
		quizObj.correctAnswers=dataService.correctAnswers;
		for(var i=0;i<dataService.questions.length;i++){
		if(dataService.questions[i].selected===quizObj.correctAnswers[i]){
			dataService.questions[i].correct=true;	
			quizObj.numCorrect++;
		}else{
			dataService.questions[i].correct=false;	
		}
		}
	}
}