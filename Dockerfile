FROM tsutomu7/scientific-python

EXPOSE 8888
VOLUME $HOME
ADD graphviz.tgz $HOME
RUN sudo apt-get update --fix-missing && sudo apt-get install -y --no-install-recommends libltdl7 && \
    conda install -y graphviz && \
    pip install --no-cache xlrd graphviz && \
    sudo find /opt -name __pycache__ | xargs rm -r && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
CMD ["sh", "-c", "jupyter notebook --ip=*"]
