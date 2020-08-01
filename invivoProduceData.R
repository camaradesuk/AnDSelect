source("R/syrfConfigure.R")
source("R/syrfDBReader.R")
source("R/jtapiConfigure.R")
source('R/ioeAPI.R')
source('R/syrfIoeHelper.R')
source('R/calculateMLPerformance.R')
source('R/dictionaryValidationHelpers.R')
source("R/functions.R")
source('R/syrfDataExtractors.R')

library(dplyr)
library(tidyr)

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
produceData(syrfConnection = syrfConnection,
                  myProjectId = invivoProjectId,
                  fileFolder = fileFolder,
                  version = version,
                  mySQLCon = mySQLCon,
                  mySQLTableName = invivoMySQLTableName,
                  googleSheetId = googleSheetId,
                  logSheetName = invivoLogSheetName,
                  diseaseSheetName = diseaseSheetName,
                  drugSheetName = drugSheetName)
