//
//  CommonURLFetch.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 5/9/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "CommonURLFetch.h"
#import "CommonStyle.h"

@implementation CommonURLFetch

-(void)getGreetifyTemplate :(void (^)(NSMutableArray *array, NSError *error3))block
{

    //bool result = false;
   // CommonStyle *common = [[CommonStyle alloc]init];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *post = [NSString stringWithFormat:@"%@getdata",[CommonStyle jsonURL]];
    [request setURL:[NSURL URLWithString:post]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        NSError *error1;
        NSMutableArray *ax = [[NSMutableArray alloc]init];

        
        if (error != nil) {
            
            error1 = error;
        }
        else
        {
            //NSLog(@"dataAsString %@", [NSString stringWithUTF8String:[data bytes]]);
            
            NSMutableDictionary *innerJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            /*
             Alert message for template data if not available for download.
             */
            if (innerJson != NULL)
            {
                
                
                NSLog(@"innerJson %@", innerJson);
                
                
                for (NSDictionary *dataDict in innerJson)
                {
                    NSString *backroundImage = [dataDict objectForKey:@"BackroundImage"];
                    NSString *createdBy = [dataDict objectForKey:@"CreatedBy"];
                    NSString *dateCreated = [dataDict objectForKey:@"DateCreated"];
                    NSString *dateModified = [dataDict objectForKey:@"DateModified"];
                    NSString *modifiedBy = [dataDict objectForKey:@"ModifiedBy"];
                    NSString *templateContent = [dataDict objectForKey:@"TemplateContent"];
                    NSString *templateID = [dataDict objectForKey:@"TemplateID"];
                    NSString *templateTitle = [dataDict objectForKey:@"TemplateTitle"];
                    
                    NSDictionary *dictionary;
                    
                    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                  backroundImage, @"BackroundImage",
                                  createdBy, @"CreatedBy",
                                  dateCreated, @"DateCreated",
                                  dateModified, @"DateModified",
                                  modifiedBy, @"ModifiedBy",
                                  templateContent, @"TemplateContent",
                                  templateID, @"TemplateID",
                                  templateTitle, @"TemplateTitle", nil];
                    [ax addObject:dictionary];
                }
                
            }
            
            
        }
        
       
        block(ax,error1);
        // Call back the block passed into your method
        }];
    
}

@end
