FROM ghcr.io/open-webui/open-webui:main


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        python3-dev \
        build-essential \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://raw.githubusercontent.com/mrjbq7/ta-lib/master/ta-lib_build_and_install.py | python

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["uwsgi", "--ini", "open_webkit/uwsgi.ini"]
