Return-Path: <linux-next+bounces-5091-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4CA0586A
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 11:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A543A2CA8
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 10:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EBE1F76DA;
	Wed,  8 Jan 2025 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mPrsBpnB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB7538F82;
	Wed,  8 Jan 2025 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736332977; cv=none; b=JQanRrk9FkQb9LNU0ttNe5b+StIZmOEEAwrlJADmRsgnuPGRaXK+l++knKL9X/dgM3yapAoLGTJ2sdGpRHhq2xm3uQTFNUw//Y23fGBOovFHvPdj6z4VBsF2l2403pgok/S+aBb5Mt6n1uuJ+wWrqbnNeXlh1gyTZxPb0LCoLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736332977; c=relaxed/simple;
	bh=fh6D6i6GrMmdW/bREi6h5fv448kO9UvLVTxitqc4QFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZBUHgPbDLtFjuzUMSQxzOEgN6Ww0/xMTlWMefGOYd44ZaU7ji4JgP9QYQuDo+WBWvuu82Wze+yLaoFR9RxpRcEh6o4bksZJTdut6OhRSqiLw7lj3Q9LErfPJPY6hh+6Uh4Ghz1oKAWd1zwjqk4+Q0+DUa5vIVUyDuE/LJSNOXGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mPrsBpnB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736332955;
	bh=Ykv7D3YIdp4eLWTcJiYUd4UtzApkjDUg0KFiMaREMqM=;
	h=Date:From:To:Cc:Subject:From;
	b=mPrsBpnBsej/5BPSJ7kH8RTnjCbgvBzVIH/fJ4ig2L8j4oH8UfS6lGxXFPkWkAIaQ
	 5Cq39TLacnnGvlhb1cuXgAK+rFrwr/I1fswZzFKMKe5rbQmrk0r2mLtCXDdcQ7KRZB
	 B9/zh4+pU6jMq82xGMSqsl8M8EjFYh82eRHLjA7qQQjNvn29CXNB4cPXDoRiuEPXxJ
	 5myvVPYRjdg5O4l5xjmGjTMohlaXVZqQt4Hj8hIrTrSPNYTD5TLHgQ8YlK6MHpgMPx
	 6YA5RFvLISxDPyozEEqEBgbMfO+hdR0pdA6R6x6njP2nuUnVpESYXZVknwFYhxDEUt
	 v0AQOjozT2I8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YSkyL4ScTz4wcD;
	Wed,  8 Jan 2025 21:42:34 +1100 (AEDT)
Date: Wed, 8 Jan 2025 21:42:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lukas Bulwahn
 <lukas.bulwahn@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the staging.current tree
Message-ID: <20250108214240.482e0ca5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yT7AFbiR.v8u4HZs/lAwKG2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yT7AFbiR.v8u4HZs/lAwKG2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging.current tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: drivers/staging/gpib/tnt4882/mite.o: in function `mite_dma_disarm':
mite.c:(.text+0x1240): multiple definition of `mite_dma_disarm'; drivers/co=
medi/drivers/mite.o:mite.c:(.text+0x1ac0): first defined here

Exposed by commit

  84b172cea4a2 ("staging: gpib: refer to correct config symbol in tnt4882 M=
akefile")

It is not, of course, the real cause of the build failure.  The duplicate
version of mite_dma_disarm() in drivers/staging/gpib/tnt4882/mite.c is
not actually used anywhere, so I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 8 Jan 2025 21:07:23 +1100
Subject: [PATCH] fix for "staging: gpib: refer to correct config symbol in
 tnt4882 Makefile"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/gpib/tnt4882/mite.c | 9 ---------
 drivers/staging/gpib/tnt4882/mite.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt=
4882/mite.c
index 90341f8c394e..22035e53ec35 100644
--- a/drivers/staging/gpib/tnt4882/mite.c
+++ b/drivers/staging/gpib/tnt4882/mite.c
@@ -170,15 +170,6 @@ int mite_dma_tcr(struct mite_struct *mite)
 	return tcr;
 }
=20
-void mite_dma_disarm(struct mite_struct *mite)
-{
-	int chor;
-
-	/* disarm */
-	chor =3D CHOR_ABORT;
-	writel(chor, mite->mite_io_addr + CHAN_OFFSET(0) + MITE_CHOR);
-}
-
 void mite_dump_regs(struct mite_struct *mite)
 {
 	void *addr =3D 0;
diff --git a/drivers/staging/gpib/tnt4882/mite.h b/drivers/staging/gpib/tnt=
4882/mite.h
index 2ecd83379974..dbfc59468228 100644
--- a/drivers/staging/gpib/tnt4882/mite.h
+++ b/drivers/staging/gpib/tnt4882/mite.h
@@ -64,7 +64,6 @@ void mite_list_devices(void);
 int mite_dma_tcr(struct mite_struct *mite);
=20
 void mite_dma_arm(struct mite_struct *mite);
-void mite_dma_disarm(struct mite_struct *mite);
=20
 void mite_dump_regs(struct mite_struct *mite);
 void mite_setregs(struct mite_struct *mite, unsigned long ll_start, int ch=
an, int dir);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/yT7AFbiR.v8u4HZs/lAwKG2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd+VqAACgkQAVBC80lX
0GymBwf/cJCeZgy4WK+75yg7oyv4nw8dHTAVfKvl7AevAIsTPDkpfwL5wf89GbI5
M7YU4FcyU4MatbostX4LlD2hBHvU8pZAyd7Oyisq2/3RSurNKmNmx9WroL03pMFY
j25DjQYCW8tQYXCj7PxH2+qDx8ggbUzdY4sjxv5YTs7Oe2iW6Sdaa6KstN1L6paS
uzFqpbQBIxx/rbIsQJB2wCDVtczJh0d2a06E+ehlFuIB4gI5QkIJ0fAnIGPtQQgv
PPeW2l2HGMqTcKTgObgsLBS/yqLiuw3GcuQAktR2Dm2zfjCEbICV/w/O6ohmAhCI
Py3Me+MIucOAh8fOMyDSgG/qXKgyDw==
=gkbv
-----END PGP SIGNATURE-----

--Sig_/yT7AFbiR.v8u4HZs/lAwKG2--

