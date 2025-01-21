Return-Path: <linux-next+bounces-5277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF32A17897
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 08:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE92188436E
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 07:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BA817A5BE;
	Tue, 21 Jan 2025 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I5xuxw/W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089310F4;
	Tue, 21 Jan 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737444776; cv=none; b=leBa9kMZvz36dTczBru51k3WyZx9w8Z6QmoGhWb0vSWbO34lcxPlitkZjjw5H/RmoH+dmsYdeXTHnB/lepTZpFXXIZAdO6DjF4VZuQLpu5OiX2Jdc/f5shgk3dMVi8HwZL8djh/cl2SLgpcDSzyD9OMfRKmTKNDpTWMihRg12p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737444776; c=relaxed/simple;
	bh=J3x3R7MWT3nTdGcB8tfIC6hhSEsFQD4BGiwnZ1M3m+w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMC2MSTn0LbSixjf4xUNcgJ4NSXHcr5aSXvVQUeS7/yk/CZVL6yzyeGV/7SzKuf4OqkL7XIKjVS1LTGnaOUEc5KlfOWpWwwCVyh1IZXbZrzq1mS5Ao5W63GM8p1a0wQDsYdPxIkzIBEUKQaDQkdd61dcreuhtHG8vqrSbnC8yz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I5xuxw/W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737444763;
	bh=SJGVdKg19m9P6OUf8TGMfzpRw5AIF1govsJxtmz5HeM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I5xuxw/W4EX+GNQDAdR+pxgM3Lyg5uwRNByuj81wGrERMy5fErZJ6NcgiEkGoI8Jh
	 X2UcOAcjuu28b0nAKiJlZ2QXI3mTL/4ShjN8KNy/sNncpaElL+jqlO7M4JSKkEK5vx
	 u3/j/jGZJPphK8powxjiRAHE0iHZTDBr3gSdYPMjKaLiP1UDJYfyxjdvulLvy1/MYB
	 OwpY9LayyVQSZFzLiB5lmtA1W/UoMCX+HThFpkIvkBsYDvwLxuKmDbS5Tk2/YFiQpO
	 /dh82/k8WuAyr7XCwa5p6JSHzqaBZKy3P5EMFzOcltri/ymFU99oNIFifMKuugS/c+
	 GDMc5KabOEh+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ycf7H2HHXz4x8f;
	Tue, 21 Jan 2025 18:32:42 +1100 (AEDT)
Date: Tue, 21 Jan 2025 18:32:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, John Garry <john.g.garry@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the bcachefs
 tree
Message-ID: <20250121183249.02c98271@canb.auug.org.au>
In-Reply-To: <20250121144955.35b11773@canb.auug.org.au>
References: <20250121144955.35b11773@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0h_I6XyBfVjGIwZ4E/2m7L0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0h_I6XyBfVjGIwZ4E/2m7L0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Jan 2025 14:49:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   fs/bcachefs/move.c
>=20
> between commits:
>=20
>   6a967d3330d9 ("bcachefs: data_update now embeds bch_read_bio")
>   b4edf03721c3 ("bcachefs: cleanup redundant code around data_update_op i=
nitialization")
>=20
> from the bcachefs tree and commit:
>=20
>   19206d3f5ef7 ("block: Delete bio_set_prio()")
>=20
> from the block tree.
>=20
> I fixed it up (see bottom and the folloing merge resolution patch) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 Jan 2025 14:45:32 +1100
> Subject: [PATCH] fix up for "block: Delete bio_set_prio()"
>=20
> interacting with commits
>=20
>   6a967d3330d9 ("bcachefs: data_update now embeds bch_read_bio")
>   b4edf03721c3 ("bcachefs: cleanup redundant code around data_update_op i=
nitialization")
>=20
> from the bcachefs tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/bcachefs/data_update.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/bcachefs/data_update.c b/fs/bcachefs/data_update.c
> index e11d05a4b31e..19b1668c53c0 100644
> --- a/fs/bcachefs/data_update.c
> +++ b/fs/bcachefs/data_update.c
> @@ -818,7 +818,7 @@ int bch2_data_update_init(struct btree_trans *trans,
>  	m->rbio.bio.bi_iter.bi_size	=3D buf_bytes;
>  	m->rbio.bio.bi_iter.bi_sector	=3D bkey_start_offset(k.k);
> =20
> -	bio_set_prio(&m->op.wbio.bio, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0));
> +	m->op.wbio.bio.bi_ioprio =3D IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0);
> =20
>  	return 0;
>  enomem:
> --=20
> 2.45.2
>=20
> diff --cc fs/bcachefs/move.c
> index 0f60025a9532,67fb651f4af4..000000000000
> --- a/fs/bcachefs/move.c
> +++ b/fs/bcachefs/move.c
> @@@ -287,10 -294,26 +287,10 @@@ int bch2_move_extent(struct moving_cont
>   	ret =3D bch2_data_update_init(trans, iter, ctxt, &io->write, ctxt->wp,
>   				    io_opts, data_opts, iter->btree_id, k);
>   	if (ret)
>  -		goto err_free_pages;
>  +		goto err_free;
>  +
>  +	io->write.rbio.bio.bi_end_io =3D move_read_endio;
> - 	bio_set_prio(&io->write.rbio.bio, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE,=
 0));
> ++	io->write.rbio.bio.bi_ioprio =3D IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, =
0);
>  =20
>   	io->write.op.end_io =3D move_write_done;
>  =20

This is now a conflict between the bcachefs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0h_I6XyBfVjGIwZ4E/2m7L0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmePTaEACgkQAVBC80lX
0GzYswf/Tt2A6HXZD1oTbaemqxCRuzw5rxk+b7XH2R9DLW5n8GSefOVp8mcTA9Ml
1uVlqivTa0n6EBOY+venYs7gpPY/t92nw6TXOI8hM3b0PnQdJ7sAmlVcNulH5pyv
mle32a+WyhZrApE9ZtpUnXUe8f4k0N/fuuhjUgqY3HxqRwcbsdaNGUEFnp9dbU/K
rFkUvZdJNlGeNE1LqS8tDzSr18N5/ge6rerkzjCJYMKp+cUXLttan4FK+qqaJ6tt
3yTs79JILazncO0w8yWOlKr2qFi6NvM0lugouzDs5j9Q1R43VDnvYhv4hK2h3y0l
4kkGmQF4vCZuNu6i/ZXknZ+qUaLsbA==
=rvKr
-----END PGP SIGNATURE-----

--Sig_/0h_I6XyBfVjGIwZ4E/2m7L0--

