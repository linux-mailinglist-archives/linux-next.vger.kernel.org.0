Return-Path: <linux-next+bounces-6122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67776A771DC
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 02:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AB51680BE
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 00:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EAC2AF14;
	Tue,  1 Apr 2025 00:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eK2qpMJ5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C302110;
	Tue,  1 Apr 2025 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467223; cv=none; b=tQqwZqGtGHL0qj0cw60JXSj1LU2PhDxFXfIvOxN14uV0ehB6zPo1Zfnq4z33t4Odv+gCpGaOXtqi0IkfgJYGuNCQXW9wc02k3v21qs2W1unRSGz0Pf4fhDTFPSd7GClTYiLdmN6ua+Vd6qh4XXPxWnmyQitQimJo4r+r4iVwayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467223; c=relaxed/simple;
	bh=yvU/D+f5dpFF4g9qVA0ZspYAyRw0cXdV28p7aODVRsk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6BNW3UmY7OkwQwF/A9ekGP75VQ+3JVJDHdnA7MW0xqmyOXvdlfGVt4uW4Rv373lhZ2AI86rvHJ2sJwsI/nmTbTwfCzS86ICxrdE1cuntrGqTy6Za8XgguT1GEn6SHGgheg4cIyI5alyLDfAdXcaO2I8NIJ0c4qZZyUaxjxjZYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eK2qpMJ5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743467218;
	bh=cBDOQP4gS5b2In4CkS503iiQCSa+VPdG3Lz7yETg+/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eK2qpMJ51DEPJIyxRJ2S79Qfe92CQLmhdR6qaAAg51FCY+ByISYgXgxnTLhUIrknQ
	 0zTgfbmAGTiwBkhPhHr5ie38wBdZQ41EMQQIRsXE+XtEIbSUz3Cdn/6WA5LlG/TYL1
	 ugG8Qddkp1ox1ZRA2M57rt7aUD830ih0/1NbTgKWNeNeZr1Px5QigtRYIzFYmgXB/i
	 W+SP+ic1PN85y9f4JHotN6J4D9FzO8WIS4kXgDk4jSAAJ8sZ9YRUI3mWdifac7IsRK
	 e2RC98/SELfS2PXqh5uBKNqtGZwTCrPV9G9y+wyD4FErHqEQPTOvkWHSK9sDj9Agr2
	 FXC2eT51uUtKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRTMk25nHz4wbZ;
	Tue,  1 Apr 2025 11:26:58 +1100 (AEDT)
Date: Tue, 1 Apr 2025 11:26:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <linux@weissschuh.net>, WANG Rui <wangrui@loongson.cn>
Subject: Re: linux-next: manual merge of the rust tree with the loongarch
 tree
Message-ID: <20250401112657.5df1001c@canb.auug.org.au>
In-Reply-To: <20250331160726.4e3d93dd@canb.auug.org.au>
References: <20250331160726.4e3d93dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cLctm6n3edB50y8MtQ0+Vz5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cLctm6n3edB50y8MtQ0+Vz5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 31 Mar 2025 16:07:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/Makefile
>=20
> between commit:
>=20
>   13c23cb4ed09 ("rust: Fix enabling Rust and building with GCC for LoongA=
rch")
>=20
> from the loongarch tree and commit:
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
> index 1750affda774,b9cc810764e9..000000000000
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@@ -251,8 -274,7 +279,9 @@@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-
>   # Derived from `scripts/Makefile.clang`.
>   BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
>   BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
>  +BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
>  +BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> + BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
>   BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
>  =20
>   # All warnings are inhibited since GCC builds are very experimental,

This is now a conflict between the loongarch tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/cLctm6n3edB50y8MtQ0+Vz5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrMtEACgkQAVBC80lX
0GzQzAf8Cqvvgi2cHIfCv+G5/jBagjeU+35HqrTYk9olpKlkk1uQwLoME/kShQlu
Ta8MCdFM7EMubnXHcN76mikwV3TtH10oSGOMR9biLQF6VLF2JTBAz38lxAIkfwsl
gAv9k20Ii/LQVbJErrDH3cvCKc/51GoJWzrXvjrIvPhQ4v9GF+U2Sk5ToVjG3aF+
1GPvsUpHfTgViSJcfZn8Yg8luYQ/fgzo9RVmWkiyrXCWYbQz0jSrIfRv/5xX6MeO
L8iCRRZmhmGWkFb6PIaPNqGGp0r2YKd09/ajSWk9RWZX6NTiQIH6OEBy6/jm6sXh
W9rh/kKZO9pJ8fYrBxnE98OS76ma/w==
=vspo
-----END PGP SIGNATURE-----

--Sig_/cLctm6n3edB50y8MtQ0+Vz5--

