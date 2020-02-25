from jobcrawler.postgres_client.PostgresClient import PostgresClient

if __name__ == "__main__":
    pg = PostgresClient()  # Initialize Postgres Client Object

    pg.initialize_tables()  # Initialize Tables
