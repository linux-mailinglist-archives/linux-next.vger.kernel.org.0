Return-Path: <linux-next+bounces-7006-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70483ACBD96
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 01:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1CC16443B
	for <lists+linux-next@lfdr.de>; Mon,  2 Jun 2025 23:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BE214A627;
	Mon,  2 Jun 2025 23:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BX3lHaSL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365A46B8;
	Mon,  2 Jun 2025 23:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905355; cv=none; b=TNnu2gerJth5inq0xv2G7Wvi8a3ij3UcmWeud8hi6xQtMgse6WbTBZooQGD39A273vw6I8mWPGxx7jo6SLZAQvDQNNgT1rEjSG1OsAuYSSNsw8Q7UtIerD5kaS5bLXq8ksP0OFHHj5zJYP+kIkoZo/RpNJUV4/tGRMdZSxBAkDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905355; c=relaxed/simple;
	bh=EuU7Nk52QaXjNeRIg8mFrtnjex8rj8W0B73rS4gnfTg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1ZvFogW2iV8F/Twj1cbJ2glXNVDLrVErt0vA78duFOnMn2fFtT2dGreEsioDaqaxTJDBH1NqFPI/Tz8QH9gAV+J5e731UFDKaLcERsYBasJPCIun79V6WdOyRj5Ju9pFUIPux5LFkpzw4zZM9K+2EEx4yslVfpiXDWNyogKA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BX3lHaSL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748905348;
	bh=NNMNvDaAbtHcCJXvJF2SIMbojQ1ZHQxBohSo5UTT5mE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BX3lHaSLZTwF//4Rob/drrCvMX/c7LecvpXGTY8HZR1rQLKPY88E1XnfCGFp4q185
	 3B+Gy+ANfg8GbH2Af8NkHpnmFZa/6UDRGEuqwKzD4DdfCqJNsqO3WYJOldnztPBlMa
	 UMbw0tB+7Jl1MF4a6kiNtkj7MMEhgQCiV3rsN8UAgqKrdYoK+SmimYIg4Nw3VaUQFc
	 jf2sHe0XL+iNZZwJPKrkaTEEKqefvf8Mzu+gWfz3PoAwxtmO6x+8qJbtvmi/CyB1ZY
	 lplxmr6zRO4HTDeiGNbOcSZPgSBcy7qnF8C9YGaokCe5Wj1HF5WCG8ehEg7CfAptvk
	 3LoEWAZkf1QZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bB8W76yRqz4x07;
	Tue,  3 Jun 2025 09:02:27 +1000 (AEST)
Date: Tue, 3 Jun 2025 09:02:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joanne Koong
 <joannelkoong@gmail.com>, Kairui Song <kasong@tencent.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: linux-next: manual merge of the fuse tree with the mm-unstable
 tree
Message-ID: <20250603090226.4bf0162e@canb.auug.org.au>
In-Reply-To: <20250514105313.5e2c367a@canb.auug.org.au>
References: <20250514105313.5e2c367a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fzBhaylT+LmG+8Wi3/v1ZEe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fzBhaylT+LmG+8Wi3/v1ZEe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 May 2025 10:53:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the fuse tree got a conflict in:
>=20
>   fs/fuse/file.c
>=20
> between commit:
>=20
>   04a1473f8ff0 ("fuse: drop usage of folio_index")
>=20
> from the mm-unstable tree and commits:
>=20
>   0c58a97f919c ("fuse: remove tmp folio for writebacks and internal rb tr=
ee")
>   3a7d67252c63 ("fuse: support large folios for writeback")
>=20
> from the fuse tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc fs/fuse/file.c
> index 6f19a4daa559,b27cdbd4bffe..000000000000
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@@ -2349,7 -2145,7 +2145,7 @@@ static bool fuse_writepage_need_send(st
>   		return true;
>  =20
>   	/* Discontinuity */
> - 	if (data->orig_folios[ap->num_folios - 1]->index + 1 !=3D folio->index)
>  -	if (folio_next_index(ap->folios[ap->num_folios - 1]) !=3D folio_index(=
folio))
> ++	if (folio_next_index(ap->folios[ap->num_folios - 1]) !=3D folio->index)
>   		return true;
>  =20
>   	/* Need to grow the pages array?  If so, did the expansion fail? */

This is now a conflict between the fuse tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fzBhaylT+LmG+8Wi3/v1ZEe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+LYIACgkQAVBC80lX
0GyeBQf/YAAjzloyk67TVVK2Y/ADgd152IuvIo//1NFGjxOeykn9YlBR/+cGiqCf
Z2HOe7+VdMGM/GS5ebXHWXu5B3qLdSWB+UgsP/UVzp3NjCsIdzMvB3yGfTqwIcji
NXWvag26ojmb8TDSrSyyBsOcpQl0jNbj0EUCv0IBz2VrY+Si9GyM+OC4c5Bu1IeH
tUxgA/Enrqv7gLnk6nPenH525RYEoblxrm49t4BIid4BWyxjV7NH/FXNaX7dkZoO
XgXPUbOVsItQzAmsBfIwX7O53F57S4yF6fZmlBhyGxCeBzlfurEVmvpLqGFdH8Vk
piKXbs+Yko38d4JllrUh0M9ExgK5eA==
=4L4+
-----END PGP SIGNATURE-----

--Sig_/fzBhaylT+LmG+8Wi3/v1ZEe--

