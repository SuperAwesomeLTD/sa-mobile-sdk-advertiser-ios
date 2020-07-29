//
//  SAAdvUtils.m
//  Pods
//
//  Created by Gabriel Coman on 28/07/2017.
//
//

#import "SAAdvUtils.h"

#if defined(__has_include)
#if __has_include(<SuperAwesomeAdvertiser/SuperAwesomeAdvertiser-Swift.h>)
#import <SuperAwesomeAdvertiser/SuperAwesomeAdvertiser-Swift.h>
#else
#import "SuperAwesomeAdvertiser-Swift.h"
#endif
#endif

@implementation SAAdvUtils

+ (NSString*) getBundleId {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString*) getUserAgent {
    return SAADependencyContainer.shared.modules.componentModule.userAgent.name;
}

/**
 * This method takes a NSDictionary paramter and returns it as a valid
 * GET query string (e.g. a JSON { "name": "John", "age": 23 }
 * would become "name=John&age=23"
 *
 * @param dict  a NSDictionary object to be transformed into a
 *              GET query string
 * @return      a valid GET query string
 */
+ (NSString*) formGetQueryFromDict:(NSDictionary *)dict {
    NSMutableString *query = [[NSMutableString alloc] init];
    NSMutableArray *getParams = [[NSMutableArray alloc] init];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [getParams addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
    }];
    [query appendString:[getParams componentsJoinedByString:@"&"]];
    
    return query;
}

@end
