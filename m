Return-Path: <linux-next+bounces-9321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62952CA224A
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 03:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA2533024369
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 02:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA92720ADD6;
	Thu,  4 Dec 2025 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tXwlutx0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD831E2614;
	Thu,  4 Dec 2025 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764813998; cv=none; b=X+UjEIOmy9yOH+j5ASjX+EsA8AHJG5CvfSYYMmhfH6VJAlV5YcuBpAG+bVCp41UBrXkN7EWp+elnXxt5U7mUiYcSIzcyjIrMBLO02VhtOIjNXHX8lJ5/bPIhL/MX5s+LRhkuEYZO3ILpOp9Jaoy3FwEb2JCI9wh7swz3O7/N1h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764813998; c=relaxed/simple;
	bh=k2yPGe7IVIhF4s5d8rzu7ic+UwrxSDLaGpprga4SAls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdTscwC+eWBTLhADdov8Vq78JrzW4urLbwMc/gNGnqi7T3WwvaievMKHkzZQl+HIzsivnengxO1TndTiElmqoSGZDsaC4N/8sHjhNmqsOK6dyrpOj40yV9XaOohtaAjqKkdtS2HmBQoNfXRY1Q2bmSNvNYiE2K84KwGHKYN1xXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tXwlutx0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764813994;
	bh=6GEjBVoGG2IMRgYyevpdzqWZU6LsOqM8P1diyYl3BD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tXwlutx01ryuNc56/otgftRdPJUkqkfde/VpZEvLKSGCbLqdne1rpPKAO5oVBJEHp
	 KJBWPnk7rkkVjNW6cGcdL7kpRykuUs4KNYkhaZb49hjk0p7lAoiCcM8QFyoAv3bJ6C
	 0y34to6HFnuYhdskz/+HJaHPShy+pjAb25q25OeARHomXnR3lO/DUbVS6XTj2QC192
	 f1gXo9GbFnrCabUvSTLGgIkp9ytQIyqOmQCn3rsxQm+Nh9Kd/FHKPED3P+W8tsHWYt
	 aLiZyHX7VAFmiCHQWc6h9GfnoOYxcjCY2kN2uSw58AEWUZHtyL7uUYFsUEuCqSAGMx
	 alyV/YYhkN1fw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMHtc4GWSz4wD3;
	Thu, 04 Dec 2025 13:06:32 +1100 (AEDT)
Date: Thu, 4 Dec 2025 13:06:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Israel Batista
 <linux@israelbatista.dev.br>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sumanth Korikkar <sumanthk@linux.ibm.com>
Subject: Re: linux-next: manual merge of the s390 tree with the mm-unstable
 tree
Message-ID: <20251204130632.379edc9b@canb.auug.org.au>
In-Reply-To: <20251103100750.4522060e@canb.auug.org.au>
References: <20251103100750.4522060e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i6p/VcdI8_+jxJh06F/aBcy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i6p/VcdI8_+jxJh06F/aBcy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Nov 2025 10:07:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the s390 tree got a conflict in:
>=20
>   include/linux/memory.h
>=20
> between commit:
>=20
>   074be77d684a ("mm: convert memory block states (MEM_*) macros to enum")
>=20
> from the mm-unstable tree and commit:
>=20
>   300709fbefd1 ("mm/memory_hotplug: Remove MEM_PREPARE_ONLINE/MEM_FINISH_=
OFFLINE notifiers")
>=20
> from the s390 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc include/linux/memory.h
> index ca3eb1db6cc8,ba1515160894..000000000000
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@@ -64,21 -64,9 +64,19 @@@ struct memory_group=20
>   	};
>   };
>  =20
>  +enum memory_block_state {
>  +	/* These states are exposed to userspace as text strings in sysfs */
>  +	MEM_ONLINE,		/* exposed to userspace */
>  +	MEM_GOING_OFFLINE,	/* exposed to userspace */
>  +	MEM_OFFLINE,		/* exposed to userspace */
>  +	MEM_GOING_ONLINE,
>  +	MEM_CANCEL_ONLINE,
>  +	MEM_CANCEL_OFFLINE,
> - 	MEM_PREPARE_ONLINE,
> - 	MEM_FINISH_OFFLINE,
>  +};
>  +
>   struct memory_block {
>   	unsigned long start_section_nr;
>  -	unsigned long state;		/* serialized by the dev->lock */
>  +	enum memory_block_state state;	/* serialized by the dev->lock */
>   	int online_type;		/* for passing data to online routine */
>   	int nid;			/* NID for this memory block */
>   	/*
> @@@ -101,14 -89,15 +99,7 @@@ int arch_get_memory_phys_device(unsigne
>   unsigned long memory_block_size_bytes(void);
>   int set_memory_block_size_order(unsigned int order);
>  =20
>  -/* These states are exposed to userspace as text strings in sysfs */
>  -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
>  -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
>  -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
>  -#define	MEM_GOING_ONLINE	(1<<3)
>  -#define	MEM_CANCEL_ONLINE	(1<<4)
>  -#define	MEM_CANCEL_OFFLINE	(1<<5)
>  -
>   struct memory_notify {
> - 	/*
> - 	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
> - 	 * specifying the altmap range and are exclusively intended for use in
> - 	 * MEM_PREPARE_ONLINE/MEM_FINISH_OFFLINE notifiers.
> - 	 */
> - 	unsigned long altmap_start_pfn;
> - 	unsigned long altmap_nr_pages;
>   	unsigned long start_pfn;
>   	unsigned long nr_pages;
>   };

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/i6p/VcdI8_+jxJh06F/aBcy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkw7KgACgkQAVBC80lX
0Gz3nwgAm6fNMHQ2IxDOMr6Wa8rJmZHeLb5o7hRtzxhHqikn+4ANe7i7nhI4Ppfn
Zd6jHOB55ykDlBWqg99NYK2nd+1YQQ7Z84sJ67ML5UAqQVVnW7fi3vUxvx4j6gfT
Qm+VbxBcq/4ubU0EN0QB2I6W32HadjMJfD7wgDjms6/yba2EuziW/phFATI/AuUP
cxghivcULa93mArgUOoQV7LiGigYQkqvawj6VnEp4m8yF9EHO7cx+X0oN6LEkQ13
Pc4A+yYTfxzev2aKxGUHMnUR9dlvcaij6iv3tnHSL0xf060Z//R73c08dN9Kamzc
gEkVTdubJz1ol27NqPQM/w3EB4gwWg==
=P/cx
-----END PGP SIGNATURE-----

--Sig_/i6p/VcdI8_+jxJh06F/aBcy--

