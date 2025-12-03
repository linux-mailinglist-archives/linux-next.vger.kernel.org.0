Return-Path: <linux-next+bounces-9313-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BFEC9D944
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 03:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21E854E06FE
	for <lists+linux-next@lfdr.de>; Wed,  3 Dec 2025 02:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D03841754;
	Wed,  3 Dec 2025 02:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ES5dgtmo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2736D507;
	Wed,  3 Dec 2025 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729240; cv=none; b=XjVaapU48fA0nPpK70yjVvV/v9xTCp2nZTdZ6or9X2PFov702If4FTRs3qzeAgLlt80gjJvpx5m3nSsJygbsRH4QzsjOIRDX5vo/Cb/c1LlMkmTeaGvgc9NzztDQnBuLCEtIJshA7MDi8sk1MTvtERVAPFQCQWk/7NqIEfBACrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729240; c=relaxed/simple;
	bh=/oL7FGQqesZDh0uMySKQPnedSttA27cNEf4hiKU2tjo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoI2D2akFKVQg7X0EZBWo6TFvtKZ++GzURAAvsYpgngtQ6EDf4nq0GP2QLe9sSvUxWtVFpDtT5zrFklyvkb9GUsfpDb36uGFJYRMpJGHbNLFxXYVHwRkzt9XCcNI90IxpPqanPT67dFpIdMCb8nLkXXDhqG/1YZaTZwc0lji8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ES5dgtmo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764729236;
	bh=bVhYc5fezc+/Jt4zqXYYWQU08MvbB1c8rs56ij+Hejw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ES5dgtmo9cophpyBoU5fCqZAGGU2tY8UfZeCDBzRxa5f9IgyN4HkxpVmrAl+q2pyM
	 AOsBEw/X63MNA8r2kkNrC7bteB2HhPSPaFf6Q0LObHYNJ+1fK30OwnLpEC6EOcQe5H
	 O4ktgMip+CfJQNlYmKPF04scMjjzlYQRF63qznxzHXbkoQGo2sMLh41TMZ2nSGaEXj
	 iF+5oPLCaC6Q+oKyVD2esHVV6TvHKWrptX1ebaYJfo3vlUxm/Didp+BDHB8WIOfw/I
	 AdmQJDRloPmAWYd9aT2cRDJtXEpRJhkCHVsyaUKk6yC3UslBjIpI47UchiAJ2uz+Er
	 RY2KL7zTK1zfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dLhXg59Wlz4wBD;
	Wed, 03 Dec 2025 13:33:55 +1100 (AEDT)
Date: Wed, 3 Dec 2025 13:33:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "jianyun.gao" <jianyungao89@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 mm-stable tree
Message-ID: <20251203133355.03bcd090@canb.auug.org.au>
In-Reply-To: <20251125122934.36f75838@canb.auug.org.au>
References: <20251125122934.36f75838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5cyf3pmLVWr55F=4Sjh0Ozh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5cyf3pmLVWr55F=4Sjh0Ozh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Nov 2025 12:29:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   mm/secretmem.c
>=20
> between commit:
>=20
>   b6c46600bfb2 ("mm: fix some typos in mm module")
>=20
> from the mm-stable tree and commit:
>=20
>   1011f385f492 ("secretmem: convert memfd_secret() to FD_ADD()")
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
>=20
> diff --cc mm/secretmem.c
> index 37f6d1097853,f0ef4e198884..000000000000
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@@ -224,10 -224,7 +224,7 @@@ err_free_inode
>  =20
>   SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
>   {
> - 	struct file *file;
> - 	int fd, err;
> -=20
>  -	/* make sure local flags do not confict with global fcntl.h */
>  +	/* make sure local flags do not conflict with global fcntl.h */
>   	BUILD_BUG_ON(SECRETMEM_FLAGS_MASK & O_CLOEXEC);
>  =20
>   	if (!secretmem_enable || !can_set_direct_map())

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5cyf3pmLVWr55F=4Sjh0Ozh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkvoZMACgkQAVBC80lX
0GwC8Af/Tivdb6JLuRTqHGaI2rNo/UjBRFIVk+xuRvSmuEcwdye+mZzmtFL5QuEr
ehOdon3wXPoE8NnUN/gCWIfMOsoZcJPZRZQIvlRXlODqLniMqVZw1xpgrIvJPhcI
MG6Po6cSC5nrAmXQ+RL7/nX5RciVzNIaG3999WDhRedahhBg4RiO0S906rKy4YuN
QxseW3raVEvA3chLJJDgu3MY6SW9RXkr3hPsJHNmd49eG1ZwXQmHS5LhLLFtvsv7
gvnw27jMNJ53d0HVgKQ1nrfEURZPzEv84JhiTesgrAO72rgE0TU63rvtP6oG8Lj5
yA5QBAoYofJ9nJr/OzIJkYyTGTvIug==
=EM+4
-----END PGP SIGNATURE-----

--Sig_/5cyf3pmLVWr55F=4Sjh0Ozh--

