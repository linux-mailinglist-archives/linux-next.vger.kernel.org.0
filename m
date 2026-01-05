Return-Path: <linux-next+bounces-9528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D6CF19F0
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 03:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D43D300215D
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 02:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC811A9F90;
	Mon,  5 Jan 2026 02:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VcTXBzoo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB331196A;
	Mon,  5 Jan 2026 02:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579666; cv=none; b=lfGMpRdk97jXCuY2P82SJhfUQf3YfeWWnXRvEz2vQO9Lxrrgi+xHlOFEh2v53gicoic1QqW9lMpl9Wjf9fGrdsdnXU60FAFa57rZ0/GeKvomIxZcyKqOaYFuyAwbPCNL5oK67gk8xFR0HJLL8NWMWFXjYeztk5wur7i2+EFew/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579666; c=relaxed/simple;
	bh=xu1i5KwNvOj4isfO/rFqYoen8sg5FvTLvzl3KgTHPJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a+kBtF5iPy6mqaA1icMiYc/LSlMSQ5YYrDebFzpyB+fwbpaaW4yiFqc6AScji8ru3oOtGMHNnn1JMI3iZrsepbTCaIY40duYFo6lKrwx/M6cSwvPG8RmuEguAgRotOlFITMkl66kuPe9ldgSgZauiOd50tCV1bLJCHZX8P6aA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VcTXBzoo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767579662;
	bh=34wq1iDgsfa73LvmdTFbnaXjd3iI7mxyRi37mETzBi4=;
	h=Date:From:To:Cc:Subject:From;
	b=VcTXBzoo1OuD8SVXfOctTIxFd2x7hmu05MWMFizKk6KDiLysueNWYaPMsTUOPFm8w
	 RhwDTynuzeTS4DxyEZazawEXIfyknF6fmVhWoxYtTzvGRWIorIuBCZO7h42gZRCtMv
	 8CLcD6ASsfhYZVIRtfTBkKA2sIYQ66k1k7M6Fpqidm32G4sgpVubPoM6RWkT7s49cP
	 U8S7bDEQpHXeaydKKmFfFgfeHGZxivzPe01vAXQFKvg/IhI6bfF4DD1SPtx2u2MT7I
	 BSFKjzXbYT2M504cHgX/GbECJcJsnI5T+zTBEmFe4DYQwt8ouVFr0qq+viBUKY17H9
	 Xgjvz2PqhWzJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkyhZ0p2Cz4w0Q;
	Mon, 05 Jan 2026 13:21:02 +1100 (AEDT)
Date: Mon, 5 Jan 2026 13:21:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Eslam Khafagy <eslam.medhat1993@gmail.com>, Linus Walleij
 <linusw@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miaoqian Lin <linmq006@gmail.com>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20260105132101.28cb175c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h1T/qnJSvBHObWYxkMEWg6Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h1T/qnJSvBHObWYxkMEWg6Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/pl111/pl111_drv.c

between commit:

  0ddd3bb4b14c ("drm/pl111: Fix error handling in pl111_amba_probe")

from the drm-misc-fixes tree and commit:

  a1542b8ca6ed ("drm: pl111: replace dev_* print functions with drm_* varia=
nts")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/pl111/pl111_drv.c
index d7dc83cf7b00,ac9e4b6bd2eb..000000000000
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@@ -294,8 -295,8 +295,8 @@@ static int pl111_amba_probe(struct amba
  	ret =3D devm_request_irq(dev, amba_dev->irq[0], pl111_irq, 0,
  			       variant->name, priv);
  	if (ret !=3D 0) {
- 		dev_err(dev, "%s failed irq %d\n", __func__, ret);
+ 		drm_err(drm, "%s failed irq %d\n", __func__, ret);
 -		return ret;
 +		goto dev_put;
  	}
 =20
  	ret =3D pl111_modeset_init(drm);

--Sig_/h1T/qnJSvBHObWYxkMEWg6Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbIA0ACgkQAVBC80lX
0Gwtagf/amx14w80fJg2MhKJSM3O8puVTRjUv/D2T/Bi0/pOMaqSO26aFL+czYI7
u4cxSF8P951Z6AUG79iZkzkCBCnZVupgnqpb5H96A05PUzJfS0sOsp7UmfSnbOAB
NGMPVcd5EVUo77UDHb/5ddJrzDs6tVTVu7VH9ypgCrD2y/YGj2+LHbHSeEnIsLcc
BItKmgUkys/6wUmopnmyOGdhZlKLr82d5s3SxZUIWe5TFZGS7erzby/FuMF5+Lbz
A0zUwMfEUhn/eZsEmGYVV9o0QO1XxrrB/WlUbMp7DtSX/gci1+7sDtXcVmBYfj+k
OtF3afEDS8biZ871gA4NGzgyH7njqg==
=mTY5
-----END PGP SIGNATURE-----

--Sig_/h1T/qnJSvBHObWYxkMEWg6Q--

