//
//  XMLModelHandler.h
//  WowTasty
//
//  Created by Weird Logics4 on 4/25/13.
//  Copyright (c) 2013 weird logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <libxml/HTMLparser.h>
#import "CeasyXML.h"

@interface XMLModelHandler : NSObject

//SHARED METHOD//
+(XMLModelHandler*)shared;

/**
 @desc: - generating custom class object on the basis of classs type given as parameter
 @param :- xml string
 @param :- name of class
 **/
+(id)getObjectFromXML:(NSString*)layoutFile libraryFile:(NSString*)libraryFile classType:(Class)class;

/**
 @desc:- GET DATA IN FORM OF NSString/NSData Format by passing the class name as parameter
 @param :- custom model object
 @param :- name of class
 **/
+(id)getXMLDataFromModel:(id)modelObject ofType:(Class)class;

//+(id)getModelFromXMLStringAndInsertDataInDB:(Class)class;

//Get Model Data from XML Data. 
+(id)getModelOfClass:(Class)class  fromData:(NSData *)xdata;
@end
