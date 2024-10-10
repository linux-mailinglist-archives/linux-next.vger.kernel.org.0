Return-Path: <linux-next+bounces-4224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD899995DE
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 01:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2E81C21095
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 23:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBD91C1AD8;
	Thu, 10 Oct 2024 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLQiC7Rs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611F19D082;
	Thu, 10 Oct 2024 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728604664; cv=none; b=Lx8QV9SNLw8hpFqLOI/yeN6jLbPNZboJ4JG3PLqBpKdrWHXWUUQ1i2jNn+6fYqV2tYLJlKKx6wzF8uWfpD97ewBE1nik1k4cMIOHByM9OEC9TTvrQTpXeh5g3EOi9kTotP8U38X10HU2YClaSxTpPsbH2KjN55DWnQIVcRUc4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728604664; c=relaxed/simple;
	bh=WtQOmuYMCSTmXkatUPgmeEtVV8AXlwJbBy9CuWURQ2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMRzgFuQVy6UlBxxw4DDAuyabqPngQJuimM9nGs/auahp47Cs+5wNeTOC8M4B109mHhMiroyIeG4+LNmN4d2EtIT0BSVdO7Kk/74OQfIF0R8ZvN01QHTnOCkPHpd7DlB0tYzxKI52niP5j5nUsX7risOChCIBTwuKrNZKw/CrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLQiC7Rs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048D4C4CEC5;
	Thu, 10 Oct 2024 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728604664;
	bh=WtQOmuYMCSTmXkatUPgmeEtVV8AXlwJbBy9CuWURQ2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLQiC7RsHesYLkAPo8UBw+PFRTxfB/HoR04/vbAjkzE+vklk9QVYPANV/arPXCNW1
	 R3BOZJbW5f9jnDTz3J1GuLZ/gi0D4e6FvOfjY+1XQAuGSBrGkSeOE9ucMOVnOg+2xr
	 G6yVDmDH37VRsZInyBwvMT92Z15SRL4IFtQFmt09MRejYdUvEKczxvIJu04fWC4A1n
	 tM96U4TtG/+EAB4WKNQ8aPlBw0PKdUm3HprZpvyer1qGS8WUavajfsQ1gpvVqcESaV
	 HqO+MKxaspmqNVmW3rP+xndPdncFYA+NUsONzlRH/Za8nREz6qVOjS4onm/PV6MsHH
	 SdUEf21o5rSsQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-next@vger.kernel.org
Subject: [PATCH] perf tools: Fix build failures on ppc64le
Date: Thu, 10 Oct 2024 16:57:43 -0700
Message-ID: <20241010235743.1356168-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241011102330.02bece12@canb.auug.org.au>
References: <20241011102330.02bece12@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  util/evsel.c: In function 'store_event':
  util/evsel.c:138:50: error: format '%llu' expects argument of type 'long long unsigned int',
                       but argument 6 has type '__u64' {aka 'long unsigned int'} [-Werror=format=]
    138 |         snprintf(path, PATH_MAX, "%s/event-%d-%llu-%d", dir,
        |                                               ~~~^
        |                                                  |
        |                                                  long long unsigned int
        |                                               %lu
    139 |                  attr->type, attr->config, fd);
        |                              ~~~~~~~~~~~~
        |                                  |
        |                                  __u64 {aka long unsigned int}
  util/evsel.c:147:41: error: format '%llu' expects argument of type 'long long unsigned int',
                       but argument 4 has type '__u64' {aka 'long unsigned int'} [-Werror=format=]
    147 |         if (fprintf(file, "[event-%d-%llu-%d]\n",
        |                                      ~~~^
        |                                         |
        |                                         long long unsigned int
        |                                      %lu
    148 |                     attr->type, attr->config, fd) < 0) {
        |                                 ~~~~~~~~~~~~
        |                                     |
        |                                     __u64 {aka long unsigned int}
  util/evsel.c:164:33: error: format '%llu' expects argument of type 'long long unsigned int',
                       but argument 3 has type '__u64' {aka 'long unsigned int'} [-Werror=format=]
    164 |         WRITE_ASS(config,  "llu");
        |                                 ^
  util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
    122 |         if (fprintf(file, #str "=%"fmt "\n", data) < 0) {               \
        |                            ^~~
  util/evsel.c:164:9: note: in expansion of macro 'WRITE_ASS'
    164 |         WRITE_ASS(config,  "llu");
        |         ^~~~~~~~~
  ...
    cc1: all warnings being treated as errors

Fixes: f90a291448877ab45 ("perf test: Remove C test wrapper for attr.py")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
Hi Stephen, can you please test if this patch fixes it?

Thanks,
Namhyung

 tools/perf/util/evsel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 37c338b0f8b2bb04..88e98c0b10528a63 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -108,7 +108,7 @@ static int store_event(struct perf_event_attr *attr, pid_t pid, struct perf_cpu
 	char path[PATH_MAX];
 	char *dir = getenv("PERF_TEST_ATTR");
 
-	snprintf(path, PATH_MAX, "%s/event-%d-%llu-%d", dir,
+	snprintf(path, PATH_MAX, "%s/event-%d-%"PRI_lu64"-%d", dir,
 		 attr->type, attr->config, fd);
 
 	file = fopen(path, "w+");
@@ -117,7 +117,7 @@ static int store_event(struct perf_event_attr *attr, pid_t pid, struct perf_cpu
 		return -1;
 	}
 
-	if (fprintf(file, "[event-%d-%llu-%d]\n",
+	if (fprintf(file, "[event-%d-%"PRI_lu64"-%d]\n",
 		    attr->type, attr->config, fd) < 0) {
 		perror("test attr - failed to write event file");
 		fclose(file);
@@ -134,10 +134,10 @@ static int store_event(struct perf_event_attr *attr, pid_t pid, struct perf_cpu
 	/* struct perf_event_attr */
 	WRITE_ASS(type,   PRIu32);
 	WRITE_ASS(size,   PRIu32);
-	WRITE_ASS(config,  "llu");
-	WRITE_ASS(sample_period, "llu");
-	WRITE_ASS(sample_type,   "llu");
-	WRITE_ASS(read_format,   "llu");
+	WRITE_ASS(config,  PRI_lu64);
+	WRITE_ASS(sample_period, PRI_lu64);
+	WRITE_ASS(sample_type,   PRI_lu64);
+	WRITE_ASS(read_format,   PRI_lu64);
 	WRITE_ASS(disabled,       "d");
 	WRITE_ASS(inherit,        "d");
 	WRITE_ASS(pinned,         "d");
@@ -168,10 +168,10 @@ static int store_event(struct perf_event_attr *attr, pid_t pid, struct perf_cpu
 	WRITE_ASS(use_clockid,    "d");
 	WRITE_ASS(wakeup_events, PRIu32);
 	WRITE_ASS(bp_type, PRIu32);
-	WRITE_ASS(config1, "llu");
-	WRITE_ASS(config2, "llu");
-	WRITE_ASS(branch_sample_type, "llu");
-	WRITE_ASS(sample_regs_user,   "llu");
+	WRITE_ASS(config1, PRI_lu64);
+	WRITE_ASS(config2, PRI_lu64);
+	WRITE_ASS(branch_sample_type, PRI_lu64);
+	WRITE_ASS(sample_regs_user,   PRI_lu64);
 	WRITE_ASS(sample_stack_user,  PRIu32);
 
 	fclose(file);
-- 
2.47.0.rc1.288.g06298d1525-goog


