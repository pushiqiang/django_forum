# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import django.utils.timezone
from django.conf import settings
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0001_initial'),
        ('contenttypes', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='LoginUser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(default=django.utils.timezone.now, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(help_text='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.', unique=True, max_length=30, verbose_name='username', validators=[django.core.validators.RegexValidator('^[\\w.@+-]+$', 'Enter a valid username.', 'invalid')])),
                ('first_name', models.CharField(max_length=30, verbose_name='first name', blank=True)),
                ('last_name', models.CharField(max_length=30, verbose_name='last name', blank=True)),
                ('email', models.EmailField(max_length=75, verbose_name='email address', blank=True)),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('levels', models.PositiveIntegerField(default=0, verbose_name='\u79ef\u5206')),
                ('avatar', models.CharField(default=b'/static/tx/default.jpg', max_length=200, verbose_name='\u5934\u50cf')),
                ('privilege', models.CharField(default=0, max_length=200, verbose_name='\u6743\u9650')),
                ('friends', models.ManyToManyField(related_name='friends_rel_+', null=True, to=settings.AUTH_USER_MODEL, blank=True)),
                ('groups', models.ManyToManyField(related_query_name='user', related_name='user_set', to='auth.Group', blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of his/her group.', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(related_query_name='user', related_name='user_set', to='auth.Permission', blank=True, help_text='Specific permissions for this user.', verbose_name='user permissions')),
            ],
            options={
                'ordering': ['-date_joined'],
                'db_table': 'loginuser',
                'verbose_name_plural': '\u7528\u6237',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Application',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('status', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('receiver', models.ForeignKey(related_name='appli_receiver', to=settings.AUTH_USER_MODEL)),
                ('sender', models.ForeignKey(related_name='appli_sender', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'application',
                'verbose_name_plural': '\u597d\u53cb\u7533\u8bf7',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Column',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30)),
                ('description', models.TextField()),
                ('post_number', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('manager', models.ForeignKey(related_name='column_manager', to=settings.AUTH_USER_MODEL)),
                ('parent', models.ForeignKey(related_name='childcolumn', blank=True, to='forum.Column', null=True)),
            ],
            options={
                'ordering': ['name'],
                'db_table': 'column',
                'verbose_name_plural': '\u677f\u5757',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('comment_parent', models.ForeignKey(related_name='childcomment', blank=True, to='forum.Comment', null=True)),
            ],
            options={
                'ordering': ['created_at'],
                'db_table': 'comment',
                'verbose_name_plural': '\u8bc4\u8bba',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('receiver', models.ForeignKey(related_name='message_receiver', to=settings.AUTH_USER_MODEL)),
                ('sender', models.ForeignKey(related_name='message_sender', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'message',
                'verbose_name_plural': '\u6d88\u606f',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Nav',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, verbose_name='\u5bfc\u822a\u6761')),
                ('url', models.CharField(max_length=200, null=True, verbose_name='\u6307\u5411\u5730\u5740', blank=True)),
                ('create_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u521b\u5efa\u65f6\u95f4', auto_now_add=True)),
            ],
            options={
                'ordering': ['-create_time'],
                'db_table': 'nav',
                'verbose_name': '\u5bfc\u822a\u6761',
                'verbose_name_plural': '\u5bfc\u822a\u6761',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Notice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('object_id', models.PositiveIntegerField()),
                ('status', models.BooleanField(default=False)),
                ('type', models.IntegerField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('content_type', models.ForeignKey(to='contenttypes.ContentType')),
                ('receiver', models.ForeignKey(related_name='notice_receiver', to=settings.AUTH_USER_MODEL)),
                ('sender', models.ForeignKey(related_name='notice_sender', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-created_at'],
                'db_table': 'notice',
                'verbose_name_plural': '\u901a\u77e5',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=30)),
                ('content', models.TextField()),
                ('view_times', models.IntegerField(default=0)),
                ('responce_times', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('author', models.ForeignKey(related_name='post_author', to=settings.AUTH_USER_MODEL)),
                ('column', models.ForeignKey(to='forum.Column')),
                ('last_response', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-created_at'],
                'db_table': 'post',
                'verbose_name_plural': '\u4e3b\u9898',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='PostType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_name', models.CharField(max_length=30)),
                ('description', models.TextField()),
                ('created_at', models.DateTimeField(default=datetime.datetime.now)),
            ],
            options={
                'db_table': 'posttype',
                'verbose_name_plural': '\u4e3b\u9898\u7c7b\u578b',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='post',
            name='type_name',
            field=models.ForeignKey(to='forum.PostType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='comment',
            name='post',
            field=models.ForeignKey(to='forum.Post'),
            preserve_default=True,
        ),
    ]
