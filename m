Return-Path: <linux-next+bounces-4070-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B243998E7FA
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 03:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F38E28786D
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 01:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707809479;
	Thu,  3 Oct 2024 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u0uEohHN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D824CA64;
	Thu,  3 Oct 2024 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727917482; cv=none; b=BFMl21Xybg84fNyrGWDv5Lb4xqmEIa0EsG9RkWqtR58ctV4NTPyr03T5tRL2ZpareB+4zw2qFZ/AqNr35azldbsgRBtpkQKjA6xHCAV/MWiUdIkIf2FmHDP69pTDuO0tezooW04TRDyHqdD+1rZVAAElabphiD2VSntIiHYlXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727917482; c=relaxed/simple;
	bh=iSTP0zih58N3xEEHEge+WT8alfAr5PIuX/8G0X505G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z3uaE/+eZQ6OKgRJ6UZ69zwepRM58PBsYkXhD4x3QkecbcuGlmwCTlezKF7dwfY3C56UEPLbnx/ocqYUve3GXsAJbn5wVBNNrJYFBJOQq7r1zXn2GtYbKslI506WqOLPuhnltr5/Pyf3dO5crxSLV3QSMp4DdUwmlAaoBGS5BU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=u0uEohHN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727917473;
	bh=X/YYsEKEor7BsDLH5o98zBdgxxt28r7iTiDpVYQK73Y=;
	h=Date:From:To:Cc:Subject:From;
	b=u0uEohHN8Dq1XXlZt8fnzUOWGGYtsGuwaBZ6Cgc6jbw9tR0aE+jZ1bpKWee93cT+J
	 fwKvT4GdCM7SktY9DqB/Idm4WEbP39m0oWQoVm2kc+ovsEmOlAlU857Hn63u3Re1nU
	 DV7naRg7PJqPnCfvSx/Qwnvr3Xx/gDTmFYMoHasEC6FRcidwEDHzqh3CVPzQkCuScG
	 RbvQIp7K4klT0ypFrkVjLTpJNfZe+ZE194UMakNN6+gKbhdjggQyfweehhDPgBl/U/
	 BqJnRucH+KPGFsMzGb5gytSeg0dOTQLVQw/wQa2IwrL7YU81rIO3EH249dCL9T1zRX
	 UKFYH2HwpViKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJtk807Zlz4wbr;
	Thu,  3 Oct 2024 11:04:31 +1000 (AEST)
Date: Thu, 3 Oct 2024 11:04:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20241003110431.4bbfd467@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y4XmcyjBBi1VuD=v6iR9R+b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y4XmcyjBBi1VuD=v6iR9R+b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/panthor/panthor_drv.c

between commit:

  2b55639a4e25 ("drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags")

from the drm-misc-fixes tree and commit:

  e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/panthor/panthor_drv.c
index c520f156e2d7,f9b93f84d611..000000000000
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@@ -1383,7 -1476,7 +1476,8 @@@ static const struct file_operations pan
  	.read =3D drm_read,
  	.llseek =3D noop_llseek,
  	.mmap =3D panthor_mmap,
 +	.fop_flags =3D FOP_UNSIGNED_OFFSET,
+ 	.show_fdinfo =3D drm_show_fdinfo,
  };
 =20
  #ifdef CONFIG_DEBUG_FS

--Sig_/Y4XmcyjBBi1VuD=v6iR9R+b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb97Z8ACgkQAVBC80lX
0GzE6gf/c+S9TSnISE26vBOeap0FH86mtSRUJiSJ6ameIHRJjSIT/+sDxhf5CiG8
+tB+9/a5n48kRrrNVA48wtRqi81UUo0bp2+GWA4VMj4Bb011MeCte23mF68mssyF
72iYSp22x5n8FlNTtTJW5hrSwj69p0UlDJgs2Uce/rX0I+24ewXDq71iMus6Mk7l
9bhzugePKWcQVA1wR3ugJHk6M5EggPIOq5mX1ITKPbZwmom3vqtdS6BqPx7fHAjS
3mZeC/btok+2gN0SJ7qfY4rixLoVQt2F5QuQuRa4QBqBjMI1IbHqiwTXZSsRh08c
ixCkOtFnsQfTsCwR/9lvI86VgF+vwA==
=fEHS
-----END PGP SIGNATURE-----

--Sig_/Y4XmcyjBBi1VuD=v6iR9R+b--

