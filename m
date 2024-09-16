Return-Path: <linux-next+bounces-3882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27E97A994
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 01:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE0F71C22E86
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 23:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C40381C2;
	Mon, 16 Sep 2024 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KAZKeF+e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCA0A95E;
	Mon, 16 Sep 2024 23:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726529453; cv=none; b=TNgkhRWmg4ZUKZcAdu+JCXgpMXA5OF+Rhw8886MB8Xx6E9fwxPgF182tRtGaWuVo7AqePwe4nYeDul4fw6tjR6dFTxE9h33ct2qYiCwVkNJEgNeNTC208O+foNlz/BRS9KaEQKuItHyNxb45uDtAxvXqxVjZFEcf0o7S7V0iA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726529453; c=relaxed/simple;
	bh=Ap3FAYfdHiUPI22xd16gn5lUluI2gzmYBEd4Xxlcmnw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJYpDVh/jaZqExYN9YlMf99Sl/0qCO3qd6uttY5yCRX4QuZTwkaoXc9nq9qGD73EiDVVl23dJxJXajTG0P/7nOyWzivCVbxGT2FOyQMzKJqxmCgGIHuCpMJe2+hy5cwQtFbu/XKqBD7ON09Z0r/r8k6zGH0fGSI5KiLnbXPFLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KAZKeF+e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726529449;
	bh=eKkHEzmM2jVjQWjflBLTyzCF2n4nRQZQrWaGuOuMmew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KAZKeF+e61BRyzkrnfT3dtjJvjw0yDvRx26AF7cxeBe5iefRk2cn2Ydl2uuor0Inw
	 gQS2NO4sLMWS03OgsUgu3qqJUXwLhjdQlWiRoglNyvCkT4woSbyfxAzgRqJE0OQTha
	 Z0GHl2+OYK5KVUbMbX7+zby6QP6qzO8+Im1pgcp8kIfqdtzD7PbKvZt8MmEEySndiE
	 6v1N3U1JTLqcJgijRJ/zmYavo+vyJ4uHw2FnqCwM6y8VhuTcaCzJWRsx2mrL/++9hW
	 y6+lVgzTTJKtJu4mklY+CvbDohXdX2hNbydnW/dTVbOW98lL7/Wn1QMAs5/qebN6X8
	 vxZSGrSDmfxFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X71PP2Jmqz4x5M;
	Tue, 17 Sep 2024 09:30:49 +1000 (AEST)
Date: Tue, 17 Sep 2024 09:30:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Moore <paul@paul-moore.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: Re: linux-next: manual merge of the security tree with the mm tree
Message-ID: <20240917093048.71949a8f@canb.auug.org.au>
In-Reply-To: <20240911142822.7c65e02e@canb.auug.org.au>
References: <20240911142822.7c65e02e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XkuWjUyVRuLqtZyIR_oKDda";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XkuWjUyVRuLqtZyIR_oKDda
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Sep 2024 14:28:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the security tree got conflicts in:
>=20
>   include/linux/lsm_hooks.h
>   security/security.c
>=20
> between commit:
>=20
>   3346ada04cf5 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   711f5c5ce6c2 ("lsm: cleanup lsm_hooks.h")
>=20
> from the security tree.
>=20
> I fixed it up (I used the latter version ofinclude/linux/lsm_hooks.h
> and see below) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc security/security.c
> index 3581262da5ee,4564a0a1e4ef..000000000000
> --- a/security/security.c
> +++ b/security/security.c
> @@@ -660,7 -745,7 +745,7 @@@ static int lsm_file_alloc(struct file *
>    *
>    * Returns 0, or -ENOMEM if memory can't be allocated.
>    */
> - int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
>  -static int lsm_inode_alloc(struct inode *inode)
> ++static int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
>   {
>   	if (!lsm_inode_cache) {
>   		inode->i_security =3D NULL;

This is now a conflict between the mm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XkuWjUyVRuLqtZyIR_oKDda
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbov6gACgkQAVBC80lX
0GzhYAf6A361cAAt0YbqDm8WCQOVRt5ZuVcHTuaCzAOuBUKFyNtuqw0XW1NqiL4A
vhDTZ0BMpC23dLHP/MtlJjPeCNA0FD9jkhhwj6BP4nw4G8LgQiC2fHKErNDGF1hz
2Nxtg3I7ncegV+szFYF87f9x4KVNzlGWZF0QMfZ9VjpOn7YdfUYxKRZSrF3YcNIC
sE0XuOaWnRNxgakm1pUoJQsnn2ZtGVTyvqjoPxPw4Yig/1klHrtQU7lgjn7/F+mn
KUB3jOpMrCQsrO4GxDFDfS3nyTA9bCWZW3ks79a2VE41ei1dB5WyI7zZTBkQVePq
3/VY8gfg5Gy7rCnl/B9p2YYf3bgeYQ==
=IuTs
-----END PGP SIGNATURE-----

--Sig_/XkuWjUyVRuLqtZyIR_oKDda--

