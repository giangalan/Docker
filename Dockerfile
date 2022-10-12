# syntax=dockerfile/dockerfile:1

FROM fedora:36
COPY . /home/setup
RUN yum update -y
RUN yum install -y virtualenv make
RUN cd /home/setup && sh setup.sh
RUN cd /home/setup/Python-3.9.4 && sh configure && make && make install
RUN cd /home && virtualenv -p /usr/local/bin/python3.9 /home/lfit
RUN source /home/lfit/bin/activate
RUN /home/lfit/bin/python -m pip install --upgrade pip
RUN pip install -r /home/setup/requirements.txt
RUN cd /home/setup && python setup.py install

