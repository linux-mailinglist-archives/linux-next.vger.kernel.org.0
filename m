Return-Path: <linux-next+bounces-3883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1723997A9EA
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 02:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D246285C80
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 00:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7873910F4;
	Tue, 17 Sep 2024 00:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RggufBgJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C07F6;
	Tue, 17 Sep 2024 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726532474; cv=none; b=fEYVXffHhwH3hrk1dMBI3qNsYsnK4w0mv6YHB9xcHJ6GUi+/qlxuT8bSIXsW1WWHvPkuIKDOhxenzr23LGtbRLEkzIygMNdn174SYDfliPgAzJo28kDeGBZAYnHH2oDrj8A3EpXA3Z88x00xmbc8FHC4cGkyaz45XORkgJdcv6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726532474; c=relaxed/simple;
	bh=3ZgGggHoX+pAh/tHkULzDYABI3Zv5CzNqsFGMvdZri8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONUcjQj9WHt/otcVxYrgFTEBfipRUKY6aMdWhIgC0b3Bl+bHNN4uI1+UGFiGK//G0WIhiNdUigXHsAWjowBfntl2fnLEGkZumQ9PMxBszNTld9HjGQIGDzCEumbi7VUByyiNu04pk4Yzrm/9HKlnoPMnDvvuvnfmEPssL0EL1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RggufBgJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726532468;
	bh=GG4tVFfNIhA20Bp/ypoPSDXgsH5ws+vJCG1ZE4vzUr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RggufBgJiRvUzdGE322E8xlaWSERRWW4zKXlVDk1dbnSZ1tCmDod05NfZFdjRa7HP
	 Oham83w4evFVlRCRWJZxDMnCMQ/sGuJU1AyAEZjBx8Cm4DL5s6MlngDzfOO0O1D0Yb
	 WBxkPc5qXk+KflwkdB3Ef2z4yiSFZAdDNvZFIVFddiNGfswLb/gztDkqUrJWkF5JTG
	 XYq6gHMe6KjIO0SF0bvmfjD2NRrCAhzEp2oXRc7A1zybE1Cw+jNtMgKeymTY5QVmXK
	 HlYuo02fCl65r/Kvk6S+ZrK9oWghvrnTQZD2JLk7VEqfR1KXZ74kbwBzJVlXu8QRwi
	 TLUIuvhwgD1+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X72WN3GBqz4xZ7;
	Tue, 17 Sep 2024 10:21:04 +1000 (AEST)
Date: Tue, 17 Sep 2024 10:21:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "Rafael
 J. Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura
 <takakura@valinux.co.jp>, Sunil V L <sunilvl@ventanamicro.com>
Subject: Re: linux-next: manual merge of the pm tree with the risc-v tree
Message-ID: <20240917102103.0e29172b@canb.auug.org.au>
In-Reply-To: <20240902121140.51cc49c9@canb.auug.org.au>
References: <20240902121140.51cc49c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2qDCC+iALDf98l+Lmvw/OjJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2qDCC+iALDf98l+Lmvw/OjJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2024 12:11:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the pm tree got a conflict in:
>=20
>   arch/riscv/include/asm/irq.h
>=20
> between commit:
>=20
>   f15c21a3de1b ("RISC-V: Enable IPI CPU Backtrace")
>=20
> from the risc-v tree and commit:
>=20
>   f8619b66bdb1 ("irqchip/riscv-intc: Add ACPI support for AIA")
>=20
> from the pm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/riscv/include/asm/irq.h
> index 8330d16b05b5,7e9a84a005ed..000000000000
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@@ -12,11 -12,8 +12,13 @@@
>  =20
>   #include <asm-generic/irq.h>
>  =20
> + #define INVALID_CONTEXT UINT_MAX
> +=20
>  +#ifdef CONFIG_SMP
>  +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_=
cpu);
>  +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>  +#endif
>  +
>   void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
>  =20
>   struct fwnode_handle *riscv_get_intc_hwnode(void);

This is now a conflict between the risc-v tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2qDCC+iALDf98l+Lmvw/OjJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmboy28ACgkQAVBC80lX
0GyDNwf+OhluL8ix9RtWsSsvBom/TEC8YT2L48ZI1m9JbCcgr2ZCgRlWTiusP08s
2giZuwEJmSF4Zzwnr4auHf3y1PDHxtFqSz72ZIJDmzYxNQw4nJiGUTT0lIxNgV+E
YeZpFy7fPatYsO0nPTpRutvapj+tapKK9dikcuQpm2Hmn1rv7kEtbi2p8AfNKWWN
DCHcUm7SeYlbGqmCgTNFAynoNbktGJ3sDlCRO5gzw0Mi+xF9WkMoKA5ljYm5SpPJ
q0aSg4W4TBkK1Bj3xndtL/gbu5CbKLlEnHtUwyQ4K0vjRQsencbFr+et4gjMaS/U
HNOXbEVAQWTiU7QJK3IMSHdWNlOR0w==
=g5Uy
-----END PGP SIGNATURE-----

--Sig_/2qDCC+iALDf98l+Lmvw/OjJ--

