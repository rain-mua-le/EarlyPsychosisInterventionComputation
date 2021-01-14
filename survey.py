#This Python program will output a survey and have users input their responses and record the responses in a file. The program will then create a Prolog program to track in which stage of psychosis the user is in

import os
import pickle

def getInput():
    """
    This function receives the user's input and bound checks it
    """

    num = input("Type in a rating (1-5) and press ENTER: ")
    while num < 0 and num > 5:
        num = input("Invalid rating. Please try again (1-5): ")
    return num

if os.path.isfile("results.p"):
    infile = open("results.p", "rb")
    results = pickle.load(infile)
    infile.close()
else:
    results = {"one": [], "two": [], "three": [], "four": [], "five": [], "six": [], "seven": [], "eight": [], "nine": []}

#Survey
print("Please rate how much you agree with the following statements with 1 being strongly disagree and 5 being strongly agree.")
print("-------------------------------------------------------------------")
print("I had felt down or depressed consistently in the last week.")
results["one"].append(getInput())
print("I had felt anxious or uneasy consistently in the last week.")
results["two"].append(getInput())
print("I had difficulty thinking or concentrating in the last week.")
results["three"].append(getInput())
print("I had withdrew from social activity in the last week.")
results["four"].append(getInput())
print("I had felt more irritable over the last week.")
results["five"].append(getInput())
print("I had felt suspicious or paranoid over the last week.")
results["six"].append(getInput())
print("I had strange perceptual experiences in the last week.")
results["seven"].append(getInput())
print("I had trouble maintaining daily living tasks over the last week.")
results["eight"].append(getInput())
print("I had thoughts that my thoughts are being controlled in the last week.")
results["nine"].append(getInput())

#Save results to file
outfile = open("results.p", "wb")
pickle.dump(results, outfile)
outfile.close()

#Create prolog program
prologProgram = open("list.pl", "w")
for key, value in results.items():
    string = ""
    for elements in value:
        string += str(elements) + ","
    prologProgram.write(key + "([" + string[: -1] + "]).\n")
