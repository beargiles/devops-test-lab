
CREATE KEYSPACE test WITH replication = {'class':'SimpleStrategy', 'replication_factor': 1};

--
-- snap-6213
--
-- CREATE TABLE test.race_times (cyclist_name text PRIMARY KEY,finish_time duration,race_date date,race_name text)
CREATE TABLE test.race_times (cyclist_name text PRIMARY KEY,race_date date,race_name text)
    WITH bloom_filter_fp_chance = 0.01
       AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
       AND comment = ''
       AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
       AND dclocal_read_repair_chance = 0.1
       AND default_time_to_live = 0
       AND gc_grace_seconds = 864000
       AND max_index_interval = 2048
       AND memtable_flush_period_in_ms = 0
       AND min_index_interval = 128
       AND read_repair_chance = 0.0
       AND speculative_retry = '99PERCENTILE'
       -- these lines break Cassandra 2.x
       AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
       AND crc_check_chance = 1.0
       ;

--
-- snap-6220
--
CREATE TABLE test.numerictypes(
       tinyintcol tinyint,
       smallintcol smallint,
       intcol int primary key,
       bigintcol bigint,
       variantcol varint,
       decimalcol decimal,
       floatcol float,
       doublecol double);

INSERT INTO test.numerictypes(tinyintcol, smallintcol, intcol, bigintcol, variantcol, decimalcol, floatcol, doublecol)
    VALUES (127, 32767, 2147483647, 9223372036854775807, 2147483647, 12.34, 12.23, 12.23);

INSERT INTO test.numerictypes(tinyintcol, smallintcol, intcol, bigintcol, variantcol, decimalcol, floatcol, doublecol)
    VALUES (-128, -32768, -2147483648, -9223372036854775808, 12345, -23.34, 12.23, 12.23);

--
-- snap-6224
--
CREATE TABLE test.numerictypes1(
       tinyintcol tinyint,
       intcol int primary key,
       bigintcol bigint,
       variantcol varint,
       decimalcol decimal,
       floatcol float,
       doublecol double);

INSERT INTO test.numerictypes1(tinyintcol, intcol, bigintcol, variantcol, decimalcol, floatcol, doublecol)
    VALUES (127, 2147483647, 9223372036854775807, 2147483647, 12.34, 12.23, 12.23);

INSERT INTO test.numerictypes1(tinyintcol, intcol, bigintcol, variantcol, decimalcol, floatcol, doublecol)
    VALUES (-128, -2147483648, -9223372036854775808, 12345, -23.34, 12.23, 12.23);


--
-- snap-6227
--
CREATE TABLE test.datetimetype1(datecol date primary key, timecol time, timestampcol timestamp);

INSERT INTO test.datetimetype1(datecol, timecol, timestampcol)
    VALUES('2018-01-31', '23:00:00.999', '2015-05-03 13:30:54.234-0800');

--
-- snap-6228
--
CREATE TABLE test.report_payments_2 (
       reportid timeuuid,
       userid timeuuid,
       adjustedearnings decimal,
       deleted set<timeuuid> static,
       earnings map<timeuuid, decimal>,
       gross map<timeuuid, decimal>,
       organizationid text,
       payall timestamp static,
       status text,
       PRIMARY KEY (reportid, userid))
  WITH CLUSTERING ORDER BY (userid ASC)
       AND bloom_filter_fp_chance = 0.01
       AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
       AND comment = ''
       AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
       AND default_time_to_live = 0
       AND gc_grace_seconds = 864000
       AND max_index_interval = 2048
       AND memtable_flush_period_in_ms = 0
       AND min_index_interval = 128
       AND read_repair_chance = 0.0
       AND speculative_retry = '99PERCENTILE'
       -- these lines break Cassandra 2.x
       AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
       AND crc_check_chance = 1.0
       ;

--
-- snap-6241
--
CREATE TABLE test.tblcalendar (
       race_id int primary key,
       race_start_date date,
       race_end_date date,
       race_name text);

