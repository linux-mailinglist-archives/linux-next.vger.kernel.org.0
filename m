Return-Path: <linux-next+bounces-5544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90600A41515
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 07:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D962188DDE9
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B06119ADBF;
	Mon, 24 Feb 2025 06:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bzSE9Iny"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D028DB3;
	Mon, 24 Feb 2025 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740377349; cv=none; b=XiOvYs/+M9KF72FU0MLwTdka5g4NmYWGEPOYLsOZ75UKw0VtTanTdGk2vqRFsIjhFKPIOkTtEXExlkX4WENs0IStLkiDvmwfgHFphBLaM/YV6PqoBDKooXIHrJ6mhcKb3asVCgZ67Oa6suJyM7RfO1btaTVp3yKPXpATjjyWta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740377349; c=relaxed/simple;
	bh=upxNq13ISVeDQ/L/ilumkitXjYMiidUSOp03Ia4DJWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mfEaNja6fLeveHMnFj9XZbvPsM+i1JCEz7/dhypzg0s+CWbf2egNIjz8W1seY1hYG4BJgaeLUvSG86Zw2j76jqJfkncmLigXPhdFipaFgflC9RAd7DkRKiSnMMFZew0EA0+AI/8I7Fy2twULN/hp/ZXhiGJLkR/yqNQ5pmXVDoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bzSE9Iny; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740377345;
	bh=uBFkPdOaIAVTkohHzeSsKOnFYegAhJOu5ESsaWPd70o=;
	h=Date:From:To:Cc:Subject:From;
	b=bzSE9InyetvwUwbtywisO2YhPdIB+TqZfG7OGdUkMpEGlNGEZY7zbFRK9cmttrtKC
	 jpKKzBobfEW7V7dyAZAzKjDFVs/VnU7l2Si89sKvLT0EpL6tmL2Zk1L4cKmNOnpOTo
	 wLTh9I+77E7CvRaV0tWS+2RB15XDVDG4kRkk4mbQX3sPY78P60+usK5gOGfcFWm6fC
	 iQBe8YNWI3rYkj+oGlPXXrlKm3uaC8i6nSKF4zStWSX1QHXhvg25nNiAgoDujwY4ut
	 tCyTgb8/wFBjXIuoTLnmOOscPz8i5N2bmIO4MxZD8SR1eJCUwaDBBHMOemc5oebdJT
	 L/hz7aKG04p1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1Vg52GW0z4wby;
	Mon, 24 Feb 2025 17:09:05 +1100 (AEDT)
Date: Mon, 24 Feb 2025 17:09:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>,
 Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the kspp tree with the tip tree
Message-ID: <20250224170904.2da09124@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oq4dTMR1XWAZ+Kru.FZDYyf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Oq4dTMR1XWAZ+Kru.FZDYyf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  lib/Makefile

between commit:

  df7fcbefa710 ("vdso: Add generic time data storage")

from the tip tree and commit:

  db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/Makefile
index 66e44569b141,1e886482a6a3..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -131,7 -121,7 +120,7 @@@ endi
  obj-$(CONFIG_DEBUG_INFO_REDUCED) +=3D debug_info.o
  CFLAGS_debug_info.o +=3D $(call cc-option, -femit-struct-debug-detailed=
=3Dany)
 =20
- obj-y +=3D math/ crypto/ vdso/
 -obj-y +=3D math/ crypto/ tests/
++obj-y +=3D math/ crypto/ vdso/ tests/
 =20
  obj-$(CONFIG_GENERIC_IOMAP) +=3D iomap.o
  obj-$(CONFIG_HAS_IOMEM) +=3D iomap_copy.o devres.o

--Sig_/Oq4dTMR1XWAZ+Kru.FZDYyf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme8DQAACgkQAVBC80lX
0GzOTAf/UeeytDAtJHSqL3sWeBPDDBi1ZlWI7FoGFtFOh+NWXNN+WH/I7+C7p1sp
gw8HY0Ch9MjRpKJt1OuL21Oa2FDzvj6jv3x4lF1D5zrNL0UYDKcJA5mTr2TUNxmn
LTBBVKXRU44VeX+H7kteWKTG18behOILcLqRikmtLPEh2+N9WarBD+O78nkHpM9i
n0KmKCQv/YtvREJgW0CQVgSoXQlAgnFLBOJtxqg+cmFvygZO3+arM6rL435gVRWU
yJh7919R18papcFOiYgSuxzyWh5w5p/sndN00Q/+oSqO841lK7dPsSSQrMdEPinq
01NzlHYcfNyRaYjwJRnvgQttp8YcYQ==
=ZKHA
-----END PGP SIGNATURE-----

--Sig_/Oq4dTMR1XWAZ+Kru.FZDYyf--

