Return-Path: <linux-next+bounces-2852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962692AECD
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 05:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1C2E1F22712
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 03:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BD843AC0;
	Tue,  9 Jul 2024 03:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bImM6c2H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA9A4204B;
	Tue,  9 Jul 2024 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720496069; cv=none; b=qGpLfsbZpr3MxVx1wEnlSh3DmIFJ0V/9l4grPPwRLTKuemzrAz4r3/Yld5ucMBVn2YotObf+XbAyk6LMq47T9CxdbxavL2fho+SE4YZHV+FFKGIVRZGwU//+AtVvmkdZ8YlP6W5ionbUnFL/N2lihvSgcrjqGD8AgEn+rxnLuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720496069; c=relaxed/simple;
	bh=5EHUmpxUI1dLdS0rQa80kk8LUvYsdCpxUW4oijufWlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EsTIQeNaKZ/7eRMwUM/ycFinoZE4QXPgRJdvnA0ccZzyXLWRaXCgOVKAyM4OZ4wlA5KRZH/F3GtYNZ1h9/sH8XmPhnFcqgNf2w0IRyyvqkoXFC5lD+vDweI262xRRp3b099+mNvw5vSmkdmft3ojwTmnPTPzsYRGlmQD3GBmPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bImM6c2H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720496062;
	bh=K63CpnCf5frr4q/o5gMfiWUPRCph/tjK5mzVwMUVt28=;
	h=Date:From:To:Cc:Subject:From;
	b=bImM6c2HJFYlVUMGqavQOjS23c2LB3DgfqME1K0NAeqparMcATHv6b1P5DO/nC8Xh
	 zEwWDTyRwHJZtrj/Q5RT0pY+NNJ0J8XrxxLY32Y+N9zNrKxRQiImQwxj5Dd2ZBGE1I
	 dOhBbQNwsLtC+RbtnZMVEarRfyLMh1NuifHNjREEFXaUeUrMLW+E/4lnG9zMbGkm+T
	 BcibS+y2OeOXVeMPo92cZKoCbUeJRbRdYHdn0/QYXqlb5tEMwI54v037v6BMXy7E1b
	 b9JP1fGCCAKOYCWlSwmFdbw+YugjWtF7FJFwTBykv5fgvgLUshtqzts13fp09PzJ4m
	 QDLBVALW3UQ/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ66j4xGhz4w2S;
	Tue,  9 Jul 2024 13:34:21 +1000 (AEST)
Date: Tue, 9 Jul 2024 13:34:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: linux-next: manual merge of the battery tree with the leds-lj tree
Message-ID: <20240709133420.55645c59@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_v8u5kc2hc6W_g+2qeKHAQL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_v8u5kc2hc6W_g+2qeKHAQL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the battery tree got a conflict in:

  include/linux/leds.h

between commit:

  6b0d3355e5a5 ("leds: class: Add flag to avoid automatic renaming of LED d=
evices")

from the leds-lj tree and commit:

  5607ca92e627 ("leds: core: Add led_mc_set_brightness() function")

from the battery tree.

I assume that the bit number valuse don;t actually matter, right?

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/leds.h
index 99f87587a132,517b6198df07..000000000000
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@@ -107,7 -107,7 +107,8 @@@ struct led_classdev=20
  #define LED_BRIGHT_HW_CHANGED	BIT(21)
  #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
  #define LED_INIT_DEFAULT_TRIGGER BIT(23)
 -#define LED_MULTI_COLOR		BIT(24)
 +#define LED_REJECT_NAME_CONFLICT BIT(24)
++#define LED_MULTI_COLOR		BIT(25)
 =20
  	/* set_brightness_work / blink_timer flags, atomic, private. */
  	unsigned long		work_flags;

--Sig_/_v8u5kc2hc6W_g+2qeKHAQL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMr7wACgkQAVBC80lX
0Gy0lwf+IWhCwyn95vuG7hTe6ViduwPCf0YLwW676tQaOuabhrUMHYQSyOccJoiu
C+ktCzeO5xUZ/ZZX3RGnFhuulaicq/dVhFnisdqeQMTGQlspapaoIWmTeF1m2j3z
AlhE99r6vOF66Zvp1mfjCBOTkeDwH1jL4mhW6newj7rU2bC30OPtNaoyxMhv0FEb
E9rye/tJpzlb9zWRoAXnwsf2Lr7xKz9Z1tztBXKLHW79fsgX4YIvGIrJ1iCOFx0E
KrMA8NFGDkm9l49xFOILdrk2TscO5nDSRqr+GiBQEOEngqllNktHfAF4RTLof3E8
q606QJVtf3gEyYFrG2U8Z4GuttDmdQ==
=jaF+
-----END PGP SIGNATURE-----

--Sig_/_v8u5kc2hc6W_g+2qeKHAQL--

