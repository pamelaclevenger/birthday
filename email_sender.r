# Email Sender
# Created by Pamela Clevenger
# Created 2018-07-14
# Last Updated 2018-07-14

# Sends email to birthday person, with attached pdf file.


# Load Libraries
library(lubridate) # For date functions
library(tidyverse) # For tidy functions like piping
library(rmarkdown) # So that I can call a function to render the markdown file
library(gmailr) # For scheduling r markdown emails
#  How-to guide:  https://www.r-bloggers.com/scheduling-r-markdown-reports-via-email/
#  Documentation: https://cran.r-project.org/web/packages/gmailr/gmailr.pdf

# today's date
today <- today()
# today <- as.POSIXct("2018-05-27", tz = "UTC", format = '%Y-%m-%d') # for debugging

# Who's birthday is it
if (month(today) == 1 && day(today) == 21) {
  name = 'KATIE'
  birthday = as.POSIXct("1990-01-21 2:00:00", tz = "UTC", format = '%Y-%m-%d %H:%M')
  email = 'kejacobsen@gmail.com'
} else if (month(today) == 9 && day(today) == 6) {
  name = 'MARY'
  birthday = as.POSIXct("1960-09-06 1:00:00", tz = "UTC", format = '%Y-%m-%d %H:%M')
  email = 'marybeth2612@gmail.com'
} else if (month(today) == 5 && day(today) == 27) {
  name = 'JOHN'
  birthday = as.POSIXct("1980-05-27 1:00:00", tz = "UTC", format = '%Y-%m-%d %H:%M')
  email = 'john.clevenger@gmail.com'
} else {
  name = 'TEST'
  birthday = as.POSIXct("2014-02-03 1:00:00", tz = "UTC", format = '%Y-%m-%d %H:%M')
  email = 'pamela@pinterest.com'
}

rmarkdown::render('/Users/pamela/Birthday/birthday_pdf_.Rmd')

# Send email
text_msg <-
mime() %>%
  to(email) %>%
  from("pamela.glosson@gmail.com") %>%
  subject(paste0("HAPPY BIRTHDAY,  ",name, "!")) %>%
  attach_file("birthday_pdf.pdf")

send_message(text_msg)
