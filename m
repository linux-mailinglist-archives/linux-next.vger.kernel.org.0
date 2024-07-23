Return-Path: <linux-next+bounces-3111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAF93A9BD
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E167E1F21B9B
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BED14884B;
	Tue, 23 Jul 2024 23:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mtfZzJUY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E013BAD5;
	Tue, 23 Jul 2024 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776745; cv=none; b=cFLtz/15jTSeZ4FoNsvzmGjvVlBUXDht0scXKhjhTcDiCvK/d1RIstoUqDAqWkBCu5Sc8yGZuF4kE02ptNSsgn4mYqZQFPSTxeHbYR151y/cIJTZmruXI062hNc/W2mylE8JvR9od2krcdi0akakAFFQDKVapl+Wdw3Dfx4L8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776745; c=relaxed/simple;
	bh=1+vaLp9bUzXOBohBGUqs8fNghTyUMEYdAk7YThuNzNk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ol7smrCiXD/4e7MNg0/Qmu5eHv0YntqyDLBbmEJc6l5gwmnRutizmXbEb0GWCupCTAmBpv4DqbmdGdD5TxAN7Lhcyi3a9cjLhDR5DblKxmoBOfL3DXopbQVVcFvATVE+d1kz4+35+Saf+W6SZ5HKqm6n1TPaDF5UZRg8FpPZdls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mtfZzJUY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721776742;
	bh=Utr/uvsI7Em2HGi2Ty9ybR8ggB1b1bqVDpXkfCxNtNY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mtfZzJUYnblbZBqSafaSyrlr3QPotGEMiRimryyP+uNfEST+vM8UtqA1tZaltVTKh
	 GVsN0Ij636XefMdk0L02HQTPv7EutGdZbloskrNKz+E8IihHTLlAi7QZmFzVTlosCZ
	 N6EnHqMBR6Rmj7kbZnUgSbz+V4NnLWE0kS1+WVEGi11Kznkpuj/JvUsM54uqeUUeNO
	 QfRackM22PwJlnukP0LBsF/MsaDgQJGUzElL841bgd1DvfikHtLcduUVkkmumh/RQv
	 Nr4s47VX6oJ/G/OO9ganDHfHfoROM7voicSsp4kwCHrd+o7HvyYD8Ie/b953CPDSdw
	 8ulLMkPEMVQ7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCl86RzQz4w2K;
	Wed, 24 Jul 2024 09:19:00 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:19:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the block tree
Message-ID: <20240724091900.155776f1@canb.auug.org.au>
In-Reply-To: <20240709175255.71439654@canb.auug.org.au>
References: <20240709175255.71439654@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bZ3/9Ob4lbQoGqV3IU5V7Ys";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bZ3/9Ob4lbQoGqV3IU5V7Ys
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 17:52:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/bindings/bindings_helper.h
>=20
> between commit:
>=20
>   5b026e341207 ("rust: block: fix generated bindings after refactoring of=
 features")
>=20
> from the block tree and commit:
>=20
>   ab44079e2869 ("rust: alloc: add __GFP_HIGHMEM flag")
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
> diff --cc rust/bindings/bindings_helper.h
> index 53c996e4bedf,f2bafb10f181..000000000000
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@@ -30,4 -26,4 +30,5 @@@ const gfp_t RUST_CONST_HELPER_GFP_KERNE
>   const gfp_t RUST_CONST_HELPER_GFP_KERNEL_ACCOUNT =3D GFP_KERNEL_ACCOUNT;
>   const gfp_t RUST_CONST_HELPER_GFP_NOWAIT =3D GFP_NOWAIT;
>   const gfp_t RUST_CONST_HELPER___GFP_ZERO =3D __GFP_ZERO;
> + const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM =3D ___GFP_HIGHMEM;
>  +const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D BLK_FEAT=
_ROTATIONAL;

This is now a conflict between the rust tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bZ3/9Ob4lbQoGqV3IU5V7Ys
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagOmQACgkQAVBC80lX
0GyPVgf7BRzzHaThH2btUPu7hjQ0yyUJ087h0138DMH+wyXWyCU1I5eaL50oL4yu
8QIFItczIgPmKF7gL9CoIn3ZzgDxOSpEnyyJYsoN8yy5Bjf6ljwcilNaAckqVA/W
4Qu89I0hfupunhDVgRdt1cOO0LoehNCiBsaFKjNw6vwpCLaYuruYP+BuPzCHudPt
9XTGioaCRXZvvoGrDEHP4pzL+tfBDqF2QaB6WGRy5iRPJjeVtJnItPW27MRltv0B
CgUEV9HP+vJr8Bsom3a5LLZ/uwJl7bZm14X0MIh2D8R0Vu9p7F3E8jEq6YbpkvqZ
U3Wd7pgoaZvYqP/gLVdrIODx9cFWsQ==
=+4Ed
-----END PGP SIGNATURE-----

--Sig_/bZ3/9Ob4lbQoGqV3IU5V7Ys--

