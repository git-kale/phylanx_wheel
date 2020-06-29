FROM stellargroup/phylanx_base:prerequisites
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update                                                                      && \
    apt-get install --yes --no-install-recommends curl                                  && \
    curl https://media.githubusercontent.com/media/git-kale/phylanx_wheel/master/phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl -o phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl &&\
    pip3 install phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl                              && \
                                                                                           \       
WORKDIR /root/      
CMD /bin/bash  
