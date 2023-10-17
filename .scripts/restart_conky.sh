#!/bin/bash

pid=`pidof conky`
kill $pid
conky
