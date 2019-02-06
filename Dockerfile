# Kali Linux base image
FROM kalilinux/kali-linux-docker:latest

# Install basic toolkit
RUN apt-get update && apt-get install -y \
    git python3-pip python-dev\
    curl dnsutils locate \
    metasploit-framework nmap \
    sqlmap dirb \
    proxychains tor


# More Wordlists for Wordlist God
RUN git clone https://github.com/danielmiessler/SecLists /usr/share/seclists

#Open port 8080 for sqlmap-server
EXPOSE 8080