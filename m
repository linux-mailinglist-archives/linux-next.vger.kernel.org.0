Return-Path: <linux-next+bounces-8635-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5FBEEEA1
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 01:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA611188F467
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 23:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DAF212F98;
	Sun, 19 Oct 2025 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kxv3o1fo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14BC2EA;
	Sun, 19 Oct 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760916688; cv=none; b=SsNJo7lTdclacKt+Ccm3U9M0UCenF871uFt2OIA0V+xzudhCifV6tWawrKOlBtnqGxQAOPp49u1a3tsjIwP3ejHKym8zkjqCE9q25pp7fjcLvyOqxRS2+/vewhE9AR3kzE6LIsMXjGJlKdSPA0O5zx4gfYxicKlXpddLNmBE08A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760916688; c=relaxed/simple;
	bh=mpVyr7UeDn6x0eU+r+JHGrDw9sJXjj7Bn5ew2TVvSIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fvCanfZPRNMx9fSSWelLYcr6DXIRnEJLFua2wSEXiq30hKaNbCmYTvDLBMf8VgOEcAgWCLcXAnio3/WUoT8xxwlWppEYrzPLovvo47Fi+L4IcQh6C4YbQG09eaVNjvIPOxmuxbyi/JnqjuyJCD/ci6rsV8UxG4qcSNusbbx4JaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Kxv3o1fo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760916681;
	bh=UoGToMhmBvEkGtFCZAK2Hfm8FjJbcOJcRKBGQzSH3uk=;
	h=Date:From:To:Cc:Subject:From;
	b=Kxv3o1forkHd7Kw9IxA6kAr7BphZdpSx4oj/w9NqLMQXh15veMVaN37hr18BZkidr
	 oKVtEL/8Rp9K/Z3kUQ6loa8g0e7aD/GtuQpTfWs27JA+zmS1s3rmB07TeK1hKaJZUG
	 8kT1mVj+IOhplw+PPoJ6ZAlPWorg1UIRXSkkrgTx4DivJ/waafhJhWIQLKF2qLWY5p
	 3ticRZ8Ul9i3+c9CLl+QOK0UQfrdepO3lBN3mmhTR1267iCc9JmFnPidFuzGwbQew4
	 0GDlnBKt3EjZQxjd/2G+U7QdXIm+7tuhLS+ccsjKtRZA7rzXprO8u0Jn60rag/J+LO
	 MBj6L70PkItCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqZZJ1QW7z4w9Q;
	Mon, 20 Oct 2025 10:31:19 +1100 (AEDT)
Date: Mon, 20 Oct 2025 10:31:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20251020103119.3215fa25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zoF=3JrYD9.aAWKh3I7OTaC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zoF=3JrYD9.aAWKh3I7OTaC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commit:

  32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")

from the drm-intel tree and commit:

  c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")

from the drm-xe tree.

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
index 89cc6d32f041,c326430e75b5..000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -375,7 -422,7 +422,8 @@@ static const struct pci_device_id pciid
  	INTEL_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
  	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
  	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 +	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
+ 	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
  	{ }
  };
  MODULE_DEVICE_TABLE(pci, pciidlist);

--Sig_/zoF=3JrYD9.aAWKh3I7OTaC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1dMcACgkQAVBC80lX
0GyPMQf/ToOBFxvQNw2oteVkjpM/0z+8iG8ISnM1FvDa21g72UesBZhT4EX04u6/
wOYpD1n3q4MTzjViVsfRE0Y2v457Z7897w+szt4y2tV67EJrIhVeDouhIVwFLsbM
UqR2NQnVImkMFvcz6MraNxohiduykQx1CH91F2BMJ+4wl7kpSV7zE8hfJTM5OQhK
byDBmHn1VY8ZSLse5pLmfGvdZmivDv2BWFyjL0a48GloJR0nj6+Stq3+n0rb0eSf
0Aypbhz0qTuxtPvPhWMWv2uhMXqnc6e3Ku9nY9mHvakDWjQWttZK7lB12UwIFZkC
TlnzJBchDkPZn3iL6UyqNOCHvJDKiw==
=m7WL
-----END PGP SIGNATURE-----

--Sig_/zoF=3JrYD9.aAWKh3I7OTaC--

