# coding:utf-8
from django.core.cache import cache

from django.utils.deprecation import MiddlewareMixin

# 缓存
# try:
#    cache = cache['memcache']
# except ImportError as e:
#    cache = cache['default']

# 中间件具体实现（中间件就是实现特定方法的类）


class CommonMiddleware(MiddlewareMixin):
    def process_request(self, request):
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']

        online_ips = cache.get("online_ips", [])
        if online_ips:
            online_ips = list(cache.get_many(online_ips).keys())

        cache.set(ip, 0, 5 * 60)
        if ip not in online_ips:
            online_ips.append(ip)
        cache.set("online_ips", online_ips)
