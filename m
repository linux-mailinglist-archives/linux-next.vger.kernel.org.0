Return-Path: <linux-next+bounces-9292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01CC99AF6
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 01:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523563A35E1
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 00:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FD317DFE7;
	Tue,  2 Dec 2025 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lvXf+DuF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB87261C;
	Tue,  2 Dec 2025 00:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764637129; cv=none; b=Jwhl9UTTRSf8wNCpViM1AUc5qk5M+sHRsXqWL+SHYpTfpYAkToD3COZcwN8K5eLK149n8hnvvFPpYoX35wKXnkTdOxsdEPzQWZoM7XHrvm2yQC2IyTryLUxqtUM3QvawxWNfGpgfOuM+HSDnxc4VF80Z5iW3dF85DDnZtV8iFwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764637129; c=relaxed/simple;
	bh=6xouRQZnPlHtlM3n4lIhGQfH9AKdi6VO2oJ5Rbi/4Es=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INythZKD/CG1WnxwH5ItbJ9HoFs80MztU5oykDd7MQmWVVxnS8ESsaKpFD0fAWOXEyd4tVlGZnHdAUFiykZg6nr4lIgLalcsrXRm+cg3A6ADGPTrLgO9qu82P3nEjyt3U5N8HOUKpFLl2/1WGgVl12Uqk71o4qCNpQXTtaMrr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lvXf+DuF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764637121;
	bh=BAJL+ADUCH8ugpwnwavqzoDobowwfyKvyUB9qZtqcTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lvXf+DuFdNcZL2vRlxrSoLx9yAnBUJfHNdExxTcxJHlD9neGWO/tFch3/DZ9Tq2jX
	 D4OuW34YWgTp1DYgbJSeuIyPxgCJxnMq3SseT+zT59F8JLkeA2xkdgL20q1C/S7Dsu
	 60jxl2ytNd39pqgSW/KMIRV6DtH879dRhT47eW0XvBluH7zd/d+YDl6uVMtmql0tYl
	 nJYcabWVCEC38gCuShYMSzdSw/5MuTDUmbo1fmGXr9cjKxT00FGBVn7jzD+Uk46aGG
	 AodQRfKsWHjh7SOtGE9uPXEviApd/k7SMdCt8JEFWeYrSohTKSMvTkeHBDHWZZq+Wa
	 vd/sR6tFc8YGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dL2T736kxz4wD0;
	Tue, 02 Dec 2025 11:58:35 +1100 (AEDT)
Date: Tue, 2 Dec 2025 11:58:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>,
 Filipe Manana <fdmanana@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20251202115834.19758b9f@canb.auug.org.au>
In-Reply-To: <20251103085832.5d7ff280@canb.auug.org.au>
References: <20251103085832.5d7ff280@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wG1140YWhoBFSDtQf0j9VOo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wG1140YWhoBFSDtQf0j9VOo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Nov 2025 08:58:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/btrfs/file.c
>=20
> between commit:
>=20
>   ede21a086a16 ("btrfs: use end_pos variable where needed in btrfs_dirty_=
folio()")
>=20
> from the btrfs tree and commit:
>=20
>   48f3784b17d9 ("btrfs: Use folio_next_pos()")
>=20
> from the vfs-brauner tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/btrfs/file.c
> index 1e0ff3d7210d,977931cfa71e..000000000000
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@@ -86,9 -86,11 +86,9 @@@ int btrfs_dirty_folio(struct btrfs_inod
>   		extra_bits |=3D EXTENT_NORESERVE;
>  =20
>   	start_pos =3D round_down(pos, fs_info->sectorsize);
>  -	num_bytes =3D round_up(write_bytes + pos - start_pos,
>  -			     fs_info->sectorsize);
>  +	num_bytes =3D round_up(end_pos - start_pos, fs_info->sectorsize);
>   	ASSERT(num_bytes <=3D U32_MAX);
> - 	ASSERT(folio_pos(folio) <=3D pos && folio_end(folio) >=3D end_pos);
>  -	ASSERT(folio_pos(folio) <=3D pos &&
>  -	       folio_next_pos(folio) >=3D pos + write_bytes);
> ++	ASSERT(folio_pos(folio) <=3D pos && folio_next_pos(folio) >=3D end_pos=
);
>  =20
>   	end_of_last_block =3D start_pos + num_bytes - 1;
>  =20

This is now a conflict between the btrfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wG1140YWhoBFSDtQf0j9VOo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkuOboACgkQAVBC80lX
0GwFmwf/R2uqfb5Ro/70XddqCj7MWaq/rRq/Ix+eVFcDKDcZz/3cnRZYgQBmF5ba
648O6yJx+282S36wEkypnvktrnojBvF9gr62qRm4Ru/JOKHgfjcAm3MpbHtiyp4R
Qwcdig5O5jeXSrwJvChJklFtFs+LnGon52JPtZZc8m1UjVMKKrbu5EHsHxUbPbJy
ArXqKW69ra62fbCVso3p+mH5dEzTxMApSzzyrxAZOKHbCaw6KN5EL1VIJLA/AdTa
08f5q0E3X+1EN94B6oBJ6oXlQauwsBUMQqZ+ztMdvezgfPLZbmRD5Dj9/mXb41AC
59JxwnicOgeUj/whH5uOIAWf6yr2nQ==
=4Mf3
-----END PGP SIGNATURE-----

--Sig_/wG1140YWhoBFSDtQf0j9VOo--

