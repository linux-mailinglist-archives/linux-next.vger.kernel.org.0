Return-Path: <linux-next+bounces-6051-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD250A7418A
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 00:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97909189EC6A
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 23:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0083A1ACEB7;
	Thu, 27 Mar 2025 23:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dVKhaxZ+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F2A18DB0D;
	Thu, 27 Mar 2025 23:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743118685; cv=none; b=AY6SXeUJhaeQh3pOsNO6/17vxOuB/MkqE9O6o5T4hsUZpV5mYwDVsQZUyEt6F0bWOOocCZigXPm+BvANzXTiZq4mVxF8WaSPznbZfCXcx6xyojVBU8j3nr+TFAbdfQOAst35abfG/uVqUGy7ddrJUXaQ8EF+Sjk5ahKba6d0lio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743118685; c=relaxed/simple;
	bh=ixzldZ6nSlBWZ7nF1bIkBZSVn2GvHpUgm4BGiu98QUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rav90HZDRvgshNXBEcz3kE1dKYjLKLHq1GIKlKKDvA2I28PP05X7vE7GeIfJ6NN30FsHIOH5cUZ8YmXDWeHXoAnLvzrKsJS7CwUZslh4sVVU0697Nm9SVrsvdi8Pk9/keIUl7PmIP+4usHThBYdpVBO32OKxkGa/kDiwHwM2rUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dVKhaxZ+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743118673;
	bh=G2bJnnCE/3+WjVRvXwOPIxpJSj3Sdd/OAjqtkEAvbpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dVKhaxZ+oSSiofkU71tww+Xg373HTFRXathYciYg81UyjH9r/m7ob3WWTHH1rfMzh
	 ZBh71qjjS8ylToy1Uh95HSaytHslIc7v5rviVgmWnSbc18Q4FX/MKYu1Ga3/AjGPW5
	 Usf/nH1qFW2JGs3xcLSp2mxyoZTN3/0+QxjiNG+JcbNT7wGyBTzVEMUZasL7FQ2ykn
	 vPQTOvKYGN7VOTe/BRSGM7V8Q5/ygmOV1PRfQmKExkNRP2do1kBU3KoZmn5tUSxN8v
	 IiU4SlyQER/2z+u37qbnzC1zSfltuNu2Y/sRGd2wJquWdlmppu1vceiPzzQghswT9o
	 o6m3GkOcIkcvw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZP0Sw6Rr9z4wyh;
	Fri, 28 Mar 2025 10:37:52 +1100 (AEDT)
Date: Fri, 28 Mar 2025 10:37:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Kaixiong Yu <yukaixiong@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the mm tree
Message-ID: <20250328103752.114dc1d8@canb.auug.org.au>
In-Reply-To: <20250311202126.1150e018@canb.auug.org.au>
References: <20250311202126.1150e018@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mah8gxos1FA.4Nu4WnU51FV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Mah8gxos1FA.4Nu4WnU51FV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 11 Mar 2025 20:21:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sysctl tree got a conflict in:
>=20
>   include/linux/mm.h
>=20
> between commit:
>=20
>   61316cdc1915 ("arch, mm: introduce arch_mm_preinit")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   73aa354af21d ("mm: filemap: move sysctl to mm/filemap.c")
>=20
> from the sysctl tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc include/linux/mm.h
> index 4d32053c3d19,f5ba3ed8b44a..000000000000
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@@ -41,9 -40,6 +41,7 @@@ struct user_struct
>   struct pt_regs;
>   struct folio_batch;
>  =20
> - extern int sysctl_page_lock_unfairness;
> -=20
>  +void arch_mm_preinit(void);
>   void mm_core_init(void);
>   void init_mm_internals(void);
>  =20

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Mah8gxos1FA.4Nu4WnU51FV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfl4VAACgkQAVBC80lX
0GxEKwf/XTXEI9Xn/OpvfBLhRijQXT8uy02/Wb4MrVhYmiQbsGCs6J8fDUah1HQj
0OYquEX1Sfxceis8oU3dytGkYQIBkC8TPbJCKWbSc+Kdo+eI2EUkoooqGmecQn4A
/JoOAGc51aboWIzYnHSyOmv1+aym8r0YcOH6KgbjflXkytwqouCM8U3jqoOasp7c
tMqccBpNPCwWi/YypRVs/31BhE5EKnmspkDDHJe1EfDx1x40xiXBDn8l8Wp+QIVa
ZVzS9oHOKLgBm7HtsXEBYAA+vxMFI3pboT3VAuwd9mLPl/knT0NtSYQFjETk80Dc
eojCRyWfq7EI2wXViyr2CYUGcR9yBg==
=ytiv
-----END PGP SIGNATURE-----

--Sig_/Mah8gxos1FA.4Nu4WnU51FV--

