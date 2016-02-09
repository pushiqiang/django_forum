from django import template

register = template.Library()

@register.filter
def checkfriend(value,username):
    if username in value.friends.all():
        return True
    return False

