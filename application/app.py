#!/usr/bin/env python3
import pyodbc
import os
import flask as f
import flask_bootstrap as fb


driver = '{ODBC Driver 18 for SQL Server}'
server = 'tcp:' + os.environ.get('DB_HOST')
database = os.environ.get('DB_NAME')
username = os.environ.get('DB_USER')
password = os.environ.get('DB_PASS')
encryption = 'no'

conn_str = f'''
DRIVER={driver};
SERVER={server};
UID={username};
PWD={password};
ENCRYPT={encryption};
DATABASE={database};
'''.strip()

conn = pyodbc.connect(conn_str)

app = f.Flask('mssqli_demo')
fb.Bootstrap(app)


@app.route('/', methods=['GET'])
def get_index():
    return f.render_template('index.html')


@app.route('/', methods=['POST'])
def post_index():
    s = f.request.form['searchtext']
    cur = conn.execute(
        f'select ArticleTitle, ArticleDesc from Articles where ArticleDesc like \'%{s}%\'')
    posts = cur.fetchall()
    if len(posts) < 1:
        posts = [(
            'No results found',
            'Please, change your search terms and try harder =).'
        )]
    return f.render_template('results.html', items=posts)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
