//
//  ChildModel.m
//  RedBourne
//  Sample childMode, further modification needed.
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import "ChildModel.h"

@implementation ChildModel

-(id)init {
    self = [super init];
    return self;
}

-(id)initWithFirstName:(NSString *)aFirstName
               surName:(NSString *)aSurName
                   crn:(NSString *)aCrn
           dateOfBirth:(NSString *)aDateOfBirth
        medicareNumber:(NSString *)aMedicareNumber
      registrationDate:(NSString *)aRegistrationDate
        countryOfBirth:(NSNumber *)aCountryOfBirth
            disability:(NSString *)theDisability
            thumbnail:(NSString *)aThumbnail
              filename:(NSString *)aFilename
{
    self = [super init];
    if (self)
    {
        self.firstName = aFirstName;
        self.surName = aSurName;
        self.crn = aCrn;
        self.dateOfBirth = aDateOfBirth;
        self.medicareNumber = aMedicareNumber;
        self.registrationDate = aRegistrationDate;
        self.countryOfBirth = aCountryOfBirth;
        self.thumbnail = aThumbnail;
        self.filename = aFilename;
        self.disability = theDisability;
    }
    return self;
};

-(NSString *)fullName{
    if (self.middleName == nil) {
        return [@[self.firstName, self.surName] componentsJoinedByString:@" "];
    } else {
        return [@[self.firstName, self.middleName, self.surName] componentsJoinedByString:@" "];
    }
}




+(void)saveChild:(ChildModel *)aChild{

}



@end
