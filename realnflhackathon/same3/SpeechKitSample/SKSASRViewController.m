//
//  ViewController.m
//  handStuff
//
//  Created by Kevin Fang on 2/12/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//
#import "SKSASRViewController.h"
#import "SKSConfiguration.h"
#import <AVFoundation/AVFoundation.h>
#import <SpeechKit/SpeechKit.h>
#import <Firebase/Firebase.h>

// State Logic: IDLE -> LISTENING -> PROCESSING -> repeat
enum {
    SKSIdle = 1,
    SKSListening = 2,
    SKSProcessing = 3
};
typedef NSUInteger SKSState;


@interface SKSASRViewController () <SKTransactionDelegate> {
    SKSession* _skSession;
    SKTransaction *_skTransaction;
    
    SKSState _state;
    
    __weak IBOutlet UITextField *weightTextField;
    __weak IBOutlet UITextField *heightTextField;
    __weak IBOutlet UITextField *positionGroupTextField;
    __weak IBOutlet UITextField *positionTextField;
    __weak IBOutlet UITextField *teamNameTextField;
    __weak IBOutlet UITextField *playerNameTextField;
    __weak IBOutlet UITextField *jerseyNumberTextField;
}

@end

@implementation SKSASRViewController{
    
}
//@synthesize toggleRecogButton = _toggleRecogButton;
@synthesize language = _language;
@synthesize recognitionType = _recognitionType;
@synthesize endpointer = _endpointer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)search:(id)sender {
    [self recognize];
//    [self log:nil];
    _logTextView.text = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Firebase *ref = [[Firebase alloc] initWithUrl: @"https://nflhackathonthingy.firebaseio.com"];
    
    
    //    self.fliteController = [[OEFliteController alloc] init];
    //    self.slt = [[Slt alloc] init];
    //    NSLog(@"running");
    //    [self.fliteController say:@"Hi, don't let your memes be dreams" withVoice:self.slt];
    
    _endpointer = SKTransactionEndOfSpeechDetectionLong;
    _recognitionType = SKTransactionSpeechTypeDictation;
    _endpointer = SKTransactionEndOfSpeechDetectionShort;
    _language = @"eng-USA";
    
    _state = SKSIdle;
    _skTransaction = nil;
    
    // Create a session
    _skSession = [[SKSession alloc] initWithURL:[NSURL URLWithString:SKSServerUrl] appToken:SKSAppKey];
    
    if (!_skSession) {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"SpeechKit"
                                                           message:@"Failed to initialize SpeechKit session."
                                                          delegate:nil cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil, nil];
        [alertView show];
    }
    
//    [self recognize];
    [self loadEarcons];
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - ASR Actions

- (void)recognize
{
    // Start listening to the user.
    //    [_toggleRecogButton setTitle:@"Stop" forState:UIControlStateNormal];
    //    [self.fliteController say:@"you didn't screw up up" withVoice:self.slt];
    
    _skTransaction = [_skSession recognizeWithType:SKTransactionSpeechTypeDictation
                                         detection:SKTransactionEndOfSpeechDetectionLong
                                          language:@"eng-USA"
                                          delegate:self];
}

- (void)stopRecording
{
    // Stop recording the user.
    
    [_skTransaction stopRecording];
    // Disable the button until we received notification that the transaction is completed.
}

- (void)cancel
{
    // Cancel the Reco transaction.
    // This will only cancel if we have not received a response from the server yet.
    //    [self.fliteController say:@"you screwed up" withVoice:self.slt];
    
    [_skTransaction cancel];
}

# pragma mark - SKTransactionDelegate

NSString *change;
- (void)transactionDidBeginRecording:(SKTransaction *)transaction
{
    [self log:@"Speak amazing one"];
    
    _state = SKSListening;
}

- (void)transactionDidFinishRecording:(SKTransaction *)transaction
{
    [self log:@"Processing"];
    
    
    
    _state = SKSProcessing;
    
}


//important one
- (void)transaction:(SKTransaction *)transaction didReceiveRecognition:(SKRecognition *)recognition
{
    [self log:[NSString stringWithFormat:@"You said: %@ \n", recognition.text]];
    [self log:[NSString stringWithFormat:@"if it's wrong just press it again"]];
    NSError *jsonError;
    NSData *objectData = [@"{\"2\":\"3\"}" dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    
    Firebase *ref = [[Firebase alloc] initWithUrl: @"https://nflhackathonthingy.firebaseio.com"];
    
    [ref observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        //        NSLog(@"%@ -> %@", snapshot.key, snapshot.value);
        //        if(recognition.text == snapshot.value[@"displayName"]){
        
//        [self log:[NSString stringWithFormat:@"%@",snapshot.value[@"position"]]];
//        [self log:[NSString stringWithFormat:@"%@",snapshot.value[@"jerseynumber"]]];
//        [self log:[NSString stringWithFormat:@"%@", snapshot.value[@"height"]]];
//        [self log:[NSString stringWithFormat:@"%@", snapshot.value[@"width"]]];
        //        }
        
//        [self log:[NSString stringWithFormat:@"%@",snapshot.value]];
        //        [self drawPath:xlocation,ylocation];
    }];
    
}




- (void)transaction:(SKTransaction *)transaction didReceiveServiceResponse:(NSDictionary *)response
{
    Firebase *ref = [[Firebase alloc] initWithUrl: @"https://nflhackathonthingy.firebaseio.com"];
    
    [ref observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        //        NSLog(@"%@ -> %@", snapshot.key, snapshot.value);
        [self log:[NSString stringWithFormat:@"didReceiveServiceResponse: %@ \n", response]];
        NSLog(@"asdf");
        [self log:[NSString stringWithFormat:@"%@",snapshot.value]];
        //        [self drawPath:xlocation,ylocation];
    }];
    
    
}

- (void)transaction:(SKTransaction *)transaction didFinishWithSuggestion:(NSString *)suggestion
{
    [self log:@"didFinishWithSuggestion"];
    _state = SKSIdle;
//    [self recognize];
    
}

- (void)transaction:(SKTransaction *)transaction didFailWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    //    [self log:[NSString stringWithFormat:@"didFailWithError: %@. %@", [error description], suggestion]];
    _state = SKSIdle;
//    [self recognize];
}



#pragma mark - Helpers

- (void)log:(NSString *)message
{
    self.logTextView.text = [self.logTextView.text stringByAppendingFormat:@"%@\n", message];
    //    [self.fliteController say:@"%@\n" withVoice:self.slt];
    
}



- (void)loadEarcons
{
    // Load all of the earcons from disk
    
    NSString* startEarconPath = [[NSBundle mainBundle] pathForResource:@"sk_start" ofType:@"pcm"];
    NSString* stopEarconPath = [[NSBundle mainBundle] pathForResource:@"sk_stop" ofType:@"pcm"];
    NSString* errorEarconPath = [[NSBundle mainBundle] pathForResource:@"sk_error" ofType:@"pcm"];
    
    SKPCMFormat* audioFormat = [[SKPCMFormat alloc] init];
    audioFormat.sampleFormat = SKPCMSampleFormatSignedLinear16;
    audioFormat.sampleRate = 16000;
    audioFormat.channels = 1;
    
    // Attach them to the session
    
    _skSession.startEarcon = [[SKAudioFile alloc] initWithURL:[NSURL fileURLWithPath:startEarconPath] pcmFormat:audioFormat];
    _skSession.endEarcon = [[SKAudioFile alloc] initWithURL:[NSURL fileURLWithPath:stopEarconPath] pcmFormat:audioFormat];
    _skSession.errorEarcon = [[SKAudioFile alloc] initWithURL:[NSURL fileURLWithPath:errorEarconPath] pcmFormat:audioFormat];
    
}

@end
