cluster {
    nodes: 10
    storage: hdfs
    replication: 3
}

dataset Users {
    source: "hdfs://data/users.parquet"
}

query Adults {
    from Users
    where age > 18
    select name, age
}
