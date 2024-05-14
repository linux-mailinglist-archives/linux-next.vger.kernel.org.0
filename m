Return-Path: <linux-next+bounces-2290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E78C4AE6
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 03:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A12C1F23137
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD60617F7;
	Tue, 14 May 2024 01:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S03oQfYk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B81869;
	Tue, 14 May 2024 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650385; cv=none; b=KnC8FtZAo0IgHa068J1D9q/E6SJX1R1EEhTErdpxW2w/DBhpvzodNTOpUrSExJEXko0IJZfhgTEjEyqSCxyiv04GTgCMzTmNlE5VE2qAX9UbAahSLKud832ZmdgC5Sz4k9X+Gf6PXuvTkt6QULyEvuMmxF9ymlpzgRpt+TvASyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650385; c=relaxed/simple;
	bh=RCAEKDarniAXQCflNxSzHy3FO6jbbnDom4yoPZTVBpY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmOJuNumfnJnPDcpEC2GOT2YfbyO8upajMbShymFQXR7aiNNuRYHSE5NmPue4sV9iZPn+v3d8pUmYDCvD5+FhIizT72OjPYuU/Hkn+NwmO3mohXfDRkKmS+jQtrxupCCeoDl7WtEL1ZY6whnH+ohbd5tKyzYhDnwp+huN2TJTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S03oQfYk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715650381;
	bh=RDNndJUAJtBCrnl6i7gFm/qlsrfLVPtq8oKSkptnnBQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S03oQfYkHu5KBxNOv5lxRPjggG6eJiWJoP0w/yFRSZcFcDqrKa2uJmsW41LuXnbk5
	 qO6BuYtIMZBBgtgVw+3PbUQLvn0XoMGFDkiaMPnv6WZ1VKjMXkid7QUwWUspHKb8j5
	 /C+h1Rk5Qjq43JmiJMEDf7lDDyhmFA4Tc6iQ3SPAwA41tmLVi9eYUxFyJABu/0XVPf
	 3GE0lwNliT0OjtpgrcXF9HsIJk+km1be+Gsmy3cZNMT3OT74lCBRu/NhHDfEQVQY5F
	 U27I0F3ZCFQAfGDrRL13m9i4rXD998xVGtPv3DK0zYEjksPsTCg8Vw1Zg0qD/cj4gq
	 N0FxCI1RkQgQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vdf4X2LrKz4wc8;
	Tue, 14 May 2024 11:33:00 +1000 (AEST)
Date: Tue, 14 May 2024 11:32:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yu Kuai <yukuai3@huawei.com>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Message-ID: <20240514113259.7396a7d4@canb.auug.org.au>
In-Reply-To: <20240510123419.42f727c1@canb.auug.org.au>
References: <20240510123419.42f727c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=sXTYUDcwt/uABqN174z=X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J=sXTYUDcwt/uABqN174z=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 May 2024 12:34:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   block/blk-core.c
>=20
> between commit:
>=20
>   3f9b8fb46e5d ("Use bdev_is_paritition() instead of open-coding it")
>=20
> from the vfs tree and commit:
>=20
>   99dc422335d8 ("block: support to account io_ticks precisely")
>=20
> from the block tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc block/blk-core.c
> index a4035dc7640d,01186333c88e..000000000000
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@@ -990,11 -986,12 +989,12 @@@ void update_io_ticks(struct block_devic
>   	unsigned long stamp;
>   again:
>   	stamp =3D READ_ONCE(part->bd_stamp);
> - 	if (unlikely(time_after(now, stamp))) {
> - 		if (likely(try_cmpxchg(&part->bd_stamp, &stamp, now)))
> - 			__part_stat_add(part, io_ticks, end ? now - stamp : 1);
> - 	}
> + 	if (unlikely(time_after(now, stamp)) &&
> + 	    likely(try_cmpxchg(&part->bd_stamp, &stamp, now)) &&
> + 	    (end || part_in_flight(part)))
> + 		__part_stat_add(part, io_ticks, now - stamp);
> +=20
>  -	if (part->bd_partno) {
>  +	if (bdev_is_partition(part)) {
>   		part =3D bdev_whole(part);
>   		goto again;
>   	}

This is now a conflict between the vfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/J=sXTYUDcwt/uABqN174z=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCv0sACgkQAVBC80lX
0GzWzQf/fB8NEqFinuZD/N/+bCx9gnWArQPQW4kWoaQ8N9sjmdHbcqxv3lKbWzoa
HQO20h53YA1JjrEk8WRQCMyOyNNrYsJJHaFUHqUl1hyPzHoLO8jJIcB8/egBIuCj
G0aZ3qyHf/PhCjo64bJs8IX3n/G7TFosEMcsdTZ+gzXacsx2ICJhRiSm+/1gvhiu
0Rextv7ZK7JZf7f/ptuUzLZNrPMijNDPwvJtEaPOcRPsp+hsfwwNnOihvLPfO99U
8rqvlzSlVwbD9Mf6VH48MADxrB0AwfOYCWYkWapwlwCwuKFxwKeAxerhyVYbZQHj
J00JWhG0uH+Hdq6tuLtQV8EtBewXoQ==
=FWmv
-----END PGP SIGNATURE-----

--Sig_/J=sXTYUDcwt/uABqN174z=X--

