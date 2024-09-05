Return-Path: <linux-next+bounces-3602-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE2696CC69
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 03:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3FE285EA9
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 01:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F052E8F66;
	Thu,  5 Sep 2024 01:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CQBgLoxi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157C8BFF;
	Thu,  5 Sep 2024 01:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725501355; cv=none; b=Mbvaja55ZDH76GYEtDPX0W/9X5dAvgzbYHETL4uMt0CZ3qycf6svQQauxsmYYnL/umGWeFb08u5Bq5xZ20p6B8Yxjmn+qb2iMJX3xI66BHPTeoNMpJjJFHp9cmfw/knZ4ehDS6xdG/lXPBdxaW0sWk8UAgXq6exuRaSLJ1qBt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725501355; c=relaxed/simple;
	bh=aXDBR6mobi74rtyFl8uzHMf9pd9WPvyhMgT/trGk0LM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aIsU0JF/WaZpDTE4fYxVNU8ave6VAI6O+nZkeaqLuGVtJ4QWEP78BYP3z1uSXCZ0vfbU4QQ0W3uPug+LrKH4vqviv4H10rHAAxNFe0uORyaIOEmqJZQS7PEbGrz1SghguYcO9xPJNgm5NATbyyOu55tOq20vwt2s68Kfmf8bk8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CQBgLoxi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725501349;
	bh=l10Mn0RRfpFDZQXV/LMbWX+X5CpX+W6dgcGRQwtR10w=;
	h=Date:From:To:Cc:Subject:From;
	b=CQBgLoxiIfLLSKGHOEVks3vvGTcOm1r9MSFUAhaFCC5Tx02Ctv/xLYEHc1Fq2YfID
	 sd1HgLxWN8VEoH964rk4eDXYCnQyUNVWg1F5RIK3UjIP77lDryIxqX/Pb2eO8Uo5Za
	 z87OcSzzsTRcGIksWpQxU3452/hzJH1ksdqrhqsoIPO28rlwbFN2BJqE4+fYgc9InS
	 bgyEkIFEG/aaE1ZO7etlFQ5kJ9ie2zMwsUVgwC9lHuLSe3RwkArH4ESQ8S/l4urWEH
	 m++giaUXD2rJwLXrnDKKjITRG+mshuhphZYiQ6KMj4QtrEqBn5B1qrLgFYebusjaWK
	 8b1JUJZ1hnTtg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzjBF20bmz4wxx;
	Thu,  5 Sep 2024 11:55:49 +1000 (AEST)
Date: Thu, 5 Sep 2024 11:55:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the perf tree
Message-ID: <20240905115548.745ef16a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A.GBAXKg9YC1=DZx6.RruK5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A.GBAXKg9YC1=DZx6.RruK5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the perf tree, today's linux-next build (native perf)
failed like this:

perf/util/bpf-filter-flex.c: In function 'yy_get_previous_state':
perf/util/bpf-filter-flex.c:1919:9: error: expected expression at end of in=
put
 1919 |         for ( yy_cp =3D (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_b=
uf_p); ++yy_cp )
      |         ^~~
perf/util/bpf-filter-flex.c:1919:9: error: expected declaration or statemen=
t at end of input
perf/util/bpf-filter-flex.c:1919:9: error: no return statement in function =
returning non-void [-Werror=3Dreturn-type]
perf/util/bpf-filter-flex.c: At top level:
perf/util/bpf-filter-flex.c:20:31: error: 'perf_bpf_filter_ensure_buffer_st=
ack' used but never defined [-Werror]
   20 | #define yyensure_buffer_stack perf_bpf_filter_ensure_buffer_stack
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:550:13: note: in expansion of macro 'yyensure_b=
uffer_stack'
  550 | static void yyensure_buffer_stack ( void );
      |             ^~~~~~~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:16:30: error: 'perf_bpf_filter__load_buffer_sta=
te' used but never defined [-Werror]
   16 | #define yy_load_buffer_state perf_bpf_filter__load_buffer_state
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:551:13: note: in expansion of macro 'yy_load_bu=
ffer_state'
  551 | static void yy_load_buffer_state ( void );
      |             ^~~~~~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:604:22: error: 'yy_try_NUL_trans' used but neve=
r defined [-Werror]
  604 | static yy_state_type yy_try_NUL_trans ( yy_state_type current_state=
  );
      |                      ^~~~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:606:24: error: 'yy_fatal_error' used but never =
defined [-Werror]
  606 | static void yynoreturn yy_fatal_error ( const char* msg  );
      |                        ^~~~~~~~~~~~~~
perf/util/bpf-filter-flex.c:510:15: error: 'yy_buffer_stack_max' defined bu=
t not used [-Werror=3Dunused-variable]
  510 | static size_t yy_buffer_stack_max =3D 0; /**< capacity of stack. */
      |               ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

I don't know what caused this, but just redoing the build worked.
Is there maybe a dependency missing?

--=20
Cheers,
Stephen Rothwell

--Sig_/A.GBAXKg9YC1=DZx6.RruK5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZD6QACgkQAVBC80lX
0GyIywgAgnHP2XzAjcvyPIz4hGHPU6pPsqv7m7DdpNhizqgtCB4f2vLl+LqzbRKN
DJS96XXlW1mXk6kENre5F6Y6rXDf7T63+A6lWW26romM2Eld0dbf37aYFn6KMZni
tUZbAwTKgWScgSA7iKFtUDkIugiNz8lw1tGmNa8xSqOAjKUSnMcMuUQls3Ln/Tr/
OFsFPDa0Kv8F0em/fHC0q1wibqnJnzYAyG1E8W6IGl1GXf2K2j6vY5Ei5DmbXHM5
tibHMB1xlhq/CMqCIXxzqw7mtZQirqowyU5DZTbWbHIaSUYmzSzI/fDAEmxPo8jd
d+unOM4mY/9dbZEHPlBEbpZjdk5l5A==
=f3yP
-----END PGP SIGNATURE-----

--Sig_/A.GBAXKg9YC1=DZx6.RruK5--

