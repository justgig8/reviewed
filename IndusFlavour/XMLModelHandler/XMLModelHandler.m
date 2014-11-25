//
//  XMLModelHandler.m
//  WowTasty
//
//  Created by Weird Logics4 on 4/25/13.
//  Copyright (c) 2013 weird logics. All rights reserved.
//

#import "XMLModelHandler.h"


@interface XMLModelHandler()

@end

@implementation XMLModelHandler


+(NSString*)getFilePathFromBundle:(NSString*)fileName ofType:(NSString*)type{
    
    NSString *layoutFilePath = nil;
    layoutFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    return layoutFilePath;
}

+(id)getModelOfClass:(Class)class  fromData:(NSData *)xdata {
    
    NSString *layoutFilePath = [XMLModelHandler getFilePathFromBundle:[NSString stringWithFormat:@"%@_Layout",[class description]] ofType:@"xml"];
  
    NSLog(@"LAYOUT FILE : %@",layoutFilePath);
    
    CSXXMLParser *parser;
    parser = [[CSXXMLParser alloc] initWithLayoutListDocument:layoutFilePath
                                                        error:NULL];
    parser.data = xdata;
    BOOL success = [parser parse];
    if(!success) {
        NSLog(@"Parser error: %@ (%@)", parser.error,
              [parser.error localizedRecoverySuggestion]);
        return nil;
    }
    return parser.result;
}

/**
 @desc: - shared instance for class so, that it can only instantiated only one time
 **/
+(XMLModelHandler*)shared{
    
    static XMLModelHandler *model = nil;
    if (model == nil) {
        model = [[XMLModelHandler alloc] init];
    }
    return model;
}

/**
 @desc: - generating custom class object on the basis of classs type given as parameter
 @param :- xml string
 @param :- name of class
 **/
+(id)getObjectFromXML:(NSString*)layoutFile libraryFile:(NSString*)xmlFilePath classType:(Class)class {
    
   NSLog(@"XML FILE PATH : %@",xmlFilePath);
   NSLog(@"LAYOUT FILE PATH : %@",layoutFile);
   
    CSXXMLParser *parser;
    parser = [[CSXXMLParser alloc] initWithLayoutListDocument:layoutFile
                                                        error:NULL];
    
    NSLog(@"PARSER DOCUMENT : %@",parser.documentLayouts);
    
    NSLog(@"PARSER RESULT : %@",[parser.documentLayouts class]);
    
    if(parser == nil) {
       NSLog(@"Failed to create XML parser.");
    }
    
    parser.file = xmlFilePath;
    BOOL success = [parser parse];
    if(!success) {
        NSLog(@"Parser error: %@ (%@)", parser.error,
              [parser.error localizedRecoverySuggestion]);
        return nil;
    }
  
    return parser.result;
    
}

/**
 @desc:- GET DATA IN FORM OF NSString/NSData Format by passing the class name as parameter
 @param :- custom model object
 @param :- name of class
 **/
+(id)getXMLDataFromModel:(id)modelObject ofType:(Class)class{
    
    id returnResponse  = nil;
    @try {
        NSError *err;
        NSString *fileName = [NSString stringWithFormat:@"%@_Layout",[[modelObject class] description]];
        
        NSString *layoutFile = [XMLModelHandler getFilePathFromBundle:fileName ofType:@"xml"];
        NSLog(@"FILE layoutFile : %@",layoutFile);
        NSLog(@"FILE layoutFile : %@",[modelObject class]);
        CSXXMLParser *parser;
        parser = [[CSXXMLParser alloc] initWithLayoutListDocument:layoutFile
                                                            error:NULL];
        
        NSLog(@"PARSER DOCUMENT : %@",parser.documentLayouts);
        CSXXMLWriter *writer;
        
        writer = [[CSXXMLWriter alloc] initWithDocumentLayout:
                  [parser.documentLayouts objectAtIndex:0]];
        assert(writer != nil);
        
        writer.XMLVersion = @"1.0";
        writer.encoding = @"UTF-8";
        
        writer.rootInstance = modelObject;
        
        NSData *myData;
        myData = [writer XMLDataWithError:&err];
        
        
        if(!myData) {
            NSLog(@"Write error: %@", err);
            return nil;
        }
        if ([[class description] isEqualToString:@"NSData"]) {
            returnResponse = myData;
        }else if ([[class description] isEqualToString:@"NSString"]){
            returnResponse = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
        }
        NSLog(@"XML STRING FROM DATA: %@", returnResponse);
    }
    @catch (NSException *exception) {
        NSLog(@"EXCEPTION : %@",[exception debugDescription]);
    }
    @finally {
        return returnResponse;
    }
}

+(id)getJSONFromModel:(id)modelObject{
    
    NSString *jsonString = nil;
    
    return jsonString;
}


@end
