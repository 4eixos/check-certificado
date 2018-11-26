FROM ubuntu:16.04

LABEL maintainer="Víctor Rodríguez <vrodriguez@4eixos.com>"

# Sistema base 
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update && apt-get dist-upgrade -y \
    && apt-get install -y perl perl-modules libdatetime-format-duration-perl \
                    libdatetime-format-strptime-perl \libdatetime-locale-perl \
                    libdatetime-perl openssl ca-certificates \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Comprobador de certificados
ADD checkCertificado /bin/checkCertificado
RUN chmod a+x /bin/checkCertificado

ENTRYPOINT ["checkCertificado"]

