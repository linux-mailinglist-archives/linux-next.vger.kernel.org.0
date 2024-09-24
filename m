Return-Path: <linux-next+bounces-3949-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A2983AA5
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 02:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73276B21299
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 00:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ACD629;
	Tue, 24 Sep 2024 00:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gQbDKYya"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC218BF0;
	Tue, 24 Sep 2024 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727138885; cv=none; b=UMO2LdmD1rqYog3ZYVjRAIKIxpa2Li4h348tLH9UhdOL8eSsYwufipsOh3kSoZiM3pK3u23oowKiTeUi1OWsctHgk2yYqubDrS0/gt/VqbDj89FmY8nJ5NtVnZiIXEdTJyR2wnSIcRPlI9q758HFIb4pxG50eQggGvJOH2Dmq+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727138885; c=relaxed/simple;
	bh=AKFHdvlhQSanhbOasBpCnxvPJB+lGZt7O//jUVBfDvU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7zcixHPXWmNLkEnz0kC3H/+U3Cn4ZlnJ2VNLCeP3OHM7QdfJgmiK9wVqqs9bb/ju3eqiasixZSmbvcPdB1UZcV76AqcwOO5SZg11KB798xVKwm29OGgGzscz5lGLjeWp8mC2V79Ufnk0GgubqKB0yGx6CzekrMND1V06aDJ76M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gQbDKYya; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727138871;
	bh=xv0pzNJvO+tPizulUZXvkGtgNWHJxZ851/lH4Gkzjbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gQbDKYyaIBop1VoxwV087oLZJAmyUS0R34+9E+D0i2hjgbpbYCsMfqxCk1gUdQQBt
	 ev3WfnL8p1/+inare/26y6MsWYaellbWFtJ3KxR8GmOho4YrmvbFzV+A2citUvZsFk
	 efOH+EEUCGvA9hQ2uhNTIsRSM0GF3FEEWRIkhfNP+ootPkvFiKAeEaUtihHkKtQ4W+
	 WlawR/jnl0ggu8YL1D6BcLhau8ZQcGDhDlTXX6qWpHIvjKD2hUqq41irclf1FQ693J
	 xwNiFes4ygiL/1Lx7zcOWnCIoN4aDuqN4H+ZjNWnm7lXU2LufEOqOrWgUYUhFpa9D7
	 NGGigXuDdD+xg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XCLn12mm8z4x7F;
	Tue, 24 Sep 2024 10:47:49 +1000 (AEST)
Date: Tue, 24 Sep 2024 10:47:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jan Kara <jack@suse.cz>, Kent Overstreet <kent.overstreet@linux.dev>
Cc: Hongbo Li <lihongbo22@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ext3 tree with the bcachefs
 tree
Message-ID: <20240924104748.3bb1baf3@canb.auug.org.au>
In-Reply-To: <20240906081944.105579fc@canb.auug.org.au>
References: <20240906081944.105579fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AtQ8BNAb+3Su3vkDHFSvPTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AtQ8BNAb+3Su3vkDHFSvPTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 08:19:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the ext3 tree got a conflict in:
>=20
>   fs/bcachefs/fs.c
>=20
> between commit:
>=20
>   455d3317bebd ("bcachefs: support idmap mounts")
>=20
> from the bcachefs tree and commit:
>=20
>   fff071a45705 ("bcachefs: add pre-content fsnotify hook to fault")
>=20
> from the ext3 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/bcachefs/fs.c
> index 486b9eba287a,f889a105643b..000000000000
> --- a/fs/bcachefs/fs.c
> +++ b/fs/bcachefs/fs.c
> @@@ -2250,7 -2124,7 +2250,7 @@@ static struct file_system_type bcache_f
>   	.name			=3D "bcachefs",
>   	.init_fs_context	=3D bch2_init_fs_context,
>   	.kill_sb		=3D bch2_kill_sb,
> - 	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
>  -	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_HSM,
> ++	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_ALLOW_HSM,
>   };
>  =20
>   MODULE_ALIAS_FS("bcachefs");

This is now a conflict between the ext3 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AtQ8BNAb+3Su3vkDHFSvPTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbyDDQACgkQAVBC80lX
0GzkhAgAmMzOchhZOQiI+ZAjH9e/UZ83l5Df5sN7WNevCkCuS2cLvFOr8OqqyVJK
aQdlgjZwbfrh6wZz6usz7g4w+W6CnGexvKSmq6alBEyhwzQqrNeSxGBSzuSULX0U
Yjs+q/XLkQkbPDx8Oq4OXE1XT7TyO+4ORJCKlqtI8EVJSJiUUB+csX4fZ4c824we
iTsbTzFu6s27QA3ZM1QzG+NNiV7oQ4zyJ7VqA0CUoCls9UhiMx9GplMAcPiK487j
ceA6lh8lg/v9cbAJJ5UKzDiQK8brBFcOOFpt7eG58+x1E16RMxd/xdofKRIQK7n8
8qDbqKG0Eb9+8/LKGGgOFMlPqSOOSw==
=49NZ
-----END PGP SIGNATURE-----

--Sig_/AtQ8BNAb+3Su3vkDHFSvPTM--

