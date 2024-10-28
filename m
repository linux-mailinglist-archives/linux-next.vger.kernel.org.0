Return-Path: <linux-next+bounces-4464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E49B22B4
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 03:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE85EB21738
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 02:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A578155C97;
	Mon, 28 Oct 2024 02:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ihryl5ms"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF28374FF;
	Mon, 28 Oct 2024 02:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730082435; cv=none; b=pVVw/f5a1F9uvrEiMqm1jAR8cZ2+xR7HGiaIROXkRnPMyWHSn2E+sE4v/UM0aqA3ERjyUxgbDcMNxIZy42lECUPRmps8drN1T5RhbS2MYAlRmpLfA/qp/jBNBcsyWqezrklbO0eeskhGpf7ZftpEKamiFVsfEmHZyb0TednuVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730082435; c=relaxed/simple;
	bh=O6n5LU5cQ2aUUdKZldlVNw7gP2/0RTzZWr3RLU4EMAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xk6awpjfwaKYeRC7D/bgG5DpBu2xjn2UuAmnWGlIJCt5cKHhfvcYDZtslYOKn0mJV890U+lp6GbYHxBcj8LU3mHaQhzJr2c8hDmNZA0N6BTkqI7s7mu03SDPevNtTONsLx4l+8Bhfzrzia4x7+fe5euF8rT2IsRku1Hp3iW4I0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ihryl5ms; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730082427;
	bh=PTgMcrh/DjlRMa4Xvz3XtnTZ7EL8OuqbXeeGiXcMhDs=;
	h=Date:From:To:Cc:Subject:From;
	b=ihryl5msw++sO6kks9izFyyBxe1jmaTGqRA1FdPxfWyCLOTplIt0yWH8Vy5Rtt1R1
	 u2gxgNgP9me+9aHldp/XsiftsKx/qVSH1KR3KAeji+Y0SjSUctrGVBTODgPTkkis/O
	 jQaPyRYIqaujmgFQzJwsuc8X94Y+XzMbjfzjdEBsp209SnnPHPLR6BrN6inUn4IJCc
	 VwR0Sj/QRTMYcOUghjN6YpxXEa3C90IaKnKslFQvUbTJPx56XiFglnT6v6iZfVCpeP
	 PSZwBhLabeDoibS3Zl9BzQNdQLJJfIFabfCnyKqV5r3QDfkRgGQIAv76hoRpl+D99m
	 CrnnTHgBQ6oaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHMt35B4z4w2L;
	Mon, 28 Oct 2024 13:27:06 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:27:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with the asm-generic tree
Message-ID: <20241028132707.24aded7d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5erwJwIlhclGCrUd=HJmnLP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5erwJwIlhclGCrUd=HJmnLP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/gma500/Kconfig

between commit:

  65f5bf96750f ("drm: handle HAS_IOPORT dependencies")

from the asm-generic tree and commit:

  aecdbfe459a0 ("drm/gma500: Run DRM default client setup")

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

diff --cc drivers/gpu/drm/gma500/Kconfig
index 23b7c14de5e2,c2927c37c40b..000000000000
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@@ -1,7 -1,8 +1,8 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_GMA500
  	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 -	depends on DRM && PCI && X86 && MMU
 +	depends on DRM && PCI && X86 && MMU && HAS_IOPORT
+ 	select DRM_CLIENT_SELECTION
  	select DRM_KMS_HELPER
  	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
  	select I2C

--Sig_/5erwJwIlhclGCrUd=HJmnLP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce9nsACgkQAVBC80lX
0GwrDwf/U8EXNf+9GHqdDXPK+6i658p6nGaSKnn6EDmLrMSUd/aG4Br+G6bNya/u
hHclK2DTDhNkFyplojeMwHEQXHhOMTImJubHzD4qcnLZxGvYtutSAOWPCtZVDz1K
ku7pwQOo2TenTlGnqX+QH1t8fWaNWh65s5Y5YLH+DgEHFmSr2UdilnEQZklT/m9b
qzZOWEGCFCVqT12+ffzgEoBCbuC9Uv79oZnzeT8cXT97dJZprhrhqUzuKUJr6xMO
/0Oisko/PVKbtCmgaNSjp3D0NWOJnNGqjXzVN/hOpyr0I944rNsXmJ3qFiqFK5zF
6IX8QB1xtQtAQFR27bovyyfcyMrFtg==
=gHTb
-----END PGP SIGNATURE-----

--Sig_/5erwJwIlhclGCrUd=HJmnLP--

