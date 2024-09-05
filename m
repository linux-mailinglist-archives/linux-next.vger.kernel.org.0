Return-Path: <linux-next+bounces-3605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86E96CE7C
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 07:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5F81F26ADA
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 05:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8357188A1F;
	Thu,  5 Sep 2024 05:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lsputVf4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1F189503;
	Thu,  5 Sep 2024 05:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725514566; cv=none; b=YuLgsLvx69alCCDHB2RKnxFIuWcY9Or7Jt4vsLz+DsCwrzw1fAVLmqwmHDCT6jV3zigSK4G2woSATNw99p4Ti6dIHvw71TpkKB4+5Ma77QNBHwRumgZ2YTqPFBhSia43FIldB8UluguU22qyK3JVo5h7XnK6HrSDZqOnKaMuM3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725514566; c=relaxed/simple;
	bh=6NInI3x4I1NLHgn/boYgF5cpXDU3fmABu5sSEdo6u+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hLGrllgubsiE+2ydyWXngI38gRl6ugQ9tesbpQhfb2JiFOeKSXT7iINVCb64RX8C6WeybL1RNc64X6W3HP2l7zItBe9uKz4X3j5BXkyGABdVstLCfISu1ezKN9mqrFu4BFzB5R1iFOVau6WXg9+Cu6G+XqvDvaup9nIRIev1IG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lsputVf4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725514559;
	bh=cM0S2UeW4mh7gMtac8o5JhDGyQIAuwWJBrJWnjvmC5g=;
	h=Date:From:To:Cc:Subject:From;
	b=lsputVf4MsBTwRldlsTOxtUT/Rr76VKAB2Cze2csWYx0mZergBHQ4LkVtxMw6ZgFf
	 nCNOIfu0x7g2iD1y9k4aKnf1WBUwoqLTBRKNQ+ytGEcIeByno7NFOTPXVs0lRO7frq
	 C8XpXB7ihN6+7HxD3WCpeY8w0Mgvv77U3JBvspRo+g5oLp8aAv5WSE4MLRbeh4bT0G
	 M37Dg8pBJejm2rkkSdILkl1TvYl+bji1g3VsWxI2ud7izRwcNTIRt06HTviP0/qj6N
	 YBzWpmQqE9EnAgZIzrVvoyZOhjhUopRKU1JznsEccZs0FVxkEN9eKMW6jsDnNehRN9
	 KkPpGQTMNJbBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wzp4G418bz4w2R;
	Thu,  5 Sep 2024 15:35:58 +1000 (AEST)
Date: Thu, 5 Sep 2024 15:35:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Sven Schnelle
 <svens@linux.ibm.com>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20240905153557.3b0f8db5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9j7a7_aMrsEXjdsdieip6+K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9j7a7_aMrsEXjdsdieip6+K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/events/uprobes.c

between commit:

  c67907222c56 ("uprobes: use vm_special_mapping close() functionality")

from the mm-unstable branch of the mm tree and commit:

  e240b0fde52f ("uprobes: Use kzalloc to allocate xol area")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/events/uprobes.c
index 6eddf4352ebb,cac45ea4c284..000000000000
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@@ -1518,8 -1480,6 +1499,7 @@@ static struct xol_area *__create_xol_ar
  		goto free_area;
 =20
  	area->xol_mapping.name =3D "[uprobes]";
- 	area->xol_mapping.fault =3D NULL;
 +	area->xol_mapping.close =3D uprobe_clear_state;
  	area->xol_mapping.pages =3D area->pages;
  	area->pages[0] =3D alloc_page(GFP_HIGHUSER);
  	if (!area->pages[0])

--Sig_/9j7a7_aMrsEXjdsdieip6+K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZQz0ACgkQAVBC80lX
0GyWTQf/QdFEi2sP0Oq/2G0tiKpPa1pIO3ZghQfVWS5dxUkpxpIQa36DMeNrZFzc
QjVsP2RrAowe8rPinoDRmjLbFl3+Zt7Fx8t+P9NLeN+0/q/7Pj03/ypOSJFUVdiF
JNzCiZbrsQ9zOnaV0+ct1XwV9cw3w8rtQ3qLQL/tNrxQ3A3C/lqDba3h6j5zpvSl
RzGXxTmTIWXAlTacItHHrwIv/v9++hS2v+aUEF3xPDMFSFCVar+ak25jOT70fXQ2
cnJsHIjD/W6YOvqMjlLl7CzY0UJE47NiDDY3MGlSwfPoIfiekBlwyIkSVgIIqmiF
XX1RsnyVirS6hT91VMjkDgGFLUmxkA==
=PGn0
-----END PGP SIGNATURE-----

--Sig_/9j7a7_aMrsEXjdsdieip6+K--

