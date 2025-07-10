Return-Path: <linux-next+bounces-7448-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79AAFF591
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 02:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0F8564434
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 00:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02A7A59;
	Thu, 10 Jul 2025 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vdlk2SkC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4EA29;
	Thu, 10 Jul 2025 00:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106223; cv=none; b=XAWJ2znaCKPJPMQBI50sFFonmiu0N1PcGfDsDx0JsEHYGoZEfW0leRvF4h41zxRkpWJVrgmIsuncY9OvtMg18vBdd31kFlbfdNuuH9SJRSRhX5WTOw6/EYg452oFQJgXVt/oqXt55kIBZjoj2TSwOq/FKRFEvqEML+O0l1CyUKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106223; c=relaxed/simple;
	bh=7E+xxRyUjaqAzFFKfK8eHYk+TjV6i7kblWPRj0/L+IY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADcIPF+xadAugGTJ2TPjz+VaLdMPKq0HW5XbzSCnX9iPgF/HIQ8Bwf5c8LoWkvtsiwOCsoS/7sYoDYrIMFxmosk6L4j+2pPmJ0EjLy+2niOUaFyxhu1YKP4xYtQmT3izA1b7U9yN8lXhK9SCdBqDEP3w9nUM/g7Jwk7fflVVHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vdlk2SkC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752106145;
	bh=5qEaJY+f97ZoD4Fmfw8fXzfpeAB9b4jFxigSeJES+mI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vdlk2SkC5VUotzykhzjx2EEJxVz3xqfAlRmDoV995QxssvyPoQyRCpUwB3XXSQQOS
	 cZegMwOdCurApgzx3a/1z75gkN0rBJ6zg9+8SHDLCgy7rxeEgAYnLFbn6DfnlIgtu6
	 H/LMpXTxlpE6uxCOABZIu5J2yB/aGkKQuXOL/KqUZdPLdQR59uqbKJky9/ry59z7++
	 2ZKptqhpEnn68m8jSxuer2mQDXotR9rX6fkn+A7gmbK2/ielbnOQrfilT5x7Ixg/dW
	 eMqRXLa6/pn17kZYNK2rgfc92dqqnerTLT59vZDyaqJK15XZQHyqkCp/Pnb+NqjO5Z
	 RThNf9Nf3aZ8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcwDx4115z4x47;
	Thu, 10 Jul 2025 10:09:05 +1000 (AEST)
Date: Thu, 10 Jul 2025 10:10:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20250710101015.3033ca44@canb.auug.org.au>
In-Reply-To: <20250709181631.GI592765@unreal>
References: <20250709233953.7afb7a8a@canb.auug.org.au>
	<20250709181631.GI592765@unreal>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DhmNvjei3inG+0qREg3VIte";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DhmNvjei3inG+0qREg3VIte
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leon,

On Wed, 9 Jul 2025 21:16:31 +0300 Leon Romanovsky <leon@kernel.org> wrote:
>
> I assume that this will fix the issue:
>=20
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 29e8594a725a..cb8936e4ffab 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -157,7 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr=
_t phys, size_t size,
>  {
>  	const struct dma_map_ops *ops =3D get_dma_ops(dev);
>  	struct page *page =3D phys_to_page(phys);
> -	size_t offset =3D offset_in_page(page);
> +	size_t offset =3D offset_in_page(phys);
>  	bool is_pfn_valid =3D true;
>  	dma_addr_t addr;

I found time to test the above on top of yesterday's linux-next and it
fixes the problem for me.  Thanks again.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/DhmNvjei3inG+0qREg3VIte
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvBOcACgkQAVBC80lX
0Gy7jwf+Pu+62IXPXlq03LXnNi4BBYxZSQNru/N0Iqbh79Imbu7TSFo7hsjK4AGp
gMVsT8OU/wp/B8IbHY3TZZt3gvcoMmxmLyyfxfA7UCxgjL7ClOo6Ck291qUfO73D
UF+QDuy15HYvQOsY0u5SANFqcf5OkXCOI5dLpMdFqIpa+JzqA80lYaDYSe93h52m
EITmb+mzJHXFd8puyahfYtS0eSs1VDePjDADqdixj29/uc6+nJUvdDoN4ex1rmZg
JN5K0slXVxX0jai8wZNdOJfM72f9KHMi38M8GA5o+pPukojibUiVVWcrcPeXWiwB
nZLprocsAn2TEZwLa6JjwUkGxAN0Ug==
=Usp3
-----END PGP SIGNATURE-----

--Sig_/DhmNvjei3inG+0qREg3VIte--

