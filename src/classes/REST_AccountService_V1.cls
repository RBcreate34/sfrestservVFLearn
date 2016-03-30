/*Learning Apex Rest Services * Code from SF Developer Tutorial */
/*Test Hunk Change for SourceTree*/
@RestResource(urlMapping='/v1/accounts/*')
global with sharing class REST_AccountService_V1 {

	@HttpGet
	global static Account doGet(){
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;

		/* I am going to send you an external ID and I want to get back the account for that external Id*/
		String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
		Account result = [SELECT Id,Name,Phone,Website,BillingState FROM Account WHERE External_Id__c = :accountId];
		return result;
	}

}