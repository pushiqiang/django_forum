from django import template

register = template.Library()

@register.filter
def checkfriend(value,user):
    if user in value.friends.all():
        return True
    return False

