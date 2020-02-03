# qualichain-jobcrawler

### Short Description 

This is a Scrapy Crawler that is used to extract relevant information from Job posting websites

### Install Postgress using docker-compose (Step 1)

cd to *config* folder

```bash
    docker-compose up -d
```

### Initialize Job Database (Step 2)

execute the following Python 3 Script:

```bash
    python init_db.py
```

### Run Scrapy crawler (Step 3)

Execute the following command

```bash
   scrapy crawl kariera -a job_positions="software engineer,developer"
```

**Export data in csv using command line**

```bash
    scrapy crawl kariera -o jobs.csv -t csv -a job_positions="software engineer,developer" 
```

### Project WIKI

Access Job Crawler WIKI from this [link](https://github.com/epu-ntua/qualichain-jobcrawler/wiki)