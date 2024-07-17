Return-Path: <linux-next+bounces-3053-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 469969336C5
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 08:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02070283458
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 06:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD2E11CA1;
	Wed, 17 Jul 2024 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EnkJrJUL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77D117997;
	Wed, 17 Jul 2024 06:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197201; cv=none; b=eOmdRuvcQKJIieAAD64nK0PO7TXUmQwEJ1Y2khxHSUWIna1IYsa14uSCyTaN0Os8w+5ScQhlR0qM2Ug580TAAwGsdCU6WKcybUHr7FA9swc33hS7luv162obZegQYEIo5kp/eAENkAisQpPJuH2Y0s3Eqwvza9qXDlEK/PCLzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197201; c=relaxed/simple;
	bh=Zv7me/dhmNwVa0EWGTIEKotNgKNQUhTpmUPyej9vY1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lb1R2i8npbw8ADLOvzpZpQHAB2c3KV2m6UvSM9y+H+XiUuuhHKPcgjqR54fyNlLcWGFusHvcNJ3MFF82q2S9I4DYQjj6xi7lCTA36dtP7FeocFil+1Dut1Fb8ELBayF7stZk23JCbQqzq2WFVKU3ntiEc+oAhLbspJYnjUgm14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EnkJrJUL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721197195;
	bh=M3tSIjcmh7g/IM3TEvPm5kACdNWJvZr4ZQQWw4tj0Kc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EnkJrJUL9vmI/Mc6mL/mCdoxbDEa0dZ8/wSKZ+s6o3v2oV7qgyMan4wj5Z/tNClxA
	 IitYMAXzZCsN6W8QRy6k1f6Pe3+uNwhCp+wlZeLqgesrYtcDfDb4AE5le0Xt4+kFLv
	 bQxGfExNQa0A4zUVCBi+xW5iPw18CklRvLxH5NBotonFNLQwl7ReBTwxG4LjURn/HJ
	 Afzjw7BY+krT9PEPA/tBveZNkqZvUwQSAUo6glfnjDkRuyk44Fe66pMSzHQaV+pUz0
	 j64awjKIfa6aQUPTcdVBfVHe6oo4QaXeAE8lCvlpyr6Y15tH0Rw42vgk9zoHE1/kXk
	 9WeDXDVm2d/Wg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WP5Q32hyyz4w2S;
	Wed, 17 Jul 2024 16:19:54 +1000 (AEST)
Date: Wed, 17 Jul 2024 16:19:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the loongarch tree with the
 asm-generic tree
Message-ID: <20240717161951.01e4737d@canb.auug.org.au>
In-Reply-To: <20240709100154.0b4b1372@canb.auug.org.au>
References: <20240709100154.0b4b1372@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gHwLOmNioCdigJhn9+oy0YW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gHwLOmNioCdigJhn9+oy0YW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 10:01:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the loongarch tree got a conflict in:
>=20
>   arch/loongarch/include/uapi/asm/unistd.h
>=20
> between commits:
>=20
>   13aa27ce8de0 ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
>   1d7b98ec5d78 ("loongarch: convert to generic syscall table")
>=20
> from the asm-generic tree and commit:
>=20
>   a5d43e6d87c0 ("LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h")
>=20
> from the loongarch tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/loongarch/include/uapi/asm/unistd.h
> index 1f01980f9c94,b344b1f91715..000000000000
> --- a/arch/loongarch/include/uapi/asm/unistd.h
> +++ b/arch/loongarch/include/uapi/asm/unistd.h
> @@@ -1,3 -1,6 +1,4 @@@
>   /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> + #define __ARCH_WANT_NEW_STAT
>  -#define __ARCH_WANT_SYS_CLONE
>  -#define __ARCH_WANT_SYS_CLONE3
>  =20
>  -#include <asm-generic/unistd.h>
>  +#include <asm/unistd_64.h>

This is now a conflict between the loongarch tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gHwLOmNioCdigJhn9+oy0YW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaXYocACgkQAVBC80lX
0GybIggAg2UbraYP86Rp21D68x6f1xsAy98VJOrKTPRfLmZz+z0r2QxOjphLLgH+
u5sdha9rDGAok5jPFvRS5Ncd7wkR8kKoC4IQe1vyXSUqT2+hZYZDFnMcwqErwuqT
pnOEiA6alCJ/Ti+4b4rITy+ErOsnxYoqBsxMSvIIIQdtY5CzacRiAJcdAS4ecZ2L
T3wLx91TXfZ2Kjc8F3rDU3ar1745oO+Hhf5H1N5yxz1IcucfG8huOLrsjbKrFdJw
HdlAH1S11EPX3PX3NJFIJBibapRtkSx/pQrunW/kdkSPoEaXXfCKbKuQn95aFhDT
qxALREGe/tqHpgtMxTQLes5wKOrcZw==
=53GI
-----END PGP SIGNATURE-----

--Sig_/gHwLOmNioCdigJhn9+oy0YW--

