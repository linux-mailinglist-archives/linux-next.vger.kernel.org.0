Return-Path: <linux-next+bounces-2342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4A88C7EF5
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 01:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209591F22C11
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 23:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6F12AF0F;
	Thu, 16 May 2024 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a/2yT3JJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C37273FC;
	Thu, 16 May 2024 23:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715901972; cv=none; b=TXNANl/ujy1nY8Twm8wdFhtcG4beqCSiAAg0+fTynkqxRx6wCjECc3tgUGqhIyKiCuhPMbNpzLEJSApyReD1krxl4ufA9vrIgaiDe/0W4pMQoObc6k3GY0fVKq80fAfldvhGSsekr2+j0oGWzCjeX0tCsHBrqlZmEsrbSYFc0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715901972; c=relaxed/simple;
	bh=yXmp54VLa+1Ob9pPxI0svhRSFqhEq/pEn9IngzRte3k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HA98rwXltvkgq99jZ/Mz9GevnwpO1nToXgwaED7hf5qndLkHll4GYPhZRXJFxlQbgoAjcQKQzZzTyj8Lp0J6UBvNHFtTlf3kODrYk/RIkuRGYzKuxcYxy9Z4mqXZbFbgRYg7FUYRWBxATneFYw7tN6AuLG5zybzuVgPrUwG4AIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a/2yT3JJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715901968;
	bh=GoIj6HHJXR4NSvNab0OEhckb6tIhU4f1StvdrCjeqw0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a/2yT3JJdCfsQQk9lvfIgFD5C356/el7n3gR7kaDdlmdkR7ug2PjJL5in6o3TnWYv
	 h7LkNs2Jhj2CLf+5jnG1BesAx0802m46rhfA/qAgDyhXlOkCzHhP08QkMjQpWNoPMe
	 t5aczk7p1Y6nW4vhUV1e+R2dfoXLZyvDMXWW+bNpLpsGivFSwrBONrYgj/PAV/xTFd
	 /hcsrZLNfWqMF+a+LuKYLonlCWT7ZlWHnULqFf+tvkZKhtGhnDYvqicklRgHIFC6JV
	 n9PWsQqQ74YiYG1rS1YEJnZKEEr1JbHQiULKMVOPFmCnq52QKDHLrQfGDDiXPMf7hZ
	 dGtoGXir0JxVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VgR6m2p35z4wb7;
	Fri, 17 May 2024 09:26:08 +1000 (AEST)
Date: Fri, 17 May 2024 09:26:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the modules tree with the mm tree
Message-ID: <20240517092607.0e3ec389@canb.auug.org.au>
In-Reply-To: <20240424122034.5b4a1a01@canb.auug.org.au>
References: <20240424122034.5b4a1a01@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n=d2tA+c6HS2gE6t_lhUWW5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n=d2tA+c6HS2gE6t_lhUWW5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 24 Apr 2024 12:20:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the modules tree got a conflict in:
>=20
>   arch/powerpc/mm/mem.c
>=20
> between commit:
>=20
>   c22e503ced5b ("fix missing vmalloc.h includes")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   7aa7eb8269ea ("arch: make execmem setup available regardless of CONFIG_=
MODULES")
>=20
> from the modules tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/powerpc/mm/mem.c
> index a197d4c2244b,5de62a3c1d4b..000000000000
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@@ -16,7 -16,7 +16,8 @@@
>   #include <linux/highmem.h>
>   #include <linux/suspend.h>
>   #include <linux/dma-direct.h>
>  +#include <linux/vmalloc.h>
> + #include <linux/execmem.h>
>  =20
>   #include <asm/swiotlb.h>
>   #include <asm/machdep.h>

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/n=d2tA+c6HS2gE6t_lhUWW5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZGlg8ACgkQAVBC80lX
0GwBDgf9FtY7Hs3fnXm8wxijL5rA6+ByHFzZSvJZfDUrpX4POlUF4dKw/J5v6iTa
pu1G+rFSGWmrFOW46tj4pXpQaIZ8z9JdahXLSk5gUFvnhDmVm5SyEFBTorPcPIQ2
mE9TfByUROgGPVqsaqUgd/BaiAAkXPBPsRCw9rvD5K8XeQRKEBQ/qF1V6+PYj7Ii
0l2DFqlvvoBzUfHqvd0xgsZdsZfiGPKxrQYQeLxXIrEe7Mek9LnDKbfCojwucteV
G4colzlVvn7CAD8N0giUd9k25OV26SmGQGzRI3cUJuXC6AjaAklfnGDzYmpmAMYH
1MkPVAIpj2VWsC9mdarqhJX0mG2InQ==
=Dm7B
-----END PGP SIGNATURE-----

--Sig_/n=d2tA+c6HS2gE6t_lhUWW5--

