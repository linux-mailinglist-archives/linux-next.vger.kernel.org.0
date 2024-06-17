Return-Path: <linux-next+bounces-2564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74390B633
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 18:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133B41C226F8
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 16:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CA114D43B;
	Mon, 17 Jun 2024 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZJPYBZr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4721014D2A8;
	Mon, 17 Jun 2024 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718641387; cv=none; b=qFOOmIq4OaNPOW+f8Gp5AOxpnoN1JEjlmkXlQFNlgPCXGPNnvXFLGVMETUjnz6dTyFCK5GDup5kvSzTyFA91tN703iXVCeJyVqS8ozFmFY20MQr6qwa3BQK5CDemhQZ2CMq5ZkX+4pK62kHrr+EaFis2pITvEc/JN1jEA2zdrac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718641387; c=relaxed/simple;
	bh=c806Pq/jjjyjfsZo3F+ORvkg3f2xW4JPAlPOkf+oCBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ik6II4kLJeWgDeT2oxGhRRS1zNQFhyTxzDJmgLPrCD2uuZSkz/urOkbLby5z4AmGmM65+MqInODZRZbOpeuSKO7pXT/5OuUTmu3bjuHZv8DRJDYWnZubGQjlqYKSduTjROGXwJy3+0e3xwzO9tCclLa2MEUzva3nYaoJY7nm0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZJPYBZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E0FC2BD10;
	Mon, 17 Jun 2024 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718641386;
	bh=c806Pq/jjjyjfsZo3F+ORvkg3f2xW4JPAlPOkf+oCBM=;
	h=Date:From:To:Cc:Subject:From;
	b=eZJPYBZrzHnJqXMg0EMapL+0IS3WhguivvHbRJ7NgMOqV+PCg9+wckXy8ozFGU+Pj
	 yPL9GlB6a6y1pOymwREscg7I7bEy0WWxbbq+DltnRVYbVrIr4j0yatfIklPEsKsMJI
	 dgbGaUga0+o7yandyj+BSAyWIFCEA2QBri8/Wf1/0XCR8XVsNrVRDrh+i5qJGfuW+8
	 pJa5QU24TNX8cm/L/WEuuSPIDyxgvEIBgHClkg7Pr0wb3oEncGF9diCDpBUbmxzrb1
	 GzAbVIX3ivmlnLEOI/KnvDk/CCDogKwOL8jxjEcavFhcn09YR84FNsvUbmx+73AP6S
	 Y58sJzbW6zq/Q==
Date: Mon, 17 Jun 2024 17:23:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <ZnBi5u4CdumbMzcB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fnD9c00v8oUxmuEJ"
Content-Disposition: inline


--fnD9c00v8oUxmuEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/builtin-record.c

between commit:

  5b3cde198878b ("Revert "perf record: Reduce memory for recording PERF_REC=
ORD_LOST_SAMPLES event"")

=66rom the origin tree and commit:

  6c1785cd75ef5 ("perf record: Ensure space for lost samples")

=66rom the perf tree.

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
@@ -1926,7 +1926,7 @@ static void __record__save_lost_samples(struct record=
 *rec, struct evsel *evsel,
 static void record__read_lost_samples(struct record *rec)
 {
 	struct perf_session *session =3D rec->session;
-	struct perf_record_lost_samples *lost =3D NULL;
+	struct perf_record_lost_samples_and_ids lost;
 	struct evsel *evsel;
=20
 	/* there was an error during record__open */
@@ -1951,19 +1951,13 @@ static void record__read_lost_samples(struct record=
 *rec)
=20
 				if (perf_evsel__read(&evsel->core, x, y, &count) < 0) {
 					pr_debug("read LOST count failed\n");
-					goto out;
+					return;
 				}
=20
 				if (count.lost) {
-					if (!lost) {
-						lost =3D zalloc(PERF_SAMPLE_MAX_SIZE);
-						if (!lost) {
-							pr_debug("Memory allocation failed\n");
-							return;
-						}
-						lost->header.type =3D PERF_RECORD_LOST_SAMPLES;
-					}
-					__record__save_lost_samples(rec, evsel, lost,
+					memset(&lost.lost, 0, sizeof(lost));
+					lost.lost.header.type =3D PERF_RECORD_LOST_SAMPLES;
+					__record__save_lost_samples(rec, evsel, &lost.lost,
 								    x, y, count.lost, 0);
 				}
 			}
@@ -1971,20 +1965,12 @@ static void record__read_lost_samples(struct record=
 *rec)
=20
 		lost_count =3D perf_bpf_filter__lost_count(evsel);
 		if (lost_count) {
-			if (!lost) {
-				lost =3D zalloc(PERF_SAMPLE_MAX_SIZE);
-				if (!lost) {
-					pr_debug("Memory allocation failed\n");
-					return;
-				}
-				lost->header.type =3D PERF_RECORD_LOST_SAMPLES;
-			}
-			__record__save_lost_samples(rec, evsel, lost, 0, 0, lost_count,
+			memset(&lost.lost, 0, sizeof(lost));
+			lost.lost.header.type =3D PERF_RECORD_LOST_SAMPLES;
+			__record__save_lost_samples(rec, evsel, &lost.lost, 0, 0, lost_count,
 						    PERF_RECORD_MISC_LOST_SAMPLES_BPF);
 		}
 	}
-out:
-	free(lost);
 }
=20
 static volatile sig_atomic_t workload_exec_errno;
@@ -3196,7 +3182,7 @@ static int switch_output_setup(struct record *rec)
 	unsigned long val;
=20
 	/*
-	 * If we're using --switch-output-events, then we imply its=20
+	 * If we're using --switch-output-events, then we imply its
 	 * --switch-output=3Dsignal, as we'll send a SIGUSR2 from the side band
 	 *  thread to its parent.
 	 */

--fnD9c00v8oUxmuEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwYuUACgkQJNaLcl1U
h9By0Qf+KHFp3+pZ1bTQsB7zdsbJ8eYB1wcbkVMFReYQafczUoQ8oHzJvoR9DSlb
SHI7fT/hUxrE5GF5vdsKZMilagYd/AaEuHOzD07UoJsjW2KHYOjtIi52JWe0KQIl
pom+j8DLWD/Ns9R9GcvtQebKW2BTd7bZeiiTvRjuKKAFb07Sivng1ClQKxqIDcIa
vxBmYb5y0dTT/UiuJ9xv/d6Nvaere1fX8b1I/KF5FPtliLZ49BAMElR8zwILDMLU
nKfRxrLcewTL9NN3BtNKElvd2s5WJNIJRqAYl6BfCPZ5DliM2fPY3vZXjHpl6tEO
Hn8iKUhGdAxIWyn1kEoZZ7TuAOFebg==
=CyV0
-----END PGP SIGNATURE-----

--fnD9c00v8oUxmuEJ--

