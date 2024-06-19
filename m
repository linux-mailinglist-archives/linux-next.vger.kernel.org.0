Return-Path: <linux-next+bounces-2598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955990E977
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 13:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20A8F1F2446C
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 11:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEE9136657;
	Wed, 19 Jun 2024 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsqjLCZg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B28763FD;
	Wed, 19 Jun 2024 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796721; cv=none; b=b39SFeACmGPH/YRHFCfbiwjoz00pekUR/5my/e6ysUCsuKlR0p86yEyK6RUk6lEeH4lSdbM8YjfAkM6zSKdtgz9qwsOJs6ks0h2setNlePm4f9EBdrK8ut8/w4IeMSNhwoQdW4c0X2JfeSz0McTJm96XMDRiCHrwQFeu5/90gpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796721; c=relaxed/simple;
	bh=HnRN8zlkp5w/2Qv0WYMC6hl58p7jVXaV2N3xIBQVmkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYbjAmD9DWJ/JrjTB7fNJWFdVwFns0RcKOqXsGNB4n2Rh4HSRkIO3RQebpu902QZWuo94CXtgSdAnXre+lkVcoTxuYD4vOaAAtprWnZalnrTu8iHoGYMywGV1oIsCwrGpLJFkx2CUzZFJuLJhOD1OdDkuuqTMFfc1bQaT9XvLkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsqjLCZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0F6C2BBFC;
	Wed, 19 Jun 2024 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718796720;
	bh=HnRN8zlkp5w/2Qv0WYMC6hl58p7jVXaV2N3xIBQVmkY=;
	h=Date:From:To:Cc:Subject:From;
	b=dsqjLCZgIqA9M3GS7vr1F9RgZudNoHNCq4DFt3d0CtliAkWodPuHWyNh1OyifMWLj
	 8Kl3U4K4hQIj5sbnTHh2t3haLynpTSnhefW0PJEWmJ38KQJE4itiCUg23Vpp/eKS8a
	 GVI5KLd3LajbB9xXQHzTcerVvh7MZw9duRQWamDNQC3ayqztdaBvyI8s+GOYp5i0xD
	 9UprdVflfAk59RVe1wMy4w8gQI2M7Iy7onfVYrMKF9NCEQXSX6mTY2JWQ+hYddcyBH
	 DqYGS91KxyZ/TtmgA7RuZd/aTy524CPD4j3GHl2bmW93rdqEDakU+cjk5o5ckxd8yy
	 mmPV7yTnrEeMw==
Date: Wed, 19 Jun 2024 12:31:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <ZnLBrO71obXfwGkE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k6JZAW0Y80KZk8Cy"
Content-Disposition: inline


--k6JZAW0Y80KZk8Cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (arm64 defconfig)
failed like this:

/tmp/next/build/mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_cfttypes_i=
nit':
/tmp/next/build/mm/hugetlb_cgroup.c:840:42: error: 'struct cftype' has no m=
ember named 'lockdep_key'
  840 |                 lockdep_register_key(&cft->lockdep_key);
      |                                          ^~
make[4]: *** [/tmp/next/build/scripts/Makefile.build:244: mm/hugetlb_cgroup=
=2Eo] Error 1

Caused by commit

  eb9290991cb59 ("mm/hugetlb_cgroup: register lockdep key for cftype")


=46rom 2de1726235b66fe778f30b53532baaa48b284f8c Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Wed, 19 Jun 2024 12:21:59 +0100
Subject: [PATCH] mm: Fix build failure due to missing build time check

/tmp/next/build/mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_cfttypes_i=
nit':
/tmp/next/build/mm/hugetlb_cgroup.c:840:42: error: 'struct cftype' has no m=
ember named 'lockdep_key'
  840 |                 lockdep_register_key(&cft->lockdep_key);
      |                                          ^~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 mm/hugetlb_cgroup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index 4ff238ba12503..369431160a0a8 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -837,7 +837,9 @@ hugetlb_cgroup_cfttypes_init(struct hstate *h, struct c=
ftype *cft,
 					   MEMFILE_FIELD_SIZE(offset) * idx;
 		}
=20
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
 		lockdep_register_key(&cft->lockdep_key);
+#endif
 	}
 }
=20
--=20
2.39.2


--k6JZAW0Y80KZk8Cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZywasACgkQJNaLcl1U
h9A+rwf8COMRDOHxtlVK3DakUMWMk0dYC8gHryhVLgbp5DjNl4vu9r1QQGbhmEr3
C/ZjlbhpQ8nYODu2nnLAdFWcg3vFtgHm8iPxo0uTQv4a7ZHxNGVN/L0EaJaWb0sA
QZ4if/a/rGslz87GDZkrFz4DYFzUqejNDW+Vb7gA0IH8wsUEwHJSlTSgnVH2W3mq
9eWDW+/IEXVQuQPzNKpzyPqkr9bLw3sCOo7tGFQKI+Vazs5N8Byk6Zo8HVpJuRcR
aUqLOPxt4miMeuOiOFVM/9ScIHUsmebY/1StAX4nI+1YnkjU6wv7tlByED4isY3D
fvNQwB4C6qXf69K4LtGkEJ03YbnYnA==
=EcR6
-----END PGP SIGNATURE-----

--k6JZAW0Y80KZk8Cy--

