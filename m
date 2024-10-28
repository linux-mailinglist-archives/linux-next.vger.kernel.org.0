Return-Path: <linux-next+bounces-4466-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6579B22C6
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 03:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ADB31C213C1
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10F714EC7E;
	Mon, 28 Oct 2024 02:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qxUBRCO+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F6140E3C;
	Mon, 28 Oct 2024 02:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730082886; cv=none; b=LkN6MIo1T5qPail3IxbcaT2OcGH12iR7zzSymJEBlehVaLa3d1rdCIO7RUSyw7zOpxXFZW526MACMoKGrOV/GQcKb+HEW3IJEldClf/D27vpC3mMoEY/Wz262uCbmem5lQFhn1YwgTt6ET8fzee5UK6V+DAvHWTPsOUQaXez5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730082886; c=relaxed/simple;
	bh=TL85J1gxP9AJH7bMKI/YbNvRbNYRZyCXtoaKDS/rlhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mnsfiSIN9nYy1o0l3XjTZGqsjq+cL8BXcP3JV9IOjxVaI+bU5Xgxs8/8YXCL/sLlEA0+WUTWLiV9mrh7Bsss/goJDf0+IhHdy6hAZSCXdPsQCOarXlYb39PyZvOkY29ggQv3tTCGbWlDZU1QqC0jM1aQyKNSTsvGR96u3TIE/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qxUBRCO+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730082881;
	bh=JDHWiN9NAo9LuoaCbWhzdDJS6nLwTnW098dN72JlDqM=;
	h=Date:From:To:Cc:Subject:From;
	b=qxUBRCO+aRZLSN3VKXR1G0fii3naedy+ScP32TccCRGfBwohPT0A9MQENaTtnzLci
	 J4YK9vKzbvdy+99v/Un/ZGKHjmkFqEDsHpBFrgsOowdirY01PJFkv2WzglWx6kdHKp
	 c5wmBqohMbAq0/PsfXAs0CPk0H6XzKqvVfPZVnOzf2/7+CSsbDJh6qhW4N1M8pTDyM
	 SunNPo1JVo7v8F5Gml+osSLt3vjP8p499V0ZEgiDF8fFvQAxjFru12+fQUxOlfhD1+
	 0DJx2TaS0qeLU2x8Ouk4coNt8PSmRFaA1RVt3KIFZ59LQD2deRplaCuensQD8yRh+V
	 725OqvAnaiW2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHXc3s41z4x6k;
	Mon, 28 Oct 2024 13:34:40 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:34:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with the asm-generic tree
Message-ID: <20241028133441.7b92ee4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SY3SL88/18B4gf/.AlhPnNx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SY3SL88/18B4gf/.AlhPnNx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/tiny/bochs.c

between commit:

  65f5bf96750f ("drm: handle HAS_IOPORT dependencies")

from the asm-generic tree and commit:

  7934a1c25097 ("drm/bochs: Use video aperture helpers")

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

diff --cc drivers/gpu/drm/tiny/bochs.c
index e738bb858316,447989bb8201..000000000000
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@@ -1,6 -1,6 +1,7 @@@
  // SPDX-License-Identifier: GPL-2.0-or-later
 =20
+ #include <linux/aperture.h>
 +#include <linux/bug.h>
  #include <linux/module.h>
  #include <linux/pci.h>
 =20
@@@ -94,13 -99,13 +100,18 @@@ struct bochs_device=20
  	struct drm_connector connector;
  };
 =20
+ static struct bochs_device *to_bochs_device(const struct drm_device *dev)
+ {
+ 	return container_of(dev, struct bochs_device, dev);
+ }
+=20
  /* ----------------------------------------------------------------------=
 */
 =20
 +static __always_inline bool bochs_uses_mmio(struct bochs_device *bochs)
 +{
 +	return !IS_ENABLED(CONFIG_HAS_IOPORT) || bochs->mmio;
 +}
 +
  static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 v=
al)
  {
  	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
@@@ -234,10 -236,10 +242,10 @@@ static int bochs_hw_init(struct bochs_d
  			DRM_ERROR("Cannot map mmio region\n");
  			return -ENOMEM;
  		}
 -	} else {
 +	} else if (IS_ENABLED(CONFIG_HAS_IOPORT)) {
  		ioaddr =3D VBE_DISPI_IOPORT_INDEX;
  		iosize =3D 2;
- 		if (!request_region(ioaddr, iosize, "bochs-drm")) {
+ 		if (!devm_request_region(&pdev->dev, ioaddr, iosize, "bochs-drm")) {
  			DRM_ERROR("Cannot request ioports\n");
  			return -EBUSY;
  		}

--Sig_/SY3SL88/18B4gf/.AlhPnNx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce+EEACgkQAVBC80lX
0GwrPggAoLtH103R0+IrRGF7UmlEAoccTRxbIxQYbZFDJT+1eVgUhDSVugHWQf4m
5dvjqxxXY/jwaI6EezJe1jhPg4neSlYzwdZT8gXWLQAdHT+2+S0Aaz84U86nhbKQ
X5z+rBtkUexUCm0NdtFLGNtUDWN3njjVJd1hwATbMwDgkEpIeiw2JkWMP06vED9O
EC7kV8nYcYlujfXj6iDOi4KM5ikHDfbOgVO3DqUDSd0Tw/UsqPIRsfPd3TPmNt+A
0siDb9ZDQ0RovY4ybCnRdYQXRehYT9nSc47vtxQgVT5nkeNLm1Bku2zEeTkFqrwx
mxdzlYZVxbTr9zwTTAb+3x5q0CCIcQ==
=IubL
-----END PGP SIGNATURE-----

--Sig_/SY3SL88/18B4gf/.AlhPnNx--

