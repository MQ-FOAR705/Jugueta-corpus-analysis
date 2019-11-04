# Package and library required for this work
if(!require(tm)){
install.packages("tm",repos = "http://cran.us.r-project.org")
library(tm)
}
# The file path to where the .txt files are stored
folder <- "~/corpus-analysis/data/corpus_output/titles"
# Lists the files in the path
filelist <- list.files(path=folder, pattern="*.txt")
# Creates a path to all .txt files in path folder
filelist <- paste(folder, "/", filelist, sep="")
# Reads text from .txt files
readtext <- lapply(filelist, FUN = readLines)
# Collapses elements into one element
corpus <- lapply(readtext, FUN = paste, collapse=" ")
# Convert corpus to something tm package can use
VCorpus <- Corpus(VectorSource(corpus))
# Using a new corpus name 'VCorpus_clean to keep the original VCorpus object untouched
# Strip whitespace from corpus
VCorpus_clean <- tm_map(VCorpus, stripWhitespace)
# Convert corpus to lower case
VCorpus_clean <- tm_map(VCorpus_clean, content_transformer(tolower))
# Remove German stop words
VCorpus_clean <- tm_map(VCorpus_clean, removeWords, stopwords("german"))
# Remove punctuation
VCorpus_clean <- tm_map(VCorpus_clean, removePunctuation)
# Remove numbers
VCorpus_clean <- tm_map(VCorpus_clean, removeNumbers)
# Remove "„" and "—"from corpus
VCorpus_clean <- tm_map(VCorpus_clean, removeWords, c("„","—"))
# Create Term-Document Matrix
dtm <- TermDocumentMatrix(VCorpus_clean)
# To get the list of frequency of words
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing=TRUE)
d <- data.frame(word = names(v), freq=v)
# Output dataframe as a .csv file
write.csv(d, file=paste0("~/corpus-analysis/data/wordfreq/titles/titlewordfrequency-", Sys.time(), ".csv"), row.names=FALSE)
