# redis
# 该命令主要做了持久化及aof自动重建，卷映射不是必须的。整体集群可以不设置端口和密码。
# 不做持久化重启数据会消失；
# 不做aof重建硬盘占用会无限上涨；
# 不做卷映射迁移会麻烦点；
# 整体集群
docker run --name redis --restart=always -p 6379:6379 -v /data:/data -d redis \
    redis-server -appendonly yes –auto-aof-rewrite-percentage 200 \
    –auto-aof-rewrite-min-size 5gb --requirepass $REDIS_PASS

