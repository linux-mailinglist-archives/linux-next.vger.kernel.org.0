Return-Path: <linux-next+bounces-4222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 729939995B4
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 01:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7952F1C2291E
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 23:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7E01E2839;
	Thu, 10 Oct 2024 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b1QHqEDN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961621C2316;
	Thu, 10 Oct 2024 23:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728602618; cv=none; b=NSBqYmaWMVYys+wtLwyn8nN46ciJonBuetwk3QjholBwN593MjHxhMWkIMd8+BGpz6KdOPz27wjha/R4bQj67OW3RgYC1rRS8CJ9iZ3FA62d7b9R0m8ESZJ4wgW4tz6hS+8+3LVCyeR0MXExbGuQTmckg8vsjwPNykMZFLT5D2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728602618; c=relaxed/simple;
	bh=zSIUU4EIutJsGV4ecHxtDXT7wk9XtbmBS441tFOYCVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I1ueUPG+2m1wPpzXb3wGY7OnEB+iV3KL1YiRLTCTzP+ArdB/kezjpq5z3hPjjgCXxzNzJ3Blz5+ytoirHfnthWkaJ2CFZFYlLMxUc/76qoBIdGJ5IKP/ft1uS3P4o63pgkWP/n1ZZLAGS5fqjZPGFORJuT+SnFmo1+STAx1PbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b1QHqEDN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728602610;
	bh=9IE0OxjsikQFfE5cKhbzBAcsZU0+6Rc7alQKJsUxxUU=;
	h=Date:From:To:Cc:Subject:From;
	b=b1QHqEDNk93ysIqJNaZLt0q5TOm4S3JAeqsjBpVfgnjtBxY4aGTbdFexw4DM9uged
	 7b9/8uv5asydXpBnUrpfa00FvpGYp/g3Zwnpm0/+aUCwGhZOuyuRDpk6MM76o/lS4h
	 04oPL7t7DQNqKJXL7a9uHmU8VcjDoj3ugkAdwKZvqXhmuGKoHNm2cJ6nDsxdkH1/yj
	 iE24Arr2jp5XETjBL0n38a9AjFFNbLtWt01N1MgjbDpukDSIPN+vVlOcCVoQl3ADVB
	 zkv3ng1jW13IwJSRrTdNC5u4MS4BKky/7Hw/BvvB3El+fShJcH9wWnN/4FaHP86S3P
	 l5fNbby7bmlEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPm5t0KtXz4wcs;
	Fri, 11 Oct 2024 10:23:30 +1100 (AEDT)
Date: Fri, 11 Oct 2024 10:23:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the perf tree
Message-ID: <20241011102330.02bece12@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IHBT7_kpKo6QUGABkkQ_o27";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IHBT7_kpKo6QUGABkkQ_o27
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the perf tree, today's linux-next build (native perf)
failed like this:

util/evsel.c: In function 'store_event':
util/evsel.c:138:50: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  138 |         snprintf(path, PATH_MAX, "%s/event-%d-%llu-%d", dir,
      |                                               ~~~^
      |                                                  |
      |                                                  long long unsigned=
 int
      |                                               %lu
  139 |                  attr->type, attr->config, fd);
      |                              ~~~~~~~~~~~~        =20
      |                                  |
      |                                  __u64 {aka long unsigned int}
util/evsel.c:147:41: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  147 |         if (fprintf(file, "[event-%d-%llu-%d]\n",
      |                                      ~~~^
      |                                         |
      |                                         long long unsigned int
      |                                      %lu
  148 |                     attr->type, attr->config, fd) < 0) {
      |                                 ~~~~~~~~~~~~
      |                                     |
      |                                     __u64 {aka long unsigned int}
util/evsel.c:164:33: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  164 |         WRITE_ASS(config,  "llu");
      |                                 ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:164:9: note: in expansion of macro 'WRITE_ASS'
  164 |         WRITE_ASS(config,  "llu");
      |         ^~~~~~~~~
util/evsel.c:165:39: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  165 |         WRITE_ASS(sample_period, "llu");
      |                                       ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:165:9: note: in expansion of macro 'WRITE_ASS'
  165 |         WRITE_ASS(sample_period, "llu");
      |         ^~~~~~~~~
util/evsel.c:166:39: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  166 |         WRITE_ASS(sample_type,   "llu");
      |                                       ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:166:9: note: in expansion of macro 'WRITE_ASS'
  166 |         WRITE_ASS(sample_type,   "llu");
      |         ^~~~~~~~~
util/evsel.c:167:39: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  167 |         WRITE_ASS(read_format,   "llu");
      |                                       ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:167:9: note: in expansion of macro 'WRITE_ASS'
  167 |         WRITE_ASS(read_format,   "llu");
      |         ^~~~~~~~~
util/evsel.c:198:33: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  198 |         WRITE_ASS(config1, "llu");
      |                                 ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:198:9: note: in expansion of macro 'WRITE_ASS'
  198 |         WRITE_ASS(config1, "llu");
      |         ^~~~~~~~~
util/evsel.c:199:33: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  199 |         WRITE_ASS(config2, "llu");
      |                                 ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:199:9: note: in expansion of macro 'WRITE_ASS'
  199 |         WRITE_ASS(config2, "llu");
      |         ^~~~~~~~~
util/evsel.c:200:44: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  200 |         WRITE_ASS(branch_sample_type, "llu");
      |                                            ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:200:9: note: in expansion of macro 'WRITE_ASS'
  200 |         WRITE_ASS(branch_sample_type, "llu");
      |         ^~~~~~~~~
util/evsel.c:201:44: error: format '%llu' expects argument of type 'long lo=
ng unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'}=
 [-Werror=3Dformat=3D]
  201 |         WRITE_ASS(sample_regs_user,   "llu");
      |                                            ^
util/evsel.c:122:28: note: in definition of macro '__WRITE_ASS'
  122 |         if (fprintf(file, #str "=3D%"fmt "\n", data) < 0) {        =
       \
      |                            ^~~
util/evsel.c:201:9: note: in expansion of macro 'WRITE_ASS'
  201 |         WRITE_ASS(sample_regs_user,   "llu");
      |         ^~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  f90a29144887 ("perf test: Remove C test wrapper for attr.py")

This is a native build of perf on ppc64le using

  make -C tools/perf -f Makefile.perf NO_BPF_SKEL=3D1

I have merged the perf tree from next-20241010 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/IHBT7_kpKo6QUGABkkQ_o27
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIYfIACgkQAVBC80lX
0GwoGQf/aASUfjN6RnMGJe/cp/qQ4mJBtpFtTajWZQQ1uyACNtal613rnvcC8qT8
7XIAr8TEgoPgtFnPlM9rcCLFObVQUat7/NYrx8z0H8nHY9ylDTcfRbFOKY4l5qOt
vOsRdF7IBGK5M3WsuTeK5rEzx0R7IXIuJm7RPTzJxCOpSFNTn098vX5qG0frFkEf
y9qZ8FK0VnJlxw+183xg35rtDKMDIe0qlnBXpTBFPE/N/sQl0QLkuDz1g9BlK/j/
sZ3Xeg7We5Gkk+pS+3Wq/b/5aePyyNbiz5tCZdn1Y7oxXEB4sKBK/vqMz0FRVf51
nRalSQWKAoonQxNZSGkS1s0N4I3iaA==
=4dBI
-----END PGP SIGNATURE-----

--Sig_/IHBT7_kpKo6QUGABkkQ_o27--

