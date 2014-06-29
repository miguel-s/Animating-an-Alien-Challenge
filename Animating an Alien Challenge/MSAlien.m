//
//  MSAlien.m
//  Animating an Alien Challenge
//
//  Created by Miguel Serrano on 29/06/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import "MSAlien.h"

@interface MSAlien ()

@property (strong, nonatomic) NSMutableArray *alienAnimations;

@end

@implementation MSAlien
{
    int _currentAnimation;
}

static const uint32_t kMSWalkingAnimation   = 0;
static const uint32_t kMSClimbingAnimation  = 1;

- (instancetype)init
{
    self = [super initWithImageNamed:@"alienGreen_walk1@2x"];
    if (self) {
        _alienAnimations = [[NSMutableArray alloc] init];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AlienAnimations" ofType:@"plist"];
        NSDictionary *animations = [NSDictionary dictionaryWithContentsOfFile:path];
        for (NSString *key in animations) {
            [self.alienAnimations addObject:[self animationFromArray:[animations objectForKey:key] withDuration:0.4]];
        }
        _currentAnimation = kMSWalkingAnimation;
        [self runAction:self.alienAnimations[_currentAnimation]];
    }
    return self;
}

- (SKAction*)animationFromArray:(NSArray*)textureNames withDuration:(CGFloat)duration {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    SKTextureAtlas *alienAtlas = [SKTextureAtlas atlasNamed:@"Alien"];
    
    for (NSString *textureName in textureNames) {
        [frames addObject:[alienAtlas textureNamed:textureName]];
    }
    
    CGFloat frameTime = duration / (CGFloat)frames.count;
    
    return [SKAction repeatActionForever:[SKAction animateWithTextures:frames timePerFrame:frameTime resize:NO restore:NO]];
}

- (void)changeAnimation {
    if (_currentAnimation == kMSWalkingAnimation) {
        _currentAnimation = kMSClimbingAnimation;
    } else {
        _currentAnimation = kMSWalkingAnimation;
    }
    [self runAction:self.alienAnimations[_currentAnimation]];
}

@end
