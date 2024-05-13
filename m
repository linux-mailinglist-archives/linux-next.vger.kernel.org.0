Return-Path: <linux-next+bounces-2275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B968C3AE5
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 07:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14496B20C1E
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 05:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9500146004;
	Mon, 13 May 2024 05:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PyineGW2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9432D05E;
	Mon, 13 May 2024 05:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577207; cv=none; b=MqRSVqVtUm+/5mc4QDpU7NrYhDQtRU7hteXNYPKswyviWMKVWi1jdoybxOIYE51bo1nEImDXqCTPf2i9B3eH9iVy9XnTJz9M+xi4V6BJ9VhhhZFKz0xJKt8CPpkjJVM11OzlGpx3j6j/hm6XsJ7qi7ZhEVmR1CqG8jyUl1ex8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577207; c=relaxed/simple;
	bh=/B/3eD2bMjKFJTAKJADLfbntDRndNUVSaxrNm5C6/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ax3VAy+WFCF2l3/GvbHoFzNsx/goc8qf0LBBqvMTjfYDmJwCztoavJS9TdIRo+J6uJhPQOPaiq4GIGnvuOooiiFlkp2soVbC4Uc576h/xsEEQHA/0agZLVPKxPbm2iEe2SQac8ANI3RL2TlGZYk+Aviyj1zV9Oq23YCR3Awl3NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PyineGW2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715577200;
	bh=5sGFYEPdjXmhCCrBK9HWeO9dlc08Qy87yM1g53roRPo=;
	h=Date:From:To:Cc:Subject:From;
	b=PyineGW21JlpgOz2XH6Vc6Wu+Vsvl2KK2qHv5JOzpsOh1DxXcGRz2iSSufaBcTuhX
	 QgFlv8OG4akzeMzLTSDjRsQoFEOBDsNOantqPdkJfFjRo7koQIRvzhJ6tRCQkB+iun
	 7Xso8BGxOy1ODe1HwpsTbaCZohZATmdjmksnzM/TNxWF5QBP6tFYTMYbgyKsRqtf1Q
	 X21WxCjc6XOFRl8/VLjCDMVnLZbW+3LPngbquP0C8hPXKaXWrM2i7FDWzJ/jnkoFJ/
	 ZcKnRmMu5MrGVXFdT325axKar6j5Zah7vXq79/2LOlBsZs+n9cbEtlFmtb1XJCgR/S
	 E8WX5yKA8tlrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vd71D4M1wz4wb2;
	Mon, 13 May 2024 15:13:20 +1000 (AEST)
Date: Mon, 13 May 2024 15:13:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kspp tree with the kbuild tree
Message-ID: <20240513151316.6bd6fc87@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6mPkapmrzNAtPfdOkQ.Op.t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6mPkapmrzNAtPfdOkQ.Op.t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  drivers/misc/lkdtm/Makefile

between commit:

  9cf51a6d1de0 ("Makefile: remove redundant tool coverage variables")

from the kbuild tree and commit:

  fb28a8862dc4 ("lkdtm: Disable CFI checking for perms functions")

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

diff --cc drivers/misc/lkdtm/Makefile
index 33fe61152a15,b28701138b4b..000000000000
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@@ -15,7 -15,11 +15,7 @@@ lkdtm-$(CONFIG_PPC_64S_HASH_MMU)	+=3D pow
 =20
  KASAN_SANITIZE_stackleak.o	:=3D n
 =20
- CFLAGS_REMOVE_rodata.o			+=3D $(CC_FLAGS_LTO) $(RETHUNK_CFLAGS)
 -KASAN_SANITIZE_rodata.o			:=3D n
 -KCSAN_SANITIZE_rodata.o			:=3D n
 -KCOV_INSTRUMENT_rodata.o		:=3D n
 -OBJECT_FILES_NON_STANDARD_rodata.o	:=3D y
+ CFLAGS_REMOVE_rodata.o			+=3D $(CC_FLAGS_LTO) $(RETHUNK_CFLAGS) $(CC_FLAG=
S_CFI)
 =20
  OBJCOPYFLAGS :=3D
  OBJCOPYFLAGS_rodata_objcopy.o	:=3D \

--Sig_/6mPkapmrzNAtPfdOkQ.Op.t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZBoWwACgkQAVBC80lX
0GxfjAf+InmmGo1j/RvCQ42kViYB+skG6eNP7D1RA5/PPnmvtan/MkfSOy+wfaxw
6njlSOz0PS+wjIFE9Q9AYQ6g2bmPDtE8xVO5G5C2I52cC46KX9BDjj8Wk1sXjLkB
CCLT468CtDkEot+IbE74PiX+zVHJ6W0hpf8GkfzX9+SeAH4vl+QcjEp/ylagKIf0
Szr7NYZmkFIQ2hm7/s36eadXXNwav4z3696Z71fwabgSTLcCvNX15N0voPF3adVp
tyhUO/NKOyrp8dTkgzN1B8Fx4RhGVL25MYgJxxJeMjopgb7xqSS4V9eEu26c0C4L
MhIaT8anh3pLnkS7N8uvY9IH4fKaQg==
=+5g3
-----END PGP SIGNATURE-----

--Sig_/6mPkapmrzNAtPfdOkQ.Op.t--

