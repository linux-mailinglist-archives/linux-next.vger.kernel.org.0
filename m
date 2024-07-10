Return-Path: <linux-next+bounces-2909-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4D092C7F7
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 03:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DE8D1C21826
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 01:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ADE1B86D9;
	Wed, 10 Jul 2024 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kMtWl5pO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB958472;
	Wed, 10 Jul 2024 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720575108; cv=none; b=LU5mheZQaMWa0b7gTBGqkVefKWdDWfvao9JQRKymmgcJ1+8Z9eOOIW4al57HmTCXQBg69Zx5Vv1YxPCi+DC47xAkgFCTEPM5GrSR3hkWBJVengoUaKAJvS67alI/tceYKTL5xziknYZ/Q+tA/kwZN8UVycjAYA3xiIr/eIr4hG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720575108; c=relaxed/simple;
	bh=XkLG/lpis0cxksm/XMIcTpTRTmAa0nlZciH2cS6caPo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjflXPpaDNGFiMB1LpMuA2iB7YBbtr4Eskz848+PJmj2PlSvVP7FQLV65BhKUqFhFso9mPAXv5VOyF0hI/fXDoFzLvBUvEgEQUWaMAs0i7GPUR0l2ks3EyvnZhT/89c7mvO3qiSN34sIWjDJVSYuQpfJEkHpyaZCFdIQeoIIKt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kMtWl5pO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720575102;
	bh=mnQz/kO/nUpbOqX3N0KKL9uzBnombFral8islbwMTME=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kMtWl5pOyGBVr3dUYN+H/7aFYuPV0+GfUFGaekZAbJNmbyDnTPG+OW4e/wFATVnkY
	 OHU1wo5XSqRYzAn0T+T9UcbcUKCHrQYxTiJbSHyajALk0ipOWR1Wxdk0AkxJ8+o2a/
	 ucxpZctUtl67TB6NyV77JVxj5VnFry/shQGm3Ao2/w5WLL8rM3HRB4s4YsdXj4pKP1
	 Uw1a0V0MGmNZoOa8SJQCiX0tA20NIuPNbw+ugPgNDLDOEz8wT48Zmy36HNy4cSInoD
	 rmyXuLQJeUA/Ivr+3C/cGXVA+9GNwNsFmIKD1nCjZ+yD3gCs+le2TcgsijXq2Ky49C
	 5lYTkbFG+X8ng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJgLk2sGDz4w2F;
	Wed, 10 Jul 2024 11:31:41 +1000 (AEST)
Date: Wed, 10 Jul 2024 11:31:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Huacai Chen" <chenhuacai@loongson.cn>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, linux-next
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the loongarch tree with the
 asm-generic tree
Message-ID: <20240710113141.25abf0cb@canb.auug.org.au>
In-Reply-To: <9e756bbf-fca2-4ebc-bc04-538aded93747@app.fastmail.com>
References: <20240709100154.0b4b1372@canb.auug.org.au>
	<9e756bbf-fca2-4ebc-bc04-538aded93747@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lyA8fFrpgGBzUNAsY+3_0lN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lyA8fFrpgGBzUNAsY+3_0lN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 09 Jul 2024 08:00:56 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> On Tue, Jul 9, 2024, at 02:01, Stephen Rothwell wrote:
> >
> > Today's linux-next merge of the loongarch tree got a conflict in:
> >
> >   arch/loongarch/include/uapi/asm/unistd.h
> >
> > between commits:
> >
> >   13aa27ce8de0 ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
> >   1d7b98ec5d78 ("loongarch: convert to generic syscall table")
> >
> > from the asm-generic tree and commit:
> >
> >   a5d43e6d87c0 ("LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h")
> >
> > from the loongarch tree.
> >
> > I fixed it up (I think - see below) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts. =20
>=20
> Thanks for taking care of it. There is a slightly better way
> to do it though:
>=20
> > diff --cc arch/loongarch/include/uapi/asm/unistd.h
> > index 1f01980f9c94,b344b1f91715..000000000000
> > --- a/arch/loongarch/include/uapi/asm/unistd.h
> > +++ b/arch/loongarch/include/uapi/asm/unistd.h
> > @@@ -1,3 -1,6 +1,4 @@@
> >   /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > + #define __ARCH_WANT_NEW_STAT
> >  -#define __ARCH_WANT_SYS_CLONE
> >  -#define __ARCH_WANT_SYS_CLONE3
> >   =20
>=20
> The macro is no longer needed in the uapi header and
> should now be included in arch/loongarch/include/asm/unistd.h
> instead.

OK, so I have removed the __ARCH_WANT_NEW_STAT line from my resolution
of arch/loongarch/include/uapi/asm/unistd.h and applied the following
merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Jul 2024 11:25:28 +1000
Subject: [PATCH] fixup for "LoongArch: Define __ARCH_WANT_NEW_STAT in unist=
d.h"

interacting with "loongarch: convert to generic syscall table"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/loongarch/include/asm/unistd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/include/asm/unistd.h b/arch/loongarch/include/a=
sm/unistd.h
index fc0a481a7416..e2c0f3d86c7b 100644
--- a/arch/loongarch/include/asm/unistd.h
+++ b/arch/loongarch/include/asm/unistd.h
@@ -8,6 +8,7 @@
=20
 #include <uapi/asm/unistd.h>
=20
+#define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
=20
 #define NR_syscalls (__NR_syscalls)
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/lyA8fFrpgGBzUNAsY+3_0lN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN5H0ACgkQAVBC80lX
0GwPAAf/WxNK6HA7UzP9pSwQ6qeJUDesZaAWecG1sCwcxKENQ6WRJ6y/gl2bw6JI
9yh2XiuxPzIMXtj82gqj0BebZ4gtVZ5YPNCybuwkU5rQ8U4gbwBLw+fX6a4/nRTA
b3bfsB3AcJeXnsXiB+uz925SpXVFrcCzae/t6i1Ze8p5YOnJsJw2+EiqEmLa70hC
EyiE3Kkb9vwlNYLYW1fg8LuBp3QMAocMYYeeIr1vOTzbXAJmYY+cow/CqpwvME+9
EcviCC/EbwnoIu+DkYNceKN+CcavyYGklBWrutqZ1Oco+io0cRZ2revVY17QO2XT
5ocGUqrGXUcFNz2Rq3Z0MHpl+1L84A==
=Zsjz
-----END PGP SIGNATURE-----

--Sig_/lyA8fFrpgGBzUNAsY+3_0lN--

