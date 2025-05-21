Return-Path: <linux-next+bounces-6872-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C098ABEAFA
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 06:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C586A8A1C85
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 04:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B6122B8D5;
	Wed, 21 May 2025 04:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YHTUaS33"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98411376F1;
	Wed, 21 May 2025 04:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801952; cv=none; b=Ds7kTIQdb5IujTFcC1BOtXJALq9k/QSR6VIk1qMOAOOSoKpzPGmESuS7tUM8idQsUoCE5X+K0y1bGnU5tgK6toy+GZbPHfTTfyBgkvPROcbP9JLalNL8SEXRvvgidvmpqb3VrgIwYVDO3RNhvrWyHZa0YxLYKEVZrLu4d0fJJRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801952; c=relaxed/simple;
	bh=RwNZz/8uNp86BJmGD7l0tE5sOrl0a9eTgxlsSkaDalQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NE3L3lQhD4W4my1txtQ8DqJ1J0oUxwvk8gok5bkozYUutXwT5PwEYNWIKpyTllE213+tKcCO+TRoaRhgk08DMJjSucrc4hH+aUR7yCl4/Bot6oBs2BcKVf/b/0I0tl20v5HWOwHclT92FTp14hacwWYxa1eZ1LcyLlsV7uJuD5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YHTUaS33; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747801947;
	bh=lN2NliBTQk+h/u/lnDT5WgIFccUSgWwx0AmEgc2U9qc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YHTUaS33pS2rIR64MiVX6Qg34mo9V/voqEbx0d/dC99kBqNvU7xQhO1XUwPzWvVn9
	 sgBdsZVplFZiKOTjxz3AbKptWCFiMwtUf9fGdOZ61yExCtUEs3ze7uw7hekR/VheUE
	 R1RFUzkkvjhYsFd8m5RaHKnyHYcoWLc9VPD271Vu1lw45isg/TD3Cd9fowjcIItBzd
	 Gc0rjLoaMEoE8oG3z6yJQkxalQkawMXyi8t0efPDG7ULIE5Q1P5Pbd5LX2pkdOD6tH
	 6pZcAtUVhj8vEWY1DxK9PIQP+Qr3CGOfnErLwHQG7fUERmX3gAMsVrRZGMZEgzooVq
	 Eql9yeteLUReA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2JRv31K4z4xTx;
	Wed, 21 May 2025 14:32:26 +1000 (AEST)
Date: Wed, 21 May 2025 14:32:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Dave Airlie
 <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-nova tree with the configfs
 tree
Message-ID: <20250521143225.7ec5064b@canb.auug.org.au>
In-Reply-To: <20250513135521.44a26953@canb.auug.org.au>
References: <20250513135521.44a26953@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gRP3VBcGjRA9YtZHIxWn=Qw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gRP3VBcGjRA9YtZHIxWn=Qw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 May 2025 13:55:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-nova tree got a conflict in:
>=20
>   samples/rust/Makefile
>=20
> between commit:
>=20
>   1bfb10505156 ("rust: configfs: add a sample demonstrating configfs usag=
e")
>=20
> from the configfs tree and commit:
>=20
>   96609a1969f4 ("samples: rust: add Rust auxiliary driver sample")
>=20
> from the drm-nova tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc samples/rust/Makefile
> index b3c9178d654a,6a466afd2a21..000000000000
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@@ -8,7 -8,7 +8,8 @@@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+=3D rust
>   obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+=3D rust_driver_pci.o
>   obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+=3D rust_driver_platform.o
>   obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+=3D rust_driver_faux.o
>  +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+=3D rust_configfs.o
> + obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+=3D rust_driver_auxiliary.o
>  =20
>   rust_print-y :=3D rust_print_main.o rust_print_events.o
>  =20

This is now a conflict between the drm tree and the configfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gRP3VBcGjRA9YtZHIxWn=Qw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtV1kACgkQAVBC80lX
0GzcHwf/TjsazM2/iS8QbPIxGerkOGDJTcfy4yLsbEnZ4scZ9JZpfhUH6/NAAcVp
NmZBLKsQ6v/X6OGMJTAW0I8J76NOaeF29f91AYuysCRzAhc8547HGSxYgEOy/Iz7
HSFNGuLe3clRH3QeY8vwst88g7gU84kbBTrE1zZKjrDzrb6BVw+R00w6OQkp4RH9
secUS/9BcxbcxjATgyWDrefhxh4WdNnA/ysHFvt7fejCMsntb2/z2Rp564PXZvnF
vhf3N8pHXKcqV3FzIbf/QvwfhCQWnMu10Njj/xwjKQvQlOroJ474ZWlGXjKayZtV
kBQwokl/pc/EEWBm4tMexW/F18vKOw==
=Ak5K
-----END PGP SIGNATURE-----

--Sig_/gRP3VBcGjRA9YtZHIxWn=Qw--

