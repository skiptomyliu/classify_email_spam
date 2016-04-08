#!/usr/bin/python

import email
import os

content_list = []


SCRUBBED_SPAM_FOLDER = "scrubbed_spam"
SCRUBBED_HAM_FOLDER = "scrubbed_ham"

HAM_FOLDER = "easy_ham"
SPAM_FOLDER = "spam_2"
SPAM_CT_FOLDER  = "ct"
SPAM_TEST_FOLDER = "test"
SPAM_TRAIN_FOLDER = "train"

def listdir_fullpath(d):
    return [os.path.join(d, f) for f in os.listdir(d)]  


def scrub(input_folder, output_folder):
    for file_name in listdir_fullpath(input_folder):
        with open(file_name, 'r') as myfile:
            data = myfile.read()
            email_msg =  email.message_from_string(data)
            with open("{scrubbed_folder}/{file}.scrubbed".format(
                                                        scrubbed_folder=output_folder, 
                                                        file=os.path.basename(file_name)), "w") as scrubbed_file:


                # CONVERT TO RECURSIVE METHOD LATER:
                msg = email_msg.get_payload()
                if isinstance(msg, str):
                    scrubbed_file.write(msg)
                else:
                    for msg in msg:
                        if type(msg.get_payload()) == str:
                            scrubbed_file.write(msg.get_payload())
                        else:
                            if type(msg.get_payload()) == str:
                                scrubbed_file.write(msg.get_payload())


scrub(SPAM_FOLDER, SCRUBBED_SPAM_FOLDER)
scrub(HAM_FOLDER, SCRUBBED_HAM_FOLDER)

