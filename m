Return-Path: <linux-next+bounces-8224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15EB48629
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 09:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5F667A4CC3
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6C221B9D9;
	Mon,  8 Sep 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HLVrPRSe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA869443;
	Mon,  8 Sep 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318252; cv=none; b=ak+1oNBYDyM4QWvJhXPLJSwLbteZsvhZ3XwAuBN5YJEF2DOWQZ4UbE5dXLbjPguWnqfLjt67YEPgCigYIv1fisP1FYmX41Xbo5RcRzD76AXyp5Cic6U9sQhVA27jomJY0uJyrTUSr3eBavJO3DMEtsPovcWYKDgU7Vp9ld9lUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318252; c=relaxed/simple;
	bh=4dpFRlq+wZMXfx0CKYZP4jYxxmI3VOqk2jBr+v5fbUk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXhbdoraRimua9qwNj59ZbhvJw4wuBJ6GvEaDeZTYzmGPAi85w8GLJAkwofuggXTuFTrdtapB85Hxe9d9P3o/UXl0LaKatPaPBK3L5UCPok3gne2VHXE2pJQB9qYfc2wZNFlkNl2WbOuEU0n7iFh7N1JqOQKv8Ifd2gRCrAjVcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HLVrPRSe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757318249;
	bh=Xi42dlr6jq1lpwdNkIB9NB7Q6cdgHDihyQ5clWj+/Hk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HLVrPRSeskZOyFUMJEj8cscwJ8lBRjYIg0Zg4UMjpRKSgfV4aekmsioaeVxTfUUJm
	 Rq1DHlobv1umpfmO7Bl1eOWkbZg4HhwkYUKGPk0yv5zBkFx20IfsOjXUp5HnycCDvs
	 84F3pJ4sLdX+yh3+TTQcvMX+csvYbwXrGvnDRrMacHMP9XC7c15lkte3Yg2LynG7Hu
	 JYdCsGpNKfM6E+XzQARdohIKAYHGzp7AWaHtmOzDMODDK5L3asy00PuYH4csGzsHEx
	 Y69yu6yhB6TYryQtNLZkOYuuHeIXuImYqfW6E1xCSDFsvh0wrKMNVcvRFxAVx9RmgV
	 iaWHnZaRtuJug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKznh6yw1z4wBC;
	Mon,  8 Sep 2025 17:57:28 +1000 (AEST)
Date: Mon, 8 Sep 2025 17:57:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda
 <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: linux-next: manual merge of the rust-alloc tree with the
 mm-unstable tree and Linus' tree.
Message-ID: <20250908175728.3001c2f4@canb.auug.org.au>
In-Reply-To: <20250826173041.3140da7b@canb.auug.org.au>
References: <20250826173041.3140da7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8q+kl4lOrlM1xEvRHMPzx4e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8q+kl4lOrlM1xEvRHMPzx4e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 26 Aug 2025 17:30:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust-alloc tree got a conflict in:
>=20
>   rust/kernel/alloc/allocator_test.rs
>=20
> between commits:
>=20
>   501046225a67 ("rust: alloc: fix missing import needed for `rusttest`")
>   c8a3b6ec0370 ("rust: add support for NUMA ids in allocations")
>=20
> from the mm-unstable tree and
>=20
>   0f580d5d3d9d ("rust: alloc: fix `rusttest` by providing `Cmalloc::align=
ed_layout` too")
>=20
> from Linus' tree and commit:
>=20
>   fe927defbb4f ("rust: alloc: remove `allocator_test`")
>=20
> from the rust-alloc tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the rust tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/8q+kl4lOrlM1xEvRHMPzx4e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+jGgACgkQAVBC80lX
0Gz6gAf/XSxqKO5nIQ2oJ1PK3F1RkEf8rkckHuufLUlCXO6HbAdjD6EB3Y+ssyVv
AgbJpXn/rtDwECygmh0K0PVP7uPPcRb9LtqhGFJBqutYK169qj08hnfwjKY+kZUA
G9vUgUic+nP4AX1qiC2ACirihVCm16GOmoVJoCULxvC4n3s5t/ATVlJcI6TFhzRv
ELu4XWdd97Ruhh1AiDzcC8OI002RcuaIJj32hvqlDONo0448GI9giJFAe4cf6fuz
p35cqMbhapZi+rsh9BQbmJsWeapEhd4BITH0Htulna93wvqWJCzJR9rrooeEkJVr
WtoazY38jfQhFHKSse3PBEqRBmv0DQ==
=dr4C
-----END PGP SIGNATURE-----

--Sig_/8q+kl4lOrlM1xEvRHMPzx4e--

