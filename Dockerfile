FROM n8nio/n8n:2
WORKDIR /home/node/
EXPOSE 5678
CMD ["n8n", "start"]
