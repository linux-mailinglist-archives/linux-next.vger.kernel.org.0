Return-Path: <linux-next+bounces-5571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58470A452C5
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 03:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80675188539B
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 02:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D088C19F13F;
	Wed, 26 Feb 2025 02:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JdHoYm7y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6781FCCF2;
	Wed, 26 Feb 2025 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740535645; cv=none; b=p4b6wCwYyZgB8elfUWnTqqvsZd8YwxrxCiBZMPfnXRDT6YivwPHYDAzqCYEl9X9KbQry9axTvu/eqQKWfbK2nEw+BCuU8X8y6oyqfujiSrcVWcrDwvT2WX80fQ0tFC5wwz5EcbLbjUSBKJhK0Yw5uPDQKEvopz8HJRHbD4Tf9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740535645; c=relaxed/simple;
	bh=7/L0cEtDpmurQYzERcbyrT9kLo++fopRuhasK2Kg5o8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gGlahhC+fQB/WaL16PTAd9hbDxZsSW1xAxaAXUre1Wk2zgMoAqaKcVVPmXkAeHPmoSGMb6iqN9GTQB9bxBTr5s1l9W+tCGd4NmUSiaf2aYDdhwn65bgWfEuYWkaN9UDwRzbIJalV98w2obOWpVRLocwTLlSa0X+y0csZ468uODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JdHoYm7y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740535639;
	bh=llEPwTgvzRAggAS24fuJbiH9tsFLaSs6VCAnpq42ScM=;
	h=Date:From:To:Cc:Subject:From;
	b=JdHoYm7yK2Br8Qd8+epDq3uiIuO3mCHBIx2ft/UV6xaEouAp9N4T0edi02Wp8zqah
	 itmlFxmcTdSVKcNrB49BNJ3XWESNBEktNbNCT/eTcD7R6ODHnqnjmK55WQi/O8xP59
	 6Niqv5cLAN7hBeVyd/FG7Mqpr74obi+j3sewxi/xR8O9rw2sUIBs6Jar+FiLBcmNGY
	 Q4H6497zVSbQxCTgd5vul10JxgbtKqQ/kCfqx+Lng2+X59Cwk2/NF4NiFz1fm6TpMq
	 80UL2f6oSD2ERBj72LR9VLwPiljp4lI+WnBEVBgCjHaBamM5SMPz2c4jyDHx0u50XR
	 l+0kcR2pSJ8DQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2dCC4Sbyz4wcj;
	Wed, 26 Feb 2025 13:07:19 +1100 (AEDT)
Date: Wed, 26 Feb 2025 13:07:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <thomas.weissschuh@linutronix.de>, Zijun Hu
 <quic_zijuhu@quicinc.com>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Message-ID: <20250226130718.0a652b44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q1KnM19SCp7VbNqAD1J/95_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q1KnM19SCp7VbNqAD1J/95_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  drivers/of/of_private.h

between commit:

  e6649328dc07 ("of: address: Add kunit test for __of_address_resource_boun=
ds()")

from Linus' tree and commit:

  f443029c9a6e ("of: Introduce and apply private is_pseudo_property()")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/of/of_private.h
index 1bdc7ceef3c5,b0c077867bf4..000000000000
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@@ -208,8 -208,11 +208,15 @@@ static void __maybe_unused of_dump_addr
  static void __maybe_unused of_dump_addr(const char *s, const __be32 *addr=
, int na) { }
  #endif
 =20
 +#if IS_ENABLED(CONFIG_KUNIT)
 +int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 +#endif
 +
+ static inline bool is_pseudo_property(const char *prop_name)
+ {
+ 	return !of_prop_cmp(prop_name, "name") ||
+ 		!of_prop_cmp(prop_name, "phandle") ||
+ 		!of_prop_cmp(prop_name, "linux,phandle");
+ }
+=20
  #endif /* _LINUX_OF_PRIVATE_H */

--Sig_/Q1KnM19SCp7VbNqAD1J/95_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+d1YACgkQAVBC80lX
0GwPWQgAgQbN/2ucf1JL2Av6HdbQdYy4a3UlNT4qyyGbNTX+MG6pSLS5eknmt2x4
DL31UkrnBRunDRfPetHQWr1cq5RW0CXNbELJiaOfRQE6eU3ldrMIiRGQqyXiOMZm
CUbqJ9lCLj4vAFkIgRFluS23/uvyA00j0szRknbn+z1uGOn+1+/cqyCHap925a+7
GdrIe0AOgjGS0AoH7GPIDGwElqnI5qqkx3WZ1MrZDZ2LiDQ/Wj6qAQ/qGXOFfbKk
nQfrKFJVrz1XAxcDCmVU37MSvxK7T10eyFQqvsOpm+Czy17DwXRBMyS7lvs7248e
AdBU/0HAUCkTWwoWD5Z/uZMllWvjrg==
=jbrF
-----END PGP SIGNATURE-----

--Sig_/Q1KnM19SCp7VbNqAD1J/95_--

