Return-Path: <linux-next+bounces-5714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23337A5B685
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 03:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C38A83A3572
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 02:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6AC1DE3BA;
	Tue, 11 Mar 2025 02:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fNPJBRQU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A83FD1;
	Tue, 11 Mar 2025 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659140; cv=none; b=a3uKVEGraAQKSuEitdUhEKyRFIBEu49zqQ39ttqbHHdKVukdEsaE/a8qTWyeP7asfkGBRIHHqPromiHC+gMGnd3gXnU477fuY6JFwrI0CAWfByaEXTBJQCu/a4SXzYiHXXWy1WdYRwQapoZMhQBDCdVsQ1dl2YIpBk9HK4OUkyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659140; c=relaxed/simple;
	bh=9BewszbnyKceG31QbpOA8h948LA+GGo/buud95D3c/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3MRq1M1J2wKjA0sZVK9T/vb7aPkXY5EOcFaA8pR8Sv8cO1LWa8o38DSEdPcfLFpZ8LzwCHM35HML4Yoh+YuOJDe2o9gcs9vZxFd1DoJ/wzVJ3cyB4YBRDRhUxYx4Anb/6mAXThyJV2tP36oZqAXcAlY97Y05vzIP4oOXBvYIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fNPJBRQU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741659135;
	bh=sPRc+SLGGmBsjVapsNsec//vcORc+A/EDQ02Tjp9hxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fNPJBRQUlWyQoZ4l+yuMk9PjEFga7EpUUJBxPHBvL/78UNUd5LK9ekyvB0VfzcNbX
	 8kRos6qJs5Fjh8LdO1KnzQCq5XHhg+v3Cu9q6LRv0TxoTHHlQUX6g+r8Mbg7pC/xpP
	 I0AGq+wOL2qBzOUdyt3UHC8zkIxtoMZbO7+bhy/F1p3BYGyw3iSSrEeMMF6mqFnwZB
	 ZCpsM6U7WQJ0zdnz/IF9v78uRkO/9tsWcNFLRA7HNRhdFdc3F7bNHvguKTYuh4qo9C
	 INEq465rvxTzR+io+c4V2G5PgDbqRTOuL2gq4ilIypqLGcOcDQXtKboS72TlqFbmNA
	 WZZ2wCuXZVUTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBchv00qfz4wcw;
	Tue, 11 Mar 2025 13:12:14 +1100 (AEDT)
Date: Tue, 11 Mar 2025 13:12:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <20250311131214.530934a4@canb.auug.org.au>
In-Reply-To: <20250307122954.1ab65809@canb.auug.org.au>
References: <20250307122954.1ab65809@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//FZSXrmCnoUDnIwitfLYCfG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//FZSXrmCnoUDnIwitfLYCfG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Mar 2025 12:29:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
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

This is now conflict between the mm tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//FZSXrmCnoUDnIwitfLYCfG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPm/4ACgkQAVBC80lX
0GwWgwf/dqiOYAQOJABrMGZlP96+Re5v5AI0/oZmQI8+MQRGYeeXMNCjKfQiMaTb
zvZ12zDkJ3vfTd4aNBcO8uGO+rxiq9vH1w4vCyGhq+IHGITnDwos5pxLegtaUI/p
69kuQNxO+iQL41EBii0t7w+tEUj0UEkUyfwi1zyPlPaunLtDVpEL05t2n8aD9A0O
NKYrvND55PlC2OMncDvOwhy3B66KtUgFB3EyG1UdWYIPwlcwg3qiI1XBumb1pWFX
/MihC/1QVJbzim3rbNmljyQM8GhBaz++2D7lf6LInAnVRwavcPHZoi0kKep12oYn
vev33M8do2498+8JyrckThlnZnqxqQ==
=Zw5K
-----END PGP SIGNATURE-----

--Sig_//FZSXrmCnoUDnIwitfLYCfG--

