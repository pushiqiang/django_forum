#coding:utf8
from functools import wraps
from django.utils.decorators import available_attrs
from django.http import HttpResponse

def user_passes_test(test_func):
    """
    Decorator for views that checks that the user passes the given test,
    redirecting to the log-in page if necessary. The test should be a callable
    that takes the user object and returns True if the user passes.
    """

    def decorator(view_func):
        @wraps(view_func, assigned=available_attrs(view_func))
        def _wrapped_view(request, *args, **kwargs):
            if test_func(request.user) == '1':           #即user.privilege==1表示版主身份
                return view_func(request, *args, **kwargs)
            return HttpResponse(u"你不是版主，没有权限删贴")
        return _wrapped_view
    return decorator


def delete_permission(function=None):
    """
    Decorator for views that checks that the user is logged in, redirecting
    to the log-in page if necessary.
    """
    actual_decorator = user_passes_test(lambda u: u.privilege)		
    #此处lambda匿名函数为权限检测函数，返回得到的是上文的decorator函数，此时调用域中包含test_func函数，即lambda的权限检测函数
    if function:             			#@方式使用
        return actual_decorator(function)       #此处实际执行上文的decorator函数
    return actual_decorator  			#=delete_permission(views)方式使用
