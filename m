Return-Path: <linux-next+bounces-6121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21209A771D9
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 02:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0D73A6019
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 00:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5D27FBAC;
	Tue,  1 Apr 2025 00:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nyCqrpV5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95546BA33;
	Tue,  1 Apr 2025 00:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467123; cv=none; b=GSF5Jf5Fk6tpFDsUVsNn07l5OsQvDL/vNPXt0HXtRMgPaammnhktiWq11j0pPF7nOeIIfIS874R3FUDcBuFtQ9xok+NPbSRMiMk/oKC6i5/duiZLOastFdyouKQE4dkV147/ZnfP6+XunHoe+YP+Ddz3kpK+w9kWj6SAUfOfhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467123; c=relaxed/simple;
	bh=v2UeovIoz8sXvTMCprvZr+VumR8Dk1+K3xD5o5ydJu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCaOzc0kr3Z8CvVMoqaSr/8gy5DsO4tA+aUumVyGMFtksCd7tBYUHRIA5anYpYO8suMV0LCIKUjLFynObRFf2ooJC1F61AArUVXxy2gPEFEjbbiBlrTYAeZg88Q7k6sAPpDC0JQKP44WofhFebLw2UfG6/3Pb2xk0m47UFDBSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nyCqrpV5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743467117;
	bh=UlUufmI3HeXQYypI5nTqarrQVbw55lwac2D4TLZTRes=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nyCqrpV5zkprycJAJJFznG5K2D8vAPM2Gg0PMl3nnrRkWs12Iu4MqWt1XJkmTxxUj
	 t1lf6dZIa8IW/6OFnRoR2xNmBBEXDcmCTrMi11rT5ANidbLkf+srlFHzC2PUoynpsT
	 sM0+RjFrcMAAceI9YD8yUzO6ySXWcTwFO6nqqTx0BH/+DJVWHWja6vRYL1g7JT9dlP
	 5M2rhr4dFuV5tkdXYakgry5Uc0IBBRByf+A20O0mtmKCTRfi2ItEiekilCKFsg1syu
	 iuQJ0/864HJTvbf15Lh0WgFWFRzHgtn+5loVn2MY4EilW1sYscnBlIOZQLXwF8P2RD
	 QT3LFndnvQITA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRTKm6s34z4wbZ;
	Tue,  1 Apr 2025 11:25:16 +1100 (AEDT)
Date: Tue, 1 Apr 2025 11:25:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Russell King <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl
 <chrisi.schrefl@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the rust tree with the arm tree
Message-ID: <20250401112516.79d13e44@canb.auug.org.au>
In-Reply-To: <20250327172055.2212641a@canb.auug.org.au>
References: <20250327172055.2212641a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V=4ilffOFYlQhl+rtTJoT9W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V=4ilffOFYlQhl+rtTJoT9W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 27 Mar 2025 17:20:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/Makefile
>=20
> between commit:
>=20
>   ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
>=20
> from the arm tree and commit:
>=20
>   6b2dab17d6fa ("rust: pass correct target to bindgen on Usermode Linux")
>=20
> from the rust tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc rust/Makefile
> index 7f4b77de833f,b9cc810764e9..000000000000
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@@ -250,7 -274,7 +278,8 @@@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-
>   # Derived from `scripts/Makefile.clang`.
>   BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
>   BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
>  +BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> + BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
>   BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
>  =20
>   # All warnings are inhibited since GCC builds are very experimental,

This is now a conflict between the arm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/V=4ilffOFYlQhl+rtTJoT9W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrMmwACgkQAVBC80lX
0Gxzngf9HYK+yg+41m3cRC2c1hJrRXgdY8XzdoGcKwwUlEXinjXLgzHLjLE8fuIw
Bun/bVH0e0wZKZSBmmXGiZeH5eh+9f0FNzGVwDD1WqY1JxMqE164T/RdPM/67+Ck
uH8yz3LTIgFGoGS8nmT6pS5I4wMFBmPye7DfA4c7Os0Idk5a16q5INBVqTiXRc+1
IXYnyignAXFRBQlwz7/U9MMpWO5jN2sVmVtFcOzCL2iw7pz0DdyJuzK/xQk67c3K
gKdXoMOfeGizVScf0N0wkzxuwwZ8SUD7R6a9h79Jvwa8bhAB0oYDKOZf1+lVevQ3
zuJKLLu6dZ13lf+mfVuoPXxoprkjOA==
=redW
-----END PGP SIGNATURE-----

--Sig_/V=4ilffOFYlQhl+rtTJoT9W--

