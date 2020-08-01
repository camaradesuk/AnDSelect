source("R/syrfConfigure.R")
source("R/syrfDBReader.R")
source("R/jtapiConfigure.R")
source('R/ioeAPI.R')
source('R/syrfIoeHelper.R')
source('R/calculateMLPerformance.R')
source('R/dictionaryValidationHelpers.R')
source("R/functions.R")

source('R/configure.R')

library(googlesheets4)
library(AutoAnnotation)
library(DBI)
library(RMySQL)
library(tidyr)
library(dplyr) 

print(paste0(' --------- ', date(), ' --------- '))
setwd("/home/jliao/workspace/ReLiSyR_Update")
print(getwd())
source('R/configure.R')
produceData(syrfConnection = syrfConnection,
            myProjectId = clinicalProjectId,
            errorAnalysisProjectId = errorAnalysisProjectId,
            fileFolder = fileFolder,
            version = version,
            mySQLCon = mySQLCon,
            mySQLTableName = clinicalMySQLTableName,
            googleSheetId = googleSheetId,
            logSheetName = clinicalLogSheetName,
            diseaseSheetName = diseaseSheetName,
            drugSheetName = drugSheetName)

