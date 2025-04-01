Return-Path: <linux-next+bounces-6124-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A320BA772F1
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 05:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2EA16AF33
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 03:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0868F1CBE8C;
	Tue,  1 Apr 2025 03:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BVoJLmb7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783CB673;
	Tue,  1 Apr 2025 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743477726; cv=none; b=H1Gl1E58ohUvWi0lKFMqCLopFtATZY13OyBFhN0efsmB3xpePcdYC12p+CIjVSjRZ8RAoM/cOpCL+s+mzWpX4+/mL0qoORObYUbnYLgHgRpYyXFVqJ4ZxvbmCJiFpesUp3Pr5m9o4lOLVVoqJGOc5ZZzVnbZ/wbbYmBv9x+Wqgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743477726; c=relaxed/simple;
	bh=VZw2pYV3IXXQg2xhNsRRQIyVlevcvBLgPaL//dheS5A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PP0Snl6EFibFlrjug2oSzoMtxEzDZOZV7OhoeNRKTgpc5lfuPhjZ7dklYfMQM8pD3wYHtJQb83RdnrlhzjAUpZQ8c4g1XZSsZ0kTsibhX3ipWch24QYDyIerGph3m1+8AXpPB/M8zJGcCuaU4jW088s4zqbmtMXMs97+O1OwCus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BVoJLmb7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743477721;
	bh=6kz1VwHKILsWDlid7TS14Nwv5qyWGtTI62w3/+MpU0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BVoJLmb7NjtBy76umJa0nqqJWk8bbTfGJ86VonXS8apBz7wwB8o3w3yLeGJQfybdn
	 9wxm5JuDaDHlQ2yxL7BntkLjN2KVDYMRn645mF+nrJTeo95e4BQOFvYLkbg2BcGNOs
	 wYX96zZkaKVj3L6UF9RGhAOswI2jArlR+dGElCnOwE66lKMJ3jWD+zbBLZJDEOz14L
	 MmLB1PWWBpU6r43zUydmiBFzEaWVT0PjAMKSW05zIG7nPNS4vKcIjMtqvZW9kRslFS
	 ce8q5wIkx6Y7+1Cnfr0UJYo7rNt/iX46mdHF8OAF8rO/gjhV8uM1Bl0m9MJvUJUl8j
	 l/qpHLnkzlj7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRYFh4jbtz4x2g;
	Tue,  1 Apr 2025 14:22:00 +1100 (AEDT)
Date: Tue, 1 Apr 2025 14:21:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20250401142159.6f468edf@canb.auug.org.au>
In-Reply-To: <20250321185630.566dc075@canb.auug.org.au>
References: <20250321185630.566dc075@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i08cdZDqBePamcHQk8DzCXY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i08cdZDqBePamcHQk8DzCXY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 21 Mar 2025 18:56:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a semantic conflict in:
>=20
>   samples/rust/rust_dma.rs
>=20
> between commit:
>=20
>   7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
>=20
> from the driver-core tree and commit:
>=20
>   9901addae63b ("samples: rust: add Rust dma test sample driver")
>=20
> from the rust tree.
>=20
> I fixed it up (I applied the following supplied resolution, thanks Danilo)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 21 Mar 2025 18:21:27 +1100
> Subject: [PATCH] fix up for "samples: rust: add Rust dma test sample driv=
er"
>=20
> interacting with commit
>=20
>   7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
>=20
> from the driver-core tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  samples/rust/rust_dma.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> index 908acd34b8db..874c2c964afa 100644
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@ -4,10 +4,10 @@
>  //!
>  //! To make this driver probe, QEMU must be run with `-device pci-testde=
v`.
> =20
> -use kernel::{bindings, dma::CoherentAllocation, pci, prelude::*};
> +use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelu=
de::*, types::ARef};
> =20
>  struct DmaSampleDriver {
> -    pdev: pci::Device,
> +    pdev: ARef<pci::Device>,
>      ca: CoherentAllocation<MyStruct>,
>  }
> =20
> @@ -48,7 +48,7 @@ impl pci::Driver for DmaSampleDriver {
>      type IdInfo =3D ();
>      const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> =20
> -    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<P=
in<KBox<Self>>> {
>          dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
> =20
>          let ca: CoherentAllocation<MyStruct> =3D
> @@ -64,7 +64,7 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) =
-> Result<Pin<KBox<Self>>
> =20
>          let drvdata =3D KBox::new(
>              Self {
> -                pdev: pdev.clone(),
> +                pdev: pdev.into(),
>                  ca,
>              },
>              GFP_KERNEL,
> --=20
> 2.45.2

This is now a conflict between the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/i08cdZDqBePamcHQk8DzCXY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrW9cACgkQAVBC80lX
0GzwFgf8CHfegwu2VpWF7Hc87eAsNBn5N2yrHmYcxyK7d5rV9WimuByxKpt3EJ+9
9qgCnKtaOA0hQ0M8y4rcnv5AkDVaKrG/w/Rayfa4EweX8PpgpO67TBHbUpx7GZyW
7YpsvL50XbtVSvpMxXLGI+HLY66HPdsXKZ9wQGrdU3KUv6IrtAx+xA/7EBZX/qKt
MxoQfd2bW4LI/B8NrB+r3E/0R3NnQTHDm6r9a7NSbZD8Rzvmc+asZAJucPxOAwIK
iMZUANfSKfmCayP1mbitU0zIfY8cfS5rehfGjByfGnxaYxONxNasFQmktHiWS0td
xopvwyYnfXoMr90GsFT1Xn4+wn9ppQ==
=R2pX
-----END PGP SIGNATURE-----

--Sig_/i08cdZDqBePamcHQk8DzCXY--

