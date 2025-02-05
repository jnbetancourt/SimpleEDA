# SimpleEDA

[![Build Status](https://travis-ci.com/jnbetancourt/SimpleEDA.svg?token=i1Xafx7oTZa1uneJDk3q&branch=main)](https://travis-ci.com/jnbetancourt/SimpleEDA)

## Overview
The SimpleEDA R package can be used to perform an Exploratory Data Analysis (EDA) 
of a data set. This package is intended to simplify the EDA that a statistician 
would perform when analyzing a data set with the intention of constructing a regression 
model.

Please note that this package is called SimpleEDA not AutomaticEDA! The package 
presents the results, but does no interpretation, and may not perform all of the 
necessary tests based on the properties of the data set. For that, a trained 
statistician would be required.

## Sample Usage

```r
library(simpleEDA)

data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c('automatic', 'manual'))
mtcars$vs <- factor(mtcars$vs, labels = c('v-shaped', 'straight'))

simpleEDA(data_frame = mtcars, response_column_name = 'mpg',
          predictor_column_names = c('hp', 'wt', 'vs', 'am'))
```

## Instruction to set up Git
1) Go to https://git-scm.com/downloads and download and install git
2) Go to github.com and create a new account
3) Follow the instructions at https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address to set up your email address
4) Open the Terminal app on Mac or the Command Line app on Windows and type:
`git config --global user.name "<YOUR NAME>"` where `<YOUR NAME>` is replaced by
your name. This will be the name that gets attached to any commits that you write, 
and can either be your name or GitHub user name, based on your preference. 


## Importing the Project into RStudio
1) Click File -> New Project
2) Select “Version Control”
3) Select “Git”
4) For “Repository URL” type: https://github.com/jnbetancourt/SimpleEDA.git
5) For "subdirectory" choose the location on your computer where you want to store
the project files
5) There will be a prompt to enter your GitHub password
6) This should create a directory called `SimpleEDA` on your computer with the project files.

## Instructions to Get New Changes to Local RStudio
1) Open Project
2) Go to Tools -> Version Control -> Pull Branches

Note: If there are conflicts it will open a merge dialog where you can resolve them

## Instructions to Push Changes to Git
1) Make changes to files in the SimpleEDA folder
2) In RStudio select Tools->Version Control->Commit
3) This will open a dialog box that lists all the files that you have made changes
to. Click the checkbox next to all of the files that you want to push changes for,
and type a short description of the changes that you made in the "Commit Message"
box.
![commit_msg](docs/commit_msg.png)
4) Click the button that says "Commit"
5) Click the button that says "Pull"
6) If someone else has made changes to the same files as you, there will be a message saying
that there is a conflict. You can use that dialog to open a merge tool that allows you to
merge your changes with the ones on GitHub.
7) Click the button that says "Push"


## How to Build the R Package
You should rebuild the R package after you have made changes to the source code R
files in the `R/` directory.

From inside the RStudio Project, go to the R Console and run:

```
# This only needs to be run one time to install the necessary packages
install.packages(c("devtools", "roxygen2", "testthat", "knitr"))


library(devtools)
devtools::document()
devtools::build(path = "./builds")
```

This will build a new `.tar.gz` file in the `builds` directory that can be used
to install the SimpleEDA package.


## Installing and Loading SimpleEDA Package

In order to run the functions in the SimpleEDA package, open the RStudio project
and go to the R Console. Then run:

```
# This only needs to be run one time to install the devtools package
install.packages("devtools")

devtools::install()
library(simpleEDA)
```
