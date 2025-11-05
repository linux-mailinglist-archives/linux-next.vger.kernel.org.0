Return-Path: <linux-next+bounces-8824-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D653C3389F
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 01:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A225B34DEE2
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 00:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFC623EAA7;
	Wed,  5 Nov 2025 00:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AxU0XoB2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2718623BCFD;
	Wed,  5 Nov 2025 00:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304050; cv=none; b=eDv5lJvu6Y9sIrUqj0OaDUjBM6+ZqlhoOYKNoNFg+oCw1RM3nPvfL3wpnu8LHHNnWTbdmj0djiFnaVoGRwdcfuwRXnyQKWMSrhS89hY+wrPws6KH4JveDhMX8K2umpNUNvRrM6f73YJyMSC5FOD/wUFFGvXbtD2hOePPh6mg/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304050; c=relaxed/simple;
	bh=9elG4V9zzkegnqI9Sxxxo+FVcPHLOu5APv5z8h2KepM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jXo2Ils1Nb0Vw15R0e9gSxoVNZcLyQ5If2epYYsny4UrFv8JRtYEATcm82fheIE4ohbVi9vXbQSRRc/7tc+LgfxL20K9na90gWpON0piP7w6Llknuxf5/KpDMlEuqCEc1VlIL3RLOLMct7YNJbjb39FDqmitDGcyaE/BxTKr9sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AxU0XoB2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762304044;
	bh=fBepn761sKXjDfElRugVGYEiyQ4J3/P/XDLs0DLwlYY=;
	h=Date:From:To:Cc:Subject:From;
	b=AxU0XoB2v3RIKbxjaa6Z+TeP7bj1CWg18EVMhdmug66WV61cG/tPv5b7zqWmOfJxq
	 RFapTfaljTbMQ4yvrCQ+Tn6IwyaXyNdGcgOBOAWgWmCITpvf3eA+9kEzQTP6YMtOAm
	 kJneoumaTmL/3Cqqo1uYDapAAqWw+0lh9tRtoEdMgH5GLAn0rIDzaYhDLSDi2rNETi
	 CDL+UR/BKmHeWJTpERkvtSlwP6nXBJIGg92Cu8m8t2UJ/2btsIbRp46x3dEqx2Muci
	 TeaapUS+GjmebkYhgwUjZ2kUQkCc6BOBvkauBqcOBS0OpUhpffcD20XmEeMfLK9h/M
	 db9x+HyRtGKhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1RfM1V7yz4w93;
	Wed, 05 Nov 2025 11:54:02 +1100 (AEDT)
Date: Wed, 5 Nov 2025 11:54:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: linux-next: manual merge of the omap tree with Linus' tree
Message-ID: <20251105115402.1b03f921@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0mMpINXgvqszb6wlyHZgtPL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0mMpINXgvqszb6wlyHZgtPL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the omap tree got a conflict in:

  arch/arm/configs/omap2plus_defconfig

between commit:

  c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the=
 defconfigs")

from Linus' tree and commit:

  810c5ef6efe9 ("arm: omap2plus_defconfig: enable ext4 directly")

from the omap tree.

I fixed it up (the latter includes the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/0mMpINXgvqszb6wlyHZgtPL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKoCoACgkQAVBC80lX
0GwcCQgAhANprpdXH0Wh/D7/TE8HXyuGrgUfpHvatL8iLrElvPfYhJr6d3z0AyRW
zlpByiN31YnX+PSRed8RXv4S3g5WzCdcE8MsRjRccs2nImxL/3AmrUzE9lPrWMWO
JeCfDj5GN42XzbW1t31li/HIf3DbV9LKaS1XoCg1IZk+i9cAjmtE/nXs825mNVRU
y8oP3snNGLgViIUsYJ2uK234JIGYW6qa4NMmT1FDqY5RDJfQt1tp0+FneYFBqdcx
DD5ZDcw7+ViAHMwwiFhCGpRxTWeu2f9opgNF/053qXBRIBKsP0T73xaoeM/kf8eK
qWryMrvzLSnTNOPvysdDcUFmbStC6A==
=7PAZ
-----END PGP SIGNATURE-----

--Sig_/0mMpINXgvqszb6wlyHZgtPL--

