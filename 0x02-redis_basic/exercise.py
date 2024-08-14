#!/usr/bin/env python3
''' Exercice '''


import redis as re
import uuid as u
from typing import Any


class Cache:
    '''
        Cache: A class Using redis
    '''
    def __init__(self):
        '''Costructor'''
        self._redis = re.Redis()
        self._redis.flushdb()


    def store(self, data: Any) -> str:
        '''
            store: A methode that store the input data in Redis using the random key
            Args:
                data: Any type of data
            Return: A string
        '''
        key = str(u.uuid4())
        self._redis.set(key, data)
        return key
