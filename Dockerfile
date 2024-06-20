FROM python:3.10-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    git \
    --no-install-recommends

RUN pip install Cython

RUN git clone https://github.com/pandas-dev/pandas.git

COPY . .

RUN ./make_bad.sh

RUN ./make_clean.sh

RUN ./exploit.sh

CMD ["dest_env/bin/python", "test.py"]