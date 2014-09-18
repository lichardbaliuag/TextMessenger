//
//  CommonURLFetch.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 5/9/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonURLFetch : NSObject

-(void)getGreetifyTemplate :(void (^)(NSMutableArray *array, NSError *error3))block;
@end
