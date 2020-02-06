from sqlalchemy import Column, Integer, String, Text, DateTime, Float, Boolean, PickleType
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class JobPost(Base):
    """Data model Job."""
    __tablename__ = "job_post"

    id = Column(Integer, primary_key=True, nullable=False)
    title = Column(String(100), nullable=True)
    requirements = Column(Text, nullable=True)
    job_url = Column(String(1024), nullable=True)
    timestamp = Column(String(1024), nullable=True)
    full_html = Column(Text, nullable=True)
    site = Column(String(1024), nullable=True)

    def __repr__(self):
        return '<JobPost model {}>'.format(self.id)
