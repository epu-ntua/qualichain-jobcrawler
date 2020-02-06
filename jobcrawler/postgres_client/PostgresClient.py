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
        self.session = sessionmaker(bind=self.engine)()

    def initialize_tables(self):
        """
        This function is used to initialize Job Posting Tables
        """
        # create Tables from Models
        Base.metadata.create_all(self.engine)
        print("JobPost table initialized successfully")

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
            job_url=kwargs["job_url"],
            timestamp=kwargs["timestamp"],
            full_html=kwargs["full_html"],
            site=kwargs["site"],
            language=kwargs["language"],
            full_text=kwargs["full_text"]
        )
        self.session.add(new_job_post)
        self.session.commit()

    def check_if_record_exists(self, title, job_url):
        """
        The following function is used to check if the extracted job exists in DB

        Args:
            title: job title
            job_url: job url

        Returns: True/False
        """
        this_job_count = self.session.query(JobPost).filter(
            JobPost.job_url == job_url,
            JobPost.title == title
        ).count()

        if this_job_count:
            return True
        else:
            return False
