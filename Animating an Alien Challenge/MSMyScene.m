//
//  MSMyScene.m
//  Animating an Alien Challenge
//
//  Created by Miguel Serrano on 29/06/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import "MSMyScene.h"
#import "MSAlien.h"

@interface MSMyScene ()

@property (strong, nonatomic) MSAlien *alien;

@end

@implementation MSMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        self.alien = [[MSAlien alloc] init];
        self.alien.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
        
        [self addChild:self.alien];
    
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        [self.alien changeAnimation];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
