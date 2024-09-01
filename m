Return-Path: <linux-next+bounces-3519-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B078D967C7E
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 00:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E82F1F21730
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 22:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731DB13AA3F;
	Sun,  1 Sep 2024 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JEprkd9q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7437708;
	Sun,  1 Sep 2024 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725228712; cv=none; b=Jj1KT209Zfrm7liWiMaMEgZeTeXwgoPAzipqlA8i2wYrGayGh5Yw8Ik8qfW/WMhA+WZvcNbEzKKsvHKVak5nI8DSdouIPWyQJI8qpuNdcr8Xx70Wd7J8gdDFpJ/cwIKFzeTLF0TXiqU9QbP5c+a33B1Z9Z1BlVOWINbT3iqESz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725228712; c=relaxed/simple;
	bh=eQUy7zUuZU/m4d6Ml7R4dvTv3QYIJS3O/FWAOaZIk60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Sdrp3HNPRTWJLBQow1Gh+p2dgpQq9/bT811jAxJx5rk0yQvGfuzUCAqp0Zsttpjt7PFQS5Tmdv6lRBwYk0ZxCzcdDBA2iNIuv8b/AoiJTlZ9m0LfpcTt51HE8x4Qb9J3roLhyLWjSHLNrKkY5I3/+DopKWVogREv469YEAFGmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JEprkd9q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725228705;
	bh=Dxm2WOeTRLX3AJSN+AvsJRjW0Bjum+sXlPbyKnIkW5M=;
	h=Date:From:To:Cc:Subject:From;
	b=JEprkd9qXIGVe2pIEAO//93yoZfJWCxH5w3QNV3fGi3ibCuC1/WsCl6u6lCIWFQey
	 u6RQtjLq8pBdrkzNYrdBgS0HiNwFfB7xFawguuEKJxhlD0aMXMYwpfN3fVz41knPzQ
	 lBi0PBA9l7drvy3lWoWtm99LhsWiXaknLskhodKPUyDIvDg4mbn+ZCBjFWT3SgyvWs
	 jc1ZVZLZmyP0UWVYfYflj72Refk/40buulEDwMxnhsCUEC9PMQS5FcKmDg6FJ25WKE
	 nD26sn07nrBlMWiL15xmYrvxQT2l9t/U6gn5xKdHfc3n1VSZhOWgP1eo+hrFPevvSj
	 B/mG/Melk94kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxmM53xqtz4x87;
	Mon,  2 Sep 2024 08:11:45 +1000 (AEST)
Date: Mon, 2 Sep 2024 08:11:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the cgroup tree
Message-ID: <20240902081125.4467945f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LTAeC+VP3q5+1xMj=Qo_oxa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LTAeC+VP3q5+1xMj=Qo_oxa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  169a8edf147f ("cgroup/cpuset: Move cpu.h include to cpuset-internal.h")

Fixes tag

  Fixes: dd46bd00ab4c ("cgroup/cpuset: move relax_domain_level to cpuset-v1=
.c")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 047b83097448 ("cgroup/cpuset: move relax_domain_level to cpuset-v1.c=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/LTAeC+VP3q5+1xMj=Qo_oxa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbU5o0ACgkQAVBC80lX
0GyUrQgAkNh2xRytQAlf4COlEjCRktnDpYVdMi2+L6HOBaTLFOT1s/V9gAEO9g5V
c95EE4bYH3ZyYnrCgvgQARtmKArkIrFkigeY2DZG0o7Co8adtHsq/4euERwSbSyf
WPWbo+DvOO2oxhTeNAyxGGxu6DYyLx8WU1Mb2WXocJLPCZhCci5CiDw3MesdVzWp
Z9eGAY78sDVr6aAlmRj5lK63rHaI02RNwDCEb1JTsetw3Cl6U9fluFyZpoEVIt6I
1Hb7QV+VN/p0luXlnQG52XuPMRe5UFcX87fYRao/8ziAhuj+Xai32PLEYqmrI4wc
PkdvDWxBQRPFB6Oac4xX73k9sSQYtg==
=rFh2
-----END PGP SIGNATURE-----

--Sig_/LTAeC+VP3q5+1xMj=Qo_oxa--

