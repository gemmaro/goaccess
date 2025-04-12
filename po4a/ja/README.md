GoAccess [![Cのビルド](https://github.com/allinurl/goaccess/actions/workflows/build-test.yml/badge.svg)](https://github.com/allinurl/goaccess/actions/workflows/build-test.yml) [![GoAccess](https://goaccess.io/badge)](https://goaccess.io)
========

## GoAccessとは ##
GoAccess is an open source **real-time web log analyzer** and interactive
viewer that runs in a **terminal** on &ast;nix systems or through your
**browser**. It provides **fast** and valuable HTTP statistics for system
administrators that require a visual server report on the fly.  More info
at: [https://goaccess.io](https://goaccess.io/?src=gh).

[![GoAccess Terminal
Dashboard](https://goaccess.io/images/goaccess-real-time-term-gh.png?2022011901)](https://goaccess.io/)
[![GoAccess HTML
Dashboard](https://goaccess.io/images/goaccess-real-time-html-gh.png?202201190)](https://rt.goaccess.io/?src=gh)

## 機能 ##
GoAccessは指定されたwebログファイルを解析しX端末にデータを出力します。
含まれている機能は以下です：

* **Completely Real Time**<br> All panels and metrics are timed to be
  updated every 200 ms on the terminal output and every second on the HTML
  output.

* **Minimal Configuration needed**<br> You can just run it against your
  access log file, pick the log format and let GoAccess parse the access log
  and show you the stats.

* **Track Application Response Time**<br> Track the time taken to serve the
  request. Extremely useful if you want to track pages that are slowing down
  your site.

* **WebSocket Authentication:**<br> GoAccess offers enhanced WebSocket
  authentication, supporting local and external JWT verification, with
  secure token refresh capabilities and seamless integration with external
  authentication systems.

* **Nearly All Web Log Formats**<br> GoAccess allows any custom log format
  string.  Predefined options include, Apache, Nginx, Amazon S3, Elastic
  Load Balancing, CloudFront, etc.

* **Incremental Log Processing**<br> Need data persistence? GoAccess has the
  ability to process logs incrementally through the on-disk persistence
  options.

* **Only one dependency**<br> GoAccess is written in C. To run it, you only
  need ncurses as a dependency.  That's it. It even features its own Web
  Socket server — http://gwsocket.io/.

* **Visitors**<br> Determine the amount of hits, visitors, bandwidth, and
  metrics for slowest running requests by the hour, or date.

* **Metrics per Virtual Host**<br> Have multiple Virtual Hosts (Server
  Blocks)? It features a panel that displays which virtual host is consuming
  most of the web server resources.

* **自律システム番号（AS番号；Autonomous System Numbers; ASN）**<br>
  悪意のあるトラフィックのパターンを検出し、それに対応して阻止する上で好適です。

* **Color Scheme Customizable**<br> Tailor GoAccess to suit your own color
  taste/schemes. Either through the terminal, or by simply applying the
  stylesheet on the HTML output.

* **大規模データセットへの対応**<br>
  GoAccessには、最適化されたインメモリのハッシュテーブルによる、大きなログを解析する機能が備わっています。適度なメモリの使用で、かなり良い効率性があります。この容量では、ディスク上への永続化の対応もされています。

* **Docker Support**<br> Ability to build GoAccess' Docker image from
  upstream. You can still fully configure it, by using Volume mapping and
  editing `goaccess.conf`.  See
  [Docker](https://github.com/allinurl/goaccess#docker) section below.
  There is also documentation how to use
  [docker-compose](./docker-compose/README.md).

### ほぼ全てのウェブのログ形式がここに…… ###
GoAccessでは、任意の独自ログ形式の文字列を処理できます。以下の定義済みオプションが含まれていますが、これに限りません。

* Amazon CloudFront (Download Distribution).
* Amazon Simple Storage Service (S3)
* AWS Elastic Load Balancing
* Combined Log Format (XLF/ELF) Apache | Nginx
* Common Log Format (CLF) Apache
* Google Cloud Storage.
* Apache仮想ホスト
* Squid Native Format.
* W3C format (IIS).
* Caddy's JSON Structured format.
* Traefik's CLF flavor

## なぜGoAccessなのか ##
GoAccess was designed to be a fast, terminal-based log analyzer. Its core
idea is to quickly analyze and view web server statistics in real time
without needing to use your browser (_great if you want to do a quick
analysis of your access log via SSH, or if you simply love working in the
terminal_).

While the terminal output is the default output, it has the capability to
generate a complete, self-contained, real-time
[**`HTML`**](https://rt.goaccess.io/?src=gh)  report, as well as a
[**`JSON`**](https://goaccess.io/json?src=gh), and
[**`CSV`**](https://goaccess.io/goaccess_csv_report.csv?src=gh) report.

You can see it more of a monitor command tool than anything else.

## インストール ##
<a href="https://repology.org/project/goaccess/versions">
    <img src="https://repology.org/badge/vertical-allrepos/goaccess.svg" alt="Packaging status" align="right">
</a>

### リリースからのビルド

GoAccess can be compiled and used on *nix systems.

Download, extract and compile GoAccess with:

    $ wget https://tar.goaccess.io/goaccess-1.9.4.tar.gz
    $ tar -xzvf goaccess-1.9.4.tar.gz
    $ cd goaccess-1.9.4/
    $ ./configure --enable-utf8 --enable-geoip=mmdb
    $ make
    # make install

### GitHubからのビルド（開発版） ###

    $ git clone https://github.com/allinurl/goaccess.git
    $ cd goaccess
    $ autoreconf -fiv
    $ ./configure --enable-utf8 --enable-geoip=mmdb
    $ make
    # make install

### 配布物 ###

It is easiest to install GoAccess on GNU+Linux using the preferred package
manager of your GNU+Linux distribution. Please note that not all
distributions will have the latest version of GoAccess available.

#### Debian/Ubuntu ####

    # apt-get install goaccess

**Note:** It is likely this will install an outdated version of GoAccess. To
make sure that you're running the latest stable version of GoAccess see
alternative option below.

#### 公式のGoAccessのDebianとUbuntuのリポジトリ ####

    $ wget -O - https://deb.goaccess.io/gnugpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/goaccess.gpg >/dev/null
    $ echo "deb [signed-by=/usr/share/keyrings/goaccess.gpg arch=$(dpkg --print-architecture)] https://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/goaccess.list
    $ sudo apt-get update
    $ sudo apt-get install goaccess

**Note**:
* `.deb` packages in the official repo are available through HTTPS as well. You may need to install `apt-transport-https`.

#### Fedora ####

    # yum install goaccess

#### Arch ####

    # pacman -S goaccess

#### Gentoo ####

    # emerge net-analyzer/goaccess

#### OS X / Homebrew ####

    # brew install goaccess

#### FreeBSD ####

    # cd /usr/ports/sysutils/goaccess/ && make install clean
    # pkg install sysutils/goaccess

#### OpenBSD ####

    # cd /usr/ports/www/goaccess && make install clean
    # pkg_add goaccess

#### openSUSE  ####

    # zypper ar -f obs://server:http http
    # zypper in goaccess

#### OpenIndiana ####

    # pkg install goaccess

#### pkgsrc (NetBSD, Solaris, SmartOS, ...) ####

    # pkgin install goaccess

#### Windows ####

GoAccess can be used in Windows through Cygwin. See Cygwin's <a
href="https://goaccess.io/faq#installation">packages</a>.  Or through the
GNU+Linux Subsystem on Windows 10.

#### Docker ####

A Docker image has been updated, capable of directing output from an access
log. If you only want to output a report, you can pipe a log from the
external environment to a Docker-based process:

    touch report.html
    cat access.log | docker run --rm -i -v ./report.html:/report.html -e LANG=$LANG allinurl/goaccess -a -o report.html --log-format COMBINED -

もしくは、実時間の場合は次の通りです。

    tail -F access.log | docker run -p 7890:7890 --rm -i -e LANG=$LANG allinurl/goaccess -a -o report.html --log-format COMBINED --real-time-html -

There is also documentation how to use
[docker-compose](./docker-compose/README.md).

##### 隔離されたコンテナでのビルド

You can also build the binary for Debian based systems in an isolated
container environment to prevent cluttering your local system with the
development libraries:

    $ curl -L "https://github.com/allinurl/goaccess/archive/refs/heads/master.tar.gz" | tar -xz && cd goaccess-master
    $ docker build -t goaccess/build.debian-12 -f Dockerfile.debian-12 .
    $ docker run -i --rm -v $PWD:/goaccess goaccess/build.debian-12 > goaccess

You can read more about using the docker image in
[DOCKER.md](https://github.com/allinurl/goaccess/blob/master/DOCKER.md).

#### 配布パッケージ ####

GoAccess has minimal requirements, it's written in C and requires only
ncurses.  However, below is a table of some optional dependencies in some
distros to build GoAccess from source.

| Distro                 | NCurses          | GeoIP (opt)      | GeoIP2 (opt)          |  OpenSSL (opt)     |
| ---------------------- | ---------------- | ---------------- | --------------------- | -------------------|
| **Ubuntu/Debian**      | libncurses-dev   | libgeoip-dev     | libmaxminddb-dev      |  libssl-dev        |
| **RHEL/CentOS**        | ncurses-devel    | geoip-devel      | libmaxminddb-devel    |  openssl-devel     |
| **Arch**               | ncurses          | geoip            | libmaxminddb          |  openssl           |
| **Gentoo**             | sys-libs/ncurses | dev-libs/geoip   | dev-libs/libmaxminddb |  dev-libs/openssl  |
| **Slackware**          | ncurses          | GeoIP            | libmaxminddb          |  openssl           |

**Note**: You may need to install build tools like `gcc`, `autoconf`,
`gettext`, `autopoint` etc. for compiling/building software from source. e.g.,
`base-devel`, `build-essential`, `"Development Tools"`.

## 保存領域 ##

#### 既定のハッシュテーブル ####

インメモリ容量により、データセットの大きさと利用できる物理記憶領域の容量に制限するコストと引き換えに、より良い効率性がもたらされます。GoAccessではインメモリのハッシュテーブルが使われています。適度なメモリ使用で、かなり良い効率性があります。この保存領域には、ディスク上の永続化の対応もされています。

## コマンドラインと構成オプション ##
コマンドに与えたり、構成ファイルで指定したりできる[**オプション**](https://goaccess.io/man#options)をご参照ください。構成ファイルで指定するときは、長いオプションは前に
`--` を付けずに使う必要があります。

## 使い方と例 ##
**補足**：GoAccessにデータをパイプで流し込むときは、ログ、日付、時刻の構成ダイアログは尋ねられません。構成ファイルかコマンドラインで予め定義する必要があります。

### 初めの一歩 ###

端末に出力して対話的なレポートを生成するには以下のようにします。

    # goaccess access.log

HTMLレポートを生成するには以下のようにします。

    # goaccess access.log -a > report.html

JSONの報告ファイルを生成するには、以下のようにします。

    # goaccess access.log -a -d -o report.json

CSVの報告を標準出力に生成するには、以下のようにします。

    # goaccess access.log --no-csv-summary -o csv

GoAccessは実時間の絞り込みと解析を行う上で、
非常に柔軟性が高い側面もあります。
例えばgoaccessが起動したあとのログを監視することによって素早く問題を診断できます。

    # tail -f access.log | goaccess -

さらに、実時間解析を保存するためにパイプを開いたまま絞り込むときは、`tail
-f`と、`grep`、`awk`、`sed`などのパターン合致ツールを活用できます。

    # tail -f access.log | grep -i --line-buffered 'firefox' | goaccess --log-format=COMBINED -

もしくはパイプを開きフィルタを適用しつつ、
ファイルの冒頭から解析するにはこのようにします。

    # tail -f -n +0 access.log | grep -i --line-buffered 'firefox' | goaccess -o report.html --real-time-html -


### 複数のログファイル ###

GoAccessで複数のログを解析するにはいくつかの方法があります。
最も単純なのはコマンドラインに複数のログファイルを渡すことです。

    # goaccess access.log access.log.1

通常のファイルから読み込みつつパイプからファイルを解析することさえできます。

    # cat access.log.2 | goaccess access.log access.log.1 -

**補足**：コマンドラインにダッシュが1つ付いています。これにより、GoAccessにパイプから読むべきことが伝わります。

GoAccessにもっと柔軟性を持たせたければ、`zcat
--force`を使い、圧縮されている可能性のあるファイルを読むことができます。例えば、`access.log*`の全てのログファイルを処理したければ、以下のようにできます。

    # zcat --force access.log* | goaccess -

_補足_ ：Mac OS Xでは、`zcat`の代わりに`gunzip -c`を使ってください。

### 複数スレッドへの対応 ###

`--jobs=<count>`（ないし`-j`）を使うと、複数スレッドでの解析が有効になります。例えば以下の通りです。

    # goaccess access.log -o report.html -j 4


And use `--chunk-size=<256-32768>` to adjust chunk size, the default chunk size is 1024. For example:

    # goaccess access.log -o report.html -j 4 --chunk-size=8192


### 実時間のHTML出力 ###

GoAccessには、HTMLの報告ファイルに実時間データを出力する機能があります。このHTMLファイルは、Eメールで送ることさえできます。外部のファイルに依存しない、単一のファイルからなっているからです。やったね！

実時間のHTMLの報告ファイルを生成する工程は、静的な報告を作成する工程ととても似ています。実時間にするには、`--real-time-html`さえあればよいのです。

    # goaccess access.log -o /usr/share/nginx/html/your_site/report.html --real-time-html

To view the report you can navigate to `http://your_site/report.html`.

既定では、GoAccessは生成された報告のホスト名を使います。クライアントのブラウザが接続するURLを指定することもできますが、省けます。より詳しい例については、[FAQ](https://goaccess.io/faq)をご参照ください。

    # goaccess access.log -o report.html --real-time-html --ws-url=goaccess.io

既定ではGoAccessはポート7890で待ち受けます。
7890以外の別のポートを使うためには以下のように指定することができます
（ポートの穴開けができていることを確かめてください）。

    # goaccess access.log -o report.html --real-time-html --port=9870

またWebSocketサーバーを0.0.0.0以外の別のアドレスに束縛したければ以下のように指定することができます。

    # goaccess access.log -o report.html --real-time-html --addr=127.0.0.1

**補足**：TLS/SSL接続越しに実時間データを出力するには、`--ssl-cert=<証明書.crt>`と`--ssl-key=<秘密鍵.key>`を使う必要があります。

### 絞り込み ###

#### 日付の扱い ####

別のパイプの有用な点はwebのログから日付で絞り込むことでしょう。

以下では、ファイルの末尾までの、`05/Dec/2010`から始まる全てのHTTP要求が得られます。

    # sed -n '/05\/Dec\/2010/,$ p' access.log | goaccess -a -

または昨日や明日のような相対的な日にちを使うと以下です。

    # sed -n '/'$(date '+%d\/%b\/%Y' -d '1 week ago')'/,$ p' access.log | goaccess -a -

日付aから日付bまでの特定の時刻間隔のみを解析したければ以下のようにできます。

    # sed -n '/5\/Nov\/2010/,/5\/Dec\/2010/ p' access.log | goaccess -a -

特定の量のデータのみを保存し容量上で古いものから再利用されている場合は、
特定の日数のみ保持するようにできます。
例えば直近5日間を保持して表示するには次のようにします。

    # goaccess access.log --keep-last=5

#### 仮想ホスト ####

ログに仮想ホストのフィールドが含まれているとします。例えば次の通りです。

    vhost.io:80 8.8.4.4 - - [02/Mar/2016:08:14:04 -0600] "GET /shop HTTP/1.1" 200 615 "-" "Googlebot-Image/1.0"

そして、仮想ホストを要求に付けて、どの仮想ホストに上位のURLが属しているか知りたいとします。

    awk '$8=$1$8' access.log | goaccess -a -

To do the same, but also use real-time filtering and parsing:

    tail -f  access.log | unbuffer -p awk '$8=$1$8' | goaccess -a -

仮想ホストのリストを除外するためには以下のようにできます。

    # grep -v "`cat exclude_vhost_list_file`" vhost_access.log | goaccess -

#### ファイル、状態コード、ボット ####

要求のうち、ページの閲覧、`html`、`htm`、`php`などの、特定のページを解析するには、以下のようにします。

    # awk '$7~/\.html|\.htm|\.php/' access.log | goaccess -

なお、`$7`は一般的な結合ログ形式（仮想ホストなし）の要求フィールドです。ログに仮想ホストが含まれるのであれば、恐らく`$8`を代わりに使うとよいでしょう。どのフィールドを選ぶべきかは確認しておくのが一番です。例えば以下です。

    # tail -10 access.log | awk '{print $8}'

または特定のステータスコードを解析するには次のようにします。
ここでは500 (Internal Server Error) を例に挙げます。

    # awk '$9~/500/' access.log | goaccess -

Or multiple status codes, e.g., all 3xx and 5xx:

    # tail -f -n +0 access.log | awk '$9~/3[0-9]{2}|5[0-9]{2}/' | goaccess -o out.html -

And to get an estimated overview of how many bots (crawlers) are hitting
your server:

    # tail -F -n +0 access.log | grep -i --line-buffered 'bot' | goaccess -

### コツ ###

また、GoAccessを低い優先度で走らせたければ次のようにできることは書いておいたほうがよいでしょう。

    # nice -n 19 goaccess -f access.log -a

また、サーバーにインストールしたくなければ、ローカルマシンからも走らせられます！

    # ssh -n root@server 'tail -f /var/log/apache2/access.log' | goaccess -

**補足：**GoAccessが標準入力を読めるようにするため、SSHには`-n`が必要です。また、パスフレーズが必要なときはうまく機能しないため、必ず認証のためのSSHキーを使ってください。

#### 困ったときは ####

We receive many questions and issues that have been answered previously.

* Date/time matching problems? Check that your log format and the system
  locale in which you run GoAccess match. See
  [#1571](https://github.com/allinurl/goaccess/issues/1571#issuecomment-543186858)
* Problems with pattern matching? Spaces are often a problem, see for
  instance [#136](https://github.com/allinurl/goaccess/issues/136),
  [#1579](https://github.com/allinurl/goaccess/issues/1579)
* Other issues matching log entries: See [>200 closed issues regarding
  log/date/time
  formats](https://github.com/allinurl/goaccess/issues?q=is%3Aissue+is%3Aclosed+label%3A%22log%2Fdate%2Ftime+format%22)
* Problems with log processing? See [>111 issues regarding log
  processing](https://github.com/allinurl/goaccess/issues?q=is%3Aissue+is%3Aclosed+label%3Alog-processing)


#### 漸進的なログ処理 ####

GoAccessには内部的な容量を通じて漸進的にログを処理してディスクにデータを吐き出す能力があります。
これは以下のように動作します。

1. データセットはまず`--persist`で永続化されなければなりません。それからは、同じデータセットを読み込むために……
2. ……`--restore`が使えます。（パイプで流し込んだり、ログファイルを通したりして）新しいデータが渡されたときは、元のデータセットに追記されます。

##### 補足 #####

GoAccessでは処理される全てのファイルのinodeが追跡されています（ファイルが同じパーティションにあり続けることを仮定しています）。加えて、ログからデータの一部と共に、各ファイルの解析された最後の行と、解析された最後の行の時間記録が抽出されます。例えば、`inode:29627417|line:20012|ts:20171231235059`です。

まず、データの一部が解析されたログと合致するか比較します。合致したら、ログが劇的には変化していないと仮定されます。例えば、切り詰められたりはしていないとされます。inodeが現在のファイルと合致しなければ、全ての行が解析されます。現在のファイルがinodeに合致すれば、残りの行を読み込み、解析された行数と時間記録を更新します。もう1つ予め注意が必要なのは、保存された時間記録より古いログの行は解析されないということです。

パイプで流し込まれたデータは、読み込まれた最後の行の時間記録に基づいて扱われます。例えば、解析の際、保存された時間記録より新しいものが見つかるまで、全ての入ってくる項目は無視されます。

##### 例 #####

    // 先月のアクセスログ
    # goaccess access.log.1 --persist

として、次のように読み込みます。

    // この月のアクセスログを追記し新しいデータを保存します。
    # goaccess access.log --restore --persist

（新しいデータを解析することなく）永続化されたデータのみを読むには次のようにします。

    # goaccess --restore

## 貢献 ##

Any help on GoAccess is welcome. The most helpful way is to try it out and
give feedback. Feel free to use the GitHub issue tracker and pull requests
to discuss and submit code changes.

You can contribute to our translations by editing the .po files direct on
GitHub or using the visual interface
[inlang.com](https://inlang.com/editor/github.com/allinurl/goaccess)

[![translation
badge](https://inlang.com/badge?url=github.com/allinurl/goaccess)](https://inlang.com/editor/github.com/allinurl/goaccess?ref=badge)

お楽しみください！
