//
//  main.m
//  rating
//
//  Created by Jinah Adam on 10/4/15.
//  Copyright (c) 2015 Jinah Adam. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        @try {
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://walrusratings.herokuapp.com/%@.json", arguments[1]]]];
            NSMutableArray *jsonList = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary *jsonDictionary = (NSDictionary *)jsonList;
            
            printf("%.2f \n", [[jsonDictionary objectForKey:@"score"] doubleValue]);
        }
        @catch (NSException * e) {
           printf("Symbol not found\n");
        }
        @finally {
        }


    }
    return 0;
}
