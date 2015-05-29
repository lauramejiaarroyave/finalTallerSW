//
//  UserHomeViewController.m
//  finalTallerSW
//
//  Created by Laura Mejia Arroyave on 24/05/15.
//  Copyright (c) 2015 Laura Mejia Arroyave. All rights reserved.
//

#import "UserHomeViewController.h"
#import "FavoriteSongsViewController.h"


@interface UserHomeViewController ()

@end

@implementation UserHomeViewController{
    
    NSArray *inputArray;
    NSArray *arrayRock;
    NSArray *arrayElectro;
    NSArray *arrayPop;
    NSArray *arrayDisco;
    NSString *selected;
    NSString *soundName;
    NSString *soundFilePath;
    NSURL *soundFileURL;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    _lblUser.text=_user;

    
    // ROCK
    NSString * rutaRock = [[NSBundle mainBundle]pathForResource:@"pListRock" ofType:@"plist"];
    arrayRock = [[NSArray alloc]initWithContentsOfFile:rutaRock];
    NSLog(@"%@", arrayRock);
    
    // ELECTRO
    NSString * rutaElectro = [[NSBundle mainBundle]pathForResource:@"pListElectro" ofType:@"plist"];
    arrayElectro = [[NSArray alloc]initWithContentsOfFile:rutaElectro];
    NSLog(@"%@", arrayElectro);
    
    // POP
    NSString * rutaPop = [[NSBundle mainBundle]pathForResource:@"pListPop" ofType:@"plist"];
    arrayPop = [[NSArray alloc]initWithContentsOfFile:rutaPop];
    NSLog(@"%@", arrayPop);
    
    // DISCO
    NSString * rutaDisco = [[NSBundle mainBundle]pathForResource:@"pListDisco" ofType:@"plist"];
    arrayDisco = [[NSArray alloc]initWithContentsOfFile:rutaDisco];
    NSLog(@"%@", arrayDisco);
    
    
}


-(void)viewWillAppear:(BOOL)animated{
 
  [super viewWillAppear:animated];
  users = [dao obtenerUser];
 
 
 
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
     return [inputArray count];

}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [inputArray objectAtIndex:row];

}



- (IBAction)btnLogOut:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnPlay:(id)sender {
    
    
    soundName= [inputArray objectAtIndex:[_pvList selectedRowInComponent:0]];
    
    soundFilePath = [NSString stringWithFormat:@"%@/%@.mp3",
                     [[NSBundle mainBundle] resourcePath], soundName];
    soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    _player.numberOfLoops = 0;
    
    
    [_player play];
    
    
    
    for (int i=0; i<users.count; i ++) {
        if ([[[users objectAtIndex:i] valueForKey:@"userName"] isEqualToString:_lblUser.text]) {
          
           NSString *userFav1= soundName;
           NSString *userFav2 =[[users objectAtIndex:i] valueForKey:@"userFav1"];
           NSString *userFav3 =[[users objectAtIndex:i] valueForKey:@"userFav2"];
            
           NSString *userName = _lblUser.text;
            
            
           [dao actualizarUser:userName userFav1:userFav1 userFav2:userFav2 userFav3:userFav3];

            users = [dao obtenerUser];
            
        }else{
            
            
            
        }
        
    }
    
    
    
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FavoriteSongsViewController *lVC = [segue destinationViewController];
    lVC.us=[NSString stringWithFormat:@"%@", _lblUser.text];
}

- (IBAction)btnPause:(id)sender {
    
    [_player pause];
}

- (IBAction)btnStop:(id)sender {
    
    [_player stop];
}

- (IBAction)btnElec:(id)sender {
    inputArray = arrayElectro;
    [self.pvList reloadAllComponents];
}

- (IBAction)btnPo:(id)sender {
    inputArray = arrayPop;
    [self.pvList reloadAllComponents];
}

- (IBAction)btnRoc:(id)sender {
    inputArray = arrayRock;
    [self.pvList reloadAllComponents];
}

- (IBAction)btnDisc:(id)sender {
    inputArray = arrayDisco;
    [self.pvList reloadAllComponents];
}



@end
