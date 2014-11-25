//
//  MenuHandler.m
//  MenuFresh
//
//  Created by Apple on 08/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "MenuHandler.h"
#import "Initializer.h"
#import "XMLModelHandler.h"
#import "Menu.h"
#import "Section.h"
#import "Categorie.h"
#import "Subcategory.h"
#import "Item.h"


NSString * const FILE_TYPE_XML    = @"xml";
@implementation MenuHandler

@synthesize merchantMenuMap;

static MenuHandler *menuHandler;

+(MenuHandler *) setup{
    
    if (menuHandler) {
        return menuHandler;
    }
    
    if (!menuHandler) {
        @synchronized([MenuHandler class]){
            if (!menuHandler) {
                menuHandler = [[MenuHandler alloc] init];
                [menuHandler setupLocal];
            }
        }
    }
    return menuHandler;
}

-(void) setupLocal{
    
    self.merchantMenuMap = [[NSMutableDictionary alloc] init];
}

/*
 *  1. All user initiated button clicks for menu will call this function with isUpdatedMenuToBeGiven=NO.
 *  2. Only timers who handle automatic update of menus, will call this function with isUpdatedMenuToBeGiven=YES.
 *  3. Please use this intelligent function wisely.
 */
+(Menu *) getMenu: (NSString *)merchantName andIsUpdated: (BOOL)isUpdatedMenuToBeGiven{
    
    Menu *menu;
    //NSLog(@"[Tester getMenu] : %@",[Tester getMenu]);
    
  
        NSString *existingVersion=@"0";
        menu = [[menuHandler merchantMenuMap] objectForKey:merchantName];
        bool isFetchMenu=NO;
        if (menu) {
            if (isUpdatedMenuToBeGiven) {
                isFetchMenu = YES;
                //existingVersion = menu.version;
            }else{
                NSLog(@"returning menu from existing map without any version checks.");
            }
        }else{
            isFetchMenu = YES;
        }
        
        if (isFetchMenu) {
            NSString *xml = [MenuHandler getMenuXml: merchantName andExistingVersion:existingVersion];
            
            menu = [MenuHandler convertIntoMenu: xml];
            [[menuHandler merchantMenuMap] setObject:menu forKey:merchantName];
        }

    
    //CREATING ITEM MAP IN SHARED MEMORY DATA//
 
    return menu;
}

+(Menu *) convertIntoMenu: (NSString *)xml{
    
    Menu *menu;
    
    NSData *data = [xml dataUsingEncoding:NSUTF8StringEncoding];
    menu = [XMLModelHandler getModelOfClass:[Menu class] fromData:data];
        
    return menu;
}

+(NSString *) getMenuXml: (NSString *)merchantName andExistingVersion: (NSString *)existingVersion{
    
    NSString *xml;
    NSLog(@"getting menu from server");
    
    NSLog(@"getting menu from server Host : %@ version: %@",[Initializer serverHost],existingVersion);
    
    xml = [self getMenuFromServer: [Initializer serverHost] withMerchant: merchantName versionNumber: existingVersion apiKey: [Initializer apiKey]];
    
    NSString *menuFile = [NSString stringWithFormat:@"%@menu.xml", merchantName];
    if (xml) {
        [self writeMenu: xml inFile: menuFile];
    }else{
       xml = [self getMenuFromFile:menuFile];
    }
      return xml;
}

//+(NSString *) menuVersionKey: (NSString *)merchantName{
//    
//    return [NSString stringWithFormat:@"%@.%@", KEY_MENU_VERSION, merchantName];
//}

+(NSString *)getMenuFromServer:(NSString *)hostName withMerchant:(NSString *)requestText versionNumber:(NSString *)versionNumber apiKey:(NSString *)apiKey{
    
    NSString *xml;
    
    if (!versionNumber) {
        versionNumber = @"0";
    }
   // http://182.50.154.218:28080/WL/admin/menu/get-named/Indus%20Flavour/Students?apikey=987462984
    
    NSString * urlString = [NSString stringWithFormat:@"http://%@/admin/menu/get-named/%@/Feedback",hostName,requestText];
    NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"URL STRING :%@",encodedString);
    
    NSURL *url = [NSURL URLWithString:encodedString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    [request setHTTPMethod:@"GET"];
    [request setValue:apiKey forHTTPHeaderField:@"apikey"];
    [request setValue:versionNumber forHTTPHeaderField:@"If-Modified-Since"];
    NSLog(@"Menu Request Url:%@",request);
    
    NSError *e = nil;
    NSHTTPURLResponse *x = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&x error:&e];
    
    if (x) {
        int statusCode = x.statusCode;
            NSLog(@"status code recevied: %d", statusCode);
        if (statusCode >= 200  && statusCode <= 300 ) {
                    NSString *statusMsg = [NSHTTPURLResponse localizedStringForStatusCode:x.statusCode];
                    NSLog(@"There is an updated menu that we have got. Status msg: %@", statusMsg);
            xml = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        }
    }
    
    return xml;
}

+(BOOL) writeMenu: (NSString *)xml inFile: (NSString *)fileName{
    NSData *data = [xml dataUsingEncoding:NSUTF8StringEncoding];
    NSString *filePath = [self getPathForMenu:fileName];
    return [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

+(NSString *) getMenuFromFile: (NSString *)fileName{
    NSString *xml;
    
    NSString *filePath = [self getPathForMenu:fileName];
   
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (data) {
        
        xml = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        fileName = [fileName stringByReplacingOccurrencesOfString:@".xml" withString:@""];
        filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:FILE_TYPE_XML];
        data = [NSData dataWithContentsOfFile:filePath];
        
        NSLog(@"data:%@",data);
        if (data) {
            xml = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return xml;
}

+(NSString *) getPathForMenu: (NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *cacheDirectory = [paths objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:fileName];
}

+(NSString *) getMenuFromDbWithMerchant:(NSString *)merchant{
    NSString *xml;
    return xml;
}


+(void)createItemMap:(Menu*)menu{
    NSLog(@"create map");
    for (Section *section in menu.list) {
        for (Categorie *category in section.list) {
            for (Subcategory *subCategory in category.list) {
                for (Item *item in subCategory.list) {
                    if (item.price == 0) {
                        item.price = @"5.0";
                    }
             [[MemoryData sharedMemoryData].itemMap setObject:item forKey:item.identifier];
                }
            }
        }
    }
}

@end
