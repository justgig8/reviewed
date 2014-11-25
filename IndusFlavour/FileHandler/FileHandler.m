//
//  FileHandler.m
//  Handler
//
//  Created by Weird Logics4 on 6/18/13.
//  Copyright (c) 2013 Weird Logics4. All rights reserved.
//

#import "FileHandler.h"
@implementation FileHandler
/*
 @desc    :- Get content of file with specified file type
 @param 1 :- file name
 @param 2 :- file type as string
 */
+(id)getContentOfFile:(NSString*)fileName type:(NSString*)fileType{

    NSString *filePath = [FileHandler getFilePathOfName:fileName type:fileType];
    
    NSError *error = nil;
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSString *fileError = [NSString stringWithFormat:STRING_FORMAT_MESSAGE_1,FILE_READ_ERROR,[error localizedDescription]];
        NSLog(NSLOG_FORMAT_1,fileError);
    }
    return fileContent;
}

/*
 @desc    :- Get image from bundle or cache with specified type of image
 @param 1 :- file name
 @param 2 :- file type as string
 */
+(UIImage*)getImage:(NSString*)fileName type:(NSString*)fileType{
    
    NSString *imageFilePath = [FileHandler getFilePathOfName:fileName];
    UIImage *image = nil;
    if (imageFilePath) {
        image = [UIImage imageWithContentsOfFile:imageFilePath];
        return image;
    }else{
        NSLog(NSLOG_FORMAT_1,FILE_NOT_FOUND);
    }
    return nil;
}

/*
 @desc    :- Get path to folder name in apps cache dir
 @param   :- folder name as string
 */
+(NSString*)getFilePathOfName:(NSString*)fileName{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:FILE_TYPE_PNG];
    if (!filePath) { //IF NOT PRESENT IN BUNDLE CHECKING IN CACHE DIR OF APP//
        NSString *cacheDirPath = nil;
        cacheDirPath = [[FileHandler fileCacheDirPath:FILE_CACHE_DIR] stringByAppendingPathComponent:fileName];
        filePath = cacheDirPath;
        if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            filePath = cacheDirPath;
        }
    }
    return filePath;
}

/*
 @desc    :- Get path to folder name in apps cache dir
 @param   :- folder name as string
 */
+(NSString*)getFilePathOfName:(NSString*)fileName type:(NSString*)fileType{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    if (!filePath) { //IF NOT PRESENT IN BUNDLE CHECKING IN CACHE DIR OF APP//
        NSString *cacheDirPath = nil;
        cacheDirPath = [[FileHandler fileCacheDirPath:FILE_CACHE_DIR] stringByAppendingFormat:STRING_FORMAT_3,fileName,fileType];
        filePath = cacheDirPath;
        if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            filePath = cacheDirPath;
        }
    }
    return filePath;
}

/*
 @desc    :- Get path to folder name in apps cache dir
 @param   :- folder name as string 
 */
+(NSString*)fileCacheDirPath:(NSString*)withFolderName{
    
    // create IMAGE CACHE dir if there is none
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *cacheDirectory = [paths objectAtIndex:0]; // Get cache folder
    NSString *fileDirPath = [[NSString alloc] initWithFormat:withFolderName, cacheDirectory];
    
	if (![[NSFileManager defaultManager] createDirectoryAtPath:fileDirPath withIntermediateDirectories:NO attributes:nil error:nil]) {
	}
    return fileDirPath;
}

/*
 @desc    :- GETTING ANY FOLDER CONTENT/OR FILES OF ANY TYPE FROM BUNDLE OF APP
 @param 1 :- folder name as a string
 @param 2 :- file type as string
 */
+(NSMutableArray*)getContentOfFolder:(NSString*)folderName fileType:(NSString*)fileType{
    
    NSMutableArray  *filesArray;
    filesArray = (NSMutableArray*)[[NSBundle mainBundle] pathsForResourcesOfType:fileType inDirectory:folderName];
    return filesArray;
}

/*
 @desc    :- Copying file into desired location if not present on that location
 @param 1 :- folder name as a string
 @param 2 :- file name as string
 @param 3 :- file type as string
 */
+(BOOL)copyFileIfNeededInFolder:(NSString*)folderName fileName:(NSString*)fileName fileType:(NSString*)fileType{
    
	NSString *filePath = [FileHandler fileCacheDirPath:folderName];
    filePath = [filePath stringByAppendingFormat:STRING_FORMAT_3,fileName,fileType];

	//get an shared object of NSFileManager class
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error = nil;
	
	//check if file is exist at a given path
	BOOL success = [fileManager fileExistsAtPath:filePath];
	
	//if file is not exist at a given path then store the database to the given path
	if(!success){
        
		NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
		NSLog(@"DEFAULT PATH : %@",defaultDBPath);
        
		success = [fileManager copyItemAtPath:defaultDBPath toPath:filePath error:&error];
		if (!success){
			NSLog(FILE_COPY_ERROR,[error description]);
		}
		else {
			NSLog(NSLOG_FORMAT_1,FILE_COPY_SUCCESS);
		}
	}
    return success;
}


+(NSString*)writeFileToFileCache:(NSString*)fileContent fileName:(NSString*)fileName fileType:(NSString*)fileType{
    
    NSError *error;
    NSString *cacheDirPath = [FileHandler fileCacheDirPath:FILE_CACHE_DIR];
    cacheDirPath = [cacheDirPath stringByAppendingFormat:STRING_FORMAT_3,fileName,fileType];
    [fileContent writeToFile:cacheDirPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    return fileContent;
}

+(NSString*)writeFileToFileCache:(NSString*)fileContent fileName:(NSString*)fileName{
    
    NSError *error;
    NSString *cacheDirPath = [FileHandler fileCacheDirPath:FILE_CACHE_DIR];
    cacheDirPath = [cacheDirPath stringByAppendingPathComponent:fileName];
    [fileContent writeToFile:cacheDirPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    return fileContent;
}

@end
