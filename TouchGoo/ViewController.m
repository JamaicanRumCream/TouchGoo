//
//  ViewController.m
//  TouchGoo
//
//  Created by Chris Paveglio on 1/27/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "ViewController.h"
#import "GooCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	resultsArray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performSearch:(id)sender
{
    [self.view endEditing:YES];
    //when the user enters something
    
    NSString *searchTerm = [_searchTermTextField text];
    NSString *escapedTerm = [searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *googleSearchLoc = @"http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=";
    
    NSString *fullTerm = [NSString stringWithFormat:@"%@%@", googleSearchLoc, escapedTerm];
    
    NSURL *searchURL = [NSURL URLWithString:fullTerm];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:searchURL];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:req delegate:self];
    
    googleData = nil;
    googleData = [NSMutableData data];
    
    [conn start];
}

//NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"conn error = %@", [error description]);
}

//NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [googleData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSLog(@"%@", [[NSString alloc] initWithData:googleData encoding:NSUTF8StringEncoding]);
    
    NSError *error;
    NSDictionary *googleDict = [NSJSONSerialization JSONObjectWithData:googleData
                                                       options:0
                                                         error:&error];
    //NSLog(@"googleDict= %@", googleDict);
    
    NSDictionary *responseDict = [googleDict objectForKey:@"responseData"];
    [resultsArray removeAllObjects];
    [resultsArray addObjectsFromArray:[responseDict objectForKey:@"results"]];
    NSLog(@"resultsArray count= %d", [resultsArray count]);
    for (NSDictionary *aDict in resultsArray) {
        NSLog(@"%@", aDict);
    }
    [_resultTable reloadData];
}


#pragma mark - TableView Data Source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GooCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSDictionary *rowItem = [resultsArray objectAtIndex:[indexPath row]];
    [[cell visibleUrlLabel] setText:[rowItem objectForKey:@"visibleUrl"]];
    [[cell contentLabel] setText:[rowItem objectForKey:@"content"]];
    [[cell titleNoFormLabel] setText:[rowItem objectForKey:@"titleNoFormatting"]];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resultsArray count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
