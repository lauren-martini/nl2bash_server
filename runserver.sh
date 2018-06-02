#!/bin/bash

pip3 install pipenv

# Taken from fullpipeline.sh in the parent repo.
pipenv install
pipenv run python manage.py migrate
pipenv run python -m nl2bash_server.add_data_from_scraper ./test_pages/ScrapedPages
pipenv run python manage.py runserver
pipenv run python -m nl2bash_server.save_data
touch all.cm
touch all.nl
