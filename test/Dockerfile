FROM python:3.9-slim-bullseye as basebuilder  
ARG MITMPROXY_BRANCH="9.0.1"
WORKDIR /workdir
#build context needs to be changed to root of test folder during docker build...
COPY output/ . 
RUN pip install *.whl
RUN apt-get update
RUN apt-get install -y --no-install-recommends git curl gcc build-essential\
		&& rm -rf /var/lib/apt/lists/*

#newer rust version
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN if [ `dpkg --print-architecture` = "armhf" ]; then \
        printf "[global]\nextra-index-url=https://www.piwheels.org/simple\n" > /etc/pip.conf ;\
		fi

RUN git clone --depth 1 --branch $MITMPROXY_BRANCH https://github.com/mitmproxy/mitmproxy.git mitmproxy \
		&& pip install -e "mitmproxy/.[dev]"
CMD ["mitmproxy", "--version"]
