Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0462027B63E
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 22:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgI1U1E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 16:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgI1U0z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2020 16:26:55 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701D8C0613CE
        for <linux-next@vger.kernel.org>; Mon, 28 Sep 2020 13:26:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d13so1893747pgl.6
        for <linux-next@vger.kernel.org>; Mon, 28 Sep 2020 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CzRblziNDCaC7keBvDiohhrFtalx1DXB9TPgmLszZrA=;
        b=e9JuINGPJVrbQYKx7vuqE1Loo2OssneXzQmGiy4MVvC7Kr42QHsB4ujyYE3sThJClK
         eyB3VynG+2YNjxnCFf54brvGq1UAcCaEzzn8XYUwVZJfWgYnFd0mf7pKZMQf5XmutkrW
         EwMA/bmLqy5rsMsw501J+eXLKTtB/3DeH+SsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CzRblziNDCaC7keBvDiohhrFtalx1DXB9TPgmLszZrA=;
        b=InsjqLgw20Do3ROKYrm7cC1Z00PxkUbgHmsr2tH+TySD1E8xp2h2UgT5dL3gPiSRTU
         oy9urzhRbi9tzepxIaC2r2jT+cmOCldlKB7oRv90jan0S8TAnYX9HEUWeFVlJt1Q4dMs
         rBByEwp+e1C5t01jCxITYJntI5pEPiI00B1i3eJIKg3nBN4O5uWQJVTMg53uVBX4TkB9
         1e66d+Hxdjx7qjhORN45Bhc/rDkMUWaw0KzQTgoPjJJRiMxxZ959w60mSRDP0Od6P23z
         Ytm3Kpg1jwjsJkgm3mBFK7bGDsBnnDJuUfYrVaHD0MKx8u3Ntqi1D71DyjdmjKygNsfG
         QgCQ==
X-Gm-Message-State: AOAM531HQw9KX1ExDFuWK1Sv0Vx6T7LJLMdlTi4aMA7ug0KYS6rADDY2
        516pzkrDcnEwK17SvO9KCXS6gQ==
X-Google-Smtp-Source: ABdhPJw9/nkVGUaCF6L4XFEYdzCOxCettpuRg4CZXwXCSjvmtNORVnNbFu6HTgjWfkWiVu1RK/mdLQ==
X-Received: by 2002:a62:6845:0:b029:13e:dcd:75bd with SMTP id d66-20020a6268450000b029013e0dcd75bdmr1112623pfc.12.1601324814948;
        Mon, 28 Sep 2020 13:26:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id bx18sm2214323pjb.6.2020.09.28.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:26:53 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <shuah@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Hangbin Liu <liuhangbin@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/3] selftests/run_kselftest.sh: Make each test individually selectable
Date:   Mon, 28 Sep 2020 13:26:49 -0700
Message-Id: <20200928202650.2530280-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928202650.2530280-1-keescook@chromium.org>
References: <20200928202650.2530280-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Currently with run_kselftest.sh there is no way to choose which test
we could run. All the tests listed in kselftest-list.txt are all run
every time. This patch enhanced the run_kselftest.sh to make the test
collections (or tests) individually selectable. e.g.:

$ ./run_kselftest.sh -c seccomp -t timers:posix_timers -t timers:nanosleep

Additionally adds a way to list all known tests with "-l", usage
with "-h", and perform a dry run without running tests with "-n".

Co-developed-by: Hangbin Liu <liuhangbin@gmail.com>
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/run_kselftest.sh | 77 ++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 8b0ad4766d78..609a4ef9300e 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -8,21 +8,86 @@ cd $BASE_DIR
 TESTS="$BASE_DIR"/kselftest-list.txt
 if [ ! -r "$TESTS" ] ; then
 	echo "$0: Could not find list of tests to run ($TESTS)" >&2
-	exit 1
+	available=""
+else
+	available="$(cat "$TESTS")"
 fi
-available="$(cat "$TESTS")"
 
 . ./kselftest/runner.sh
 ROOT=$PWD
 
-if [ "$1" = "--summary" ] ; then
-	logfile="$BASE_DIR"/output.log
-	cat /dev/null > $logfile
+usage()
+{
+	cat <<EOF
+Usage: $0 [OPTIONS]
+  -s | --summary		Print summary with detailed log in output.log
+  -t | --test COLLECTION:TEST	Run TEST from COLLECTION
+  -c | --collection COLLECTION	Run all tests from COLLECTION
+  -l | --list			List the available collection:test entries
+  -d | --dry-run		Don't actually run any tests
+  -h | --help			Show this usage info
+EOF
+	exit $1
+}
+
+COLLECTIONS=""
+TESTS=""
+dryrun=""
+while true; do
+	case "$1" in
+		-s | --summary)
+			logfile="$BASE_DIR"/output.log
+			cat /dev/null > $logfile
+			shift ;;
+		-t | --test)
+			TESTS="$TESTS $2"
+			shift 2 ;;
+		-c | --collection)
+			COLLECTIONS="$COLLECTIONS $2"
+			shift 2 ;;
+		-l | --list)
+			echo "$available"
+			exit 0 ;;
+		-n | --dry-run)
+			dryrun="echo"
+			shift ;;
+		-h | --help)
+			usage 0 ;;
+		"")
+			break ;;
+		*)
+			usage 1 ;;
+	esac
+done
+
+# Add all selected collections to the explicit test list.
+if [ -n "$COLLECTIONS" ]; then
+	for collection in $COLLECTIONS ; do
+		found="$(echo "$available" | grep "^$collection:")"
+		if [ -z "$found" ] ; then
+			echo "No such collection '$collection'" >&2
+			exit 1
+		fi
+		TESTS="$TESTS $found"
+	done
+fi
+# Replace available test list with explicitly selected tests.
+if [ -n "$TESTS" ]; then
+	valid=""
+	for test in $TESTS ; do
+		found="$(echo "$available" | grep "^${test}$")"
+		if [ -z "$found" ] ; then
+			echo "No such test '$test'" >&2
+			exit 1
+		fi
+		valid="$valid $found"
+	done
+	available="$(echo "$valid" | sed -e 's/ /\n/g')"
 fi
 
 collections=$(echo "$available" | cut -d: -f1 | uniq)
 for collection in $collections ; do
 	[ -w /dev/kmsg ] && echo "kselftest: Running tests in $collection" >> /dev/kmsg
 	tests=$(echo "$available" | grep "^$collection:" | cut -d: -f2)
-	(cd "$collection" && run_many $tests)
+	($dryrun cd "$collection" && $dryrun run_many $tests)
 done
-- 
2.25.1

