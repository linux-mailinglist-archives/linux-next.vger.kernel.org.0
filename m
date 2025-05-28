Return-Path: <linux-next+bounces-6949-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF1AC6034
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D164516C897
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080931E32B7;
	Wed, 28 May 2025 03:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XMt34V6n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0D199931;
	Wed, 28 May 2025 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404063; cv=none; b=VXO83PLFdr7SCQNxpulCID0dC9WoKWccKmbuFgIAS/vtVtYfHEmHyo5QePosVGHmyinUA96K8C6r3W0qXnBFzwY1XYpqbprVcBazoDu2Uau1stou7zI4QDGn9VApnBIfci9gwkN+KKVl5+xrNqDBT5yGG9ucnygm4Px3KLEhEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404063; c=relaxed/simple;
	bh=kHmg6K4hUuGfEE6/rRgMCBZrKFol9EIPcLFJBSSYN3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NM+a3fU5SYtWo0GDR+rizv2FMIsSJ3dDNx8P350nWjtGk8D1nNZvRJJjuWSLna6benvBnipXdtvR8d4Wcyx6VWeLM0hRnigYTX9BY73BUo8mBlHZVQZD5CtI2y7tUMMg6ppoDmLCcxy59vSsLgbyNZNCw99KdF6cLwxyWyF/4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XMt34V6n; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748404059;
	bh=cR7ylNJ0z7mTo/7GRrWKbVU0TIvdsV/dzioPLp3vEX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XMt34V6nG/uDGI8CiuJAyDPDl8aMUSF8hGz9x1HaMQ/l1ZbnlrYPc1Bf2eIQI7pqb
	 6o6Exd3MS8bkAIBa0MExguIFn3cxWb8PieG9Px6mWKx726XyhtJ7fTQNf7O+1iQRV1
	 jjDjLX44vkrSmQnzG+umrPREwcYqBquFm6e5KkqDGoSSPBLAz+UYx7ogj0LhYgRrpI
	 ptIfYvGu4QZ3JZhnLNB7JmyjkDi8FiMzlkyEN7PW3C6xaPImVcCg62OCEukWroV03w
	 t9Co9bTJgFGgQYxnIfXD/dRknQ2w2Rz11ecqnEKxxFVJaHet2nitRUmjQUumqFJ4sq
	 Nz0afmrHXl43Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6b6x0YYSz4wbr;
	Wed, 28 May 2025 13:47:37 +1000 (AEST)
Date: Wed, 28 May 2025 13:47:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20250528134736.5c79411a@canb.auug.org.au>
In-Reply-To: <20250521161656.429889eb@canb.auug.org.au>
References: <20250521161656.429889eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kjeyAj/giqHec70ax=Y_3eg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kjeyAj/giqHec70ax=Y_3eg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 May 2025 16:16:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/pci/controller/pcie-apple.c
>=20
> between commit:
>=20
>   3f1ccd6e85d7 ("PCI: apple: Abstract register offsets via a SoC-specific=
 structure")
>=20
> from the pci tree and commit:
>=20
>   5d627a9484ec ("PCI: apple: Convert to MSI parent infrastructure")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/pci/controller/pcie-apple.c
> index c3fb2c1cc103,3d412a931774..000000000000
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@@ -183,8 -134,6 +184,7 @@@ struct apple_pcie=20
>   	struct mutex		lock;
>   	struct device		*dev;
>   	void __iomem            *base;
>  +	const struct hw_info	*hw;
> - 	struct irq_domain	*domain;
>   	unsigned long		*bitmap;
>   	struct list_head	ports;
>   	struct completion	event;

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kjeyAj/giqHec70ax=Y_3eg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2h1gACgkQAVBC80lX
0GxePwf/Ytvv6La9pO/eUaEpjgHiNtv4gfboWHgu/ZE796DuoR8zOwBuCHVR9aEB
lQ1GLuEpAzJd1097U8DuMAPw9/UBuCegVBwMFgyq56t0ApULKQKA4h0euaaDgknL
9leuJq+uNj66ocxnwSY0yg8Ds74gBCaNq76c72sW+dOXTVDOx060DJvcxomOQ9R8
G9v7hOXT/Nv7sCD1zk5WXODIuzWz6JHI5KLxyrux1Jyb5kR5gZ5q8lVsJCxFv2Ih
AKEijw+JrYMpjOZyg9SgNUZAmf83FREY3oqoZ9S0pADoqAsWVZZS25pMfZEz45xN
hvGsEKhObKQfKAtQNXWMBbdD/i10mQ==
=diu2
-----END PGP SIGNATURE-----

--Sig_/kjeyAj/giqHec70ax=Y_3eg--

