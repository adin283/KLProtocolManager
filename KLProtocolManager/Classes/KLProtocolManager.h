//
//  KLProtocolManager.h
//  KLProtocolManager
//
//  Created by Kevin on 2016/12/29.
//  Copyright © 2016年 KevinLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLProtocolManager : NSObject

+ (void)registerServiceProvider:(id)provider forProtocol:(Protocol *)protocol;
+ (id)serviceProviderForProtocol:(Protocol *)protocol;

@end
