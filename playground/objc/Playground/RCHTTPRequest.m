//
//  RCHttp.m
//  IMAGIN
//
//  Created by Baluta Cristian on 5/9/10.
//  Copyright 2010 ralcr. All rights reserved.
//

#import "RCHttpRequest.h"


@implementation RCHttpRequest
@synthesize receivedData, result;


- (id)initWithURL:(NSString*)u delegate:(id)d {
	
	if (self = [super init]) {
		URL = u;
		delegate = d;
	}
	return self;
}




- (void)call:(NSString*)script variables:(NSDictionary*)dictionary method:(NSString*)method {
	
	if ([method isEqualToString:@"GET"]) {
		
		NSURLRequest *request = [[NSURLRequest alloc]
								 initWithURL: [NSURL URLWithString:URL]
								 cachePolicy: NSURLRequestReloadIgnoringLocalCacheData
								 timeoutInterval: 10];
		
        [self download:request];
		return;
	}
	
	// Create POST variables
	NSMutableString *postStr = [[NSMutableString alloc] init];
	
	for (id key in dictionary) {
		//NSLog(@"RCHttp append key: %@, value: %@", key, [dictionary objectForKey:key]);
		[postStr appendFormat:@"%@=%@&", key, [dictionary objectForKey:key]];
	}
	
    NSData *postData = [postStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	//NSLog(@"RCHttp scriptsPath: %@", scriptsPath);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
	
	[self download:request];
}

-(void)put {
	
	NSString *postStr = @"MY-API-KEY=e7f018bce4d8ebf9e96b129774217376a7b67f2a&friends=%5B%7B%22id%22%3A%22120811039%22%2C%22name%22%3A%22Renee%20Jim%22%7D%2C%7B%22id%22%3A%22223406616%22%2C%22name%22%3A%22Jonathan%20Melhuish%22%7D%2C%7B%22id%22%3A%22245700020%22%2C%22name%22%3A%22Emma%20Rault%22%7D%2C%7B%22id%22%3A%22500073284%22%2C%22name%22%3A%22Valeriu%20Trufas%22%7D%2C%7B%22id%22%3A%22502347916%22%2C%22name%22%3A%22Alecs%20Stan%22%7D%2C%7B%22id%22%3A%22503037844%22%2C%22name%22%3A%22Simona%20Mirea%22%7D%2C%7B%22id%22%3A%22506081845%22%2C%22name%22%3A%22Burcu%20Bozok%22%7D%2C%7B%22id%22%3A%22510534851%22%2C%22name%22%3A%22Madalina%20State%22%7D%2C%7B%22id%22%3A%22511571764%22%2C%22name%22%3A%22Poh-Choo%20Pang%22%7D%2C%7B%22id%22%3A%22513524802%22%2C%22name%22%3A%22Andreea%20Retinschi%22%7D%2C%7B%22id%22%3A%22517433512%22%2C%22name%22%3A%22Serkan%20%C3%B6zbayrak%22%7D%2C%7B%22id%22%3A%22522357028%22%2C%22name%22%3A%22Alina%20Teodora%22%7D%2C%7B%22id%22%3A%22524019339%22%2C%22name%22%3A%22Nicu%20Oprea%22%7D%2C%7B%22id%22%3A%22525718745%22%2C%22name%22%3A%22Roxana%20Zega%22%7D%2C%7B%22id%22%3A%22529487955%22%2C%22name%22%3A%22Ana%20Pobleanu%22%7D%2C%7B%22id%22%3A%22533817749%22%2C%22name%22%3A%22Daniel%20Voicu%22%7D%2C%7B%22id%22%3A%22536107131%22%2C%22name%22%3A%22Ramona%20Barbu%22%7D%2C%7B%22id%22%3A%22537682841%22%2C%22name%22%3A%22Rau%20George%20Ovidiu%22%7D%2C%7B%22id%22%3A%22539622149%22%2C%22name%22%3A%22Miruna%20Doicaru%22%7D%2C%7B%22id%22%3A%22545253020%22%2C%22name%22%3A%22Anca%20Nelersa%22%7D%2C%7B%22id%22%3A%22556366576%22%2C%22name%22%3A%22Corrie%20LaiLai%22%7D%2C%7B%22id%22%3A%22556733249%22%2C%22name%22%3A%22Alice%20Paysdesmerveilles%22%7D%2C%7B%22id%22%3A%22566902268%22%2C%22name%22%3A%22Andreea%20Maris%22%7D%2C%7B%22id%22%3A%22566965426%22%2C%22name%22%3A%22Dublew%20Dublew%20Dublew%22%7D%2C%7B%22id%22%3A%22568591140%22%2C%22name%22%3A%22Ana%20Key%20Ularu%22%7D%2C%7B%22id%22%3A%22570574904%22%2C%22name%22%3A%22Alina%20Iordache%20Mohr%22%7D%2C%7B%22id%22%3A%22573132164%22%2C%22name%22%3A%22Anca%20Dimofte%22%7D%2C%7B%22id%22%3A%22579986863%22%2C%22name%22%3A%22Aurora%20Chen%20Zhou%22%7D%2C%7B%22id%22%3A%22580951972%22%2C%22name%22%3A%22Ida%20Vernersson%22%7D%2C%7B%22id%22%3A%22585937942%22%2C%22name%22%3A%22Sinaed%20Godin%22%7D%2C%7B%22id%22%3A%22586112971%22%2C%22name%22%3A%22Adam%20Foster%22%7D%2C%7B%22id%22%3A%22587035572%22%2C%22name%22%3A%22Sigita%20Zukaite%22%7D%2C%7B%22id%22%3A%22590522324%22%2C%22name%22%3A%22Adrian%20Popescu%22%7D%2C%7B%22id%22%3A%22591987215%22%2C%22name%22%3A%22Sagi%20London%22%7D%2C%7B%22id%22%3A%22592838035%22%2C%22name%22%3A%22Roxana%20Enache%22%7D%2C%7B%22id%22%3A%22594299625%22%2C%22name%22%3A%22Liviu%20Nichie%22%7D%2C%7B%22id%22%3A%22598410865%22%2C%22name%22%3A%22Teodora%20Ciric%22%7D%2C%7B%22id%22%3A%22602691235%22%2C%22name%22%3A%22Gabriel%20Ilioiu%22%7D%2C%7B%22id%22%3A%22610874710%22%2C%22name%22%3A%22Daniel%20Wahba%22%7D%2C%7B%22id%22%3A%22621990619%22%2C%22name%22%3A%22Julia%20Kuczera%22%7D%2C%7B%22id%22%3A%22622370380%22%2C%22name%22%3A%22Anca%20Adelina%20Pop%22%7D%2C%7B%22id%22%3A%22623737956%22%2C%22name%22%3A%22Cristina%20Cruz%20Zurita%22%7D%2C%7B%22id%22%3A%22627673810%22%2C%22name%22%3A%22Andrei%20Vocurek%22%7D%2C%7B%22id%22%3A%22639478979%22%2C%22name%22%3A%22Lauraspberry%20Sm%C3%A2nt%C3%A2n%C4%83%22%7D%2C%7B%22id%22%3A%22640465165%22%2C%22name%22%3A%22Rina%20Melissa%20Raimee%22%7D%2C%7B%22id%22%3A%22643773441%22%2C%22name%22%3A%22%C4%8Ceslovas%20Kar%C5%BEenauskas%22%7D%2C%7B%22id%22%3A%22644282677%22%2C%22name%22%3A%22Stephanie%20Chen%22%7D%2C%7B%22id%22%3A%22645321464%22%2C%22name%22%3A%22Oliver-Bogdan%20Iancu%22%7D%2C%7B%22id%22%3A%22648008095%22%2C%22name%22%3A%22Anca%20Muresan%22%7D%2C%7B%22id%22%3A%22648432713%22%2C%22name%22%3A%22Ioana%20Stangacilovic%22%7D%2C%7B%22id%22%3A%22649703389%22%2C%22name%22%3A%22Bogdan%20Tinteanu%20Jr.%22%7D%2C%7B%22id%22%3A%22652342862%22%2C%22name%22%3A%22Irina%20Ballerina%22%7D%2C%7B%22id%22%3A%22653332635%22%2C%22name%22%3A%22Nike%20Ei%22%7D%2C%7B%22id%22%3A%22655859279%22%2C%22name%22%3A%22Alin%20Inayeh%22%7D%2C%7B%22id%22%3A%22656135714%22%2C%22name%22%3A%22Cynthia%20Cinnamon%22%7D%2C%7B%22id%22%3A%22659069226%22%2C%22name%22%3A%22Irina%20Aldoescu%22%7D%2C%7B%22id%22%3A%22663588738%22%2C%22name%22%3A%22Vlad%20Eftenie%22%7D%2C%7B%22id%22%3A%22665043461%22%2C%22name%22%3A%22Claudia%20Tocil%C4%83%22%7D%2C%7B%22id%22%3A%22666040494%22%2C%22name%22%3A%22Lucina%20Testa%22%7D%2C%7B%22id%22%3A%22667777532%22%2C%22name%22%3A%22Debasree%20Dey%22%7D%2C%7B%22id%22%3A%22671887361%22%2C%22name%22%3A%22Ciprian%20Constantin%20Manea%22%7D%2C%7B%22id%22%3A%22673108256%22%2C%22name%22%3A%22Thibault%20Smockey%22%7D%2C%7B%22id%22%3A%22677119275%22%2C%22name%22%3A%22Kamile%20Tulippa%20Tulpe%22%7D%2C%7B%22id%22%3A%22681994999%22%2C%22name%22%3A%22Novi%20Mihai%22%7D%2C%7B%22id%22%3A%22682491794%22%2C%22name%22%3A%22Florin%20Iscru%22%7D%2C%7B%22id%22%3A%22683517619%22%2C%22name%22%3A%22Gabriela%20Cristina%22%7D%2C%7B%22id%22%3A%22688350355%22%2C%22name%22%3A%22Alina%20Dimofte%22%7D%2C%7B%22id%22%3A%22690370091%22%2C%22name%22%3A%22Oana%20Rosu%22%7D%2C%7B%22id%22%3A%22695099681%22%2C%22name%22%3A%22Ernesta%20Nezinau%22%7D%2C%7B%22id%22%3A%22696424833%22%2C%22name%22%3A%22Andra%20Tudoran%22%7D%2C%7B%22id%22%3A%22696671442%22%2C%22name%22%3A%22Alina%20Liliana%20Popa%22%7D%2C%7B%22id%22%3A%22703955797%22%2C%22name%22%3A%22Andi%20Todea%22%7D%2C%7B%22id%22%3A%22708958951%22%2C%22name%22%3A%22George%20Cristian%20Negreanu%22%7D%2C%7B%22id%22%3A%22711797479%22%2C%22name%22%3A%22Catalin%20Stefanescu%22%7D%2C%7B%22id%22%3A%22712628498%22%2C%22name%22%3A%22J.%20Christian%20Andersen%22%7D%2C%7B%22id%22%3A%22716277141%22%2C%22name%22%3A%22Jeanine%20Bergh%22%7D%2C%7B%22id%22%3A%22716502762%22%2C%22name%22%3A%22Ligia%20Adam%22%7D%2C%7B%22id%22%3A%22717347958%22%2C%22name%22%3A%22Claudia%20Gulea%22%7D%2C%7B%22id%22%3A%22717724907%22%2C%22name%22%3A%22Medina%20Popescu%22%7D%2C%7B%22id%22%3A%22719725013%22%2C%22name%22%3A%22Angi%20Ghimpeteanu%22%7D%2C%7B%22id%22%3A%22725943210%22%2C%22name%22%3A%22Alexandru%20George%22%7D%2C%7B%22id%22%3A%22729292847%22%2C%22name%22%3A%22Adam%20Ward%22%7D%2C%7B%22id%22%3A%22730532608%22%2C%22name%22%3A%22Liliana%20Lefter%22%7D%2C%7B%22id%22%3A%22731329390%22%2C%22name%22%3A%22Cristina%20%C5%A2int%C4%83%22%7D%2C%7B%22id%22%3A%22735394676%22%2C%22name%22%3A%22Shelly%20Webster%22%7D%2C%7B%22id%22%3A%22738518852%22%2C%22name%22%3A%22Blossom%20Blue%22%7D%2C%7B%22id%22%3A%22740497967%22%2C%22name%22%3A%22Emine%20Mert%22%7D%2C%7B%22id%22%3A%22743100220%22%2C%22name%22%3A%22Claire%20Hamill%22%7D%2C%7B%22id%22%3A%22744186357%22%2C%22name%22%3A%22Michael%20Serwa%22%7D%2C%7B%22id%22%3A%22744687088%22%2C%22name%22%3A%22Silvia%20Dr%C4%83g%C5%9Fan%22%7D%2C%7B%22id%22%3A%22753598025%22%2C%22name%22%3A%22Weir%20Do%22%7D%2C%7B%22id%22%3A%22762774618%22%2C%22name%22%3A%22Gabriela%20Balanescu%22%7D%2C%7B%22id%22%3A%22764337069%22%2C%22name%22%3A%22Andrei%20Gheorghe%22%7D%2C%7B%22id%22%3A%22778473501%22%2C%22name%22%3A%22Andriusha%20Kotikov%22%7D%2C%7B%22id%22%3A%22785293908%22%2C%22name%22%3A%22Max%20Pol%20Le%20Brun%22%7D%2C%7B%22id%22%3A%22792418954%22%2C%22name%22%3A%22Andra%20Duta%22%7D%2C%7B%22id%22%3A%22793350474%22%2C%22name%22%3A%22Koray%20Kandemir%22%7D%2C%7B%22id%22%3A%22800735858%22%2C%22name%22%3A%22Hande%20Akar%22%7D%2C%7B%22id%22%3A%22809339026%22%2C%22name%22%3A%22Mihai%20Dragan%22%7D%2C%7B%22id%22%3A%22812639853%22%2C%22name%22%3A%22Atena%20Chiper%22%7D%2C%7B%22id%22%3A%22820555522%22%2C%22name%22%3A%22Ewie%20Bop%22%7D%2C%7B%22id%22%3A%22827569660%22%2C%22name%22%3A%22Livia%20Dumitrescu%22%7D%2C%7B%22id%22%3A%22834040356%22%2C%22name%22%3A%22Sasha%20Celeste%20Possemiers%22%7D%2C%7B%22id%22%3A%22851060483%22%2C%22name%22%3A%22Tracy%20Satori%22%7D%2C%7B%22id%22%3A%22861630530%22%2C%22name%22%3A%22Iuliae%20J%C3%B9%22%7D%2C%7B%22id%22%3A%22895905161%22%2C%22name%22%3A%22Denisa%20Dobrin%22%7D%2C%7B%22id%22%3A%221003181575%22%2C%22name%22%3A%22Mia%20Campion%22%7D%2C%7B%22id%22%3A%221010294808%22%2C%22name%22%3A%22Felicia%20Mirela%22%7D%2C%7B%22id%22%3A%221012389157%22%2C%22name%22%3A%22Mihai%20Baloianu%22%7D%2C%7B%22id%22%3A%221031467845%22%2C%22name%22%3A%22Alexandra%20Pasca%22%7D%2C%7B%22id%22%3A%221037456029%22%2C%22name%22%3A%22Ileana%20Ionescu%22%7D%2C%7B%22id%22%3A%221046140902%22%2C%22name%22%3A%22Ileana%20Campean%22%7D%2C%7B%22id%22%3A%221046204213%22%2C%22name%22%3A%22Mirela%20Bichigeanu%22%7D%2C%7B%22id%22%3A%221048773752%22%2C%22name%22%3A%22Ovidiu%20Mihalcea%22%7D%2C%7B%22id%22%3A%221056658236%22%2C%22name%22%3A%22Gratiela%20Badescu%22%7D%2C%7B%22id%22%3A%221057751934%22%2C%22name%22%3A%22Saru%20Zaru%22%7D%2C%7B%22id%22%3A%221058886367%22%2C%22name%22%3A%22Jules%20Roman%22%7D%2C%7B%22id%22%3A%221059908696%22%2C%22name%22%3A%22Monna%20Petrescu%22%7D%2C%7B%22id%22%3A%221072983678%22%2C%22name%22%3A%22Daniela%20Matei%22%7D%2C%7B%22id%22%3A%221076673706%22%2C%22name%22%3A%22George%20Enache%22%7D%2C%7B%22id%22%3A%221077162095%22%2C%22name%22%3A%22Rita%20Milian%22%7D%2C%7B%22id%22%3A%221077810158%22%2C%22name%22%3A%22Samir%20Akacha%22%7D%2C%7B%22id%22%3A%221081205976%22%2C%22name%22%3A%22Claudiu%20G%C3%AElmeanu%22%7D%2C%7B%22id%22%3A%221082804549%22%2C%22name%22%3A%22Delphine%20Eydieux%22%7D%2C%7B%22id%22%3A%221091550787%22%2C%22name%22%3A%22Adrian%20Dumitrescu%22%7D%2C%7B%22id%22%3A%221098693944%22%2C%22name%22%3A%22Andrei%20Procopie%22%7D%2C%7B%22id%22%3A%221117455210%22%2C%22name%22%3A%22Diana%20Croitoru%22%7D%2C%7B%22id%22%3A%221126023435%22%2C%22name%22%3A%22Marija%20Bushavka%20Nakovska%22%7D%2C%7B%22id%22%3A%221129498053%22%2C%22name%22%3A%22Oana%20Boncu%22%7D%2C%7B%22id%22%3A%221131976803%22%2C%22name%22%3A%22Simona%20Patrascu%22%7D%2C%7B%22id%22%3A%221160728079%22%2C%22name%22%3A%22Elena%20Isac%22%7D%2C%7B%22id%22%3A%221165967805%22%2C%22name%22%3A%22Cristina%20Matei%22%7D%2C%7B%22id%22%3A%221166025592%22%2C%22name%22%3A%22Maria%20Marie%22%7D%2C%7B%22id%22%3A%221172771964%22%2C%22name%22%3A%22Andrei%20Birsan%22%7D%2C%7B%22id%22%3A%221173172829%22%2C%22name%22%3A%22Aleskander%20Albe%22%7D%2C%7B%22id%22%3A%221173995077%22%2C%22name%22%3A%22Vlad%20Emil%20Petrea%22%7D%2C%7B%22id%22%3A%221190498019%22%2C%22name%22%3A%22Viorel%20Sfetea%22%7D%2C%7B%22id%22%3A%221201085981%22%2C%22name%22%3A%22Cezara%20Bata%22%7D%2C%7B%22id%22%3A%221202597897%22%2C%22name%22%3A%22Dan%20Baluta%22%7D%2C%7B%22id%22%3A%221204209882%22%2C%22name%22%3A%22Sabina%20Ppllon%22%7D%2C%7B%22id%22%3A%221204935592%22%2C%22name%22%3A%22Bogdan%20Cosmin%22%7D%2C%7B%22id%22%3A%221208946443%22%2C%22name%22%3A%22Floriana%20Balan%22%7D%2C%7B%22id%22%3A%221210472777%22%2C%22name%22%3A%22Mircea%20Bezergheanu%22%7D%2C%7B%22id%22%3A%221211280119%22%2C%22name%22%3A%22Flori%20Dragomiroiu%22%7D%2C%7B%22id%22%3A%221211496109%22%2C%22name%22%3A%22Gabriel%20Oana%22%7D%2C%7B%22id%22%3A%221215428199%22%2C%22name%22%3A%22Katie%20Ch%C3%A9z%22%7D%2C%7B%22id%22%3A%221231471734%22%2C%22name%22%3A%22Alexandra%20David%22%7D%2C%7B%22id%22%3A%221233384284%22%2C%22name%22%3A%22Irina%20Visan%22%7D%2C%7B%22id%22%3A%221237595167%22%2C%22name%22%3A%22Kolea%20Plesco%22%7D%2C%7B%22id%22%3A%221239535910%22%2C%22name%22%3A%22Camelia%20Capitanu%22%7D%2C%7B%22id%22%3A%221240535519%22%2C%22name%22%3A%22Ovidiu%20Chereche%C5%9F%22%7D%2C%7B%22id%22%3A%221249812507%22%2C%22name%22%3A%22Antonis%20Grr%22%7D%2C%7B%22id%22%3A%221250386547%22%2C%22name%22%3A%22Aur%C3%A9lie%20Mathieu%22%7D%2C%7B%22id%22%3A%221252364651%22%2C%22name%22%3A%22Cristina%20Suciu%22%7D%2C%7B%22id%22%3A%221264028535%22%2C%22name%22%3A%22C%C4%83t%C4%83lin%20Mihai%20Ghi%C5%A3%C4%83%22%7D%2C%7B%22id%22%3A%221267627625%22%2C%22name%22%3A%22Alina%20Bitca%22%7D%2C%7B%22id%22%3A%221272931065%22%2C%22name%22%3A%22Sanna%20Garraway%22%7D%2C%7B%22id%22%3A%221275240670%22%2C%22name%22%3A%22Rosalie%20Vered%20Kogan%22%7D%2C%7B%22id%22%3A%221278250421%22%2C%22name%22%3A%22Carmen%20Rusu%22%7D%2C%7B%22id%22%3A%221280211199%22%2C%22name%22%3A%22IUana%20Iordache%22%7D%2C%7B%22id%22%3A%221283043046%22%2C%22name%22%3A%22Alex%20Bucur%22%7D%2C%7B%22id%22%3A%221286264502%22%2C%22name%22%3A%22Augustinas%20Petronis%22%7D%2C%7B%22id%22%3A%221286994923%22%2C%22name%22%3A%22Mouhamad%20Ajmal%22%7D%2C%7B%22id%22%3A%221291284369%22%2C%22name%22%3A%22Bobo%20Boo%22%7D%2C%7B%22id%22%3A%221293896069%22%2C%22name%22%3A%22Cristiana-Iuliana%20Bobaru%22%7D%2C%7B%22id%22%3A%221299429046%22%2C%22name%22%3A%22Daniela%20Shaw%22%7D%2C%7B%22id%22%3A%221300792302%22%2C%22name%22%3A%22Geta%20Ghita%22%7D%2C%7B%22id%22%3A%221303128142%22%2C%22name%22%3A%22Lavinia%20Visan%22%7D%2C%7B%22id%22%3A%221308415384%22%2C%22name%22%3A%22Alain%20Laboile%22%7D%2C%7B%22id%22%3A%221316407299%22%2C%22name%22%3A%22Andreea%20Iancu%22%7D%2C%7B%22id%22%3A%221318326215%22%2C%22name%22%3A%22Nicolae%20Ion%20Catalin%22%7D%2C%7B%22id%22%3A%221320541713%22%2C%22name%22%3A%22Budoiu%20Bogdan%22%7D%2C%7B%22id%22%3A%221328153339%22%2C%22name%22%3A%22Gosia%20Moczulska%22%7D%2C%7B%22id%22%3A%221336793737%22%2C%22name%22%3A%22Ioana%20Antonela%20Paduraru%22%7D%2C%7B%22id%22%3A%221341840046%22%2C%22name%22%3A%22Aleeza%20Howitt%22%7D%2C%7B%22id%22%3A%221347522967%22%2C%22name%22%3A%22Elisa%20Rossini%22%7D%2C%7B%22id%22%3A%221349866210%22%2C%22name%22%3A%22Razvan%20Garofeanu%22%7D%2C%7B%22id%22%3A%221349904060%22%2C%22name%22%3A%22U%20Lia%20GT%22%7D%2C%7B%22id%22%3A%221365174327%22%2C%22name%22%3A%22Razvan%20Tudosie%22%7D%2C%7B%22id%22%3A%221370276345%22%2C%22name%22%3A%22Francesco%20Mattia%22%7D%2C%7B%22id%22%3A%221373232950%22%2C%22name%22%3A%22Liv%20Dancaescu%22%7D%2C%7B%22id%22%3A%221376690723%22%2C%22name%22%3A%22Dan%20Cristian%20Mihailescu%22%7D%2C%7B%22id%22%3A%221381968100%22%2C%22name%22%3A%22Elena%20Simona%20Craciun%22%7D%2C%7B%22id%22%3A%221389240716%22%2C%22name%22%3A%22Andri%20Subcarpa%C8%9Bi%22%7D%2C%7B%22id%22%3A%221393336734%22%2C%22name%22%3A%22Omu%20Negru%22%7D%2C%7B%22id%22%3A%221403912690%22%2C%22name%22%3A%22Bogdan%20St%C4%83iculescu%22%7D%2C%7B%22id%22%3A%221417481025%22%2C%22name%22%3A%22Stefanie%20Heitm%C3%BCller%22%7D%2C%7B%22id%22%3A%221418625608%22%2C%22name%22%3A%22Ting%20Ting%22%7D%2C%7B%22id%22%3A%221421182364%22%2C%22name%22%3A%22Laurentiu%20Dumitrescu%22%7D%2C%7B%22id%22%3A%221421351434%22%2C%22name%22%3A%22Mariel%20Morales%20Lezica%22%7D%2C%7B%22id%22%3A%221430977060%22%2C%22name%22%3A%22Raluca%20Ilie%22%7D%2C%7B%22id%22%3A%221438598906%22%2C%22name%22%3A%22Carla%20Tat%20Tile%22%7D%2C%7B%22id%22%3A%221438716991%22%2C%22name%22%3A%22Lucia%20Constantin%22%7D%2C%7B%22id%22%3A%221439277497%22%2C%22name%22%3A%22Florin%20Garoi%22%7D%2C%7B%22id%22%3A%221440290192%22%2C%22name%22%3A%22Monika%20Sopyte%22%7D%2C%7B%22id%22%3A%221441610151%22%2C%22name%22%3A%22Carlos%20Dreem%22%7D%2C%7B%22id%22%3A%221449614074%22%2C%22name%22%3A%22Mihai%20Alina%22%7D%2C%7B%22id%22%3A%221458705737%22%2C%22name%22%3A%22Bl%C3%A1ith%C3%ADn%20Carmen%22%7D%2C%7B%22id%22%3A%221483605813%22%2C%22name%22%3A%22Paul%20Fasching%22%7D%2C%7B%22id%22%3A%221484899162%22%2C%22name%22%3A%22Drago%C5%9F%20Gabriel%20Toma%20V%22%7D%2C%7B%22id%22%3A%221488635485%22%2C%22name%22%3A%22Roberto%20Iosupescu%22%7D%2C%7B%22id%22%3A%221503264621%22%2C%22name%22%3A%22Eli%20Elena%22%7D%2C%7B%22id%22%3A%221506259464%22%2C%22name%22%3A%22Marcel%20Eremia%22%7D%2C%7B%22id%22%3A%221522876784%22%2C%22name%22%3A%22Oana%20Tudorache%22%7D%2C%7B%22id%22%3A%221527073775%22%2C%22name%22%3A%22Ben%20Kraus%22%7D%2C%7B%22id%22%3A%221528957170%22%2C%22name%22%3A%22Akos%20Wonerth%22%7D%2C%7B%22id%22%3A%221531157728%22%2C%22name%22%3A%22Alice%20Bucur%22%7D%2C%7B%22id%22%3A%221534951784%22%2C%22name%22%3A%22Simona%20Muresan%22%7D%2C%7B%22id%22%3A%221555488387%22%2C%22name%22%3A%22Haris%20Liviu%22%7D%2C%7B%22id%22%3A%221570073300%22%2C%22name%22%3A%22Linda%20Loredana%22%7D%2C%7B%22id%22%3A%221577888266%22%2C%22name%22%3A%22Marilena%20Ifrim%22%7D%2C%7B%22id%22%3A%221578785859%22%2C%22name%22%3A%22Nuno%20Duarte%20Marques%22%7D%2C%7B%22id%22%3A%221585464296%22%2C%22name%22%3A%22Arsureanu%20Elena%20Roxana%22%7D%2C%7B%22id%22%3A%221613684192%22%2C%22name%22%3A%22Odette%20Rzhannikova%22%7D%2C%7B%22id%22%3A%221616261215%22%2C%22name%22%3A%22Mihai%20Vulpie%22%7D%2C%7B%22id%22%3A%221636102337%22%2C%22name%22%3A%22Dominika%20Noworolska%22%7D%2C%7B%22id%22%3A%221642812349%22%2C%22name%22%3A%22Ciprian%20Caba%22%7D%2C%7B%22id%22%3A%221682961522%22%2C%22name%22%3A%22Laura%20Matasa%22%7D%2C%7B%22id%22%3A%221693647816%22%2C%22name%22%3A%22Anca%20Turtoi%22%7D%2C%7B%22id%22%3A%221706818245%22%2C%22name%22%3A%22Ilas%20Leonard%22%7D%2C%7B%22id%22%3A%221711059530%22%2C%22name%22%3A%22Gabriel%20Agu%22%7D%2C%7B%22id%22%3A%221722115755%22%2C%22name%22%3A%22Denisia%20Aghiorghitoaie%22%7D%2C%7B%22id%22%3A%221722832851%22%2C%22name%22%3A%22Florentina-Catalina%20Nastasa%22%7D%2C%7B%22id%22%3A%221722864532%22%2C%22name%22%3A%22Daniela%20Dinu%22%7D%2C%7B%22id%22%3A%221725019866%22%2C%22name%22%3A%22Anca%20Duma%22%7D%2C%7B%22id%22%3A%221730449682%22%2C%22name%22%3A%22Daineanu%20Petre%22%7D%2C%7B%22id%22%3A%221763303174%22%2C%22name%22%3A%22Maria%20Olteanu%22%7D%2C%7B%22id%22%3A%221786585159%22%2C%22name%22%3A%22Elaine%20Yi%20Liang%22%7D%2C%7B%22id%22%3A%221806967187%22%2C%22name%22%3A%22Elena%20Pribeagu%22%7D%2C%7B%22id%22%3A%221814833494%22%2C%22name%22%3A%22Camelia%20Stan%22%7D%2C%7B%22id%22%3A%221826223372%22%2C%22name%22%3A%22Simion%20Buia%22%7D%2C%7B%22id%22%3A%221835060833%22%2C%22name%22%3A%22Irina%20Banita%22%7D%2C%7B%22id%22%3A%221836361609%22%2C%22name%22%3A%22Mirela%20Radulescu%22%7D%2C%7B%22id%22%3A%221849684038%22%2C%22name%22%3A%22Simona%20Risnita%22%7D%2C%7B%22id%22%3A%22100000044753273%22%2C%22name%22%3A%22Ana-Maria%20Bojinca%22%7D%2C%7B%22id%22%3A%22100000061224379%22%2C%22name%22%3A%22Andrei%20G%C3%AEndac%22%7D%2C%7B%22id%22%3A%22100000072562470%22%2C%22name%22%3A%22Jiska%20Tellam%22%7D%2C%7B%22id%22%3A%22100000076639145%22%2C%22name%22%3A%22Alina%20Ionescu%22%7D%2C%7B%22id%22%3A%22100000087196168%22%2C%22name%22%3A%22Cristi%20Nya%22%7D%2C%7B%22id%22%3A%22100000106658054%22%2C%22name%22%3A%22Corina%20Diaconu%22%7D%2C%7B%22id%22%3A%22100000118602669%22%2C%22name%22%3A%22Adrian%20Petrisor%22%7D%2C%7B%22id%22%3A%22100000131143637%22%2C%22name%22%3A%22Andreea%20Ionescu%22%7D%2C%7B%22id%22%3A%22100000143125608%22%2C%22name%22%3A%22Adrian%20Baicea%22%7D%2C%7B%22id%22%3A%22100000154823003%22%2C%22name%22%3A%22Iulian%20Is%22%7D%2C%7B%22id%22%3A%22100000168296073%22%2C%22name%22%3A%22Andra%20Garoi%22%7D%2C%7B%22id%22%3A%22100000173856883%22%2C%22name%22%3A%22Alex%20Ifrim%22%7D%2C%7B%22id%22%3A%22100000191616630%22%2C%22name%22%3A%22Andra%20Turtoi%22%7D%2C%7B%22id%22%3A%22100000211483779%22%2C%22name%22%3A%22Ana%20Maria%20Hirtauca%22%7D%2C%7B%22id%22%3A%22100000213854942%22%2C%22name%22%3A%22Ileana%20Bertea%22%7D%2C%7B%22id%22%3A%22100000224463258%22%2C%22name%22%3A%22Alexandru%20Cohal%22%7D%2C%7B%22id%22%3A%22100000224901767%22%2C%22name%22%3A%22Kristina%20Pribilskaya%22%7D%2C%7B%22id%22%3A%22100000229297164%22%2C%22name%22%3A%22Sindija%20Kalni%C5%86a%22%7D%2C%7B%22id%22%3A%22100000231331637%22%2C%22name%22%3A%22Raluca%20Bardosi%22%7D%2C%7B%22id%22%3A%22100000231945992%22%2C%22name%22%3A%22Comanescu%20Valentin%22%7D%2C%7B%22id%22%3A%22100000246702299%22%2C%22name%22%3A%22Martynas%20%C5%A0abunia%22%7D%2C%7B%22id%22%3A%22100000255716715%22%2C%22name%22%3A%22Georgeta%20Manea%22%7D%2C%7B%22id%22%3A%22100000260343644%22%2C%22name%22%3A%22Jaquelinne%20Gautier%22%7D%2C%7B%22id%22%3A%22100000273660281%22%2C%22name%22%3A%22Paul%20Sarstiuc%22%7D%2C%7B%22id%22%3A%22100000282503345%22%2C%22name%22%3A%22Badescu%20Magdalena%22%7D%2C%7B%22id%22%3A%22100000286198468%22%2C%22name%22%3A%22Valentin%20Smirnov%22%7D%2C%7B%22id%22%3A%22100000289674141%22%2C%22name%22%3A%22Andrei%20Adrian-Ionut%22%7D%2C%7B%22id%22%3A%22100000299934291%22%2C%22name%22%3A%22Panait%20Ovidiu%22%7D%2C%7B%22id%22%3A%22100000305617926%22%2C%22name%22%3A%22Lori%20Alexe%22%7D%2C%7B%22id%22%3A%22100000308155930%22%2C%22name%22%3A%22Vlad%20Hurjui%22%7D%2C%7B%22id%22%3A%22100000343417900%22%2C%22name%22%3A%22Diana%20Livia%22%7D%2C%7B%22id%22%3A%22100000349084519%22%2C%22name%22%3A%22Robert%20Sumarocov%22%7D%2C%7B%22id%22%3A%22100000362451288%22%2C%22name%22%3A%22Alexandra%20Bujenita%22%7D%2C%7B%22id%22%3A%22100000366578721%22%2C%22name%22%3A%22Nita%20Mihai%22%7D%2C%7B%22id%22%3A%22100000374045134%22%2C%22name%22%3A%22Costin%20Anghel%22%7D%2C%7B%22id%22%3A%22100000388623447%22%2C%22name%22%3A%22Alexandra%20Sophie%22%7D%2C%7B%22id%22%3A%22100000395804440%22%2C%22name%22%3A%22Alexandra%20Petcu%22%7D%2C%7B%22id%22%3A%22100000406332355%22%2C%22name%22%3A%22Paulinka%20Nesta%22%7D%2C%7B%22id%22%3A%22100000409100272%22%2C%22name%22%3A%22Aj%20Dcn%22%7D%2C%7B%22id%22%3A%22100000424290481%22%2C%22name%22%3A%22Petra%20Penciulescu%22%7D%2C%7B%22id%22%3A%22100000433055496%22%2C%22name%22%3A%22Andreea%20Malvina%22%7D%2C%7B%22id%22%3A%22100000437765590%22%2C%22name%22%3A%22Iuliana%20Paulet%22%7D%2C%7B%22id%22%3A%22100000457313824%22%2C%22name%22%3A%22Adina%20Anida%22%7D%2C%7B%22id%22%3A%22100000464383904%22%2C%22name%22%3A%22Tibi%20Baluta%22%7D%2C%7B%22id%22%3A%22100000466747164%22%2C%22name%22%3A%22Ciortan%20Ancuta%22%7D%2C%7B%22id%22%3A%22100000472650203%22%2C%22name%22%3A%22Iulia%20Antocica%22%7D%2C%7B%22id%22%3A%22100000474168504%22%2C%22name%22%3A%22Mihaela%20Lungu%22%7D%2C%7B%22id%22%3A%22100000477476867%22%2C%22name%22%3A%22Alina%20Gaboran%22%7D%2C%7B%22id%22%3A%22100000479952219%22%2C%22name%22%3A%22Silvia%20Podarascu%22%7D%2C%7B%22id%22%3A%22100000480688684%22%2C%22name%22%3A%22Iulian%20Hars%22%7D%2C%7B%22id%22%3A%22100000482070643%22%2C%22name%22%3A%22Popescu%20Cristian%22%7D%2C%7B%22id%22%3A%22100000502917959%22%2C%22name%22%3A%22Cosmin%20Bumbu%C8%9B%22%7D%2C%7B%22id%22%3A%22100000505695034%22%2C%22name%22%3A%22Alex%20Bertea%22%7D%2C%7B%22id%22%3A%22100000523617852%22%2C%22name%22%3A%22Vestineanu%20Stefan%22%7D%2C%7B%22id%22%3A%22100000527931935%22%2C%22name%22%3A%22Alina%20Corcoz%22%7D%2C%7B%22id%22%3A%22100000538327640%22%2C%22name%22%3A%22Andreea%20Toader%22%7D%2C%7B%22id%22%3A%22100000572120219%22%2C%22name%22%3A%22Iulia%20Antonache%22%7D%2C%7B%22id%22%3A%22100000577135669%22%2C%22name%22%3A%22Tudor%20Pantelimonescu%22%7D%2C%7B%22id%22%3A%22100000579443421%22%2C%22name%22%3A%22Cristina%20Crafty%20Cristina%22%7D%2C%7B%22id%22%3A%22100000585256813%22%2C%22name%22%3A%22Petronela%20Garoi%22%7D%2C%7B%22id%22%3A%22100000608786036%22%2C%22name%22%3A%22Sorin%20Rechitan%22%7D%2C%7B%22id%22%3A%22100000625624159%22%2C%22name%22%3A%22Rafaila%20Florentina%22%7D%2C%7B%22id%22%3A%22100000630484509%22%2C%22name%22%3A%22Radu%20Borzea%22%7D%2C%7B%22id%22%3A%22100000638877026%22%2C%22name%22%3A%22Alina%20Dumitrescu%22%7D%2C%7B%22id%22%3A%22100000643399636%22%2C%22name%22%3A%22Cristian%20Iohan%20Sallai%22%7D%2C%7B%22id%22%3A%22100000672592572%22%2C%22name%22%3A%22Sorana%20Chitimia%22%7D%2C%7B%22id%22%3A%22100000679219318%22%2C%22name%22%3A%22Monica%20Ida%22%7D%2C%7B%22id%22%3A%22100000693472408%22%2C%22name%22%3A%22Daniel%20Rusu%22%7D%2C%7B%22id%22%3A%22100000696794973%22%2C%22name%22%3A%22Lucian%20Olteanu%22%7D%2C%7B%22id%22%3A%22100000702693572%22%2C%22name%22%3A%22Claudiu%20Paduroiu%22%7D%2C%7B%22id%22%3A%22100000741757158%22%2C%22name%22%3A%22Adrian%20Lungu%22%7D%2C%7B%22id%22%3A%22100000746207079%22%2C%22name%22%3A%22Andreea%20Mesesan%22%7D%2C%7B%22id%22%3A%22100000747058041%22%2C%22name%22%3A%22Dumitru%20Cristina%20Adina%22%7D%2C%7B%22id%22%3A%22100000764102172%22%2C%22name%22%3A%22Anca%20Vrabie%22%7D%2C%7B%22id%22%3A%22100000765757455%22%2C%22name%22%3A%22Vasilescu%20Alexandra%22%7D%2C%7B%22id%22%3A%22100000800663809%22%2C%22name%22%3A%22Cleyton%20Pedroza%22%7D%2C%7B%22id%22%3A%22100000810339109%22%2C%22name%22%3A%22Olimpia%20Mioara%22%7D%2C%7B%22id%22%3A%22100000819227764%22%2C%22name%22%3A%22Irina%20Bucescu%22%7D%2C%7B%22id%22%3A%22100000822267424%22%2C%22name%22%3A%22Cristian%20Ivan%22%7D%2C%7B%22id%22%3A%22100000822309637%22%2C%22name%22%3A%22Andreea%20Alexe%22%7D%2C%7B%22id%22%3A%22100000824193851%22%2C%22name%22%3A%22Madalina%20Bran%22%7D%2C%7B%22id%22%3A%22100000826325914%22%2C%22name%22%3A%22Neagu%20Andrei%22%7D%2C%7B%22id%22%3A%22100000831410649%22%2C%22name%22%3A%22Titel%20Dragomir%22%7D%2C%7B%22id%22%3A%22100000839033451%22%2C%22name%22%3A%22Razvan%20Serban%22%7D%2C%7B%22id%22%3A%22100000859671546%22%2C%22name%22%3A%22Victor%20Arsene%22%7D%2C%7B%22id%22%3A%22100000861013770%22%2C%22name%22%3A%22Radu%20Cristian%20Vucea%22%7D%2C%7B%22id%22%3A%22100000884611797%22%2C%22name%22%3A%22Mariana%20Momciu%22%7D%2C%7B%22id%22%3A%22100000890356464%22%2C%22name%22%3A%22Marginean%20Calin%20Nicolae%22%7D%2C%7B%22id%22%3A%22100000902726109%22%2C%22name%22%3A%22Casandra%20Miruna%22%7D%2C%7B%22id%22%3A%22100000904316133%22%2C%22name%22%3A%22Ariadna%20Dobrin%22%7D%2C%7B%22id%22%3A%22100000913795705%22%2C%22name%22%3A%22Razvan%20Taisei%20Costache%22%7D%2C%7B%22id%22%3A%22100000924497565%22%2C%22name%22%3A%22Alina-Mihaela%20Muntean%22%7D%2C%7B%22id%22%3A%22100000939003522%22%2C%22name%22%3A%22Ciprian%20Cenan%22%7D%2C%7B%22id%22%3A%22100000967075456%22%2C%22name%22%3A%22Iuliana%20Iorga%22%7D%2C%7B%22id%22%3A%22100000970445029%22%2C%22name%22%3A%22Daniela%20Ghita%22%7D%2C%7B%22id%22%3A%22100000973105804%22%2C%22name%22%3A%22Dan%20Moruzan%22%7D%2C%7B%22id%22%3A%22100000977794173%22%2C%22name%22%3A%22Toma%20Viorica%22%7D%2C%7B%22id%22%3A%22100000981658963%22%2C%22name%22%3A%22Alexandra%20Iordache%22%7D%2C%7B%22id%22%3A%22100000996429909%22%2C%22name%22%3A%22Eduard%20Moise%22%7D%2C%7B%22id%22%3A%22100001016651608%22%2C%22name%22%3A%22Oana%20Oana%20Madalina%22%7D%2C%7B%22id%22%3A%22100001052307750%22%2C%22name%22%3A%22Nicu%20Buculei%22%7D%2C%7B%22id%22%3A%22100001052829526%22%2C%22name%22%3A%22Anca%20Stambuliu%22%7D%2C%7B%22id%22%3A%22100001053817391%22%2C%22name%22%3A%22Ana-Maria%20Galeteanu%22%7D%2C%7B%22id%22%3A%22100001056858507%22%2C%22name%22%3A%22Lazar%20Dinu%22%7D%2C%7B%22id%22%3A%22100001104162563%22%2C%22name%22%3A%22Ana%20Neacsa%22%7D%2C%7B%22id%22%3A%22100001116843817%22%2C%22name%22%3A%22Mimi%20Walter%22%7D%2C%7B%22id%22%3A%22100001125391592%22%2C%22name%22%3A%22Bogdan%20Albu%22%7D%2C%7B%22id%22%3A%22100001125553025%22%2C%22name%22%3A%22Alina%20Stoica%22%7D%2C%7B%22id%22%3A%22100001130534558%22%2C%22name%22%3A%22Canonisti%20Romania%22%7D%2C%7B%22id%22%3A%22100001143635982%22%2C%22name%22%3A%22Adina%20Munteanu%22%7D%2C%7B%22id%22%3A%22100001176610630%22%2C%22name%22%3A%22Bogdan%20Brinza%22%7D%2C%7B%22id%22%3A%22100001178043827%22%2C%22name%22%3A%22Andreea%20Marcu%22%7D%2C%7B%22id%22%3A%22100001179396169%22%2C%22name%22%3A%22Dcac%20Lab%22%7D%2C%7B%22id%22%3A%22100001233206506%22%2C%22name%22%3A%22Gina%20Iacob%22%7D%2C%7B%22id%22%3A%22100001250034089%22%2C%22name%22%3A%22Andrei%20Pascalopol%22%7D%2C%7B%22id%22%3A%22100001323126158%22%2C%22name%22%3A%22Rusu%20Oana%22%7D%2C%7B%22id%22%3A%22100001427671836%22%2C%22name%22%3A%22Kundor%20Kraft%22%7D%2C%7B%22id%22%3A%22100001431715758%22%2C%22name%22%3A%22Egl%C4%97%20Vaitmonait%C4%97%22%7D%2C%7B%22id%22%3A%22100001445931365%22%2C%22name%22%3A%22Olimpia%20Dordea%22%7D%2C%7B%22id%22%3A%22100001594165320%22%2C%22name%22%3A%22Mihaela%20Motaianu%22%7D%2C%7B%22id%22%3A%22100001600747815%22%2C%22name%22%3A%22Georgiana%20Dinu%22%7D%2C%7B%22id%22%3A%22100001604739251%22%2C%22name%22%3A%22Xin%20Liu%22%7D%2C%7B%22id%22%3A%22100001620518617%22%2C%22name%22%3A%22Mia%20Parascka%22%7D%2C%7B%22id%22%3A%22100001636028181%22%2C%22name%22%3A%22Carmen%20Stefan-Pelinel%22%7D%2C%7B%22id%22%3A%22100001636116573%22%2C%22name%22%3A%22Tudorache%20Cristian%22%7D%2C%7B%22id%22%3A%22100001636166982%22%2C%22name%22%3A%22Ion%20Barbu%22%7D%2C%7B%22id%22%3A%22100001665369640%22%2C%22name%22%3A%22Cristi%20Spiridon%22%7D%2C%7B%22id%22%3A%22100001683891776%22%2C%22name%22%3A%22Nastasia%20Veselia%22%7D%2C%7B%22id%22%3A%22100001706124927%22%2C%22name%22%3A%22Puiu%20Timofte%22%7D%2C%7B%22id%22%3A%22100001719070193%22%2C%22name%22%3A%22Agnieszka%20Ma%C5%82ocha%22%7D%2C%7B%22id%22%3A%22100001733701029%22%2C%22name%22%3A%22Amber%20Yu%22%7D%2C%7B%22id%22%3A%22100001771470914%22%2C%22name%22%3A%22Gabriel%20Sandulescu%22%7D%2C%7B%22id%22%3A%22100001780292083%22%2C%22name%22%3A%22Bogdan%20Burducel%22%7D%2C%7B%22id%22%3A%22100001871057725%22%2C%22name%22%3A%22Ramunas%20Stadalnykas%22%7D%2C%7B%22id%22%3A%22100001908850313%22%2C%22name%22%3A%22Bogdan%20Badescu%22%7D%2C%7B%22id%22%3A%22100001912981126%22%2C%22name%22%3A%22Diana%20Lazarescu%22%7D%2C%7B%22id%22%3A%22100001974892231%22%2C%22name%22%3A%22Barbulescu%20Anca%22%7D%2C%7B%22id%22%3A%22100002015935106%22%2C%22name%22%3A%22Gabriel%20Chitu%22%7D%2C%7B%22id%22%3A%22100002046663589%22%2C%22name%22%3A%22Vasilescu%20Stefania%22%7D%2C%7B%22id%22%3A%22100002092842035%22%2C%22name%22%3A%22Rotaru%20Valentin-Matei%22%7D%2C%7B%22id%22%3A%22100002095173344%22%2C%22name%22%3A%22Toulouse%20Lautrec%20Man%22%7D%2C%7B%22id%22%3A%22100002109496720%22%2C%22name%22%3A%22Andreea%20Chiru%22%7D%2C%7B%22id%22%3A%22100002129340355%22%2C%22name%22%3A%22Lidia%20Ivanescu%22%7D%2C%7B%22id%22%3A%22100002179908469%22%2C%22name%22%3A%22Alexandra%20Pasca%22%7D%2C%7B%22id%22%3A%22100002182268081%22%2C%22name%22%3A%22Daniel%20Adrian%20Mandache%22%7D%2C%7B%22id%22%3A%22100002182865907%22%2C%22name%22%3A%22Ochisiurechi%20Ro%22%7D%2C%7B%22id%22%3A%22100002339546233%22%2C%22name%22%3A%22Ana-Maria%20Leonte%22%7D%2C%7B%22id%22%3A%22100002397566209%22%2C%22name%22%3A%22Sharon%20Sharona%22%7D%2C%7B%22id%22%3A%22100002421088821%22%2C%22name%22%3A%22Adina%20Felea%22%7D%2C%7B%22id%22%3A%22100002514439069%22%2C%22name%22%3A%22Alex%20Lezeu%22%7D%2C%7B%22id%22%3A%22100002540766027%22%2C%22name%22%3A%22Alex%20Mirea%22%7D%2C%7B%22id%22%3A%22100002574810185%22%2C%22name%22%3A%22Eugen%20Mitrita%22%7D%2C%7B%22id%22%3A%22100002629317470%22%2C%22name%22%3A%22Fotografi%20Romani%20de%20Pretutindeni%22%7D%2C%7B%22id%22%3A%22100002757482378%22%2C%22name%22%3A%22Roxana%20Theo%22%7D%2C%7B%22id%22%3A%22100002785212764%22%2C%22name%22%3A%22Diana%20Dana%22%7D%2C%7B%22id%22%3A%22100002815253119%22%2C%22name%22%3A%22Mohammad%20Katebiyan%22%7D%2C%7B%22id%22%3A%22100002823834331%22%2C%22name%22%3A%22Bogdan%20A-Popei%22%7D%2C%7B%22id%22%3A%22100003003974301%22%2C%22name%22%3A%22Tu%C8%9Bi%20Garoi%22%7D%2C%7B%22id%22%3A%22100003059434541%22%2C%22name%22%3A%22Mirela%20Catargiu%22%7D%2C%7B%22id%22%3A%22100003181275346%22%2C%22name%22%3A%22Ducu%20Stefan%22%7D%2C%7B%22id%22%3A%22100003189608910%22%2C%22name%22%3A%22Sanda%20Baban%22%7D%2C%7B%22id%22%3A%22100003218375425%22%2C%22name%22%3A%22Ioana%20Pop%22%7D%2C%7B%22id%22%3A%22100003247371439%22%2C%22name%22%3A%22Ovidiu%20Gheorghe%22%7D%2C%7B%22id%22%3A%22100003288854495%22%2C%22name%22%3A%22Elena%20Ida%22%7D%2C%7B%22id%22%3A%22100003312410960%22%2C%22name%22%3A%22Marian%20Nedelcu%22%7D%2C%7B%22id%22%3A%22100003476636405%22%2C%22name%22%3A%22Razel%20Daz%22%7D%2C%7B%22id%22%3A%22100003501863083%22%2C%22name%22%3A%22Constantin%20Busaga%22%7D%2C%7B%22id%22%3A%22100003770720893%22%2C%22name%22%3A%22Alex%20Buga%22%7D%2C%7B%22id%22%3A%22100003771482186%22%2C%22name%22%3A%22Izrazdealternmundo%20Maza%22%7D%2C%7B%22id%22%3A%22100003834237563%22%2C%22name%22%3A%22Ionut%20Bazavan%22%7D%2C%7B%22id%22%3A%22100003943863829%22%2C%22name%22%3A%22Dorin%20Nitu%22%7D%2C%7B%22id%22%3A%22100004295171370%22%2C%22name%22%3A%22Catalina%20Turcu%22%7D%2C%7B%22id%22%3A%22100004378419862%22%2C%22name%22%3A%22Elena%20Martinez%22%7D%2C%7B%22id%22%3A%22100004425010204%22%2C%22name%22%3A%22Martha%20Otwinowski%22%7D%2C%7B%22id%22%3A%22100004972152106%22%2C%22name%22%3A%22Sasha%20Costel%22%7D%2C%7B%22id%22%3A%22100004977842994%22%2C%22name%22%3A%22George%20Garoi%22%7D%5D&facebook_id=100001416751627&";
	NSData *postData = [postStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	//NSLog(@"RCHttp scriptsPath: %@", scriptsPath);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://www.kinecto.ro/jagermeister-game-center/api/user/friends"]];
    [request setHTTPMethod:@"PUT"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
	
	[self download:request];
}




- (void)download:(NSURLRequest *)request {
	NSLog(@"HTTPReqest startDownload");
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    // Test the validity of the connection object.
    NSAssert (connection != nil, @"Failure to create URL connection.");
}





#pragma mark NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"RCHttp didReceiveResponse");
	receivedData = [NSMutableData data];
}

// Called when a chunk of data has been downloaded.
- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data {
    NSLog(@"RCHttp didReceiveData");
	[receivedData appendData:data];
	//NSLog(@"RCHttp didReceiveData with %d bytes", [receivedData length]);
	
//	[self performSelectorOnMainThread:@selector(onRCHttpProgress) 
//                           withObject:nil 
//                        waitUntilDone:NO];
}
/*- (NSURLRequest *)connection: (NSURLConnection *)inConnection
             willSendRequest: (NSURLRequest *)inRequest
            redirectResponse: (NSURLResponse *)inRedirectResponse;
{
    NSLog(@"redirectResponse %@", inRedirectResponse);
	return inRequest;
//	if (inRedirectResponse) {
//        NSMutableURLRequest *r = [[request mutableCopy] autorelease]; // original request
//        [r setURL: [inRequest URL]];
//        return r;
//    } else {
//        return inRequest;
//    }
}*/

- (void)connectionDidFinishLoading:(NSURLConnection *)conn {
    
    result = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
	NSLog(@"RCHttp connectionDidFinishLoading %@", result);
//	[self performSelectorOnMainThread:@selector(onRCHttpComplete) 
//                           withObject:nil 
//                        waitUntilDone:NO];
}

// Forward errors to the delegate.
- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error {
    
	if ([error code] == kCFURLErrorNotConnectedToInternet) {
		NSLog(@"HTTPRequst connection didFail - not connected to the internet");
        // If we can identify the error, we can present a more precise message to the user.
//        [self performSelectorOnMainThread:@selector(onHTTPConnectionError) 
//                               withObject:nil
//							waitUntilDone:NO];
    }
	else {
		NSLog(@"HTTPRequst connection didFail - url not found");
        // otherwise handle the error generically
//        [self performSelectorOnMainThread:@selector(onRCHttpError)
//                               withObject:nil
//							waitUntilDone:NO];
    }
}

// Disable caching so that each time we run this app we are starting with a clean slate.
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
				  willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    return nil;
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
		[challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
	
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}




#pragma mark Delegate stuff

- (void) onRCHttpProgress {
	if ([delegate respondsToSelector:@selector(onRCHttpProgress:)])
		[delegate performSelector:@selector(onRCHttpProgress:) withObject:self];
}
- (void) onRCHttpComplete {
	NSLog(@"onRCHttpComplete %@", result);
	if ([delegate respondsToSelector:@selector(onRCHttpComplete:)])
		[delegate performSelector:@selector(onRCHttpComplete:) withObject:result];
}
- (void) onRCHttpError {
	NSLog(@"onRCHttpError");
	if ([delegate respondsToSelector:@selector(onRCHttpError)])
		[delegate performSelector:@selector(onRCHttpError)];
}
- (void) onHTTPConnectionError {
	NSLog(@"onRCHttpError");
	if ([delegate respondsToSelector:@selector(onHTTPConnectionError)])
		[delegate performSelector:@selector(onHTTPConnectionError)];
}



- (void) downloadStarted {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void) downloadEnded {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


@end
