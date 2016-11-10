#!/bin/perl

use Archive::Zip;   # imports

$obj = Archive::Zip->new();   # new instance
use Email::Send::SMTP::Gmail;

@files = ('C:\Users\Komal Varu\Desktop\prac3a_128.odt');   # files to store

foreach $file (@files) {
    $obj->addFile($file);   # add files
}

if ($obj->writeToFileNamed('abc.zip') != AZ_OK) {  # write to disk
    print "Error in archive creation!";
} else {
    print "Archive created successfully!";
}

my $mail=Email::Send::SMTP::Gmail->new( -smtp=>'gmail.com',
                                        -login=>'romanee.solanki@gmail.com',
                                        -pass=>'add_your_pass');
$mail->send(-to=>'komalvaru96@gmail.com',
            -subject=>'Hello!',
            -verbose=>'1',
            -body=>'find attachment here',
            -attachments=>'C:\Users\Komal Varu\Desktop\abc.zip');
$mail->bye;
