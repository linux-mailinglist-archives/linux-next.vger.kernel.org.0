Return-Path: <linux-next+bounces-9227-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B85C8AA53
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 16:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B811D3AFD05
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 15:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EE43346A8;
	Wed, 26 Nov 2025 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOQKjj12"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177F7334698;
	Wed, 26 Nov 2025 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171040; cv=none; b=AckzG2ziAizxb6rJvlLR63s8ZnumTmWt4coKDKvp3927ls4aIOIT35XIb1dVxJMWTiyZ5eh/kikweh/ctaJGRfxFFluNKWccNBNu7ckwga5l0nWWaYGq/perJ3PRT313eX9ucF9PrlcVI7ZTnbWhxxSmC/tAhP+O5HKrEU3zIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171040; c=relaxed/simple;
	bh=cWNAxYYMlJ5hlWBj+1KaKsCm5HgO/QaekBh3jUhGvR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wnd717jnyTkVUXEfsGZ8nxB0GZ3PzlmeaRAJlg3jMMOAsR4BlveMCWCvWm8XCj2G9YXk5qj4P88cZKTyt9LnM44/qOt7LIiFEw/MHC9I4XT2/lDkou1xfCzd9eQMgaX2hd00+zmBjg7WNjtG7w+U8aDpQ0S/EW9aQbiRF/OqEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOQKjj12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A71CC113D0;
	Wed, 26 Nov 2025 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171039;
	bh=cWNAxYYMlJ5hlWBj+1KaKsCm5HgO/QaekBh3jUhGvR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOQKjj12rKHrxKvXRLfq9BjbK9W2ch3ArAAYC9S/g/0F6wGUqOIyFJ1O9VbsmdPar
	 AqYSWadNmVot4bE4eh+qrSux+Mw4m47QZOaAcmUuiv1WPxnEV5L2wwm3ykDju0A78+
	 Wd2tqcjrBZJ27Ga2UTrnsXzGQ02jB64ncXvj55jE1oq2SXo6bXS3OlyII4VVkpbAZ7
	 651FWy0P/W9UwQravJMfTKLngVYf9wSB2dw06eEJfp9V4KJpGOFqd67Nsn2ysAsfU5
	 JdpzGipTfMc/HHl4zEiNtfdon0W3YLcOKgjV69DAxkIoDf08NU/zCmmk7FR9MBE/9c
	 2LwP0JGKxTJ+g==
Date: Wed, 26 Nov 2025 09:30:34 -0600
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm-soc tree
Message-ID: <aScdGuUjxJ3FkwYg@gen8>
References: <20251126094511.07bdf834@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RlElvJGJSVm6EJMd"
Content-Disposition: inline
In-Reply-To: <20251126094511.07bdf834@canb.auug.org.au>


--RlElvJGJSVm6EJMd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 09:45:11AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the risc-v tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   4de28f1edcfb ("dt-bindings: riscv: Add Tenstorrent Blackhole compatible=
")
>=20
> from the arm-soc tree and commits:
>=20
>   e0ce62cfe3a9 ("drivers: firmware: add riscv SSE support")
>   832fd6c2e55c ("MAINTAINERS: refer to intended files in RISC-V SSE DRIVE=
R")
>=20
> from the risc-v tree.
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
> diff --cc MAINTAINERS
> index aacd4a754dab,6fa1048c248a..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -22247,15 -22195,14 +22254,23 @@@ F:	arch/riscv/boot/dts/spacemit
>   N:	spacemit
>   K:	spacemit
>  =20
> + RISC-V SSE DRIVER
> + M:	Cl=E9ment L=E9ger <cleger@rivosinc.com>
> + R:	Himanshu Chauhan <himanshu@thechauhan.dev>
> + L:	linux-riscv@lists.infradead.org
> + S:	Maintained
> + F:	drivers/firmware/riscv/riscv_sbi_sse.c
> + F:	include/linux/riscv_sbi_sse.h
> +=20
>  +RISC-V TENSTORRENT SoC SUPPORT
>  +M:	Drew Fustini <dfustini@oss.tenstorrent.com>
>  +M:	Joel Stanley <jms@oss.tenstorrent.com>
>  +L:	linux-riscv@lists.infradead.org
>  +S:	Maintained
>  +T:	git https://github.com/tenstorrent/linux.git
>  +F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  +F:	arch/riscv/boot/dts/tenstorrent/
>  +
>   RISC-V THEAD SoC SUPPORT
>   M:	Drew Fustini <fustini@kernel.org>
>   M:	Guo Ren <guoren@kernel.org>

Thanks for fixing this up. It looks like the correct resolution to me.

Tenstorrent MAINTAINERS patch is in the tag tenstorrent-dt-for-v6.19 [1]
that I used for the 6.19 pull request [2].

Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git/t=
ag/?h=3Dtenstorrent-dt-for-v6.19
[2] https://lore.kernel.org/all/aPUemXdOFZEdkayE@x1/

--RlElvJGJSVm6EJMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaScdFQAKCRDb7CzD2Six
DAlpAP9MEEev3Nsw6UvuNV6ewwCGZ/1J4EvRmRaTGObPhydPpgD9F9R95uB6LoRK
zChI5YQNXgMlHGxKgwkD+QAvgFf5Hw0=
=FM5A
-----END PGP SIGNATURE-----

--RlElvJGJSVm6EJMd--

