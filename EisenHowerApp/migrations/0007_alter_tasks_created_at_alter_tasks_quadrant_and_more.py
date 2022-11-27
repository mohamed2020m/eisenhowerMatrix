# Generated by Django 4.1.3 on 2022-11-27 20:14

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('EisenHowerApp', '0006_alter_tasks_created_at_alter_tasks_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tasks',
            name='created_At',
            field=models.DateTimeField(default=datetime.datetime(2022, 11, 27, 20, 14, 0, 18482)),
        ),
        migrations.AlterField(
            model_name='tasks',
            name='quadrant',
            field=models.CharField(choices=[('do_first', 'Do First'), ('schedule', 'Schedule'), ('delegate', 'Delegate'), ('dont_do', "Don't do")], default='do_first', max_length=8),
        ),
        migrations.AlterField(
            model_name='tasks',
            name='status',
            field=models.CharField(choices=[('done', 'Done'), ('in_progress', 'In Progress')], default='in_progress', max_length=12),
        ),
    ]
