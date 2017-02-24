actorsApp.controller('actorsListController',ActorsListData);
//ActorsListData.$inject=['commonData'];

ActorsListData.$inject=['quizMetrics','dataService'];

function ActorsListData(quizMetrics,dataService){
	var vm=this;
	vm.quizMetrics=quizMetrics;
	vm.data=dataService.actorData;
	vm.activeActor={};
	vm.changeActiveActors=changeActiveActors;
	vm.search="";
	vm.activateQuiz=activateQuiz;
	
	
	function changeActiveActors(actData){
		//alert(actData);
		vm.activeActor=actData;
		
	}
	
	function activateQuiz(){
		quizMetrics.changeState('quiz',true);
	}
};


