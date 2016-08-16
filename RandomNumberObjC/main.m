//
//  main.m
//  RandomNumberObjC
//
//  Created by John Carson on 8/15/16.
//  Copyright © 2016 John Carson. All rights reserved.
//

#import <Foundation/Foundation.h>



int main(int argc, const char * argv[]) {
    
    
    int number, guess;
    
    
    int randomNumber = arc4random_uniform(5);
    NSNumber *_number = @(randomNumber);
 
    number = arc4random_uniform(5);
    
    while (guess != randomNumber) {
        
        NSArray *array = @[
                           @"1",
                           @"2",
                           @"3",
                           @"4",
                           @"5"
                           ];
        
        NSLog(@"Can you guess which number from the following list that I am thinking of?: %@\n", array);
        scanf("%i", &guess);
        
        NSLog(@"Choose from the following: %@\n", array);
        
        NSLog (@"You chose %i.", guess);
        
        
        if (guess > randomNumber)
        {
            NSLog(@"You guessed too high! Try another!");
        }
        
               else if (guess < randomNumber)
        {
            NSLog(@"You guessed too low! Try another!");
        }
        if (guess == randomNumber)
        {
            
            NSLog(@"Conglaturation ! ! ! !", randomNumber);
        }
        
    }
    
    return 0;
}

