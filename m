Return-Path: <linux-next+bounces-6974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15418AC754A
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 03:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECA257B5557
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 01:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01041A5B8F;
	Thu, 29 May 2025 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mfpHHONd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D801A4F3C;
	Thu, 29 May 2025 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481150; cv=none; b=V7XveythJVCK2E4KuynhR1TOwxAnGuCMRpwJ0AsIxvVkQ8vTGDE6YzAPocB11bBQoj0906XCeUywfAalmT+0wyJM9IhaGt3xyr3uNMDQPJqZa3Ml2Z3ipZg/50p3LVr5E1D7DErVPJ+bNlZdCsNoSXDiYbCsDVHY4qUcD5KMgsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481150; c=relaxed/simple;
	bh=W/S7R1mtJB+BZRbHsdLA7U4+0le/3LuMTFYgZ0vonqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T/f8xDAvhm5vJWlkaIDpHLUEVgTsX/7OYlx3JkkoZad846ncOg9BalbJKxsoq6coZqOkG5FxFrxK7lsDQjY56NuQj+hJA5BDdlHkVBZ6k5EHHHnid2gEbbAbtPdx+gf0KXiM8DUN4ld5wR626ZbLeiw6skTtJ7jw6HYMd16NqC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mfpHHONd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748481144;
	bh=YNMtwzp5uE0H1mZvj/jpdaNMrt7nyrZu9vZxYoZ0kI4=;
	h=Date:From:To:Cc:Subject:From;
	b=mfpHHONd5rDZk5saCQOCNufEhdSjz7YaEhy0zEj8vvVBq+QO4sLM4ihGSKNzNupJ5
	 m9+pGBn1zm1gWygvaAcRmkxjAXw+d81EUMt6afEvHDSpI500QSLePT2xpFTu4QJdBu
	 MoNckw9sDsqGWlqWUApzB1OQRVIRxzK9nZxA5hfkRgro4Lqu/7FFPGp1W+eLskwyzQ
	 wVSmRBsSsah4WZdKNby2Laxh2+Xua5e5lZ+CTEWzcHuS6N3wCsClkn02y6u9jBihcS
	 TdAMl+i3sdm+45OzmHv4fOYKZCU5fEO0MtJ9jclHsNf+JtrQhsTnop2NIXkWyB4Nt7
	 BiI/nj8Z+lzpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b77dN2slsz4x8P;
	Thu, 29 May 2025 11:12:24 +1000 (AEST)
Date: Thu, 29 May 2025 11:12:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: JP Kobryn <inwardvessel@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, Tejun
 Heo <tj@kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with Linus' tree
Message-ID: <20250529111223.3987a514@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bodWnFVirzXDFl5rScR3H/v";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bodWnFVirzXDFl5rScR3H/v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  mm/memcontrol.c

between commit:

  a97915559f5c ("cgroup: change rstat function signatures from cgroup-based=
 to css-based")

from Linus' tree and commit:

  202cf1817f29 ("memcg: make memcg_rstat_updated nmi safe")

from the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memcontrol.c
index b90aa3075950,a268690cd07b..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -571,7 -571,9 +571,9 @@@ static inline void memcg_rstat_updated(
  	if (!val)
  		return;
 =20
- 	css_rstat_updated(&memcg->css, cpu);
+ 	/* TODO: add to cgroup update tree once it is nmi-safe. */
+ 	if (!in_nmi())
 -		cgroup_rstat_updated(memcg->css.cgroup, cpu);
++		css_rstat_updated(&memcg->css, cpu);
  	statc_pcpu =3D memcg->vmstats_percpu;
  	for (; statc_pcpu; statc_pcpu =3D statc->parent_pcpu) {
  		statc =3D this_cpu_ptr(statc_pcpu);

--Sig_/bodWnFVirzXDFl5rScR3H/v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3tHcACgkQAVBC80lX
0GyPdgf/SIwJEFGl0XDdsc5zt54CU6PR9452H8afZsILCLtrsjWotTWIVXP6TiTD
yG5X6il7K82DKXVfkbTJMFdZzrKT909p7jvaUtsRYbtBEvOqxv3CcknHoM8MRxcm
YC5/3udkNpV68VMIpmTmf1V4XHd25edkfNuMLCgCcjNY/zy8e5jMr1Ojate8sT8k
S/7iDEsiofy7vrNQ+kCrRb3Vzne4ZBhDIt2l3n/4ftQZFo85X+cb3/xUlflQRMM7
vHjqxU0FRacy2MBh+MaD/7qqkoCnHBHWH7nbfuGAPC20anmop4A7XuSaeYclvhlg
b51+cmDRfXKwSg4D8K0oQ0KNqjiWaQ==
=dQam
-----END PGP SIGNATURE-----

--Sig_/bodWnFVirzXDFl5rScR3H/v--

