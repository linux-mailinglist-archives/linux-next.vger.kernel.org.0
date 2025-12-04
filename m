Return-Path: <linux-next+bounces-9322-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303ECA2394
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 04:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4674302A968
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 03:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB43032FA32;
	Thu,  4 Dec 2025 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BB/qJqaK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B82FF160;
	Thu,  4 Dec 2025 03:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764817625; cv=none; b=M2rfpESIbnPPr7utCRZ6b1CuXmtHHgWvewj4ADXGH1q+LSv2GAClQAmAK+lMj5NBev8HIbtfoZiDolPunFsBr0f6e1vIjb3E/Bbt+iIwQtfzVOkebeVAudL+T6C6C4QDP0wZNpaOABNXv3xqw4G3A/u0P8G8nvqSG429hES8/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764817625; c=relaxed/simple;
	bh=OzviML42/PZV4P386UodcF7hmXtQM2dda3ytwl0Ro9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WatvXdkFFsbkCXmrvmEkiI/wWARq2X831dI6iNhVFZwkvjXC9bISxMPH2IxxKq+KRGPeScUY/qaMK2cVgdUAYqw0Ql4ETnxTGeM6YrmT6Uil8hcWoxeP4d2rPK6Z9HJ4sIdIu91fyczfsBb7SIyL6DL10i6PSp2aRWV5DmMhpF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BB/qJqaK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764817615;
	bh=3VDbv8be7WXmqziqx3UIDm831ej/hZpH03IJPhmPaT0=;
	h=Date:From:To:Cc:Subject:From;
	b=BB/qJqaKvbBqZK2NrUbwN1BiB5KTOn3484/e+6JcajzmWy4qoEk8aupltwIRLDq22
	 L1g6uH5TRE7ggIC6KMgyIVyBtJi4ZH/CjLXObn8aODqRRUQb9moxiJiEyFZZ0qVX+9
	 5VYgxw0coNgnXF0Pi3fegWUwFkVCb4TyIXtHD7NECNtrptiyJf2vfXe22952RtcxOE
	 o+1VdeLe0bh/5ig9z8npMntQ5TVyhaUDxlF08JXOPdfNRAsgF8LZW08FUQUxhfDp3b
	 7yhJ/RzjXOh872H1lxZcjVT0Mhp/NY7+YAAUdSLS3NGW/U7AvMwRA3yZkLN+TTxXER
	 ARjGAumMMnBBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMKDH3tnhz4w2J;
	Thu, 04 Dec 2025 14:06:55 +1100 (AEDT)
Date: Thu, 4 Dec 2025 14:06:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20251204140654.1cba1aeb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AXumj+EMN1pf_6OiZG45q/O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AXumj+EMN1pf_6OiZG45q/O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_fb_helper.c

between commit:

  eb76d0f55535 ("drm, fbcon, vga_switcheroo: Avoid race condition in fbcon =
setup")

from Linus' tree and commit:

  6915190a50e8 ("drm/client: Support emergency restore via sysrq for all cl=
ients")

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

diff --cc drivers/gpu/drm/drm_fb_helper.c
index 0b3ee008523d,be790fc68707..000000000000
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@@ -31,7 -31,8 +31,6 @@@
 =20
  #include <linux/console.h>
  #include <linux/export.h>
- #include <linux/sysrq.h>
 -#include <linux/pci.h>
 -#include <linux/vga_switcheroo.h>
 =20
  #include <drm/drm_atomic.h>
  #include <drm/drm_drv.h>

--Sig_/AXumj+EMN1pf_6OiZG45q/O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkw+s4ACgkQAVBC80lX
0GykkAgAiuS/bCiTzN8kqRw+NJMXeQO/6QoHVyVD1x+n6Sy42jpFpv7QDfe1izps
uQpSGD+UcSZ9CQG6tbUXA9IdiYXbvD1E+U1ftiumi1ci2IjMsJHpr6IbH6u39RQq
OtoVvVb7Fa2oBa9c9mvok5iU5gbZlu1qZx5coObTmTGbq7Oeikzhn5C35uQ1RwY4
Cz12bGYGG2E+GKa7/myFt9zroAy6v8M+C5+AFlghyotLj30YWvtZl2DesS9+VDfI
myHFxRKYJKI8JKAopz5v9SQKTGfqklz3f2RzUdOhU2N21mU6wg8DKbtdfVCtvKMk
HHtgcOD/2BeOtwDl+7BoEZctYQ4t/g==
=Kzxx
-----END PGP SIGNATURE-----

--Sig_/AXumj+EMN1pf_6OiZG45q/O--

