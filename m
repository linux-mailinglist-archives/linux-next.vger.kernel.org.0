Return-Path: <linux-next+bounces-9343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56625CA5AA8
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 00:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8B2F3024AD6
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 23:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A902E06EA;
	Thu,  4 Dec 2025 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Jgco/Dr4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF93315D44;
	Thu,  4 Dec 2025 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764889215; cv=none; b=EPZbQxLuJRhuLgsluBhMbNB7ubxnUhiPn2jQPUlIrztAT2kRZgib57I1HyJpR+JF8JeKshTpEPo/N7bq3UfWi9g3xfhZX8hhAQmruSBG4lh/UgfthJDqy3j4wkK+FAtoO2MflT5YJrgOLvUe6P0tkbA9Jac0cFjROh1gSWlOEuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764889215; c=relaxed/simple;
	bh=y27ykz+Bhew4Yh++nU/eufwmElDBc82E5a0JM+lIx7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tzmxmoKolRrC8rRcW5mSJxneLvFJpt+stxXrobS2olWkgirJdGHU9qP41Hq75NswrcTIAXqFiI6+f4P8qrM8I+n8+jPE9yC4xI3VbYC2XlUwkcm1Br/le5wQI+2qbg2pqvBMN5677uEuij/I7ILsBTNVE3BtU4S1OV4w44Ed8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Jgco/Dr4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764889208;
	bh=GAvKUxskdYfFuE39PIIJ2ZmleRkeMkjPYHnXd+3KcKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jgco/Dr4qB4Ep6nzc2DNBE20sUA0gf5SPqOVTCy3CsAvjKvKgoaqT8LYA13Z8/hUE
	 r2oXBogF+HC6ohYUOoiVRksTc/T9QDcBHNS4c55ngbSHV4xnLN+ykrQ7Q1aDbpbs5s
	 djoA/kQlDQibgTccFcIrcm9JEDoRpoDJAelFqeeskOudLpdOqfFY+ZRzrUJonluM4c
	 sjYCpTNmyVG4OmGlOVV3o1pAMXYq7QXr/9OJOkLQrDxSQC9SZ4qaPf3sJXqltosA2h
	 ZjjJ0bFdMumBVE46jLr1SKOS5Glu0YKkGDHmzCSHe02u/rDNBXMKbMXiOX8w8O9nnj
	 W1jejRB/+V/Cw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMqj40QJHz4wGr;
	Fri, 05 Dec 2025 10:00:08 +1100 (AEDT)
Date: Fri, 5 Dec 2025 10:00:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Usama Arif <usamaarif642@gmail.com>
Subject: Re: linux-next: manual merge of the memblock tree with the
 mm-nonmm-stable tree
Message-ID: <20251205100007.734b0089@canb.auug.org.au>
In-Reply-To: <20251201123722.19e5f034@canb.auug.org.au>
References: <20251201123722.19e5f034@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oc2LjjyktsPAQMVJFGyzyD2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Oc2LjjyktsPAQMVJFGyzyD2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Dec 2025 12:37:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the memblock tree got a conflict in:
>=20
>   kernel/Kconfig.kexec
>=20
> between commit:
>=20
>   48a1b2321d76 ("liveupdate: kho: move to kernel/liveupdate")
>=20
> from the mm-nonmm-stable tree and commit:
>=20
>   ab65699f9add ("memblock: remove CONFIG_MEMBLOCK_KHO_SCRATCH option")
>=20
> from the memblock tree.
>=20
> I fixed it up (I used the former version of the above file and then
> added the following merge resolution patch) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 1 Dec 2025 12:33:52 +1100
> Subject: [PATCH] fix for "memblock: remove CONFIG_MEMBLOCK_KHO_SCRATCH op=
tion"
>=20
> interacting with commit
>=20
>   48a1b2321d76 ("liveupdate: kho: move to kernel/liveupdate")
>=20
> from the mm-nonmm-stable tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/liveupdate/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
> index 9b2515f31afb..86a58eaf433a 100644
> --- a/kernel/liveupdate/Kconfig
> +++ b/kernel/liveupdate/Kconfig
> @@ -7,7 +7,6 @@ config KEXEC_HANDOVER
>  	bool "kexec handover"
>  	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
>  	depends on !DEFERRED_STRUCT_PAGE_INIT
> -	select MEMBLOCK_KHO_SCRATCH
>  	select KEXEC_FILE
>  	select LIBFDT
>  	select CMA
> --=20
> 2.52.0

It appears that the above memblock tree commit has been removed from
the memblock tree, so this resolution is not longer needed.

--=20
Cheers,
Stephen Rothwell

--Sig_/Oc2LjjyktsPAQMVJFGyzyD2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyEncACgkQAVBC80lX
0Gxorwf/ad/8lXfAGmWq2ZbYkQJaSrveGX49l+Y57RK64J/qDLMmV826gvLoPSh9
jyBitkQdF6e8OgSglbjA774iHTgAXQu6Z3QQDMeuLELbbUGTE5NydezgnHQquiKV
M8/IqlowSvxkEiVgy1hGxgdwm113pupXZ4in0Pts/xwc3YlBHdAzPpvIBaCJMfw4
tZ1L8YmEyZg7dcxBtxck445IdJR/I2xU83lNhXVq6/Yo64Cl22E6KmbgTSyd+wh5
joyo7yuLWgN6M6Alp+tKhwhf8ZWwIXznYD5xocaJi/HLSiSMYzGRDejF9HFIG5J6
jIEMZS5GyEUQKacBOj/u2u+zas2GXA==
=gtJx
-----END PGP SIGNATURE-----

--Sig_/Oc2LjjyktsPAQMVJFGyzyD2--

