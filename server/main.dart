import 'dart:io';
import 'dart:convert';

main() {
  HttpServer.bind('127.0.0.1', 8080).then((server) {
      server.listen((HttpRequest request) {
        String requestURL = request.uri.toString();
        
        print("Request for  $requestURL");
        
        
        switch (requestURL) {
          case '/':
            topTenUsers(request, request.response);
            break;
          default:
            err404(request, request.response);
            break;
            
        }

        
      });
  });
}

void topTenUsers(var req, var res){
  
}

void err404(var req, var res){
  
//  Return JSON like so: {error:{number:404,description:"Endpoint not found"}}
  Map data = {};
  data['error'] = generateError(404, "Endpoint not found");
  
  
  
  res.write(JSON.encode(data));
  res.close();
}

generateError(num, description) => r'{number:' + num.toString() + r', description:\"' + description + r'\"}';