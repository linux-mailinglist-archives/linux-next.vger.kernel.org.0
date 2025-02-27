Return-Path: <linux-next+bounces-5599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2EA48CC9
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 00:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 242817A7224
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 23:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D6E276D0B;
	Thu, 27 Feb 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OANXmy4u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18543276D02;
	Thu, 27 Feb 2025 23:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698993; cv=none; b=aQEZoDeUQ9XcOQwjpGZN+ihhpOmTfJHQyMESJBUbrBVK75EBt9qIidwDzK6SWe6Lz51F3sOVn6+eTg62trozyOvLg1v0vYpF4aYNM0r1BFIMGT+R8SeA8Tj09MIcwt3lnYtfxZYEa3AFHoq7ErvwnXnX73HDMNhctrmqEOcubSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698993; c=relaxed/simple;
	bh=o/mFX7dmp+4EtVArlr44WPFEuqsKCehinVJYYnLbK1o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWZNZXQLAH8LqFSHj9W7xddlFxejgRZqt+/r+X77HHRz0X9sMDUo6/pu1XAQtSAwb/mJE3IRO5DwhsXYVymsjX/5Pp05JKzjQfgve/5jm2BiKZXQA68ZrVd2mmpB3AgLJ6TX3qYtg+RbQ6DwpZ08wAPl/HCXZvoM2SK08lRfAgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OANXmy4u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740698985;
	bh=Q2hjLnrIolEILwyLz7zCnFDjPdH+aDy4Du44bDcorKQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OANXmy4uYrxbgDsvk098a6paXoMY9nO6GbxM4Vu3XvyxB8g3h00BoifMiLZ+HqqyY
	 PbEgnphxyJJRV8f3sTbX8v788B4BLPBTmf7+xrmbUntziV7Ko+zaA4DK9NSxb7gL7Z
	 rnheyPUKoMJkk9ph+7DYudegnRxE8UcWHWcMBssfatI+1ZVEzhdHEhFfmd8gpA+d8k
	 8JC4JsZzGN5ndvUGOMD/LiwJs9hXBjw3T4G0P/dDhcg2mPziTVvEzaBhV0OQmJH9a3
	 s0Y9DTE5LEKgHaXRHaaLsREdGXhwxCQNwgAszpB31qghFpmUtjHujXKdg3QqKwoY5u
	 oJFJ+VkOsSYRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3ncT0Gpjz4wcQ;
	Fri, 28 Feb 2025 10:29:45 +1100 (AEDT)
Date: Fri, 28 Feb 2025 10:29:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joshua Ashton <joshua@froggi.es>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bcachefs tree with Linus tree
Message-ID: <20250228102943.1c3a9908@canb.auug.org.au>
In-Reply-To: <20250228092826.255fec8a@canb.auug.org.au>
References: <20250228092826.255fec8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qH9Ps+J8ERY0bMXfUjQPmsf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qH9Ps+J8ERY0bMXfUjQPmsf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Feb 2025 09:28:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the bcachefs tree got conflicts in:
>=20
>   fs/bcachefs/dirent.h
>   fs/bcachefs/fs-common.c
>   fs/bcachefs/sb-downgrade.c
>=20
> between commit:
>=20
>   4804f3ac2649 ("bcachefs: Revert directory i_size")
>=20
> from Linus tree and commits:
>=20
>   1afdbf54cda5 ("bcachefs: bcachefs_metadata_version_cached_backpointers")
>   713d0639b9f7 ("bcachefs: bcachefs_metadata_version_stripe_backpointers")
>   3e97fc2b1bb1 ("bcachefs: Kill dirent_occupied_size()")
>   bb13a9d96daa ("bcachefs: bcachefs_metadata_version_casefolding")
>=20
> from the bcachefs tree.
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
> diff --cc fs/bcachefs/dirent.h
> index 362b3b2f2f2e,a6e15a012936..000000000000
> --- a/fs/bcachefs/dirent.h
> +++ b/fs/bcachefs/dirent.h
> diff --cc fs/bcachefs/fs-common.c
> index 2c3d46ac70c6,ca70a3de805c..000000000000
> --- a/fs/bcachefs/fs-common.c
> +++ b/fs/bcachefs/fs-common.c
> diff --cc fs/bcachefs/sb-downgrade.c
> index 051214fdc735,21130eadaf32..000000000000
> --- a/fs/bcachefs/sb-downgrade.c
> +++ b/fs/bcachefs/sb-downgrade.c
> @@@ -90,7 -90,16 +90,13 @@@
>   	  BIT_ULL(BCH_RECOVERY_PASS_check_allocations),		\
>   	  BCH_FSCK_ERR_accounting_mismatch,			\
>   	  BCH_FSCK_ERR_accounting_key_replicas_nr_devs_0,	\
> - 	  BCH_FSCK_ERR_accounting_key_junk_at_end)
> + 	  BCH_FSCK_ERR_accounting_key_junk_at_end)		\
>  -	x(directory_size,					\
>  -	  BIT_ULL(BCH_RECOVERY_PASS_check_dirents),		\
>  -	  BCH_FSCK_ERR_directory_size_mismatch)			\
> + 	x(cached_backpointers,					\
> + 	  BIT_ULL(BCH_RECOVERY_PASS_check_extents_to_backpointers),\
> + 	  BCH_FSCK_ERR_ptr_to_missing_backpointer)		\
> + 	x(stripe_backpointers,					\
> + 	  BIT_ULL(BCH_RECOVERY_PASS_check_extents_to_backpointers),\
> + 	  BCH_FSCK_ERR_ptr_to_missing_backpointer)
>  =20
>   #define DOWNGRADE_TABLE()					\
>   	x(bucket_stripe_sectors,				\

I also needed this to make it build:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 28 Feb 2025 09:59:39 +1100
Subject: [PATCH] fix up for "bcachefs: fix directory i_size checking for the
 last entry"

interacting with "bcachefs: Revert directory i_size"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bcachefs/fsck.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/bcachefs/fsck.c b/fs/bcachefs/fsck.c
index 9e922babace0..0e85131d0af8 100644
--- a/fs/bcachefs/fsck.c
+++ b/fs/bcachefs/fsck.c
@@ -2449,8 +2449,7 @@ int bch2_check_dirents(struct bch_fs *c)
 				POS(BCACHEFS_ROOT_INO, 0),
 				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots, k,
 			check_dirent(trans, &iter, k, &hash_info, &dir, &target, &s)) ?:
-		check_subdir_count_notnested(trans, &dir) ?:
-		check_dir_i_size_notnested(trans, &dir));
+		check_subdir_count_notnested(trans, &dir));
=20
 	snapshots_seen_exit(&s);
 	inode_walker_exit(&dir);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/qH9Ps+J8ERY0bMXfUjQPmsf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfA9WcACgkQAVBC80lX
0Gzu2AgAnIco/gquchRT5n2fVNFPmqCOoEbeFi7bEC1812XzCXFFeu2cLUQvfaPS
0Hdaw77PtPpNYv3RQh8VVIweq+Vi+KjQRvWQDVVBgzmVam42KlxnN4qVlDZ3Qn9p
2oh2/OPMk6fhh7Sll+y06GD6jypfu2yL37NVzs8QEMntSvps8l+xtcM2qK+qFzSt
K3kxRtOHSgJi0E8GvqtjNuJSkLDM6wz2G+xxNhxIqjYLecgK4BDmNruv1vTdj+mb
iIQ7UzIJWZnsC+SSEy6zZRZ7xdeB5dRnCd+teMFvdXChxUlNz9UptYNTLpjwrCbF
QCp1a5auZ4Xt7Farq11WxDkSflkYYQ==
=vVnE
-----END PGP SIGNATURE-----

--Sig_/qH9Ps+J8ERY0bMXfUjQPmsf--

