FROM gcc:8.3.0

RUN wget "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2019.01/gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz?revision=c69ea519-a965-4359-84a4-cbd440ff4130&la=en" -O gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz \
    && tar xf gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz \
    && rm gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz \
    && mv /gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf /crosscompiler

ENV PATH="/crosscompiler/bin:${PATH}"

RUN apt-get update \
    && apt-get install -y bc fakeroot kmod \
    && rm -rf /var/lib/apt/lists/
