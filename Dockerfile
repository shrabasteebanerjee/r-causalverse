FROM rocker/tidyverse

# Install other libraries
RUN install2.r --error \
        hdm grf broom cem stargazer xtable quantreg caret DescTools gbm car doParallel multcomp cowplot fixest Rcpp gtsummary lfe
RUN mkdir /home/rstudio/data \
&& chown rstudio:rstudio /home/rstudio/data \
&& chmod -R ugo+rw /home/rstudio/data \
&& usermod -aG sudo rstudio
