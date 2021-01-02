FROM rocker/tidyverse
LABEL maintainer="Shrabastee Banerjee <shrabastee.b@gmail.com>"

# Install other libraries
RUN install2.r --error \
        hdm grf broom cem stargazer
RUN mkdir /home/rstudio/data \
	&& chown rstudio:rstudio /home/rstudio/data \
	&& chmod -R ugo+rw /home/rstudio/data \
	&& usermod -aG sudo rstudio
