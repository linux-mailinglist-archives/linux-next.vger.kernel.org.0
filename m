Return-Path: <linux-next+bounces-4125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4161993A99
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 00:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40C7FB22D47
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 22:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F0218E342;
	Mon,  7 Oct 2024 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bW3rV3lS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984318BC19;
	Mon,  7 Oct 2024 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728341841; cv=none; b=Lz6v3XTuSm0r2vDFysCrFrE9bUocZ3sRgvga3vUqS8PvWkXNiKV2N0Kx5ul0jlvEa8lxJ9NXOWE6hMoUCjsAi3lsdvn3J2ZtzLN44//xOeBzEeE6xaZhDCK4d73iCpZdrjoe3MoTtzUS73iyjn2BB3NDaqUnKbFPSm9nDvhOkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728341841; c=relaxed/simple;
	bh=N39tV22x2P9bOlmw1WyQYXsUAmc3efVBP8V2EwvPVxs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GprMi0m7+shlLuBNq8Pauz7ZGkAUhxyDT0j2dALx2G2ilYgfmHOlb4jpT0ICBfmW03Wwqa+omuyYNiROgaT3Aw4TcCWdG2nHp/Bog+iEl3H5w11lhjjhVrc/h6NUhNTN5BxnAUvbj61KOL6A/pKqcKRXhtCXmG8l4t86vJowIZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bW3rV3lS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728341835;
	bh=Sye/LI2qzNyrNolV9YJtz8azbnOBwKAIMQ/Jd9grQ20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bW3rV3lSkzigNn1B5FOdSoPEzrbJ0KFpgPn/q67BVKaxLQb1/jGbbV60DkIGpPNYW
	 lJ3HcIM8nN/8B3RSAKOTYbcCUIPmbDQklPGa5E18Qcxg6JtU/6/gjRh6Ctnn3Y0fTF
	 mnrNE4Db1GMuWHHWT4Ina3tAEJRzo0r3timqKVgvho0GTwVqk64XpWN4U84GqwpwhR
	 kFSU5DBqms48nN9H3PG/30+pppSQ2irTUWoSPaHyZt1Zr6tJMnjEyrPWwHO9igL93A
	 8tNnzQPuOiVUxjIjSwydouhUxnp5hwXehz30kIKW77Ke23s3hrw9QS1fRrvta5jwkl
	 U6Tx9PUa9RfPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMvfy5VVnz4wbv;
	Tue,  8 Oct 2024 09:57:13 +1100 (AEDT)
Date: Tue, 8 Oct 2024 09:56:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 rust-fixes tree
Message-ID: <20241008095652.2247c731@canb.auug.org.au>
In-Reply-To: <20241001102839.77211fb8@canb.auug.org.au>
References: <20241001102839.77211fb8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bu3DQD.PVh_Phkvw57tpMpc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Bu3DQD.PVh_Phkvw57tpMpc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Oct 2024 10:28:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the fs-next tree got a conflict in:
>=20
>   rust/kernel/lib.rs
>=20
> between commit:
>=20
>   ece207a83e46 ("rust: kernel: sort Rust modules")
>=20
> from the rust-fixes tree and commit:
>=20
>   94d356c0335f ("rust: security: add abstraction for secctx")
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
> diff --cc rust/kernel/lib.rs
> index b5f4b3ce6b48,ff7d88022c57..000000000000
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@@ -44,8 -46,9 +46,9 @@@ pub mod net
>   pub mod page;
>   pub mod prelude;
>   pub mod print;
>  -pub mod sizes;
>   pub mod rbtree;
> + pub mod security;
>  +pub mod sizes;
>   mod static_assert;
>   #[doc(hidden)]
>   pub mod std_vendor;

This is now a conflict between the vfs-brauner tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bu3DQD.PVh_Phkvw57tpMpc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEZzQACgkQAVBC80lX
0GwqjQf3a7zLjC86nxUyv8EqeaSUYe5f4RnNOiYn/90+RMR1RF0xlf3VYxA8boq4
cGXNB6AqavDmszIUIvV2f1YfsoMByA+8vmUaCB+lI4IiJLE269AfUjLClWzfdCxo
B827d9EWfYZC3fTnISHklxrObwaXeWC/HoraUN+HToAA3Akj+WGi4l5UKCGwtAmf
uFoceBDo0sk8L+kew7rjMU1hGhobBg4JYg2PjUZutcByl/55Pq96MI1jafeKqjQj
Yq+FcqoxLh5jspErf+3mb9xRqeFWkducJFzJZ6K8C0H+AW5eBHJayGQyL9mwpsSq
Ooep+ol61RGDwQbZ8qmpGs+rAi7C
=9MJ7
-----END PGP SIGNATURE-----

--Sig_/Bu3DQD.PVh_Phkvw57tpMpc--

