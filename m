Return-Path: <linux-next+bounces-4829-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08F9D5677
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 00:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DD68B24346
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2024 23:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3601B1CBEB9;
	Thu, 21 Nov 2024 23:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U0LwXR63"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BC519F410;
	Thu, 21 Nov 2024 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732233388; cv=none; b=Hgj/5vqU0gE7lyLbGXrvFzkwZQXXMhlNnVLo7kZepbQr3vy0DwFCUhOBjMO2+sVJRBtwE5g7e87/Gq0wlC8zDIyBJa7S4SjI2jOgyAVdTiOq5xTm30rY/rNiqPS9S1J6aix7hWJaPtWXYwZK3oCRNxd7pJOIUbnwu0FIp/dEeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732233388; c=relaxed/simple;
	bh=JTX8rK0tDIOsQhXvdAlefynAbFr2c/KG/cTKbiC6vJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovkJD5RvjW4w5ie/SixD90o02773wmkV5AlBWWNjcH/FWw9WUMex1Eo5d87l6QDho8JXxeZhxPLAiogqabbiAzreMFj/QcIrCahbgAuCm2NqSxKdWh9eZ0d04/snKiq6WvaRMf+y51uNzwvG21znxXrFQjyPRdVbNHoxalPtyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U0LwXR63; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732233370;
	bh=gteJz45hcbxUpnJwPsrCXaOeQ2wAJnZjTsciHCiDRqs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U0LwXR63OILDwz+7nFDueZ2qDtKa1ALEu87dhuKpgGZjHoB7MVqBvXGeBpTfCNqFG
	 FFmFJL2gHkSpMSwr57v/cA8NqfPzv8UEmSP74v8CQCeH0D1vnNemNDanB2CbAkldWU
	 gBBW7Rm6/EPLsYkuJMYOhCtUH0xqLLxqCcIxK1a3StzTfI/PUrAGgeGPHxF3xfeLV/
	 dMWliVTBp/AbU6nte0LE7utU2oagggzPkbzrmh/4shyY1Ouir7w5RXZBcPH0hvY2mh
	 fjfbYAXfWNPtkfKd3hKbCREESBO8dhklyE3Vxi3+4SJs531nXR/W3CnnjVJiZcRulI
	 GMZruZdILrc5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XvZr93cmCz4wcy;
	Fri, 22 Nov 2024 10:56:09 +1100 (AEDT)
Date: Fri, 22 Nov 2024 10:56:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Julian Vetter <jvetter@kalrayinc.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the asm-generic tree with the mm
 tree
Message-ID: <20241122105611.38d8607e@canb.auug.org.au>
In-Reply-To: <20241029095525.0fba9d23@canb.auug.org.au>
References: <20241029095525.0fba9d23@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E92lv+vJFk=+jTPtDxaFBhK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E92lv+vJFk=+jTPtDxaFBhK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 Oct 2024 09:55:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the asm-generic tree got a conflict in:
>=20
>   lib/Makefile
>=20
> between commit:
>=20
>   2ff14c29323d ("lib/Makefile: make union-find compilation conditional on=
 CONFIG_CPUSETS")
>=20
> from the mm tree and commit:
>=20
>   b660d0a2acb9 ("New implementation for IO memcpy and IO memset")
>=20
> from the asm-generic tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc lib/Makefile
> index 1eb89962daef,db4717538fad..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -35,12 -35,10 +35,12 @@@ lib-y :=3D ctype.o string.o vsprintf.o cm
>   	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
>   	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
>   	 nmi_backtrace.o win_minmax.o memcat_p.o \
> - 	 buildid.o objpool.o
>  -	 buildid.o objpool.o union_find.o iomem_copy.o
> ++	 buildid.o objpool.o iomem_copy.o
>  =20
>  +lib-$(CONFIG_UNION_FIND) +=3D union_find.o
>   lib-$(CONFIG_PRINTK) +=3D dump_stack.o
>   lib-$(CONFIG_SMP) +=3D cpumask.o
>  +lib-$(CONFIG_MIN_HEAP) +=3D min_heap.o
>  =20
>   lib-y	+=3D kobject.o klist.o
>   obj-y	+=3D lockref.o

This is now a conflict between the mm-non-mm stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/E92lv+vJFk=+jTPtDxaFBhK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc/yJsACgkQAVBC80lX
0GzhQAf+O5+PCBdLiRWEh6LhpQrH4Z3Uz/7LjG6kHOX34BCy3DzjhYqYkmJQrAAK
QjmZ5eusApOglnT/kxbdZp/esm+Q/nrufwRoCi4JYQRktURUJuza42LS3bGaRC4y
vtxQVoR+GssgiPNt248e9FXiTW6ApnsbAA1lp/sjdpDo6RAqepufG8vo2u0TBLoF
NWTSmgeQH5PSTA067v6JAysWwNctQ9QEVjKgFIqPUY5Z3bKgrfSrHy5qT8b6PIzj
4q9oWn7x/WdmoXBhXBH3jtEt366sWMrQ4k8b87lkE0O9LabW7DSdLZMEUVXdIFjf
/j6MWL+yEOsdleMO0A+WIKTYu0ddpA==
=ZEmi
-----END PGP SIGNATURE-----

--Sig_/E92lv+vJFk=+jTPtDxaFBhK--

