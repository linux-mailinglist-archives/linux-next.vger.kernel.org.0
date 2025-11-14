Return-Path: <linux-next+bounces-8974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6252C5AFAF
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 03:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1EA23AF613
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 02:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C626F2AD;
	Fri, 14 Nov 2025 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gNO0BJ+Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA4221578;
	Fri, 14 Nov 2025 02:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763086387; cv=none; b=sj/GX4OySNaz+N9rrHTZabbLITXolxdjAOwkbU8gcQ3OEd1TuBWMmr1auNhkLRi0PiwnQ6Ug7ft/d5WT8DHzPtsrqqCkFoDgZZnAKmELl9jzDcGsidYKs4q9xCFC/dZ1aCR9ihSwAcS2/2eakoYzS+KhjN32lqcG9bHN0g7YhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763086387; c=relaxed/simple;
	bh=Sz7m4pr2UrYin1rvD4BhZlZWNk6D3ipJfQpxNwlUGSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pdknOdqXI3DcK6aHRiLZFDLH5EOp+rqP09IZdNvgPuSp724NzNFLbWKvLJEAWmDVcbq3JctYSZZIPfnSvpvsC9Nd51SXWvsAp47XbNnCjW5WhWhf9r0N95vLRNJRKZS/FRrzxoduS29XWVoeggl5NIILjAEcrk4tYGsG0NIZn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gNO0BJ+Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763086381;
	bh=Qk6v2ec3iCNSrghOCoVvl96dmDEyyJpElKquk5ihSUw=;
	h=Date:From:To:Cc:Subject:From;
	b=gNO0BJ+ZHopEW7mQ1wboS9JPdgRyXzDWy6vyX1wBvnHrvNWgDaUUw54iW+XiaYkSl
	 mgsMG2NCrJmZInq7myAEMegZThdRUBvjEoPBBEm/oHBKiS0W2+WBywcrb99/cnvYTW
	 XZAfgiGkNNSZay+DBUqq05v0xI+xqb2Gu8EMsTVfJI8RGENs+AduYzHwL+/xA2mWwm
	 o6q5UZzz7ndxj7iMeS0BwPhLxkkg5/7atgN6IGiOONGexANE/EujnkB3TI71aAMP29
	 lb2YR2hOOacfd6sz07izQ6s4Y+WsKrjGz+jGxVSJmgoXASmK6Sihzb378/jsCEoECD
	 cskhMSV54QQ0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d70zK0cDwz4wCv;
	Fri, 14 Nov 2025 13:13:01 +1100 (AEDT)
Date: Fri, 14 Nov 2025 13:13:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20251114131300.21a5c6da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QRJTF=0oc=x.AptOBtn4aAx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QRJTF=0oc=x.AptOBtn4aAx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/gpu/drm/xe/xe_vram.c

between commit:

  d30203739be7 ("drm/xe: Move rebar to be done earlier")

from Linus' tree and commits:

  73cd7ee85e78 ("PCI: Fix restoring BARs on BAR resize rollback path")
  348df5b30822 ("drm/xe: Remove driver side BAR release before resize")
  af63e94f01d7 ("drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()")

from the pci tree.

I fixed it up (but I am not happy with the result - see below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_vram.c
index 652df7a5f4f6,10f8a73e190b..000000000000
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@@ -24,39 -24,14 +24,37 @@@
  #include "xe_vram.h"
  #include "xe_vram_types.h"
 =20
- #define BAR_SIZE_SHIFT 20
-=20
 -static void
 -_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 +/*
 + * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
 + * assigned IORESOURCE_MEM_64 BARs
 + */
 +static void release_bars(struct pci_dev *pdev)
 +{
 +	struct resource *res;
 +	int i;
 +
 +	pci_dev_for_each_resource(pdev, res, i) {
 +		/* Resource already un-assigned, do not reset it */
 +		if (!res->parent)
 +			continue;
 +
 +		/* No need to release unrelated BARs */
 +		if (!(res->flags & IORESOURCE_MEM_64))
 +			continue;
 +
 +		pci_release_resource(pdev, i);
 +	}
 +}
 +
 +static void resize_bar(struct xe_device *xe, int resno, resource_size_t s=
ize)
  {
  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
  	int bar_size =3D pci_rebar_bytes_to_size(size);
  	int ret;
 =20
 +	release_bars(pdev);
 +
- 	ret =3D pci_resize_resource(pdev, resno, bar_size);
+ 	ret =3D pci_resize_resource(pdev, resno, bar_size, 0);
  	if (ret) {
  		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabl=
ing 'Resizable BAR' support in your BIOS\n",
  			 resno, 1 << bar_size, ERR_PTR(ret));

--Sig_/QRJTF=0oc=x.AptOBtn4aAx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWkCwACgkQAVBC80lX
0GyxwwgAoG4leciFsdXu6ZFiFoPkJa+Uuyvn2G2P1Py0H5uRUfbQ5OL6Hpm456RV
CHAOVAwGPddMkemlKuT0ufdGl0fWa4NazaGhbj29GCtpoZb28pfutfDso/a8vBS+
FWzmnVblwEu0qCTQA41PnTnwEEyEJ9KEQv1UIgR9ig+IjG4dRPBLuoZnFdw81Jmm
jircMBH6LVYSHh49iJ6hOeohX5k08UHR4lhPHPtM8pzjaRLbl1RmGfGD/uoNt8do
c5TgK7h8XhTynvPYWwuyJsnRhRWdHqEczrAf72LdRAGPTzHUcuSZQmwkUfLCxXqa
FFQK78CNjrKNGZlQogYeHNx6xYqlvA==
=yjOJ
-----END PGP SIGNATURE-----

--Sig_/QRJTF=0oc=x.AptOBtn4aAx--

