from sqlalchemy import create_engine, MetaData
from sqlalchemy.orm import sessionmaker

from jobcrawler.settings import POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_DB
from jobcrawler.postgres_client.models import Base, JobPost


class PostgresClient(object):
    """
    This is a Python Object that handles Postgress DB using SQLAlchemy
    """

    def __init__(self):
        self.engine = create_engine(
            'postgresql+psycopg2://{}:{}@{}/{}'.format(POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_DB)
        )
        self.meta = MetaData()
        self.conn = self.engine.connect()
        self.session = sessionmaker(bind=self.engine)

    def initialize_tables(self):
        """
        This function is used to initialize Job Posting Tables
        """
        # create Tables from Models
        Base.metadata.create_all(self.engine)

    def add_job_post(self, **kwargs):
        """
        This function is used to add job post to JobPost Model

        Args:
            **kwargs: provided keyword arguments

        Examples:
            >>> pg = PostgresClient()
            >>> pg.add_job_post(**kwargs)
        """
        new_job_post = JobPost(
            title=kwargs["title"],
            requirements=kwargs["requirements"],
            job_url=kwargs["job_url"]
        )
        self.session.add(new_job_post)
