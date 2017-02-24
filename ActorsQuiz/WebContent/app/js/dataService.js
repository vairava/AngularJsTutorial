/**
 * 
 */
angular.module('actorsApp').factory('dataService',DataService);

function DataService(){
	var dataObj={
			
			actorData:actorData,
			questions:quizQuestions,
			correctAnswers:correctAnswers
			
	};
	return dataObj;
}

var correctAnswers=[1,0,0,1,3];
var quizQuestions  = [
    {
        type: "text",
        text: "What is the Pet name of Vijay?",
        possibilities: [
            {
                answer: "Thalapathy"
            },
            {
                answer: "IllayaThalapathy"
            },
            {
                answer: "Joseph"
            },
            {
                answer: "Next superStar"
            }
        ],
        selected: null,
        correct: null
    },
    {
        type: "text",
        text: "whose last name is Hasan?",
        possibilities: [
            {
                answer: "Kamal"
            },
            {
                answer: "Rajini"
            },
            {
                answer: "Vijay"
            },
            {
                answer: "Ajith"
            }
        ],
        selected: null,
        correct: null
    },
    {
        type: "image",
        text: "Who won Vijay awards?",
        possibilities: [
            {
                answer: "pic/vijay.jpg"
            },
            {
                answer: "pic/kamal.jpg"
            },
            {
                answer: "pic/rajini.jpg"
            },
            {
                answer: "pic/ajith.jpg"
            }
        ],
        selected: null,
        correct: null
    },
    {
        type: "image",
        text: "Who is called Thala?",
        possibilities: [
        	{
                answer: "pic/rajini.jpg"
            },
            {
                answer: "pic/ajith.jpg"
            },
            {
                answer: "pic/vijay.jpg"
            },
            {
                answer: "pic/kamal.jpg"
            }
        ],
        selected: null,
        correct: null
    },
    {
        type: "text",
        text: "Who won National award?'",
        possibilities: [
            {
                answer: "Ajith"
            },
            {
                answer: "Vijay"
            },
            {
                answer: "Rajini"
            },
            {
                answer: "Kamal"
            }
        ],
        selected: null,
        correct: null
    }
];


var actorData=[
	{
		name:"Joseph Vijay",
		title:"Actor",
		peopleCall:"Illayathalapathy",
		firstMovie:"NaalayaTheerpu",
		award:"Vijay Awards",
		image:"pic/vijay.jpg",
		description:"Vijay is a Roman Catholic by birth,[42] and took his Holy Communion at a Chennai church.[43] He had a sister Vidhya, who died at the age of two years." +
				"[44] His father S. A. Chandrasekhar is a popular film director and his mother Shoba Chandrasekhar is a popular playback singer and carnatic vocalist. " +
				"Vijay married a Sri Lankan Tamil, Sangeetha Sornalingam on 25 August 1999." +
				"[45] They have two children, a son Sanjay born in 2000 in London," +
				"[46] and a daughter Divya born in 2005 in Chennai[47] Jason Sanjay made a cameo appearance" +
				" with his father in Vettaikaaran (2009) and Divya portrayed a small role as her father's daughter " +
				"in Theri (2016).[48][49] Vijay is the nephew of playback singer and voice actor S. N. Surendar." +
				"[50] His cousin Vikranth is also an actor.[51]"
		
	},
	{
		name:"Rajini kanth",
		title:"Actor",
		peopleCall:"SuperStar",
		firstMovie:"Apporva Ragangal",
		award:"Padma booshan",
		image:"pic/rajini.jpg",
		description:"Rajinikanth married Latha Rangachari," +
				" a student of Ethiraj College for Women, who interviewed " +
				"him for her college magazine.[137][138] " +
				"The marriage took place on 26 February 1981," +
				" in Tirupati, Andhra Pradesh.[139] " +
				"The couple have two daughters named Aishwarya Rajinikanth and " +
				"Soundarya Rajinikanth. Latha runs a school named The Ashram." +
				"Aishwarya married actor Dhanush on 18 November 2004 and they have two sons, " +
				"Yathra and Linga.[140][141] His younger daughter, Soundarya, works in the Tamil " +
				"film industry as a director, producer and graphic designer. " +
				"She married industrialist Ashwin Ramkumar on 3 " +
				"September 2010 and have a son Ved Krishna.[142]"
	},
		{
		name:"Kamal Hasan",
		title:"Actor",
		peopleCall:"UlagaNayagan",
		firstMovie:"Kalathur kanamma",
		award:"National Award",
		image:"pic/kamal.jpg",
		description:"Kamal Haasan was born into a Tamil family[70] in the town of Paramakudi, " +
				"in the Ramanathapuram district of Tamil Nadu, to criminal lawyer" +
				" D. Srinivasan and Rajalakshmi a housewife.[71] During a 2013 " +
				"appearance on an episode of Neengalum Vellalam Oru Kodi," +
				" he stated that his parents originally named him Parthasarathy and his mother always used to" +
				" call him by that name.[6] In an interview with Karan Thapar, Haasan said his father was literate " +
				"in Sanskrit. Kamal was the youngest of four children; his siblings are Charuhasan, Chandrahasan " +
				"and Nalini (Raghu). " +
				"His two older brothers followed their father's example and studied law."
				},
		{
		name:"Ajith Kumar",
		title:"Actor",
		peopleCall:"Thala",
		firstMovie:"AMaravathi",
		award:"FilmFare",
		image:"pic/ajith.jpg",
		description:"Ajith was born on 1 May 1971, in Hyderabad, India.[" +
				"1] His mother Mohini is of Sindhi origin from Kolkata," +
				"West Bengal.[3] Ajith created the non-profit organisation 'Mohini-Mani Foundation'," +
				" named after his parents, in order to promote self-hygiene and civic consciousness and to help " +
				"ease the problems of urban sprawl.[8] Ajith was the middle son out of three brothers," +
				" the others being Anoop Kumar, a stockbroker in New York, and Anil Kumar, " +
				"an IIT Madras graduate working in Seattle." +
				"[8] Ajith also had younger twin sisters, both of whom died young.[3]"
				}
	
];