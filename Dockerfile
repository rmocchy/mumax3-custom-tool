# Base image
FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

# Install Python & pip
RUN apt -y update
RUN apt -y upgrade
RUN apt install -y python3 python3-pip

# Install curl for Mumax3
RUN apt install -y curl

# create dirs
RUN mkdir /app
RUN mkdir /app/mumax3
WORKDIR /app

# Install Python Modules
RUN pip3 install --no-cache-dir --default-timeout=1000 --verbose gpustat

# Install Mumax3 
RUN curl -OL https://mumax.ugent.be/mumax3-binaries/mumax3.10_linux_cuda11.0.tar.gz
RUN tar xvfz mumax3.10_linux_cuda11.0.tar.gz -C /app/mumax3

# Copy the Python script into the container
COPY ./src /app/ 

# give-execute-permission
RUN chmod +x -R .

# set-synbolic-link
# create-original-commands
RUN ln -s /app/mumax3/mumax3.10_linux_cuda11.0/mumax3-server /usr/bin/mumax3-server
RUN ln -s /app/mumax3/mumax3.10_linux_cuda11.0/mumax3 /usr/bin/mumax3
RUN ln -s /app/mumax3/mumax3.10_linux_cuda11.0/mumax3-convert /usr/bin/mumax3-convert
# for test
RUN ln -s /app/mumax3-test/mumax3-conv-test.py /usr/bin/mumax3-convert-test
RUN ln -s /app/mumax3-test/mumax3-exec-test.py /usr/bin/mumax3-execute-test


# Command to run the Python script
CMD ["python3"]