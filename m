Return-Path: <linux-next+bounces-4836-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9E29D7920
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 00:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F11DB22402
	for <lists+linux-next@lfdr.de>; Sun, 24 Nov 2024 23:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703442500BB;
	Sun, 24 Nov 2024 23:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y2ZGqkIJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E3163;
	Sun, 24 Nov 2024 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732491250; cv=none; b=spgY0BxDdvZWl4NoZlawqCsiV+PRT1Hb0DWZg8sFYLqZl4vmYQLTcVZBgYYTrYsbR60bKkAt+QEx+sNXBdK31Jezhgd5Fh7cLDcb1K+D3JDuWf7UidvSnFwVLGJwAUuDEsUxejQZRWNyd2ZrrnDpfzrthlD5HxwjI0IA1lagdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732491250; c=relaxed/simple;
	bh=CT9D6mdOROTux249B+29mlTSpXVs5OamgWdIgzsLPTc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPNWMQrqKrX2dA26yq1M98losqLPdMASZoALvethTeA4kdKu185NVsNEFvJYdu70QGhBzaa/q+FtNKOUSj0PS+3MsHjsWBMId3nDLUpIxB9oed7oE8ZG9M3pJ+/mHOXvx03L4tn5gMY6b+VnQMqrr3aTxLGaXsuKmCh2U0mM/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y2ZGqkIJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732491238;
	bh=3HZgDipoBDYjlrimLFeAzGIB/HpXZYSyIrDnhPg+UVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y2ZGqkIJPobGRlc/ltIq3UFrdZNbJNUQ1D32IYYc+2P5f66hP/QPs6kSWZmdRZnAj
	 l7iJA0prBuFnXLEHQ105uzhw3SC1s9QZ+NstXkKtjIcBiLk17LvBD1lytYAhw026Hv
	 r6pR/CQHrTJew4MQQPMsrPTozkl8WXf9tA9qFzWMZuDjZl0g3W1y3jpcrhajp3pR+q
	 G5qbBJ8NjOTfekwjZv1cnYUZ0NW6fDd1uItzJhJgq3/SwXo6k+DVqhI5gCJjNit6b0
	 i6rRmNJQOSWEbyN15CjwNgktroiSr0xT3hNqmDAymTYaDWEzXBqPp5+c7MAuDWZfNo
	 03C9z0xRAghcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxQCB10mLz4xdH;
	Mon, 25 Nov 2024 10:33:58 +1100 (AEDT)
Date: Mon, 25 Nov 2024 10:32:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the kbuild
 tree
Message-ID: <20241125103217.56a6eb0e@canb.auug.org.au>
In-Reply-To: <20241113095228.4ac96776@canb.auug.org.au>
References: <20241113095228.4ac96776@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dY9MbLJdb98co5AuDAiy8S5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dY9MbLJdb98co5AuDAiy8S5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Nov 2024 09:52:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>=20
>   arch/powerpc/Makefile
>=20
> between commit:
>=20
>   de51342c5157 ("kbuild: add $(objtree)/ prefix to some in-kernel build a=
rtifacts")
>=20
> from the kbuild tree and commit:
>=20
>   bee08a9e6ab0 ("powerpc: Adjust adding stack protector flags to KBUILD_C=
LAGS for clang")
>=20
> from the powerpc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/powerpc/Makefile
> index 321b596d2550,99af7953e844..000000000000
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@@ -402,9 -403,11 +403,11 @@@ prepare: stack_protector_prepar
>   PHONY +=3D stack_protector_prepare
>   stack_protector_prepare: prepare0
>   ifdef CONFIG_PPC64
> - 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk=
 '{if ($$2 =3D=3D "PACA_CANARY") print $$3;}' $(objtree)/include/generated/=
asm-offsets.h))
> + 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protec=
tor-guard-reg=3Dr13 \
>  -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA=
_CANARY") print $$3;}' include/generated/asm-offsets.h))
> ++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "PACA=
_CANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
>   else
> - 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell awk=
 '{if ($$2 =3D=3D "TASK_CANARY") print $$3;}' $(objtree)/include/generated/=
asm-offsets.h))
> + 	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls -mstack-protec=
tor-guard-reg=3Dr2 \
>  -				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK=
_CANARY") print $$3;}' include/generated/asm-offsets.h))
> ++				-mstack-protector-guard-offset=3D$(shell awk '{if ($$2 =3D=3D "TASK=
_CANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
>   endif
>   endif
>  =20

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dY9MbLJdb98co5AuDAiy8S5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdDt4EACgkQAVBC80lX
0GxIRgf/ZYcl6Eoilt3oUwtsfmVx4S5ZuRc/BGXxz+C7amLovrnnvKd2soqIYk8d
+iluP6iZPEAxqkoYSWwMoCqBrO+OLlQi/TY2S0f9Ig7M7TqcZG0qR+43FohW62hN
usbJEFKHp1T+Oc3LCdxQArk9aAZJ0BI/vdypwRvZ+d+fQ+u2OLMNFmKJ6HOlNfL5
bLdD2kMhRR85pIGcHMqfuDvb2aiePB0IKmilp4iRZkj3AEddl3+ArIoyCiKjqt3/
XKSmoCBIXejzOq573z2PiKoJBEtRsSTJK2Nf1Vo9tffmzYcNaQfUbmdDj2nG1B8H
nvRg6C76jMaRfB/NHco2+2++nLjncg==
=Bz4k
-----END PGP SIGNATURE-----

--Sig_/dY9MbLJdb98co5AuDAiy8S5--

