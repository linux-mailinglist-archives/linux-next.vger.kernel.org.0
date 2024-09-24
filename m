Return-Path: <linux-next+bounces-3950-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06F983AA7
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 02:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734971F235C8
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 00:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C287ECF;
	Tue, 24 Sep 2024 00:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cZ3FwHH3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959338C;
	Tue, 24 Sep 2024 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727139049; cv=none; b=XlOazuhht3BoCxNePw6hM/gVPHaqk6y2S0DYzRCo02Uz7OBkByZSbi0RfaBnq2cJph0HefJ2k+zFYV5CYhaW90uCZUVDrvUJIymUTmPeoVdZYpDODZjIkJm0OQ4UeDtdWIyikF8+zExUvpiMDFjjAPuUKd/GdRZuxLg0Onvd5qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727139049; c=relaxed/simple;
	bh=AZE+Qiaw2w+awGcYoQHiAgWO1WbbGgc3wBjgBu8BZuY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKTzixJTDYvuaEdHhz7h0f4sEDgn9D0uUzSFQBawoACWMMF/WoqcgaLWMiqqOFnb5cAEwFRLVeNsThDOPU5S3CPU/+p7foCtt1rpExZsT9OYryHJ/eF2z6293ZvAoCmugFe/KxPHKhe6/w4ReEPLYzpDoC1maO7ihqFUv+iNUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cZ3FwHH3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727139044;
	bh=xGpZbT7mg9IvH37SG01CpNOzsHu0+NIrFGiUekLwwhg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cZ3FwHH3VPH9h2+gUoDldqdBJ8lxFVy8befeyo/9tukYkMSie6Il2jPGI8x0a21l4
	 a7HSOEj90eYRkkrO50LhTtCyh9/LHaJZsVniyZhBrEp/uASotJYoRSEPck1TLB56dO
	 xm8WwwsinGSkGt+eKrC9Vp8QiBnuzq8WqwtYcYh1hYtRSRt79hMfGafkHXg5fG1SvS
	 Ue0U2dzPLp8ewOYdOMuc/QuXYjXpwJGTfrTLOByGiNT08SoWiYB2C4syHs/5bsOzBP
	 0NRGHamUQPK/sZpCd4Nj3I9nLKLQ97SQCp/XbdR6RsS4y/gW/GhbPjP0VHmK9SU5zN
	 x+xQHjiDOTKhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XCLrM0nJXz4x7B;
	Tue, 24 Sep 2024 10:50:43 +1000 (AEST)
Date: Tue, 24 Sep 2024 10:50:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the net-next
 tree
Message-ID: <20240924105042.22f709a4@canb.auug.org.au>
In-Reply-To: <20240902160436.793f145d@canb.auug.org.au>
References: <20240902160436.793f145d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K_nd4GEO/6Q4sLzDL+IrQ23";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K_nd4GEO/6Q4sLzDL+IrQ23
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2024 16:04:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/lib.rs
>=20
> between commit:
>=20
>   4d080a029db1 ("rust: sizes: add commonly used constants")
>=20
> from the net-next tree and commit:
>=20
>   a0d13aac7022 ("rust: rbtree: add red-black tree implementation backed b=
y the C version")
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
> diff --cc rust/kernel/lib.rs
> index 58ed400198bf,f10b06a78b9d..000000000000
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@@ -43,7 -44,7 +44,8 @@@ pub mod net
>   pub mod page;
>   pub mod prelude;
>   pub mod print;
> + pub mod rbtree;
>  +pub mod sizes;
>   mod static_assert;
>   #[doc(hidden)]
>   pub mod std_vendor;

This is now a conflict between the rust tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/K_nd4GEO/6Q4sLzDL+IrQ23
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbyDOIACgkQAVBC80lX
0GxRhAgAjfEKehrtxyoFtJcctjBKRxBoTtZ7SnqUJ1IFBSugMhUeJ31r2m5/WWtW
XGpISo13YU+AFJLfgsSlSHE+5JQhQ5oxh2NzaP2Jm14eCYSTqcgP8abNvu45oAk4
AMoPF6WnzYYJaaFPYYk3aHDyKSgOkRS0KGUq6BCE1wUD8Sj4ypjaFVd4DM1VYRMG
mdGoQSm6MiMhp6yjlaQBy5Sm5K+xNQH/mWc+417NvbzIEn7CZEg108nPlYZuJ3Qb
9sKlYQ2aZDe62OGjhykRel0SN70hLxDnw0vbBmJhOfmstc8JGVfX4vi7NCUr1uHe
cX8AiBRXf3sfK67HQSgqLRXU3yVCtA==
=PyXz
-----END PGP SIGNATURE-----

--Sig_/K_nd4GEO/6Q4sLzDL+IrQ23--

