# qualichain-jobcrawler

### Short Description 

This is a Scrapy Crawler that is used to extract relevant information from Job posting websites

### Run Scrapy crawler

Firstly execute the following command

```bash
cd jobcrawler/
```

```bash
   scrapy crawl kariera -a job_positions="software engineer,developer"
```

**Export data in csv using command line**

```bash
    scrapy crawl kariera -o jobs.csv -t csv -a job_positions="software engineer,developer" 
```

### Install Postgress using docker-compose

cd to *config* folder

```bash
    docker-compose up -d
```