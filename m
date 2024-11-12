Return-Path: <linux-next+bounces-4763-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382959C6485
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 23:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFCE92856B8
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 22:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C683121A704;
	Tue, 12 Nov 2024 22:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CXXu+kDI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33221A6EC;
	Tue, 12 Nov 2024 22:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731451957; cv=none; b=am4NjZ54dxRUt6acWKOAFWjmqkt1QbivAxAAng3sN0h3ipUc7H8EUdjDMS7dM4kp/LZEtKtWRE4c9Nn8U+nRSmRXqabqhh8H0Zr9RUM8+F/n9x30CFkV/z/hzchkTkuZFOTk2Pm5l21p18N5omcpF3a9AqJe1V36CPvvaiJ1sOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731451957; c=relaxed/simple;
	bh=+TmRNrWhyk0NyksbrpfjrLdNlIatOZKJUZsfBmYqBuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZDj2PxGzWaakeJD3UvITdit279G8JFxFewJfdrnExS/5IQ5WUxP1OH1yX4qk1cHsAoPGhmKmEQzcx7PMtvK3cjZeB+ZMuhsyrgM1MZr9t7hPZ2kzFPl3tvnadegpSYzyxp7IoGE59oOqCw8k82Dh0Tx8SIBgVZrcMba47ccr3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CXXu+kDI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731451947;
	bh=5SUS8h1FDCOnKZcauReWecwOZMznU7f7Y2JZrN2r7SM=;
	h=Date:From:To:Cc:Subject:From;
	b=CXXu+kDI+tNZf5t4hU+9MepqNkXRKecTsLUDfkD8cLhBKKdyTWYfquSsJlpvF344Y
	 VKVZmOOmhNNbDuDGIr1+IdqpkfduvmuizhJOsnSTmP50eP7UnFsti56DPD1lx8VgAh
	 ybOU6Qru/ua/RVb6FlAF8hgAp/Q/nH/YbFBj7HWWyzZ74KSJdzEC8QDcLpyVgg8xGM
	 MojYK0H7AIh22pR7GEvnEg6QdXactTsEURGPnzSy/nAKnolByGXvjD3/Ru5p09CmCw
	 u57X2oGdq8zoFQEukwFRl8UH4SVOwFBSnkeirkBLEK+DE4yUAhoijg28X+QRQBBkkp
	 KdSa3KzeVEP6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xp1rq4VQPz4x8C;
	Wed, 13 Nov 2024 09:52:27 +1100 (AEDT)
Date: Wed, 13 Nov 2024 09:52:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: linux-next: manual merge of the powerpc tree with the kbuild tree
Message-ID: <20241113095228.4ac96776@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OJSHOma8eTbb221uzinmuQ5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OJSHOma8eTbb221uzinmuQ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/Makefile

between commit:

  de51342c5157 ("kbuild: add $(objtree)/ prefix to some in-kernel build art=
ifacts")

from the kbuild tree and commit:

  bee08a9e6ab0 ("powerpc: Adjust adding stack protector flags to KBUILD_CLA=
GS for clang")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Makefile
index 321b596d2550,99af7953e844..000000000000
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@@ -402,9 -403,11 +403,11 @@@ prepare: stack_protector_prepar
  PHONY +=3D stack_protector_prepare
  stack_protector_prepare: prepare0
  ifdef CONFIG_PPC64
- 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk '=
{if ($$2 =3D=3D "PACA_CANARY") print $$3;}' $(objtree)/include/generated/as=
m-offsets.h))
+ 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protecto=
r-guard-reg=3Dr13 \
 -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA_C=
ANARY") print $$3;}' include/generated/asm-offsets.h))
++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA_C=
ANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
  else
- 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk '=
{if ($$2 =3D=3D "TASK_CANARY") print $$3;}' $(objtree)/include/generated/as=
m-offsets.h))
+ 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protecto=
r-guard-reg=3Dr2 \
 -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK_C=
ANARY") print $$3;}' include/generated/asm-offsets.h))
++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK_C=
ANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
  endif
  endif
 =20

--Sig_/OJSHOma8eTbb221uzinmuQ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcz3CwACgkQAVBC80lX
0GynbQf/QT9xN5Sadagwxsdm+jnyJshU9thoOA+VE1BCgAD92+Ejeoqi9n4OaHyW
Znl+GF3VDsGajimTDFXoOJM1Wo52jvMNonXMezv4gpR/q2SobxfoKQ8MhKDW2gnF
ZdSeoSWKxCEeNYuMNMoDDwFuncgz+CXTrQIBFnJc1R4tZfUjLU9aDcu1zT20c9w7
ohToakX5p4aizTudR7Hqcb0jvV0LcxuZUGa3x2dqc1humE2D2JRADrMbc2dj0cKV
OvZMQia1n4v6gxz7IgzJSGu0thVwNXB9MRNH17UnHOegxIgh0U4xsDZ1nslllAQz
u7ZR+nJ6JhTxsjFXuLXv3TVILH6BjA==
=STb3
-----END PGP SIGNATURE-----

--Sig_/OJSHOma8eTbb221uzinmuQ5--

