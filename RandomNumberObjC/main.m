//
//  main.m
//  RandomNumberObjC
//
//  Created by John Carson on 8/15/16.
//  Copyright © 2016 John Carson. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL runGame();
BOOL askForReplay();

int main(int argc, const char * argv[]) {
    BOOL userWantsToPlay = YES;
    
    while (userWantsToPlay) {
        userWantsToPlay = runGame();
    }
    
    NSLog(@"Thanks for playing!");
}

BOOL runGame() {
    int number, guess;
    
    int numberOfItemsScanned = -1;
    int randomNumber = arc4random_uniform(5);
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
        
        while (numberOfItemsScanned != 1 || (guess < 1) || (guess > 5)) {
            fpurge(stdin);
            numberOfItemsScanned = scanf("%i", &guess);
            if (numberOfItemsScanned != 1 || (guess < 1) || (guess > 5)) {
                NSLog(@"That's not a number! Try one of these! %@\n", array);
                numberOfItemsScanned = 0;
            }
            
        }
        NSLog (@"You chose %i.", guess);
        
        if (guess > randomNumber) {
            NSLog(@"You guessed too high! Try again!");
        } else if (guess < randomNumber) {
            NSLog(@"You guessed too low! Try again!");
        }
        
        numberOfItemsScanned = 0;
    }
    
    NSLog(@"Conglaturation ! ! ! !");
    return askForReplay();
}

BOOL askForReplay() {
    int numberOfItemsScanned = 0;
    int wantsReplay = -1;
    
    while (numberOfItemsScanned != 1 || (wantsReplay < 0) || (wantsReplay > 1)) {
        NSLog(@"Would you like to play again?\n");
        NSLog(@"Yes: 1\n");
        NSLog(@"No : 0\n");
        fpurge(stdin);
        
        numberOfItemsScanned = scanf("%i", &wantsReplay);
        
        if (numberOfItemsScanned != 1 || (wantsReplay < 0) || (wantsReplay > 1)) {
            numberOfItemsScanned = 0;
        }
    }
    
    return wantsReplay == 1;
}

