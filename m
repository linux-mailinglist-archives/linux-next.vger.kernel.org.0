Return-Path: <linux-next+bounces-8793-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1EC299EF
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 00:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29CD23A9A3E
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 23:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35192F5E;
	Sun,  2 Nov 2025 23:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rbKZQ6rz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464C5695;
	Sun,  2 Nov 2025 23:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762125527; cv=none; b=jy+Kk4GcA1AgTBH2qKrVBpp5CKQc5xg7pgQ2fpJjQwTsdoyaVY72J+NTtxqVvXjINNX2CeYFvWQ5MptkiwnYcmkJIgj1VUiidi9KKcVuzC7mUe7yjSrYIOVkA+gY/xK4eCgPJWcznyYslry54XJL+xgpeWo+ZdivB6p7F7zYEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762125527; c=relaxed/simple;
	bh=I1yre/jJPJlVbQN7HiYQAlPyeVNuRrnAciVM6wRmcGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ss9EDlWDs0nLqgbK3ocH1NnNjcj+zIwf34pwqbR/BwMdRnxsc5E9LlNoXu1e5bm+we9wQrHtDDIjpuwDOxBSt1ThMoDj/QNttkR2qMxvxiUcsynpJfzRr1SFDhMM9GZK36OltZxnlfUFOZ2LHJs4QrvphEWG3Rq8/6EB4qlJlz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rbKZQ6rz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762125522;
	bh=xaU4rrErMEvuq9+RliP/7svNzdrCSMaDrdk5mZvdito=;
	h=Date:From:To:Cc:Subject:From;
	b=rbKZQ6rzBvDb9N5EeEPtT5qSKhA8Qc5vgil6auxdE0Av/rjn9HZR2PXNjQKuVnNWq
	 d2Jur7Ya0HNLogjiFqU0NMwYlJ8W9CSycmGhg2qQa0S1+EAh20TWwNMjDj80T2cei3
	 jB4+MsRTo7WffBLrrGhd6r1sdMmvkDLNSVTIkFp2rp8p4Q/yG4/qREPrS6Kk2on0m9
	 Ywpk7MLihc0gA1L/Q5oq/rWqGovq1zIr8SnUyXIAwQ+yAYWg+0QzA0SqpUcgN/lSS/
	 bkkYzSJSdvm8/XGUJonzBCny7Lj+8972nrcB3+ISzN9TXFiqmsf7Wi+On5LLxzSR0G
	 cCMopMY2GWj7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09dG3jf3z4w9R;
	Mon, 03 Nov 2025 10:18:42 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:18:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20251103101841.537c87dc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y9dSf5_k+qC6k1QYFAE.jCC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y9dSf5_k+qC6k1QYFAE.jCC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commits:

  c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
  5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")

from the drm tree and commit:

  32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_pci.c
index 6e59642e7820,67c808bb22a8..000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -440,8 -375,7 +440,9 @@@ static const struct pci_device_id pciid
  	INTEL_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
  	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
  	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 +	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
 +	INTEL_CRI_IDS(INTEL_PCI_DEVICE, &cri_desc),
+ 	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
  	{ }
  };
  MODULE_DEVICE_TABLE(pci, pciidlist);

--Sig_/Y9dSf5_k+qC6k1QYFAE.jCC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH5tEACgkQAVBC80lX
0GzAIQf/VXtLy2V2td1WeYdKCBZ+qe7GU3Z8yZyrQwJ7ZSQ/nT0xga432I16p44M
3Nm5dtc58Ba/ignPJjvpjuaphB53OZbJNVRgnYFmJTSZD+PKWha+CvJ0ViSted98
33ABLrWqvIs2D8+A4jLUp+SFx1hMIQv/S5+VoJL+/z72dLOjA/1q3lSg1mrYxn83
FEdScUYt/+vGVv+4Oq1qpOQUPROiC5S3Wlwy/7JODXdnsQXNwmyY3yPY+UHAzW+e
ruARCMEIOm6M14gQUxU2QgqNSlr3XprkDFHdg+tIV7lRDmL+rLk1IHIARSmlvGJ4
EWH3jUmOqqexeaWiKsG5/OsiJgFx9w==
=OMTU
-----END PGP SIGNATURE-----

--Sig_/Y9dSf5_k+qC6k1QYFAE.jCC--

