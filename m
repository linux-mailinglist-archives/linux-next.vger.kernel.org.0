Return-Path: <linux-next+bounces-2846-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10392ACDA
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 02:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412BB1C21692
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 00:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D95EA4;
	Tue,  9 Jul 2024 00:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sxdU6Zx+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA31EA8D;
	Tue,  9 Jul 2024 00:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483325; cv=none; b=PDqG1dUVDXGPY5glwxZFRpBjImLdNqmF5bbQhakTi3sOMsI05MqUceyWWkH0gJFmuxKjzeu1NBSFgqtmCfBqPCeayTUDH10eI0Oh6P85YJlmJG8rI6yBbMe/2FQk5OIhCMft+LMNYip8UoDTXcA9/2cbVETKzy2+QD337aMRLxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483325; c=relaxed/simple;
	bh=dG5OzQrTSYuIs0p8atRovs65L6NW2KZUERwrJIgA6Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ak9ngQ9VeefRAYHTV4VgjUyAgAJZd2QQgk3PKUvpjwmcO/njeDnnTiG6AVD5XAZD663HE5eGoT2qE0+megkuHeEHPC8WsH4fjzX5ttoC4pp4pYGQ9PrgIRLzm+6jBYTzpPih8pFAp9BEOUDRvWsBb2zco+9MN6IXnAeA2PC++JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sxdU6Zx+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720483316;
	bh=4EoW3en1poDjQhqoBNR+zdRfgk6JnNl8SyN18lpiRhE=;
	h=Date:From:To:Cc:Subject:From;
	b=sxdU6Zx+gSyN/qVKJ5tzIRVi/Wcg1sPYtOGTQ49WIC1Nlqz2QKFVGGjP0tsIAHDSt
	 j+mVwNumBJwLlEMSBJ82Q9xW2CLYGm9ZNiS8hrdSY80UHGyfoBcVmijgnqzYaZW8Tw
	 dZsBtgx26ubmw7bHkI4Zn2jJRmU5vhPoWia3U/uZ3+1IKKH1kSdzz1ubp6rnizMnnq
	 TuGDMePxVUTvCqmgvI/UHtppuyj/i3aU2SzsYT9atGgcBEFFm/zKRy8a3FKRmjtg7A
	 cHIJGTVpsrrRvc0HDMpUS/bz0akgFnbSYYSYUVsXDNmc1qHVwukpoDTpZifcXOnAqP
	 ovgNGRgkHhVpg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ1Pb5GGNz4w2R;
	Tue,  9 Jul 2024 10:01:55 +1000 (AEST)
Date: Tue, 9 Jul 2024 10:01:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the loongarch tree with the asm-generic
 tree
Message-ID: <20240709100154.0b4b1372@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tyAqR0/17fp8Oix9WjZuroh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tyAqR0/17fp8Oix9WjZuroh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the loongarch tree got a conflict in:

  arch/loongarch/include/uapi/asm/unistd.h

between commits:

  13aa27ce8de0 ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
  1d7b98ec5d78 ("loongarch: convert to generic syscall table")

from the asm-generic tree and commit:

  a5d43e6d87c0 ("LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h")

from the loongarch tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/loongarch/include/uapi/asm/unistd.h
index 1f01980f9c94,b344b1f91715..000000000000
--- a/arch/loongarch/include/uapi/asm/unistd.h
+++ b/arch/loongarch/include/uapi/asm/unistd.h
@@@ -1,3 -1,6 +1,4 @@@
  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+ #define __ARCH_WANT_NEW_STAT
 -#define __ARCH_WANT_SYS_CLONE
 -#define __ARCH_WANT_SYS_CLONE3
 =20
 -#include <asm-generic/unistd.h>
 +#include <asm/unistd_64.h>

--Sig_/tyAqR0/17fp8Oix9WjZuroh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMffIACgkQAVBC80lX
0Gw58wf/ej1lSWnuM4/KpOYRyf7AFxFIGuHEe3PWI66JhSRbE4GQXRwD2ob5i5gx
QilnVWse31u809LAQLnnjCTMwuws65cHsOLGP/NRbO9yNIMTUMV+7xV41Uhspf7g
zYCI/pxPkvP3v+SMqUGCST/oPHgTCNdsATn9VxjPQQEM7gqCnilsNY3sG79oCkgZ
MyXo2aWTglCQr65gOIPzWhue8DthOGT389Kz/rDoANBG4X6MOcFGkG/8tzib/M7U
cQ48LBYdgmfQycwV5qWc/H1p9B0Xwnbo4uHAApLQgdXVGxnpa954X6SmcG/ybATs
URUTtryewsP0NgceZFCSFuG3IiLnVg==
=OLR0
-----END PGP SIGNATURE-----

--Sig_/tyAqR0/17fp8Oix9WjZuroh--

