Return-Path: <linux-next+bounces-3181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE3943FF8
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 03:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B092281194
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 01:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C161509A2;
	Thu,  1 Aug 2024 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lm2uO4v7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7705149C6D;
	Thu,  1 Aug 2024 01:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722475092; cv=none; b=TcLgmGHYAUbvS15L3HBcKOx6TBQCaWbMD0ZtUbgPTxJkBqNxjeZZux97g1n2yiAYhKU81cybbrsAnTYYyAM9DJF09nl31QOlO9Wd9Gcns6Yg/DNRuBLRPRS0X1SNT3F2lAuYBUK7FHjWf1HBOYvPzotb28jcCuk/qODVYnSxakc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722475092; c=relaxed/simple;
	bh=eG0d2A8LGbY0khAvkudvgWKfframij3BMS7C7EZ2tyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UwZPwhtOAk4dsZcN6/LT/TPGD7h2HuGJI2y5y7+twsv5VTN/ND5o1VB2IlaXR9+b+RMIvH95GT/EuG6o+w+PTeBR1NaFIR6VEbaqHM15w8kS/4hzX2U011/uqDIE5J2UDTqYtXAvAfGQ6WJxie1p8PxKFGK4Pzm2o8myIMsqKD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Lm2uO4v7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722475084;
	bh=tW1zyvH/+6rUIbk5j37lWHaekfpVhhTK6eHLoZm/4/s=;
	h=Date:From:To:Cc:Subject:From;
	b=Lm2uO4v7fTcHRevDxyMxdQu+GY2ebNGU5bHwdbc42y7ghNo511pJ/FjkCWAAUUdzC
	 4GzxseVNmpeEkBjfgwdClfce/vyhlceik1jEjYBhU8s07SyGdncuLkxUCcW7wZqv30
	 PTEuw7TKiMDR+8bZnYUzGfpmh9+W3NhLJRJyIGKD85rAHFXY0hvAA8QZiNERPOK/Da
	 w1nvr6rCj+ADbjqMaHoEca705hmcWiEDwIfgMcCR3wg2jnSNGOdVGIPQcGB4Rg1zWH
	 2axnKB0LCXr/LiTZBaYnsa0hYymJfZ+TIViYhJn59xG7eZHgs45Qalhm+Vyn84pZ1c
	 qmq38hoyxGqGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZB0q4cg6z4wZx;
	Thu,  1 Aug 2024 11:18:03 +1000 (AEST)
Date: Thu, 1 Aug 2024 11:18:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20240801111802.3723a203@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l3o_30aUQRg51Gmy=WMn7mu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l3o_30aUQRg51Gmy=WMn7mu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/ast/ast_drv.h

between commit:

  0ce91928ec62 ("drm/ast: astdp: Wake up during connector status detection")

from the drm-misc-fixes tree and commit:

  c91d75a3c6a2 ("drm/ast: astdp: Test firmware status once during probing")

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

diff --cc drivers/gpu/drm/ast/ast_drv.h
index 47bab5596c16,b54a89676e9f..000000000000
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@@ -471,9 -471,9 +471,10 @@@ void ast_init_3rdtx(struct drm_device *
  /* aspeed DP */
  bool ast_astdp_is_connected(struct ast_device *ast);
  int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
- void ast_dp_launch(struct drm_device *dev);
+ int ast_dp_launch(struct ast_device *ast);
 +bool ast_dp_power_is_on(struct ast_device *ast);
  void ast_dp_power_on_off(struct drm_device *dev, bool no);
+ void ast_dp_link_training(struct ast_device *ast);
  void ast_dp_set_on_off(struct drm_device *dev, bool no);
  void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v=
bios_mode);
 =20

--Sig_/l3o_30aUQRg51Gmy=WMn7mu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq4koACgkQAVBC80lX
0GxA2Af/cbNs2BlwTCMCerVN8tIWLM0msFK9LFtdyB0zCfl+8Gm/Irj+65HHRss5
+lkLZ+ioNnmIOmHWgztZ6aKaw0YEHHHKukg9wYiUH+fG99m83/1axl7pO3V5SjRY
I92L5jEPjlqLGxjGLZ62m8CXJoaZuL6DyGYCfJ6HwXrDoYoq+gQJIU/cdw+0HZO0
xJM6jWlUjDDiwbzLkGLxw5VHKtZeLV7CwjwpBpnvikNKIPqH5iyf5og9XxC8JtaG
zkOErxxoUyj+8BKWFoWYukTrKSqjnsG1wzqoIQAgn2znixBLZg4fVMXtwCK1Q1uS
etNwUEiLyxVp3LtFJsnLtWnOHXeB5w==
=Eaeh
-----END PGP SIGNATURE-----

--Sig_/l3o_30aUQRg51Gmy=WMn7mu--

