import os
import re
import csv
import time
import psycopg2
import psycopg2.extras

part_size = 50
QUERY = (
    '''
        INSERT INTO zno (
            zno_year,
            OUTID,
            Birth,
            SEXTYPENAME,
            REGNAME,
            AREANAME,
            TERNAME,
            REGTYPENAME,
            TerTypeName,
            ClassProfileNAME,
            ClassLangName,
            EONAME,
            EOTYPENAME,
            EORegName,
            EOAreaName,
            EOTerName,
            EOParent,
            UkrTest,
            UkrTestStatus,
            UkrBall100,
            UkrBall12,
            UkrBall,
            UkrAdaptScale,
            UkrPTName,
            UkrPTRegName,
            UkrPTAreaName,
            UkrPTTerName,
            histTest,
            HistLang,
            histTestStatus,
            histBall100,
            histBall12,
            histBall,
            histPTName,
            histPTRegName,
            histPTAreaName,
            histPTTerName,
            mathTest,
            mathLang,
            mathTestStatus,
            mathBall100,
            mathBall12,
            mathBall,
            mathPTName,
            mathPTRegName,
            mathPTAreaName,
            mathPTTerName,
            physTest,
            physLang,
            physTestStatus,
            physBall100,
            physBall12,
            physBall,
            physPTName,
            physPTRegName,
            physPTAreaName,
            physPTTerName,
            chemTest,
            chemLang,
            chemTestStatus,
            chemBall100,
            chemBall12,
            chemBall,
            chemPTName,
            chemPTRegName,
            chemPTAreaName,
            chemPTTerName,
            bioTest,
            bioLang,
            bioTestStatus,
            bioBall100,
            bioBall12,
            bioBall,
            bioPTName,
            bioPTRegName,
            bioPTAreaName,
            bioPTTerName,
            geoTest,
            geoLang,
            geoTestStatus,
            geoBall100,
            geoBall12,
            geoBall,
            geoPTName,
            geoPTRegName,
            geoPTAreaName,
            geoPTTerName,
            engTest,
            engTestStatus,
            engBall100,
            engBall12,
            engDPALevel,
            engBall,
            engPTName,
            engPTRegName,
            engPTAreaName,
            engPTTerName,
            fraTest,
            fraTestStatus,
            fraBall100,
            fraBall12,
            fraDPALevel,
            fraBall,
            fraPTName,
            fraPTRegName,
            fraPTAreaName,
            fraPTTerName,
            deuTest,
            deuTestStatus,
            deuBall100,
            deuBall12,
            deuDPALevel,
            deuBall,
            deuPTName,
            deuPTRegName,
            deuPTAreaName,
            deuPTTerName,
            spaTest,
            spaTestStatus,
            spaBall100,
            spaBall12,
            spaDPALevel,
            spaBall,
            spaPTName,
            spaPTRegName,
            spaPTAreaName,
            spaPTTerName
        ) VALUES %s
    ''',
    '''
        UPDATE temp_table SET record_id = %s, is_done = %s WHERE zno_year = %s
    '''
)
numbers = [1, 18, 19, 20, 21, 29, 30, 31, 39, 40, 41, 49, 50, 51, 59, 60, 61, 69, 70, 71, 79, 80, 81, 88, 89, 91, 98, 99, 101, 108, 109, 111, 118, 119, 121]


def populate(conn):
    cur = conn.cursor()

    for name in os.listdir('data'):
        year = re.findall(r'Odata(\d{4})File.csv', name)
        if year:
            with open(os.path.join('data', name), encoding='cp1251') as csvfile:
                csv_reader = csv.reader(csvfile, delimiter=';')

                next(csv_reader)

                start = time.time()
                count = 0
                part = list()

                cur.execute('SELECT record_id, is_done FROM temp_table WHERE zno_year = %s', year)
                res = cur.fetchone()

                if res is None:
                    cur.execute('INSERT INTO temp_table (zno_year, record_id, is_done) VALUES (%s, %s, %s)', year + [count, False])
                else:
                    if res[-1]:
                        continue
                    for row in csv_reader:
                        count += 1
                        if count >= res[0]:
                            break

                    count += 1
                    part.append(year + row)
                    if not count % part_size:
                        psycopg2.extras.execute_values(cur, QUERY[0], part)
                        cur.execute(QUERY[1], [count, False] + year)
                        part = list()
                        conn.commit()
                if part:
                    psycopg2.extras.execute_values(cur, QUERY[0], part)
                    cur.execute(QUERY[1], [count, True] + year)
                    part = list()
                    conn.commit()
                finish = time.time() - start

    cur.close()

conn = psycopg2.connect("dbname=postgres user=postgres password=password")
populate(conn)
conn.close()
