public class postManRestCallout {
    @Future(callout=true)
    public static void testCallout(){
        String endPoint='https://postman-echo.com/get?foo1=bar1&foo2=bar2';
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPoint);        
        req.setMethod('GET');
        
        req.setHeader('content-type', 'application/json; charset-UTF-8');
        req.setHeader('Accept', 'application/json');
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            System.debug('res__--===>>'+res);
        }
    }   
}