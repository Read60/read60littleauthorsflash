import flash.events.Event;
import flash.events.ErrorEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;

	 class RestClient {
		private var requestor: URLLoader = new URLLoader();
		public function restServiceCall(): void {
			//Create the HTTP request object 
			var request: URLRequest = new URLRequest("http://service.example.com/");
			request.method = URLRequestMethod.GET;

			//Add the URL variables 
			var variables: URLVariables = new URLVariables();
			variables.method = "test.echo";
			variables.api_key = "123456ABC";
			variables.message = "Able was I, ere I saw Elba.";
			request.data = variables;

			//Initiate the transaction 
			requestor = new URLLoader();
			requestor.addEventListener(Event.COMPLETE, httpRequestComplete);
			requestor.addEventListener(IOErrorEvent.IOERROR, httpRequestError);
			requestor.addEventListener(SecurityErrorEvent.SECURITY_ERROR, httpRequestError);
			requestor.load(request);
		}
		private function httpRequestComplete(event: Event): void {
			trace(event.target.data);
		}

		private function httpRequestError(error: ErrorEvent): void {
			trace("An error occured: " + error.message);
		}
	}
