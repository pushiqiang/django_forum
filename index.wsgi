import sae
from myforum import wsgi

application = sae.create_wsgi_app(wsgi.application)