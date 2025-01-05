Return-Path: <linux-next+bounces-5022-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46205A01BA9
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 20:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99B63A19DC
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 19:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D2E12C7FD;
	Sun,  5 Jan 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T/o64Gfc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0181E487;
	Sun,  5 Jan 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106654; cv=none; b=CKpE8Hu13RJWOsTfkmcOCeUaNKQhkzdMvNIGV4cXNYJZK3s2ina8/HyzzWvDn9g06/IMtHQqjNH9SHpZ2ZNPTAQY32yAlRvRaK9PmGdjFwIDYfuuEVkW8K1eld/ia3Fp6YdJJBoF/WSYJPXzFa4BGYJFXz539h2wGU4Adu/SnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106654; c=relaxed/simple;
	bh=H0ZeGG9PV73wo9OMpjrFAiK+VQBPtxslacSWLZhOyU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GBsSOLRZRRsP3O1obIWzk8LiXfqdpngEKCww1AKhOfa1n6R7Lwi+CynXQ9GcbRjp7hdUfV0S/6mDcZdBkDrtDBX8VZYb7HKMNg/G5RS2M8PUqRVdbjVY4021nu713FSJwJl6Cq2vr/BixfLOwJLxJQRtI+rxLjqQJRc6blHBAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T/o64Gfc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736106642;
	bh=WPmJKjUzqxlg75YKdohmwdnGJB6F+VF1uNyPXJUy/eA=;
	h=Date:From:To:Cc:Subject:From;
	b=T/o64GfcZP8JYtbH5+xe+NDKL9MtxTc1/qS8n/4ZY972AhZSHd1K/NWtK7Cdii7Js
	 4JmMOIv6+eBCmY4RHzufKLP/wXU3fUugei00TXJzDZhZn75BUXlaq2YtwTnPFeZSYH
	 XedqX1bSYsicueyRBWJIAGnRa5REa5pNgn4idwZsQfnRXRuUgyKnxqq0InxD2CR/2/
	 laV5SAekL/tJ+FljcAoprfbeaNX0ud7b0fJzz5VLnQrw2Q1pA+7Tp3+h/kW9mM6c88
	 EHBKvMAOfqavmKO8BxhaQBaJQZvvZmzlY4K6Zdfl3A9vbn6bhNJ8yFkaEMPINMlYQl
	 oq53/MgcWEhqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YR7GB5CRWz4wvb;
	Mon,  6 Jan 2025 06:50:42 +1100 (AEDT)
Date: Mon, 6 Jan 2025 06:50:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the crypto tree
Message-ID: <20250106065048.3ce6090d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tkaNrA1Tv4z91OhwbeANZBA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tkaNrA1Tv4z91OhwbeANZBA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4ebd9a5ca478 ("crypto: iaa - Fix IAA disabling that occurs when sync_mode=
 is set to 'async'")

Fixes tag

  Fixes: 09646c98d ("crypto: iaa - Add irq support for the crypto async int=
erface")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/tkaNrA1Tv4z91OhwbeANZBA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd64pgACgkQAVBC80lX
0Gw4rAgApBx3O822xML48Er1Oj0FP6/PrOu83MvjUPQPv/ZP38yfyIhyoxCknjLF
2GxULYLfdrEkj0cGGwHNgkT/pjCl48XovxIaG9uyV646A1Q54cBelvSmC9PAR91b
Qs3ShlFHlHR1dBRJ+72sgM5jABcgpVErnvpTU6ilkl9+N45SBsI/bnLNAvolz8dh
xaTwqqUZ8eJcFvs4eniDqM7Lyih72K/wU2ODAKQTVxHPCnt/Gfu2dqIYsSiFJAR8
erNn2rkifFwP0eZhdOyfON791TY1od2ZAJDdNo09Km90frP6N9/NGfiqBoyNIipf
SFSLr1B3aKN3fawYhk6S+NAP0s5APA==
=3mgj
-----END PGP SIGNATURE-----

--Sig_/tkaNrA1Tv4z91OhwbeANZBA--

