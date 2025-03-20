Return-Path: <linux-next+bounces-5901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5CCA69F75
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 06:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D92067B0BB5
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 05:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CDC1E1E0C;
	Thu, 20 Mar 2025 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aiQ23o1f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2B1E3769;
	Thu, 20 Mar 2025 05:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742449276; cv=none; b=BL8hL0ito0UwGA3PzTAg3REFpxPOLjciamMLjxWOJDgWPe2GqwNbQ/6nTiouQsaRum+W2DZQeMusDI9kTa15Sq2NzJG5vlc4T0MCvSziZfHlkuVxt1dCDz4WKrXftv3UeB6KuJG83rHYolSpFlvGJ8k5wHco2+5adQRg39PGyOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742449276; c=relaxed/simple;
	bh=FSRjntSQhWPLa02TONDY5WM1kzyi51yjXA8O7KZ11d8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkwK9ULb2wEyhOc1rR/nRUhR8hLNExtuFF9UhD5izO7M9BB8XnZkqw8nOWdtkmWAA8EJMPmPaJM5XuUJysdS5fL7scrhkmODnyo5KJnzi9amWQz4gNALY0cjfJevbEC9Ykpg+1Mudl6gADqmLyMqXGCtu+3VSNRnykDzLlpXMRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aiQ23o1f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742449268;
	bh=om4SfL+rs7yXAMjmCpcR7Chi7f9L0ieNUX8zveSiNcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aiQ23o1f+jZrqOsK2pg03xEcAhexQrbvHbm3HUgYj7l+LlE6ZOfzdUbfwwztm8TGE
	 cln+WZ2uosC9oABcBCbBl32zhvcJhawyyi/dQD6CAY02MXTR9OyVXoRMRCQGPdQOW6
	 LqorLZX+qwHZGFSTy7M+CFBFLmv9ATwg8N50EMHPoD/Qn/ugqqRIZQmvhGTN+uBoz8
	 Y16cINFUXtgHEBOdiMxHHvzyxTZJE9nQ52KmWfACuFrfuWoeKqM06NA1Yvc0CeCZcK
	 KyR2knlBwjyPHsPJvThV2JzOqo7n5ZXWIrZ8pUS1w5mMHopbIUkWRp3k8/SJDe3jdg
	 qvXJWoWXmm0vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJDvl6Bbhz4wnp;
	Thu, 20 Mar 2025 16:41:07 +1100 (AEDT)
Date: Thu, 20 Mar 2025 16:41:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250320164107.51f7737e@canb.auug.org.au>
In-Reply-To: <Z9qnl2bxFZ-Q5Al4@pollux>
References: <20250319180556.4475584f@canb.auug.org.au>
	<Z9qnl2bxFZ-Q5Al4@pollux>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o2tDcpD+dduaO+xh.g0XoJL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o2tDcpD+dduaO+xh.g0XoJL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

On Wed, 19 Mar 2025 12:16:39 +0100 Danilo Krummrich <dakr@kernel.org> wrote:
>
> The following diff should fix the below conflict.
>=20
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 63c19f140fbd..a08fb6599267 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use kernel::{bindings, c_str, pci, prelude::*};
> +use kernel::{bindings, c_str, device::Core, pci, prelude::*};
> =20
>  use crate::gpu::Gpu;
> =20
> @@ -27,7 +27,7 @@ impl pci::Driver for NovaCore {
>      type IdInfo =3D ();
>      const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> =20
> -    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<P=
in<KBox<Self>>> {
>          dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> =20
>          pdev.enable_device_mem()?;
>=20

I have added that to the merge resolution for the merge of the
driver-core tree today and it works for me.  Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/o2tDcpD+dduaO+xh.g0XoJL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfbqnMACgkQAVBC80lX
0Gw0mAf/a/d3kTac8y5zs/ehujge70tzHze+CLi6NpUOXIoVn2FcDV9uHVsskx23
1UaWfCsH+OBjy4u+Dl6CJ+Ch/Wse6C3wAZDR5ORxxIV0AdKKFXgMxlE8uYwAVMrL
QlsEiYNFjmcZMkvFA80EUCY/k7HGyEwapC7ZL8wzGZy7VViDq5wCr5gNxqOYeQQZ
WfOvPqKlNQYXTOVqnGb3XCRNKWyLb58CRNfCtPB17fDvwLNhDua1ohTCh59oJDTf
MZESYCy+d3suDDB81/PDsFpxZBfOwugE3GWAFniRoiH6cF4F9g6CoQ+Yy3nUt76o
RGgE6xGTwuiqfPUONIgkkw4qUXNpAg==
=RqmF
-----END PGP SIGNATURE-----

--Sig_/o2tDcpD+dduaO+xh.g0XoJL--

