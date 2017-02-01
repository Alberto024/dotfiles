#!/usr/bin/python3

import re
import sys

def getIDs(FILE):
    with open(FILE,'r') as F:
        Data = F.readlines()
    formattedData = []
    for line in Data:
        spl = line.strip('\n').split('\t')
        formattedData.append([spl[0],spl[1]])
    return formattedData

def getGOs(FILE):
    with open(FILE,'r') as F:
        Data = F.readlines()[1:]
    formattedData = {}
    stuff={}
    GOre = re.compile(r'GO:0*(\d*)')
    for line in Data:
        spl = line.strip('\n').split('\t')
        reMatches = re.findall(GOre,spl[1])
        formattedData[str(spl[0])] = reMatches
    return formattedData

def gatherData(idFile,goFile):
    Names = getIDs(idFile)
    GOs = getGOs(goFile)
    formattedData = {}
    for gene in Names:
        try:
            formattedData[gene[0]] = GOs[gene[1]]
        except KeyError:
            pass
    return formattedData

def writeData(idFile,goFile,toFile):
    Data = gatherData(idFile,goFile)
    formattedData = []
    for key in Data:
        Lines = ['{} = {}'.format(key,value) for value in Data[key]]
        for line in Lines:
            formattedData.append(line)
    goodData = '\n'.join(formattedData)
    with open(toFile,'w') as F:
        F.write(goodData)

GOfile = '/home/alberton/Downloads/Julie/IPS_uniProt2GO.txt'
IDfile = '/home/alberton/Downloads/Julie/IPS_IDs2uniprot.txt'
goodFile = '/home/alberton/Downloads/Julie/GoodData.txt'
#GOfile = sys.argv[1]
#IDfile = sys.argv[2]
#goodFile = sys.argv[3]

if __name__ == '__main__':
    writeData(IDfile,GOfile,goodFile)
