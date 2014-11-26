

#import "NetworkResourcer.h"

#import "AsyncRequest.h"
#import "XMLModelHandler.h"
#import "Initializer.h"
#import "AsyncRequestHelper.h"
#import "Constants.h"

@implementation NetworkResourcer

@synthesize httpResponseCode;
@synthesize downloadedData;
@synthesize responseType;
@synthesize responseError;
@synthesize uniqueResourceId;
@synthesize delegate;
@synthesize isRequestSend;
@synthesize responseText;


#pragma mark ---
#pragma mark ---NetworkResourcer util methods--

-(id)init{
    self = [super init];
    if (self) {
        self.isRequestSend = NO;
    }
    return self;
}

+(NSMutableDictionary *)getHeader{
    NSMutableDictionary *header = [[NSMutableDictionary alloc] init];
    [header setObject:[Initializer apiKey] forKey:API_KEY];
    return header;
}

+ (NSString *)encodeURLComponent:(NSString *)string
{
    NSString *s = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}



+(NetworkResponse *)sendSyncRequestWithType:(NSString *)requestType urlString:(NSString *)urlString object:(id)object responseType:(Class)resType header:(NSMutableDictionary *)headers {
    
    BOOL isSuccessful = NO;
    id responseObject = nil;
    NSData *responseData = nil;
    NSUInteger statusCode = 0;
    NSString *statusMsg = nil;
    NSError *error = nil;
    
    if ([NetworkMessanger isNetworkConnectionFound]) {
        
        NSString *xmlString = [XMLModelHandler getXMLDataFromModel:object ofType:[NSString class]];
        NSLog(@"xmlString To be post %@",xmlString);
        NSData *postData = [xmlString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO];
        NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
        NSString *serverHost = [Initializer serverHost];
        urlString = [NSString stringWithFormat:@"http://%@/%@",serverHost,urlString];
        NSLog(@"urlString %@",urlString);
        NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:encodedString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                           timeoutInterval:kMKNetworkKitRequestTimeOutInSeconds];
        if (requestType) {
            [request setHTTPMethod:requestType];
        }else
            [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        for (NSString *key in [headers allKeys]) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
        
        NSError *e = nil;
        NSHTTPURLResponse *x = nil;
        responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&x error:&e];
        
        
        
        NSLog(@"responseData %@ ",[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
        
        NSLog(@"%s eorrr: %@",__FUNCTION__,e);
        
        if (x) {
            
            NSLog(@" Resposes %d",x.statusCode);
            statusCode = x.statusCode;
            
            if (statusCode >= 200  && statusCode <= 300 ) {
                statusMsg = [NSHTTPURLResponse localizedStringForStatusCode:x.statusCode];
                isSuccessful = YES;
                if (resType) {
                    responseObject = [XMLModelHandler getModelOfClass:[resType class] fromData:responseData];
                }
            }else {
                isSuccessful = NO;
                error = [NetworkMessanger errorForResponseCode:statusCode];
                statusMsg =  [NetworkMessanger errorMessageResponseCode:statusCode];
                NSLog(@"Error : %@ response Code %d ",statusMsg,x.statusCode);
            }
        }else {
            //Error form server ---
            error = e;
        }
    }
    else {
        //No network error ----
        NSLog(@"No Internet connection ");
        statusMsg =  [NetworkMessanger errorMessageResponseCode:1000];
        error = [self noNetworkConnectionFound];
    }
    
    NetworkResponse *result = [[NetworkResponse alloc] init];
    result.statusCode = statusCode;
    result.response = responseData;
    result.statusMsg = statusMsg;
    result.statusCode = statusCode;
    result.isSuccessful = isSuccessful;
    result.responseObject = responseObject;
    result.error = error;
    
    return result;
    
}

-(BOOL)createRequestUrl:(NSString *)urlString  object:(id)object responseType:(id)resType callBackController:(id)target  requestId:(NSString *)requestKey header:(NSMutableDictionary *)header{
    
    self.responseType = resType;
    if (header == nil) {
        header = [NetworkResourcer getHeader];
    }
    NSString *contentType = @"application/xml";
    NSString *xmlString = [XMLModelHandler getXMLDataFromModel:object ofType:[NSString class]];
    NSLog(@"xmlString To be post %@",xmlString);
    
    
    AsyncRequestHelper *asyncHelper = [[AsyncRequestHelper alloc] initWithHostName:[Initializer serverHost] apiPath:nil customHeaderFields:header withCallBack:(id)self];
    
    [asyncHelper createResourceFromURL:urlString responseType:self.responseType contentText:xmlString contentType:contentType uniqueResourceId:requestKey callBack:(id)self];
    
    self.isRequestSend = YES;
    return self.isRequestSend;
}


+(NetworkResponse *)sendSyncGetRequest:(NSString *)urlString andParams:(NSDictionary *)queryParam  responseType:(Class)resType header:(NSMutableDictionary *)headers{
    
    BOOL isSuccessful = NO;
    id responseObject = nil;
    NSData *responseData = nil;
    NSUInteger statusCode = 0;
    NSString *statusMsg = nil;
    NSError *error = nil;
    
    if ([NetworkMessanger isNetworkConnectionFound]) {
        
        NSString *serverHost = [Initializer serverHost];
        urlString = [NSString stringWithFormat:@"http://%@/%@",serverHost,urlString];
        NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@"urlString %@",encodedString);
        
        NSURL *url = [NSURL URLWithString:encodedString];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url                                                               cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:kMKNetworkKitRequestTimeOutInSeconds];
        [request setHTTPMethod:@"GET"];
        
        for (NSString *key in [headers allKeys]) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
        
        NSError *e = nil;
        NSHTTPURLResponse *x = nil;
        responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&x error:&e];
        //TODO: errorful response coming too late
        NSLog(@"eorrr: %@",e);
        
        if (x) {
            
            NSLog(@" Resposes Code %d",x.statusCode);
            
            statusCode = x.statusCode;
            
            if (statusCode >= 200  && statusCode <= 300 ) {
                statusMsg = [NSHTTPURLResponse localizedStringForStatusCode:x.statusCode];
                isSuccessful = YES;
                if (resType) {
                    responseObject = [XMLModelHandler getModelOfClass:resType fromData:responseData];
                }
            }else {
                statusMsg =  [NetworkMessanger errorMessageResponseCode:statusCode];
                error = [NetworkMessanger errorForResponseCode:statusCode];
                NSLog(@"Error : %@ response Code %d ",statusMsg,x.statusCode);
            }
        }else {
            //Error form server ---
            error = e;
        }
    }
    else {
        //No network error ----
        NSLog(@"No Network Connection");
        statusMsg =  [NetworkMessanger errorMessageResponseCode:1000];
        error = [self noNetworkConnectionFound];
    }
    NetworkResponse *result = [[NetworkResponse alloc] init];
    result.statusCode = statusCode;
    result.response = responseData;
    result.statusMsg = statusMsg;
    result.statusCode = statusCode;
    result.isSuccessful = isSuccessful;
    result.responseObject = responseObject;
    result.error = error;
    
    return result;
}



-(BOOL )addAsyncGetRequestUrl:(NSString *)urlString andParams:(NSDictionary *)queryParam  responseType:(Class)resType header:(NSMutableDictionary *)headers{
    
    if ([NetworkMessanger isNetworkConnectionFound]) {
        
        self.responseType = resType;
        NSMutableDictionary *header = [[self class] getHeader];
        NSString *encodedString = [[self class] encodeURLComponent:urlString];
        NSString *serverHost = [Initializer serverHost];
        AsyncRequest *asyncHelper = [[AsyncRequest alloc] initWithHostName:serverHost apiPath:nil customHeaderFields:header withCallBack:(id)self];
        [asyncHelper getResourceFromURL:encodedString queryStringParams:nil responseType:resType uniqueResourceId:nil];
        self.isRequestSend = YES;
    }else {
        //Create Error and send the no network exception ----
        [self noNetworkConnectionFound];
    }
    return self.isRequestSend;
}


-(BOOL)addAsyncCreateRequestUrl:(NSString *)urlString  object:(id)object responseType:(id)resType callBackController:(id)target  requestId:(NSString *)requestKey header:(NSMutableDictionary *)header{
    
    if ([NetworkMessanger isNetworkConnectionFound]) {
        
        self.responseType = resType;
        if (header == nil) {
            header = [NetworkResourcer getHeader];
        }
        NSString *contentType = @"application/xml";
        NSString *serverHost = [Initializer serverHost];
        
        NSString *xmlString = [XMLModelHandler getXMLDataFromModel:object ofType:[NSString class]];
        NSLog(@"xmlString To be post %@",xmlString);
        
        AsyncRequest *asyncHelper = [[AsyncRequest alloc] initWithHostName:serverHost apiPath:nil customHeaderFields:header withCallBack:(id)self];
        [asyncHelper createResourceFromURL:urlString responseType:self.responseType contentText:xmlString contentType:contentType uniqueResourceId:requestKey callBack:(id)self];
        
        self.isRequestSend = YES;
    }else {
        //Create Error and send the no network exception ----
        [self noNetworkConnectionFound];
    }
    return self.isRequestSend;
}

-(BOOL)addAsyncUpdateRequestUrl:(NSString *)urlString  object:(id)object responseType:(id)resType callBackController:(id)target  requestId:(NSString *)requestKey header:(NSMutableDictionary *)header{
    
    if ([NetworkMessanger isNetworkConnectionFound]) {
        self.isRequestSend = YES;
        
        self.responseType = resType;
        if (header == nil) {
            header = [NetworkResourcer getHeader];
        }
        
        NSString *serverHost = [Initializer serverHost];
        
        NSString *contentType = @"application/xml";
        NSString *xmlString = [XMLModelHandler getXMLDataFromModel:object ofType:[NSString class]];
        NSLog(@"xmlString To be post %@",xmlString);
        
        AsyncRequest *asyncHelper = [[AsyncRequest alloc] initWithHostName:serverHost apiPath:nil customHeaderFields:header withCallBack:(id)self];
        [asyncHelper updateResourceFromURL:urlString responseType:self.responseType contentText:xmlString contentType:contentType uniqueResourceId:requestKey callBack:(id)self httpMethod:@"PUT"];
    }else {
        //Create Error and send the no network exception ----
        [self noNetworkConnectionFound];
    }
    return self.isRequestSend;
}


//Create Error and send the no network exception ----
+(NSError *)noNetworkConnectionFound{
    NSError *error  = [NetworkMessanger errorWithName:@"No Network Connection" andDescription:@"Please try later"];
    return error;
}

-(void)noNetworkConnectionFound{
    NSError *error  = [NetworkMessanger errorWithName:@"No Network Connection" andDescription:@"Please try later"];
    [self requestFailedWithError:error];
}


//Request failed befroe sending to server
-(void)requestFailedWithError:(NSError *)error {
    
    NSLog(@"Request Failed before sending to server  %@",error);
    
    self.responseError = error;
    if ([self.delegate respondsToSelector:@selector(requestFailed:)]) {
        [self.delegate requestFailed:self];
    }
}


#pragma mark ---
#pragma mark ---AsyncRequestHelper Delegate Imimentation here.....

/*
 Request Completed with response data and response code.
 */
-(void)asynRequestCompleted:(AsyncRequest *)asyncHelper withResponseData:(NSString *)string responseType:(id)resType responseCode:(NSInteger)responseCode uniqueResourceId:(NSString *)uri{
    
    
    self.uniqueResourceId = uri;
    self.httpResponseCode = responseCode;
    // response Type will be only used when we need to parse the server details to specific CustomData Type ---
    if (resType != nil && string.length > 0) {
        NSData *responseData = [string dataUsingEncoding:NSUTF8StringEncoding];
        self.downloadedData = [XMLModelHandler getModelOfClass:[self.responseType class] fromData:responseData];
    }else {
        self.downloadedData = string;
    }
    if ([self.delegate respondsToSelector:@selector(requestCompletedWith:)]) {
        [self.delegate requestCompletedWith:self];
    }
}

/*
 Request Failed with error and request id.
 */
-(void)asynRequestFailed:(AsyncRequest *)asyncHelper withError:(NSError *)error uniqueResourceId:(NSString *)uri responseCode:(NSInteger)responseCode{
    
    NSError *resError = [NetworkMessanger errorForResponseCode:responseCode];
    
    NSLog(@"asyn Request Failed %@",resError);
    
    
    self.uniqueResourceId = uri;
    self.httpResponseCode = responseCode;
    self.responseError = resError;
    self.responseText = [NetworkMessanger errorMessageResponseCode:responseCode];
    if ([self.delegate respondsToSelector:@selector(requestFailed:)]) {
        [self.delegate requestFailed:self];
    }
}


@end
