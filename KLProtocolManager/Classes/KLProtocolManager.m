//
//  KLProtocolManager.m
//  KLProtocolManager
//
//  Created by Kevin on 2016/12/29.
//  Copyright © 2016年 KevinLab. All rights reserved.
//

#import "KLProtocolManager.h"

@interface KLProtocolManager ()

@property (strong, nonatomic) NSMutableDictionary *serviceProviderSource;

@end

@implementation KLProtocolManager

+ (KLProtocolManager *)sharedInstance
{
    static KLProtocolManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.serviceProviderSource = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (void)registerServiceProvider:(id)provider forProtocol:(Protocol *)protocol
{
    if (provider == nil || protocol == nil) {
        return;
    }
    [[self sharedInstance].serviceProviderSource setObject:provider forKeyedSubscript:NSStringFromProtocol(protocol)];
}

+ (id)serviceProviderForProtocol:(Protocol *)protocol
{
    return [[self sharedInstance].serviceProviderSource objectForKey:NSStringFromProtocol(protocol)];
}

@end
