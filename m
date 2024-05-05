Return-Path: <linux-next+bounces-2167-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C458BC466
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 00:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB961C2095C
	for <lists+linux-next@lfdr.de>; Sun,  5 May 2024 22:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0062136E20;
	Sun,  5 May 2024 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nyeGfYBR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DD136E03;
	Sun,  5 May 2024 22:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714946640; cv=none; b=uIUnlRD+Xh4d5EZyA1CpinJ2Po0D+2JDFZkW0N5QOOEoOn6Pn1PjCA2itdiApoRnulZfncEmOOrUn7C134DsWm8AnJLyjzZ5Y6ZONVha9mnYbsRMC1qSlALCymkMsf8dmEWyPsqIarSCIIM89mqJslulNpnHVSQLAr6mpeh5i2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714946640; c=relaxed/simple;
	bh=eEAYQXfdxuIVc3yHy+1MMCH/JfdJJ4pV9FJy1JHE27o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XC8MsaaDRIWtg4fZe98tC8gXGXop6cnSyH9GGVwybnn+xo9nCQZZrkTmzIBwc98+Iz2BMjt6CLGm5Vbdu22LZo0wD4oLn+kJDUU1gosoMwr1pRDUr/vnKEBm1dREFFp8lHZxhLhXupSGFsW/gpQQcDhZABhLIldKXFJ9Dv5zoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nyeGfYBR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714946636;
	bh=tVxnR5AG3Vk1TVk5CYYSoNFW2ZV7l8WgVqDajRnQ3Vg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nyeGfYBRcOI6wibIOIYR38qj5NRniTtO54y0fRMAeKsx+xXFpXYlsSK04gAmIgHxg
	 YwjFbEZvn2nIHDZ+oVJ2EkrXZV6ghCmJyR6jgt+VcGpLIaZ0iBCCZgb1b3cId/25rH
	 kEkdmYuhXfQm6H0rWiBEewnpSyNxCTNEhvrZI5M+S9KHtmAKqiWRkg9Ac1e19B+HIT
	 F3X9YyiQyvadI42qYjN3Fr+C7bqgIJ7wBQqB84EnzTh7Rv//AMQIJOPdyx6CRpRaLu
	 u2HeB4hPB2VjAWHhin0f3KmiZ48ijLdYmZZRMCZ0GJBfaN0U2UBKw0B7c9ea8ucjQw
	 DV3EIVRBVgzQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXdq00YY9z4wcR;
	Mon,  6 May 2024 08:03:56 +1000 (AEST)
Date: Mon, 6 May 2024 08:03:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Wu Hao
 <hao.wu@intel.com>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the fpga-fixes tree
Message-ID: <20240506080355.7550e2e9@canb.auug.org.au>
In-Reply-To: <20240501083805.76e87698@canb.auug.org.au>
References: <20240501083805.76e87698@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OXA8nZ68_l/EM6BGrLxnd_O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OXA8nZ68_l/EM6BGrLxnd_O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 1 May 2024 08:38:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> The following commit is also in the char-misc.current tree as a different
> commit (but the same patch):
>=20
>   54435d1f21b3 ("fpga: dfl-pci: add PCI subdevice ID for Intel D5005 card=
")
>=20
> This is commit
>=20
>   bb1dbeceb1c2 ("fpga: dfl-pci: add PCI subdevice ID for Intel D5005 card=
")
>=20
> in the char-misc.current tree.

This latter commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OXA8nZ68_l/EM6BGrLxnd_O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4AksACgkQAVBC80lX
0Gxsfgf/fbUvivwCFPt+6iP3cvtP5ZNcPekR82VNN9zUNUnvJbLBrZZAL0Vgs2Li
F3UvtXbJzmt3iXl4135csIAZQ3UAn8srZVO3it58V++LkZ3TlXjI9TUFB1N0ne2l
S9fwxif8aFsIBCYHuzah/yzVeKWDx+VvQ1mNXROfKkpDBYjBqQXk802NJlD2fwsD
EDWkO3F+DtnOoG2/Z/g5FOpIEtjrS3mdjCRDLeD+whjpAUAaM2Sx7LlThmoTxHxy
VKw0+ZwPSA2nnnJwIoXuCGcfK/i4vMNJfbnrho6sMTOzba5bvL1AlETmkZIAcLCV
Ol7ZSVxWRLHx+ambiM8PsQqaPxjN/g==
=ennv
-----END PGP SIGNATURE-----

--Sig_/OXA8nZ68_l/EM6BGrLxnd_O--

