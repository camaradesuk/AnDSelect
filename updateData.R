source("R/syrfDBReader.R")
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
updateData(syrfConnection = syrfConnection,
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

print(paste0(' --------- ', date(), ' --------- '))
setwd("/home/jliao/workspace/ReLiSyR_Update")
print(getwd())
updateData(syrfConnection = syrfConnection,
           myProjectId = invivoProjectId,
           fileFolder = fileFolder,
           version = version,
           mySQLCon = mySQLCon,
           mySQLTableName = invivoMySQLTableName,
           googleSheetId = googleSheetId,
           logSheetName = invivoLogSheetName,
           diseaseSheetName = diseaseSheetName,
           drugSheetName = drugSheetName)

source('R/relisyrScoring.R')

CreateProgressSummary(syrfConnection, clinicalProjectId, invivoProjectId,
                                  mySQLCon, clinicalSQLTableName,invivoSQLTableName,
                                  googleSheetId,
                                  diseaseOfInterestSheetName = diseaseOfInterestSheetName,
                                  drugOfInterestSheetName = drugOfInterestSheetName,
                                  diseaseSheetName = diseaseSheetName,
                                  drugSheetName = drugSheetName,
                                  scoreRuleSheetName = scoreRuleSheetName,
                                  progressSummarySheetName = progressSummarySheetName,
                                  clinicalProjectProgresRangeLine = clinicalProjectProgresRangeLine,
                                  invivoProjectProgresRangeLine = invivoProjectProgresRangeLine)
