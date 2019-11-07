# FOAR705 Digital Humanities Proof of Concept: Corpus Word Frequency Analysis for German Texts

# Table of Contents
- [Background](#background)
- [Requirements](#requirements)
- [Instructions](#instructions)
- [Language](#language)
- [Issues](#issues)

## Background

As a Masters of Research student at Macquarie University, the Digital Humanities unit (FOAR705) posed a several questions on how I should perform my research. My proposed research centres around analysing text from a large corpus. The analysis would then be used to identify themes present within the corpus, upon which theories could be constructed.

This Proof of Concept evolved after I had identified a number of 'pains'  in the Scoping Process, associated with being a research student. The list intially started very broadly.

### Pains and Scoping
- Time Management
- Note Taking Management
- Reference Management

All these pains share potential solutions that are based in making the research process more efficient.

### Elaboration

When more time was spent on the research project, it became clear that I would benefit addressing Time Management or Note Taking Management. As part of the Elaboration process, I built on what could help alleviate some pains. 

#### Finding of sources and downloading articles from newspaper archive

This was not necessarily a pain reliever, but it was a necessary part of my research.

#### Textual Analysis

Instead of thoroughly reading all the articles repetively, I found the software solution Voyant Tools which could analyse a corpus of text and provide word frequency lists and word clouds. A solution like this would dramatically reduce the time spent analysing text.

#### Note organisation

Two solutions were considered here. In the end, I chose to save notes and as plain text files.

### Design

The more I refined my Proof of Concept, the more apparent it was that Textual Analysis would be the pain reliever that would make my research process more efficient. I subsequently created some User Stories that helped me break down the process I would use in this research project. I identified three main phases.

- Saving the articles as .txt files
- Loading all .txt files into Voyant Tools
- Running analysis in Voyant Tools and process findings

I tested all these User Stories independent and they all manually worked. It was only until I tried to automate the process of getting data in or out of Voyant Tools, that I began to think of alternative solutions. Once I could not find an API for Voyant Tools, I decided I would instead use R for Textual Analysis. 

I also identified a potential problem when saving newspaper articles as .txt files. I would need to be able to extract specific text, such as titles or body text when performing textual analysis. Simply loading all .txt into a script that performs textual analysis could also incorporate information such as dates, subtitles and other non-relevant information. Thus, when saving the articles, I decided upon a structure that would dictate what information would be stored where:

Line 1 - Date\
Line 2 - Title\
Line 3 - Subtitle\
Line 4 - Author Information\
Line 5 - Blank\
Line 6 - Body Text
    
More will be explained later regarding this.

## Requirements 

## Instructions

Corpus Word Frequency Analysis requires the programming language R and access to a Unix Shell Program.

### R

If you need to install R, please visit https://www.r-project.org and following the instructions.

### Terminal

Users with Mac OSX can launch the Terminal application by using Spotlight Search (shortcut is command + spacebar) to find it.

Users with Windows can download Git for Windows as their Unix Shell Program. Please visit https://gitforwindows.org for instructions.

Users with Linux can access Unix Shell Program by clicking on the Activities item on the top left of the screen and type Terminal.

### Installation

- Download the ``corpus-analysis`` directory from this repository and move it into the ``User`` directory on your computer.

### Loading a corpus

- Move your the ``.txt`` files that comprise your corpus into the ``data/corpus_input`` directory. I have pre-loaded a corpus of German newspaper articles in this directory already in the event that you wish to test the workflow. If you are analysing a new corpus, please ensure that you remove all irrelevant ``.txt`` files from the ``data/corpus_input`` folder, lest they are analysed as part of your corpus. You can import multiple .txt files.

It is important that the corpus is saved in the following format:

Line 1 - Date\
Line 2 - Title\
Line 3 - Subtitle\
Line 4 - Author Information\
Line 5 - Blank\
Line 6 - Body Text

If the .txt files are not saved in this format, the Unix Shell Bash Scripts will not be extracting the correct information. This has been designed in a way that does not alter the original corpus, but rather, the scripts create new .txt files for analysis.

### Running the script

- Open your the Terminal program on your machine and navigate to the ``corpus-analysis/bin`` directory. If you have corrected placed the ``corpus-analysis`` folder in the ``User`` folder, then you should be able to use this Terminal code to navigate there.

``cd corpus-analysis/bin``

- If it is the first time you are running this package, then simply type in the command

``bash go.sh``

If it is not the first time you are running this package, then use the command ``delete.sh`` to clear the ``data/corpus_output`` directories, reading for a clean run.

It will then analyse the corpus, outputting the data in a .csv format into the ``data/wordfreq`` directories. ``bash go.sh`` will analyse body text, titles and titles&subtitles. If you want to analyse body text, titles or titles&subtitles specifically, you can use the following codes.

``bash extractbody.sh`` for body text only.\
``bash extracttitles.sh`` for titles only.\
``bash extracttitlessubtitles.sh`` for titles and subtitles only.

### Structure

The ``corpus-analysis`` folder in the repository is the folder that contains all the necessary scripts and folders to run this Proof of Concept. Within the ``corpus-analysis`` are two subdirectories: ``bin`` and ``data``. ``bin`` contains five shell bash scripts and three R scripts.

### Shell scripts

#### ``go.sh``

Is the primary shell script that triggers the entire process. 

#### ``extractbody.sh``

Extracts text from line 6 (body text) down in the selected corpus and creates new .txt files in data/corpus_output/body directory.

#### ``extracttitles.sh``

Extracts text from line 2 (title text) in the selected corpus and creates new .txt files in data/corpus_output/titles directory.

#### ``extracttitlessubtitles.sh``

Extracts text from lines 2 and 3 (title text) in the selected corpus and creates new .txt files in data/corpus_output/titlessubtitles directory.

#### ``delete.sh``

Deletes .txt files in the data/corpus_output directories.

#### ``wordfreq_body.R``

Analyses .txt files in data/corpus_output/body directory and creates a list of words and their frequency in a .csv file located in the data/wordfreq/body directory.

#### ``wordfreq_titles.R``

Analyses .txt files in data/corpus_output/titles directory and creates a list of words and their frequency in a .csv file located in the data/wordfreq/titles directory.

#### ``wordfreq_titlessubtitles.R``

Analyses .txt files in data/corpus_output/titlessubtitles directory and creates a list of words and their frequency in a .csv file located in the data/wordfreq/titlessubtitles directory.

## Results

To test the frequency analysis component of this package (the R scripts), I used the first verse and chorus of Helene Fischer's song 'Atemlos durch die Nacht'. The lyrics are listed below.

```Wir zieh'n durch die Straßen und die Clubs dieser Stadt
Das ist unsre Nacht, wie für uns beide gemacht, oho oho
Ich schließe meine Augen, lösche jedes Tabu
Küsse auf der Haut, so wie ein Liebes-Tattoo, oho, oho

Was das zwischen uns auch ist
Bilder die man nie vergisst
Und dein Blick hat mir gezeigt
Das ist unsre Zeit

Atemlos durch die Nacht
Bis ein neuer Tag erwacht
Atemlos einfach raus
Deine Augen zieh'n mich aus

Atemlos durch die Nacht
Spür' was Liebe mit uns macht
Atemlos, schwindelfrei
Großes Kino für uns zwei

Wir sind heute ewig, tausend Glücksgefühle
Alles was ich bin, teil' ich mit dir
Wir sind unzertrennlich, irgendwie unsterblich
Komm nimm meine Hand und geh mit mir
```

I had manually counted the frequency of each of the words and which resulted in this list (of only the words that occured 2 or more times).

4 - atemlos\
4 - oho\
3 - nacht\
2 - ziehn\
2 - unsre\
2 - augen

After running the R script, a .csv file was created in the ``wordfreq/body`` directory. Below is a screenshot of the result.

![example csv file](https://github.com/MQ-FOAR705/jugueta-corpus-analysis/blob/master/images/unittest1.png)

The result matched the manual count.

## Language

As mentioned in the title, this package was designed to analyse German language texts specifically. Analysing texts in English may still render some results, however, the R Script was written to identify German words.

## Issues

There are some known bugs relating to the running of this package. However, after some testing, it appears that they have a negligible effect on the analysis performed. The bugs include

- R Script warning ``transformation drops documents``. I have tried the best to my ability to debug this issue but have had little success so far. As far as I can tell, no documents were dropped when performing analysis.
- R Script is not able to remove some German punctuation characters. This includes ``„`` and ``—``. It seems that the command ``removePunctuation`` is not able to remove German punctuation.
