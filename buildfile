require 'buildr/scala'

VERSION_NUMBER = "1.0.10"

repositories.remote << "http://www.ibiblio.org/maven2/"

HTTPCLIENT = 'commons-httpclient:commons-httpclient:jar:3.1'
CODEC = 'commons-codec:commons-codec:jar:1.3'
POOL = 'commons-pool:commons-pool:jar:1.4'

SLF4J_VERSION = "1.5.6"
SLF4J = [
  "org.slf4j:slf4j-api:jar:#{SLF4J_VERSION}",
  "org.slf4j:slf4j-log4j12:jar:#{SLF4J_VERSION}",
  "org.slf4j:jcl-over-slf4j:jar:#{SLF4J_VERSION}"
]
LOG4J = "log4j:log4j:jar:1.2.15"

FAKESDB = "fakesdb:fakesdb-standalone:jar:2.1"

download(artifact(FAKESDB) => 'https://github.com/downloads/stephenh/fakesdb/fakesdb-standalone-2.1.jar')

desc 'Scala binding for Amazon SimpleDB'
define "simplistic" do
  project.version = VERSION_NUMBER
  project.group = "simplistic"

  compile.with(HTTPCLIENT, CODEC, POOL).using(:deprecation => true)

  test.using :scalatest
  test.with FAKESDB, LOG4J, SLF4J

  package :jar
end

