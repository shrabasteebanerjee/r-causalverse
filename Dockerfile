FROM rocker/tidyverse
LABEL maintainer="Shrabastee Banerjee <shrabastee.b@gmail.com>"

# Install other libraries
RUN install2.r --error \
        hdm grf broom cem stargazer
