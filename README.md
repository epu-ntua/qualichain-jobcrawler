# qualichain-jobcrawler

### Short Description 

This is a Scrapy Crawler that is used to extract relevant information from Job posting websites

### Project WIKI

Access Job Crawler WIKI from this [link](https://github.com/epu-ntua/qualichain-jobcrawler/wiki)

### Install Project using Docker

Install QualiChain Job Crawler using docker by executing the following bash commands

```bash
cd config/

docker-compose up -d --build
```

Then trigger the spider by executing the docker command above

```bash
docker exec -it job_crawler scrapy crawl kariera -o jobs.csv -t csv -a job_positions="software engineer,developer"
```


### Run QualiChain Job Crawler locally

Execute the following command

```bash
scrapy crawl kariera -a job_positions="software engineer,developer"
```

**Export data in csv using command line**

```bash
scrapy crawl kariera -a job_positions="software engineer,developer" 
```

