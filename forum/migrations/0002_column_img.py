# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('forum', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='column',
            name='img',
            field=models.CharField(default=b'/static/tx/default.jpg', max_length=200, verbose_name='\u56fe\u6807'),
            preserve_default=True,
        ),
    ]
