# qualichain-jobcrawler

### Short Description 

This is a Scrapy Crawler that is used to extract relevant information from Job posting websitesz

### Run Scrapy crawler

Firstly execute the following command

```bash
cd jobcrawler/
```

```bash
   scrapy crawl kariera -a query="software engineer"
```

**Export data in csv using command line**

```bash
    scrapy crawl kariera -o jobs.csv -t csv -a query="software engineer" 
```

### Install Postgress using docker-compose

cd to *config* folder

```bash
    docker-compose up -d
```