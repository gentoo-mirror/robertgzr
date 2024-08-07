# Copyright 2020-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="distributed, offline-first bug tracker"
HOMEPAGE="https://github.com/MichaelMure/git-bug"

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"github.com/99designs/gqlgen v0.10.3-0.20200208093655-ab8d62b67dd0"
	"github.com/99designs/gqlgen v0.10.3-0.20200208093655-ab8d62b67dd0/go.mod"
	"github.com/99designs/gqlgen v0.10.3-0.20200209012558-b7a58a1c0e4b"
	"github.com/99designs/gqlgen v0.10.3-0.20200209012558-b7a58a1c0e4b/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/Masterminds/glide v0.13.2/go.mod"
	"github.com/Masterminds/semver v1.4.2/go.mod"
	"github.com/Masterminds/vcs v1.13.0/go.mod"
	"github.com/MichaelMure/go-term-text v0.2.6"
	"github.com/MichaelMure/go-term-text v0.2.6/go.mod"
	"github.com/MichaelMure/go-term-text v0.2.7"
	"github.com/MichaelMure/go-term-text v0.2.7/go.mod"
	"github.com/MichaelMure/go-term-text v0.2.8"
	"github.com/MichaelMure/go-term-text v0.2.8/go.mod"
	"github.com/OneOfOne/xxhash v1.2.2/go.mod"
	"github.com/agnivade/levenshtein v1.0.1"
	"github.com/agnivade/levenshtein v1.0.1/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883"
	"github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883/go.mod"
	"github.com/araddon/dateparse v0.0.0-20190622164848-0fb0a474d195"
	"github.com/araddon/dateparse v0.0.0-20190622164848-0fb0a474d195/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/awesome-gocui/gocui v0.6.1-0.20191115151952-a34ffb055986"
	"github.com/awesome-gocui/gocui v0.6.1-0.20191115151952-a34ffb055986/go.mod"
	"github.com/awesome-gocui/termbox-go v0.0.0-20190427202837-c0aef3d18bcc"
	"github.com/awesome-gocui/termbox-go v0.0.0-20190427202837-c0aef3d18bcc/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/blang/semver v3.5.1+incompatible"
	"github.com/blang/semver v3.5.1+incompatible/go.mod"
	"github.com/cespare/xxhash v1.1.0/go.mod"
	"github.com/cheekybits/genny v0.0.0-20170328200008-9127e812e1e9"
	"github.com/cheekybits/genny v0.0.0-20170328200008-9127e812e1e9/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/codegangsta/cli v1.20.0/go.mod"
	"github.com/coreos/bbolt v1.3.2/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/go-etcd v2.0.0+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e/go.mod"
	"github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f/go.mod"
	"github.com/corpix/uarand v0.1.1"
	"github.com/corpix/uarand v0.1.1/go.mod"
	"github.com/cpuguy83/go-md2man v1.0.10"
	"github.com/cpuguy83/go-md2man v1.0.10/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-sip13 v0.0.0-20181026042036-e10d5fee7954/go.mod"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/fatih/color v1.9.0"
	"github.com/fatih/color v1.9.0/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/go-chi/chi v3.3.2+incompatible/go.mod"
	"github.com/go-errors/errors v1.0.1"
	"github.com/go-errors/errors v1.0.1/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/gogo/protobuf v1.0.0/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.2.1/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/protobuf v1.2.0"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-querystring v1.0.0"
	"github.com/google/go-querystring v1.0.0/go.mod"
	"github.com/gorilla/context v0.0.0-20160226214623-1ea25387ff6f/go.mod"
	"github.com/gorilla/mux v1.6.1/go.mod"
	"github.com/gorilla/mux v1.7.3"
	"github.com/gorilla/mux v1.7.3/go.mod"
	"github.com/gorilla/mux v1.7.4"
	"github.com/gorilla/mux v1.7.4/go.mod"
	"github.com/gorilla/websocket v1.2.0"
	"github.com/gorilla/websocket v1.2.0/go.mod"
	"github.com/gorilla/websocket v1.4.0"
	"github.com/gorilla/websocket v1.4.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway v1.9.0/go.mod"
	"github.com/hashicorp/go-cleanhttp v0.5.1"
	"github.com/hashicorp/go-cleanhttp v0.5.1/go.mod"
	"github.com/hashicorp/go-hclog v0.9.2/go.mod"
	"github.com/hashicorp/go-retryablehttp v0.6.4"
	"github.com/hashicorp/go-retryablehttp v0.6.4/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.4"
	"github.com/hashicorp/golang-lru v0.5.4/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/icrowley/fake v0.0.0-20180203215853-4178557ae428"
	"github.com/icrowley/fake v0.0.0-20180203215853-4178557ae428/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/jonboulle/clockwork v0.1.0/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/kisielk/errcheck v1.1.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/logrusorgru/aurora v0.0.0-20200102142835-e9ef32dff381/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/matryer/moq v0.0.0-20200106131100-75d0ddfc0007/go.mod"
	"github.com/mattn/go-colorable v0.1.4"
	"github.com/mattn/go-colorable v0.1.4/go.mod"
	"github.com/mattn/go-isatty v0.0.8"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.11/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-runewidth v0.0.4/go.mod"
	"github.com/mattn/go-runewidth v0.0.6"
	"github.com/mattn/go-runewidth v0.0.6/go.mod"
	"github.com/mattn/go-runewidth v0.0.8"
	"github.com/mattn/go-runewidth v0.0.8/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/mapstructure v0.0.0-20180203102830-a4e142e9c047/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/ngdinhtoan/glide-cleanup v0.2.0/go.mod"
	"github.com/oklog/ulid v1.3.1/go.mod"
	"github.com/opentracing/basictracer-go v1.0.0/go.mod"
	"github.com/opentracing/opentracing-go v1.0.2/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/phayes/freeport v0.0.0-20171002181615-b8543db493a5"
	"github.com/phayes/freeport v0.0.0-20171002181615-b8543db493a5/go.mod"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v0.9.3/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/common v0.0.0-20181113130724-41aa239b4cce/go.mod"
	"github.com/prometheus/common v0.4.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.0-20190507164030-5867b95ac084/go.mod"
	"github.com/prometheus/tsdb v0.7.1/go.mod"
	"github.com/rogpeppe/fastuuid v0.0.0-20150106093220-6724a57986af/go.mod"
	"github.com/rs/cors v1.6.0/go.mod"
	"github.com/russross/blackfriday v1.5.2"
	"github.com/russross/blackfriday v1.5.2/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/shurcooL/githubv4 v0.0.0-20190601194912-068505affed7"
	"github.com/shurcooL/githubv4 v0.0.0-20190601194912-068505affed7/go.mod"
	"github.com/shurcooL/graphql v0.0.0-20181231061246-d48a9a75455f"
	"github.com/shurcooL/graphql v0.0.0-20181231061246-d48a9a75455f/go.mod"
	"github.com/shurcooL/httpfs v0.0.0-20171119174359-809beceb2371"
	"github.com/shurcooL/httpfs v0.0.0-20171119174359-809beceb2371/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/shurcooL/vfsgen v0.0.0-20180121065927-ffb13db8def0"
	"github.com/shurcooL/vfsgen v0.0.0-20180121065927-ffb13db8def0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/skratchdot/open-golang v0.0.0-20190402232053-79abb63cd66e"
	"github.com/skratchdot/open-golang v0.0.0-20190402232053-79abb63cd66e/go.mod"
	"github.com/soheilhy/cmux v0.1.4/go.mod"
	"github.com/spaolacci/murmur3 v0.0.0-20180118202830-f09979ecbc72/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.5"
	"github.com/spf13/cobra v0.0.5/go.mod"
	"github.com/spf13/cobra v0.0.6"
	"github.com/spf13/cobra v0.0.6/go.mod"
	"github.com/spf13/cobra v0.0.7"
	"github.com/spf13/cobra v0.0.7/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.3"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/viper v1.3.2/go.mod"
	"github.com/spf13/viper v1.4.0/go.mod"
	"github.com/stretchr/objx v0.1.0"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.1/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/theckman/goconstraint v1.11.0"
	"github.com/theckman/goconstraint v1.11.0/go.mod"
	"github.com/tmc/grpc-websocket-proxy v0.0.0-20190109142713-0ad062ec5ee5/go.mod"
	"github.com/ugorji/go v1.1.4/go.mod"
	"github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod"
	"github.com/urfave/cli v1.20.0/go.mod"
	"github.com/vektah/dataloaden v0.2.1-0.20190515034641-a19b9a6e7c9e/go.mod"
	"github.com/vektah/gqlparser v1.2.1"
	"github.com/vektah/gqlparser v1.2.1/go.mod"
	"github.com/vektah/gqlparser v1.3.1"
	"github.com/vektah/gqlparser v1.3.1"
	"github.com/vektah/gqlparser v1.3.1/go.mod"
	"github.com/vektah/gqlparser v1.3.1/go.mod"
	"github.com/xanzy/go-gitlab v0.22.1"
	"github.com/xanzy/go-gitlab v0.22.1/go.mod"
	"github.com/xanzy/go-gitlab v0.24.0"
	"github.com/xanzy/go-gitlab v0.24.0/go.mod"
	"github.com/xanzy/go-gitlab v0.25.0"
	"github.com/xanzy/go-gitlab v0.25.0/go.mod"
	"github.com/xanzy/go-gitlab v0.26.0"
	"github.com/xanzy/go-gitlab v0.26.0/go.mod"
	"github.com/xanzy/go-gitlab v0.27.0"
	"github.com/xanzy/go-gitlab v0.27.0/go.mod"
	"github.com/xanzy/go-gitlab v0.29.0"
	"github.com/xanzy/go-gitlab v0.29.0/go.mod"
	"github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"go.etcd.io/bbolt v1.3.2/go.mod"
	"go.uber.org/atomic v1.4.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20181108082009-03003ca0c849/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20181220203305-927f97764cc3/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190522155817-f3200d17e092/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20181106182150-f42d05182288"
	"golang.org/x/oauth2 v0.0.0-20181106182150-f42d05182288/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20181107165924-66b7b1311ac8/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod"
	"golang.org/x/tools v0.0.0-20180221164845-07fd8470d635/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190125232054-d66bd3c5d5a6/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190515012406-7d7faa4812bd/go.mod"
	"golang.org/x/tools v0.0.0-20200114235610-7ae403b6b589"
	"golang.org/x/tools v0.0.0-20200114235610-7ae403b6b589/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.3.0"
	"google.golang.org/appengine v1.3.0/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.21.0/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/resty.v1 v1.12.0/go.mod"
	"gopkg.in/yaml.v2 v2.0.0-20170812160011-eb3733d160e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"sourcegraph.com/sourcegraph/appdash v0.0.0-20180110180208-2cc67fd64755/go.mod"
	"sourcegraph.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67/go.mod"
)
go-module_set_globals
SRC_URI="https://github.com/MichaelMure/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

RESTRICT="strip"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

src_compile() {
	go generate
	go build \
		-ldflags "-s -w -X github.com/MichealMure/git-bug/commands.GitLastTag=${PV} -X github.com/MichealMure/git-bug/commands.GitExactTag=${PV}" \
		-o ${PN}
}

src_install() {
	dobin ${PN}
}
