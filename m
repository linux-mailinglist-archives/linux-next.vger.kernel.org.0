Return-Path: <linux-next+bounces-6120-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2775A77196
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 01:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FE28188628E
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 23:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D60A21C9E3;
	Mon, 31 Mar 2025 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XosN8NtJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A51DC9B8;
	Mon, 31 Mar 2025 23:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743465537; cv=none; b=OOvHSj1yVCsy3PJl4LxK1sOudzkb1n0Lx9D0Fzpt1/4PsRySxa+f/fYKGzjWJII/yiTIdh7NSZw26x40Z/RBK144R+T8YsPdfGeyw1g1EzBHGveqYY6vTKwE0elRBDcul/zKVf3kv32mfDGxCBpm3s4AOTu9fF+uk+sSPSmUJgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743465537; c=relaxed/simple;
	bh=menO4sDEk3l45fnsd0YQAAdQADVGd+u3djMWqArXze8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFNGFoLjgM35Kg3mAxPF+FjgNIdSESSlU0wzCQRA3jg81j2TpN1cNqRcy23XI4T5B6MvAXTqmkJAniqiQPpbu5o3dsefcGmDPSnQ28d35ce2gWKbOChzOVp29Zg6AU7iG7SKRLCwxd1vN88QIFVm88Z3CvfxLTgQmynr+293DuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XosN8NtJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743465531;
	bh=h4B1PPTydGZ2muA7rAU7uWBbHuGLy5fpc4PfjuS1hRQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XosN8NtJeRfDe1+tylNta3ayDdJwqkgVAEwQoH9orSLW8tBd0mi8PP8/wP6GbKhiu
	 8ARhpyW6jztEy1kjtVW2vEjWVEU5xWvPsysO4byNYRH72imOu2sqk/xuKtd5NP+2I7
	 cF/RcprwYSwImekVZsKIOWdQ50Y07gHIRZjNeytbqgdbANaKAJOIv/ep8SS6F2l03N
	 JnaxH+jSkUyVjekxDVMXn77kiKSkYtDXMRl0ySlinUdN7A+0nFTpRx1s2LGcEjUooZ
	 qcv/md+v0QA8UPNbKiVECexGQGWE6c4yGb0e34dwFw1Jvy0pBSdhJAMbQEWVTH/lgB
	 tc9IDSuIH11Fg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRSlH0XVSz4x5g;
	Tue,  1 Apr 2025 10:58:51 +1100 (AEDT)
Date: Tue, 1 Apr 2025 10:58:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20250401105850.171beb9d@canb.auug.org.au>
In-Reply-To: <20250317203806.63d4bc95@canb.auug.org.au>
References: <20250317203806.63d4bc95@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x1AnGmJrWppbkV5yxRc8MoQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x1AnGmJrWppbkV5yxRc8MoQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Mar 2025 20:38:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/Makefile
>=20
> between commit:
>=20
>   e3de46f775ec ("rust: kbuild: skip `--remap-path-prefix` for `rustdoc`")
>=20
> from the kbuild tree and commit:
>=20
>   d7659acca7a3 ("rust: add pin-init crate build infrastructure")
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
> diff --cc rust/Makefile
> index 089473a89d46,e761a8cc3bd5..000000000000
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@@ -175,9 -199,9 +203,9 @@@ quiet_cmd_rustdoc_test_kernel =3D RUSTDO
>   	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
>   	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
>   	OBJTREE=3D$(abspath $(objtree)) \
>  -	$(RUSTDOC) --test $(rust_flags) \
>  +	$(RUSTDOC) --test $(filter-out --remap-path-prefix=3D%,$(rust_flags)) \
> - 		-L$(objtree)/$(obj) --extern ffi --extern kernel \
> - 		--extern build_error --extern macros \
> + 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
> + 		--extern kernel --extern build_error --extern macros \
>   		--extern bindings --extern uapi \
>   		--no-run --crate-name kernel -Zunstable-options \
>   		--sysroot=3D/dev/null \

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/x1AnGmJrWppbkV5yxRc8MoQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrLDoACgkQAVBC80lX
0Gy5FggAgiGbx5AKDem4lklXDGDz49T2iCsPF9IbcG98vzugLFDD+6NRuxQYvbjJ
d1uJFYTIDwWy+kVgbDpbLq+Nj6IPIcUHIXqkCzvr/w+CSAYLUVAnxEs75ekJw8Hi
b/3gV/iGu0QuJzQPAUfbRBbwSueJKsrJgGtr6pyOU6RNdFZDwW3GAbLpTFgHR6eY
ayWNFT+zT/+4o8iB2zZCJosAhl7V+SN46VIFFu518oLCcHme7+Ua3cFv2ert3rtf
pe2DGM4WqAhUEF0fIsXua4Sm0yBPtcPeOmbQFIh5lwXi/p5zTuNjESzfp2X9nvSn
lxKHeGjI3hGtAG2CGoazcAGpTm/U7Q==
=HmpW
-----END PGP SIGNATURE-----

--Sig_/x1AnGmJrWppbkV5yxRc8MoQ--

