# Kali Linux base image
FROM kalilinux/kali-linux-docker:latest

# Install basic toolkit
RUN apt-get update && apt-get install -y \
    git vim python3-pip python-dev\
    curl dnsutils locate \
    metasploit-framework nmap netcat\
    sqlmap dirb wordlists \
    proxychains tor

# More Wordlists for the Wordlist God!
# Include only selected directories from SecLists through git *sparse-checkout* (and still pulling slow AF)
RUN mkdir /usr/share/seclists && cd /usr/share/seclists && \
    git init && git remote add origin -f https://github.com/danielmiessler/SecLists && \
    git config core.sparseCheckout true && \
    echo "Discovery" >> .git/info/sparse-checkout && \
    echo "Passwords/Leaked-Databases/rockyou.txt.tar.gz" >> .git/info/sparse-checkout && \
#    echo "Fuzzing/Polyglots" >> .git/info/sparse-checkout && \s
#    echo "Usernames" >> .git/info/sparse-checkout && \
    git pull origin master && \
    cd /usr/share/seclists/Passwords/Leaked-Databases/ && tar -xvzf rockyou.txt.tar.gz

#OR
#RUN git clone https://github.com/danielmiessler/SecLists /usr/share/seclists

#Open port 8080 for sqlmap-server
EXPOSE 8080

#Change working directory
WORKDIR /root/
