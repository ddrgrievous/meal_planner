FROM nethacker/ubuntu-18-04-python-3:python-3.7.3
COPY requirements.txt /root/
RUN pip install -r /root/requirements.txt && useradd -m ubuntu
ENV HOME=/home/ubuntu
USER ubuntu
COPY app01.py wsgi.py gunicorn_config.py /home/ubuntu/
WORKDIR /home/ubuntu/
EXPOSE 8080
CMD ["gunicorn", "-c", "gunicorn_config.py", "wsgi:hello"]