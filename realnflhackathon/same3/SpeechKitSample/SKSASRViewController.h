//
//  ViewController.h
//  handStuff
//
//  Created by Kevin Fang on 2/12/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpeechKit/SKTransaction.h>
//#import <OpenEars/OEFliteController.h>
//#import <Slt/Slt.h>
//#import <OpenEars/OEEventsObserver.h>


@interface SKSASRViewController : UITableViewController<UITextFieldDelegate>

// User interface
@property (weak, nonatomic) IBOutlet UITextView *logTextView;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *recognitionTypeSegmentControl;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *endpointerTypeSegmentControl;

// Settings
//@property (strong, nonatomic) OEFliteController *fliteController;
//@property (strong, nonatomic) Slt *slt;
//@property (strong, nonatomic) OEEventsObserver *openEarsEventsObserver;

@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *recognitionType;
@property (assign, nonatomic) SKTransactionEndOfSpeechDetection endpointer;

@end