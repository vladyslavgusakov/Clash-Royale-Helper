//
//  ViewController.m
//  ClashRoyaleInfo
//
//  Created by Vladyslav Gusakov on 3/15/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
// 283*340 -> 56.6*68

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat width;
    CGFloat height;
    NSArray *cards;
    NSArray *elixirCost;
    NSDictionary *cardsWithCost;
    UIButton *bottomRightCornerButton;
    UITapGestureRecognizer *singleTap;
    UILabel *info;
}
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    width = CGRectGetWidth(screen);
    height = CGRectGetHeight(screen);
    
    cards = @[@"archers", @"arrows", @"baby_dragon", @"barbarian_hut", @"barbarians", @"bomb_tower", @"cannon", @"elixir_collector", @"fireball", @"giant_skeleton", @"giant", @"goblin_barrel", @"goblins", @"golem", @"hog_rider",
              @"knight", @"lightning", @"mini_PEKKA", @"minions", @"mirror", @"mortar", @"PEKKA", @"prince", @"rage", @"skeleton_army", @"skeletons", @"spear_goblins", @"tombstone", @"valkyrie", @"witch", @"x-bow", @"zap"];
    elixirCost = @[@3, @3, @4, @7, @5, @5, @3, @5, @4, @6, @5, @4, @2, @8, @4, @3, @6, @4, @5, @0, @6, @8, @5, @3, @4, @1, @5, @3, @4, @5, @6, @2];
    
    [self createScrollView];
    [self createDeckView];
    [self createBottomRightButton];
    [self createInfoLabel];
    
}

-(void) createDeckView {

    for (int i = 0; i < 10; i++) {
        
        CGFloat avgElixirCost = 0;
        NSMutableArray *imagesArr = [[NSMutableArray alloc] init];
        
        while (imagesArr.count < 8) {
            NSString *cardLink = [[NSString alloc] initWithString:[cards objectAtIndex: arc4random() % cards.count]];
            
            if (![imagesArr containsObject:cardLink]) {
                [imagesArr addObject:cardLink];
                avgElixirCost += [[elixirCost objectAtIndex: [cards indexOfObject:cardLink]] floatValue];
            }
        }
        
        myDeck *deck = [[myDeck alloc] initAtIndex:i];
        deck.frame = CGRectMake(CGRectGetMidX(self.scrollView.bounds)-deck.width/2, height/8+i*(deck.height+height/20) , deck.width, deck.height);
        
        for (int j = 0; j < 8; j++) {
            NSString *cardNumber = [NSString stringWithFormat:@"card%i", j+1];
            myCard *currentCard = ((myCard *)[deck valueForKey:cardNumber]);
            currentCard.name = [imagesArr objectAtIndex:j];
            [currentCard.button setBackgroundImage:[UIImage imageNamed: [imagesArr objectAtIndex:j]] forState:UIControlStateNormal] ;
            currentCard.button.tag = j+1;
            [currentCard.button addTarget:self action:@selector(tapDetected:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        deck.averageElixirCost.text = [NSString stringWithFormat:@"Average Elixir cost: %1.1f", avgElixirCost/8];
        
        [self.scrollView addSubview:deck];
        
        self.scrollView.contentSize = CGSizeMake(width, height/8+(deck.height+height/20)*(i+1));
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    for (UIView *subView in self.scrollView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    self.scrollView.frame = self.view.bounds;
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    height = CGRectGetHeight(screen);
    
    bottomRightCornerButton.frame = CGRectMake(width*0.85, height - width/7 - 5, width/7, width/7);
    info.frame = CGRectMake(width/3, 30, width/3, 30);
    
    [self createDeckView];
}

-(void)tapDetected: (UIButton *) sender {
    
    myDeck *mc = (myDeck *)[sender superview];
    
    NSString *cardNumber = [NSString stringWithFormat:@"card%lu", sender.tag
                            ];
    info.text = [[[[mc valueForKey:cardNumber] name] stringByReplacingOccurrencesOfString:@"_" withString:@" "] uppercaseString];
    
}

-(void) createScrollView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    self.scrollView.contentSize = CGSizeMake(width, height*2);
    self.scrollView.backgroundColor = [UIColor colorWithRed: 0.817 green: 0.926 blue: 1 alpha: 1];
    self.scrollView.scrollEnabled = YES;
    
    [self.view addSubview:self.scrollView];
    
}
-(void) createBottomRightButton  {
    
    bottomRightCornerButton = [[UIButton alloc] initWithFrame:CGRectMake(width*0.85, height*0.8, width/7, width/7)];
    bottomRightCornerButton.backgroundColor = [UIColor redColor];
    [bottomRightCornerButton setTitle:@"Shuffle" forState:UIControlStateNormal];
    bottomRightCornerButton.titleLabel.textColor = [UIColor whiteColor];
    bottomRightCornerButton.layer.cornerRadius = 10.0;
    [bottomRightCornerButton addTarget:self action:@selector(bottomRightCornerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bottomRightCornerButton];

}

-(void) bottomRightCornerButtonAction {
    info.text = @"Select any card";
    [self viewDidLayoutSubviews];
}

-(void) createInfoLabel {
    info = [[UILabel alloc] init];
    info.text = @"HELLO";
    info.backgroundColor = [UIColor colorWithRed: 0.988 green: 1 blue: 0.79 alpha: 0.5];
    info.textAlignment = NSTextAlignmentCenter;
    info.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:20];
    info.textColor = [UIColor colorWithRed: 0.339 green: 0.339 blue: 0.339 alpha:1.0];
    
    [self.view addSubview:info];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
