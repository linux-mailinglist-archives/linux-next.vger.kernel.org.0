Return-Path: <linux-next+bounces-6950-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE666AC6040
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047161BA71B7
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C6C19DF7A;
	Wed, 28 May 2025 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PLu+xZcQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08B195FE8;
	Wed, 28 May 2025 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404118; cv=none; b=ZJmgPEUzfGllx1syMoHACDwPFtK1YGUqkrYbCpw8L5kLLdnXPDjyI+DueyLj+KStR5jQznwIK/5J78XrdkOGscYuzw55Wh4QDtIjDPOUNhkRLb8NZm7JjJexTBi8S6B91cTt9EI8q4HPWK11a/99BquG0Ajw4nhk205Eoq+QOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404118; c=relaxed/simple;
	bh=470LBfrL+F2zu93W1Reu6s6BdVcybnUNr0ivKo7MMVc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afQ1unhXnI97XOTAfV6w7VYckwlPFD/AaY1Iqv6qUARWs2XZM5HG7CZIFBBOikwBVpDO/b0/z/KGgOIIq12S8TUUu02ODOH0K2SDKJJLDWrcztuIPXkpuo7fi25v2hNNUkCT36XoFMcdHQ8zyjIN0tKdp1ilujk/AvJCorJ+NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PLu+xZcQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748404114;
	bh=e1csxFsr9FKKZP4A5qTJlIDLNv/1tEaWp1fKhEkKVH8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PLu+xZcQtRqAp8BqCpwa4CFYlGlj9fQ+Sy+wEjzNBwM7BAPyXKHUUJzWSEjdJk38J
	 rqIP6efhoysc3+ApwPGGROGX85YD0eJISHkXUI2o7F8rUSakv+mQ/Z0TBf6oZzVZt6
	 dGV88DoqHwy9ggCqwV0Bxo6FSQTcYDDPZP+l3qVWoBO/z0bUTH0U+jUtcq5605sH5q
	 O04Gtwz8dVQDe3u+JegJQ+KtPdh9Ir4LaVSuEnwNrMUO/2l03xMChpQnB+RQS94KTt
	 Vt9LXBvJ584uNBeyv0iylbOEp/qfWDpFlyu/JjAIAx3BnPfDcczKC/OQjVaZOFYNEt
	 Bi7fTA8E7r63w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6b823xpTz4wcd;
	Wed, 28 May 2025 13:48:34 +1000 (AEST)
Date: Wed, 28 May 2025 13:48:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Philipp Stanner
 <phasta@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20250528134833.699ee6da@canb.auug.org.au>
In-Reply-To: <20250523132343.6f33b625@canb.auug.org.au>
References: <20250523132343.6f33b625@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//O.hRwo.cDV=Y_hCJsM/Mx8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//O.hRwo.cDV=Y_hCJsM/Mx8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 23 May 2025 13:23:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/pci/pci.h
>=20
> between commits:
>=20
>   51f6aec99cb0 ("PCI: Remove hybrid devres nature from request functions")
>   8e9987485d9a ("PCI: Remove pcim_request_region_exclusive()")
>   dfc970ad6197 ("PCI: Remove function pcim_intx() prototype from pci.h")
>=20
> from the pci tree and commit:
>=20
>   d5124a9957b2 ("PCI/MSI: Provide a sane mechanism for TPH")
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
> diff --cc drivers/pci/pci.h
> index e39a2a5df587,39f368d2f26d..000000000000
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@@ -1105,6 -1059,20 +1105,15 @@@ static inline pci_power_t mid_pci_get_p
>   }
>   #endif
>  =20
>  -int pcim_intx(struct pci_dev *dev, int enable);
>  -int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
>  -				  const char *name);
>  -void pcim_release_region(struct pci_dev *pdev, int bar);
>  -
> + #ifdef CONFIG_PCI_MSI
> + int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int index, u1=
6 tag);
> + #else
> + static inline int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned=
 int index, u16 tag)
> + {
> + 	return -ENODEV;
> + }
> + #endif
> +=20
>   /*
>    * Config Address for PCI Configuration Mechanism #1
>    *

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//O.hRwo.cDV=Y_hCJsM/Mx8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2h5EACgkQAVBC80lX
0Gwwpgf9G9kiGgWA7BiBIwnL9Cg6W4hxAZwlbrH3uuj7NVe5F/PGCnng576TW8CL
1S1qaAVtuxvLMsyJQjj1NuhA121WjJXlxpo/3YDRPB3lFAYm8cC8Eb2qBpjLU7jH
z960BRSk49JE+j3Qk8mS7rmeE5BsaKsBhbo/tv/9bNpKiJY0kRoSnHbO1St9wDaT
GmQ8fxBAu499SD42gw/gnaiNUpLxMZ4t/9ciPI4T/tTkJxsn/2GS0fhKhX2I873f
mZB5RP+0875jdIebQA37qUxg8045F33evJUOpYmnEDRksLewwtCQ9+gO0gNa+HY5
9cSNRaZQIHoSK60OUHcp3SQiKCGJiw==
=HaEA
-----END PGP SIGNATURE-----

--Sig_//O.hRwo.cDV=Y_hCJsM/Mx8--

