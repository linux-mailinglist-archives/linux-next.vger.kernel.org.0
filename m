Return-Path: <linux-next+bounces-2563-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1E90B61E
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 18:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92A18283E2D
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 16:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC081C2BD;
	Mon, 17 Jun 2024 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyjfTB//"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C681C287;
	Mon, 17 Jun 2024 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718641157; cv=none; b=kglw+g/L2wNr5+zoWqlSCvj06Oau9PiZ8GywT8oniGxtsE2zHyyGj1DIAwL0y+4zVFUyMNbfZrFj/ASm7KvLqqAq2A+lRxTqrqcChqBB7u9Nt+dy/o2HUpzmOcsjodLWvpWVvOsNllSbZiuJYlb0WbCuwe0LxV4XrfxCSoLUpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718641157; c=relaxed/simple;
	bh=tNMKTFx8GZIsHQAa1TVjBp9pE152a4bTFj1Yozh2Ewc=;
	h=From:Date:Message-ID:To:Cc:Cc:Cc:Cc:Subject; b=GnU+EhllyryIvHjJof+toSabvEpI/XRgsKHMj9Rgyiujy5RvrKewzO1ZRJ/0hWP8tUgBltW3fBHz/Oosmtz2/O7SC1LjLY9iO43eKODo2wy5/z5lrPxx1kXHrfSbzVrgCXGRYmvZ3rkpXfSpdqn+M1GC2AlGXrk/1TAqGYWRy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyjfTB//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B66C2BD10;
	Mon, 17 Jun 2024 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718641157;
	bh=tNMKTFx8GZIsHQAa1TVjBp9pE152a4bTFj1Yozh2Ewc=;
	h=From:Date:To:Cc:Cc:Cc:Cc:Subject:From;
	b=iyjfTB//cTSyRjYJZZ/YpaLXx6Q28lQMJCYtAOGgDFEk4oqV5p8FPBkutxGsSvXTG
	 tHB2d9hsOg7Jw32NXDCHJPRjCqBJDcWCvmKZ9Dyg0wXgu6keJBuQpVOA9dzcJ/9fJF
	 uembCL4jdK2cVx/Ys/QNRDUpTpkRyL8oTiNGcR+KcSJgSqXSmZs4xSUbbVEZoo5ZSo
	 nG7Xh8XaxldSOWkNiNa1aHJ4ZWJuX6q2iRdYQpS30dMdcxBovtgS3aLmoExEfZiJ1i
	 mYweP/AGFwstC7UcwL+6CvH0QjYGmImAbiOYo3mR9GIGjhwETZTj005KTwMo0HZbW+
	 3/0wE26tspbdw==
From: broonie@kernel.org
Date: Mon, 17 Jun 2024 17:19:14 +0100
Message-ID: <9de6dc27d89ada54613f3b5a830fee12.broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with the origin tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/builtin-record.c

between commit:

  5b3cde198878b ("Revert "perf record: Reduce memory for recording PERF_RECORD_LOST_SAMPLES event"")

from the origin tree and commit:

  6c1785cd75ef5 ("perf record: Ensure space for lost samples")

from the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 0a8ba1323d64b..019305b94e5fc 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -1926,7 +1926,7 @@ static void __record__save_lost_samples(struct record *rec, struct evsel *evsel,
 static void record__read_lost_samples(struct record *rec)
 {
 	struct perf_session *session = rec->session;
-	struct perf_record_lost_samples *lost = NULL;
+	struct perf_record_lost_samples_and_ids lost;
 	struct evsel *evsel;
 
 	/* there was an error during record__open */
@@ -1951,19 +1951,13 @@ static void record__read_lost_samples(struct record *rec)
 
 				if (perf_evsel__read(&evsel->core, x, y, &count) < 0) {
 					pr_debug("read LOST count failed\n");
-					goto out;
+					return;
 				}
 
 				if (count.lost) {
-					if (!lost) {
-						lost = zalloc(PERF_SAMPLE_MAX_SIZE);
-						if (!lost) {
-							pr_debug("Memory allocation failed\n");
-							return;
-						}
-						lost->header.type = PERF_RECORD_LOST_SAMPLES;
-					}
-					__record__save_lost_samples(rec, evsel, lost,
+					memset(&lost.lost, 0, sizeof(lost));
+					lost.lost.header.type = PERF_RECORD_LOST_SAMPLES;
+					__record__save_lost_samples(rec, evsel, &lost.lost,
 								    x, y, count.lost, 0);
 				}
 			}
@@ -1971,20 +1965,12 @@ static void record__read_lost_samples(struct record *rec)
 
 		lost_count = perf_bpf_filter__lost_count(evsel);
 		if (lost_count) {
-			if (!lost) {
-				lost = zalloc(PERF_SAMPLE_MAX_SIZE);
-				if (!lost) {
-					pr_debug("Memory allocation failed\n");
-					return;
-				}
-				lost->header.type = PERF_RECORD_LOST_SAMPLES;
-			}
-			__record__save_lost_samples(rec, evsel, lost, 0, 0, lost_count,
+			memset(&lost.lost, 0, sizeof(lost));
+			lost.lost.header.type = PERF_RECORD_LOST_SAMPLES;
+			__record__save_lost_samples(rec, evsel, &lost.lost, 0, 0, lost_count,
 						    PERF_RECORD_MISC_LOST_SAMPLES_BPF);
 		}
 	}
-out:
-	free(lost);
 }
 
 static volatile sig_atomic_t workload_exec_errno;
@@ -3196,7 +3182,7 @@ static int switch_output_setup(struct record *rec)
 	unsigned long val;
 
 	/*
-	 * If we're using --switch-output-events, then we imply its 
+	 * If we're using --switch-output-events, then we imply its
 	 * --switch-output=signal, as we'll send a SIGUSR2 from the side band
 	 *  thread to its parent.
 	 */

