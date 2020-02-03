from sqlalchemy import create_engine

from jobcrawler.settings import POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_DB


class PostgresClient(object):
    def __init__(self):
        self.engine = create_engine(
            'postgresql+psycopg2://{}:{}@{}/{}'.format(POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_DB)
        )
