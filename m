Return-Path: <linux-next+bounces-6093-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A62A75D53
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 01:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB5A61686F7
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 23:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B0C19DF52;
	Sun, 30 Mar 2025 23:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="glndaPKs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5222B2CF;
	Sun, 30 Mar 2025 23:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743377176; cv=none; b=LhhX+o/5i/6JwzQCHCG0f9wEEQuUHohsA4GqBAXx+SQ2TXLH9nYvE/E2KpqqnLdCpDRUOmMUYZTytz3XtD093vA3WxRkC7G9hzVhLWchGt9UC5HDCktP0IIaO+d3+XEupOOADrPh/8pUliLawYZ9W9ItVq8/FL/6eJCtvZe17EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743377176; c=relaxed/simple;
	bh=50R0c1VgnieIawkqrv9JYgmqOXl1hC5B90Q4YUpB+sU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWE9woERHB2FrH05u4S87/QTiuHeDdi9gpjeBXYC+24A7wPcjppT4esyNQqkdPaRUxDbbXJBVAaMs8P+XHrVZkX/CENL0xxghkj58GJJ9U9xoA3mwtl/oQCcwQvj1tWNqEzT2DKZOulWuyDORHeasM/OVDKPZuc/W9m3fGJv8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=glndaPKs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743377172;
	bh=dzWqQDMsVbKcM6Kea1OPZ2gEKOfMd1pt8Yvj0Yve6hw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=glndaPKs2auJ8IM1hTYZSOFrjPau6+OUaCA+IY1YUKuF6hpLc50KDqzeaklUkVDDf
	 E9k4JICtRJMxsQOmJLKKAbddvlDkJi6D4l7IC2BxubBXHUSys8pc0lDHDrCyRsyXac
	 46nd85M2j2bWm6sJiMQJ5QeY6IWpynUPvM1v2nJPkjZDt3heOA72r+nFxfq+wGCVfc
	 a0HB47BanX6Rw0z/lSIHmbkinErT+2+VfxRTo1/cTJgFKD5Lr5hZCqoMF3Z6+7lDmT
	 eTrwRSv7YA7xlo/FEkr5/oDI/7zTUgLEeL+Hn0EjhWbYcuFjD+P4d/iyrOV/KtPWtN
	 KXLcS82oxUIkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQr433yHdz4wnp;
	Mon, 31 Mar 2025 10:26:11 +1100 (AEDT)
Date: Mon, 31 Mar 2025 10:26:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <20250331102610.24f7cba4@canb.auug.org.au>
In-Reply-To: <20250307122954.1ab65809@canb.auug.org.au>
References: <20250307122954.1ab65809@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uEU_ZKYLPjEx++eyFKHewdg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uEU_ZKYLPjEx++eyFKHewdg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Mar 2025 12:29:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the drm-xe tree got a conflict in:
>=20
>   mm/memory.c
>=20
> between commit:
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
>=20
> from the drm-xe tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc mm/memory.c
> index d21f6cded7e3,59b804f4bf3f..000000000000
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@@ -4473,11 -4348,15 +4473,16 @@@ vm_fault_t do_swap_page(struct vm_faul
>   			 * Get a page reference while we know the page can't be
>   			 * freed.
>   			 */
> - 			get_page(vmf->page);
> - 			pte_unmap_unlock(vmf->pte, vmf->ptl);
> - 			pgmap =3D page_pgmap(vmf->page);
> - 			ret =3D pgmap->ops->migrate_to_ram(vmf);
> - 			put_page(vmf->page);
> + 			if (trylock_page(vmf->page)) {
> + 				get_page(vmf->page);
> + 				pte_unmap_unlock(vmf->pte, vmf->ptl);
>  -				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> ++				pgmap =3D page_pgmap(vmf->page);
> ++				ret =3D pgmap->ops->migrate_to_ram(vmf);
> + 				unlock_page(vmf->page);
> + 				put_page(vmf->page);
> + 			} else {
> + 				pte_unmap_unlock(vmf->pte, vmf->ptl);
> + 			}
>   		} else if (is_hwpoison_entry(entry)) {
>   			ret =3D VM_FAULT_HWPOISON;
>   		} else if (is_pte_marker_entry(entry)) {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uEU_ZKYLPjEx++eyFKHewdg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfp0xIACgkQAVBC80lX
0GwBiAgAizDOKF19YZ2wzZJSfu00GpNC4vZW3qwfRrUwP9TZXcQggKitsovxTC7E
So0aEKLi2AajtpQAS8YO/7hda+LS5VHUgg6QOT16tDYF61wBORPXLKeevFUDtNBY
ALBvZRykGnIoQmEYTBy3CEztdF4Jjo2fItQamNMpN+5tsQpOs2Lx5RNkvqLdyxaM
H+dDx1L258+IISW4Ze57nv8xivqefwjSvxcgRoqz/vBZsOJv/Q9XdPPEg9EgUTn0
pgAocApjnQV+R8cK0GpcgGH8iL8Zrpx4/cryqubIDAKp54Kn3GhlvAtvJsX+6SFc
V0qncwrocpZwhOfE6C+Q6D/HPyqTyw==
=aNkb
-----END PGP SIGNATURE-----

--Sig_/uEU_ZKYLPjEx++eyFKHewdg--

