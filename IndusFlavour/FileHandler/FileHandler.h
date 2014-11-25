//
//  FileHandler.h
//  Handler
//
//  Created by Weird Logics4 on 6/18/13.
//  Copyright (c) 2013 Weird Logics4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileConstants.h"
#import "FileMacros.h"
@interface FileHandler : NSObject


/*
 @desc    :- GETTING ANY FOLDER CONTENT/OR FILES OF ANY TYPE FROM BUNDLE OF APP
 @param 1 :- folder name as a string
 @param 2 :- file type as string
*/
+(NSMutableArray*)getContentOfFolder:(NSString*)folderName fileType:(NSString*)fileType;

/*
 @desc    :- Get content of file with specified file type
 @param 1 :- file name
 @param 2 :- file type as string
 */
+(id)getContentOfFile:(NSString*)fileName type:(NSString*)fileType;

/*
 @desc    :- Get image from bundle or cache with specified type of image
 @param 1 :- file name
 @param 2 :- file type as string
 */
+(id)getImage:(NSString*)fileName type:(NSString*)fileType;

/*
 @desc    :- Get path of file with specified name and type
 @param 1 :- file name
 @param 2 :- file type as string
 */
+(NSString*)getFilePathOfName:(NSString*)fileName type:(NSString*)fileType;


+(BOOL)copyFileIfNeededInFolder:(NSString*)folderName fileName:(NSString*)fileName fileType:(NSString*)fileType;

+(NSString*)writeFileToFileCache:(NSString*)fileContent fileName:(NSString*)fileName fileType:(NSString*)fileType;

+(NSString*)writeFileToFileCache:(NSString*)fileContent fileName:(NSString*)fileName;
@end
