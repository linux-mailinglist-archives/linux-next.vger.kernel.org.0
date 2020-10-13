Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4218D28C974
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 09:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390018AbgJMHew (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 03:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390362AbgJMHeu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 03:34:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C08BC0613D0;
        Tue, 13 Oct 2020 00:34:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9S472H0Zz9sVL;
        Tue, 13 Oct 2020 18:34:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602574487;
        bh=xtWjdMs/3CDfLYum2CFyA2pchAXKUKoEOiejJZzr094=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U1NFe6Ybo8PG/jQifUjkL56z10yrGhkMsuNfqXNifArcEohVJWOnwq28oqmsFcP8i
         72EblQgU3GCiEnkT+UEbckXPoOCRNS2heZuDE/Kjtg1V1t1MmMXhhwl9Oq2SsSByTS
         8zOWkiE3EBq/Ltzm9cg9JvaeeeFrWkV9kwF5jyv5Dn0BGsdhaXRU9Kt1x7++sOYurK
         ef8TXV8/7kracBia6zebxIesY3X/SH8+yZ/DGMiU4tIvuKe+FC5NJeWl+yV9hwYTMo
         FsQ/G5SRfqHxO33Pczk3yCPRGPhbJzmQPe4jo+TYOPw8TV40on9R6qwVY9sJ1RQ7Gh
         3ZoR+wyIcHfKw==
Date:   Tue, 13 Oct 2020 18:34:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 arm64 tree
Message-ID: <20201013183446.654826bd@canb.auug.org.au>
In-Reply-To: <20200921180353.421484e8@canb.auug.org.au>
References: <20200921180353.421484e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wUROmdlMdSgGnPMMDIarwSo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wUROmdlMdSgGnPMMDIarwSo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 21 Sep 2020 18:03:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/arm64/mm/mmu.c
>=20
> between commit:
>=20
>   0178dc761368 ("arm64: mte: Use Normal Tagged attributes for the linear =
map")
>=20
> from the arm64 tree and commit:
>=20
>   8e19cbb9528f ("arch, drivers: replace for_each_membock() with for_each_=
mem_range()")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/arm64/mm/mmu.c
> index 087a844b4d26,64211436629d..000000000000
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@@ -493,21 -483,10 +494,15 @@@ static void __init map_mem(pgd_t *pgdp
>   #endif
>  =20
>   	/* map all the memory banks */
> - 	for_each_memblock(memory, reg) {
> - 		phys_addr_t start =3D reg->base;
> - 		phys_addr_t end =3D start + reg->size;
> -=20
> + 	for_each_mem_range(i, &start, &end) {
>   		if (start >=3D end)
>   			break;
> - 		if (memblock_is_nomap(reg))
> - 			continue;
> -=20
>  -		__map_memblock(pgdp, start, end, PAGE_KERNEL, flags);
>  +		/*
>  +		 * The linear map must allow allocation tags reading/writing
>  +		 * if MTE is present. Otherwise, it has the same attributes as
>  +		 * PAGE_KERNEL.
>  +		 */
>  +		__map_memblock(pgdp, start, end, PAGE_KERNEL_TAGGED, flags);
>   	}
>  =20
>   	/*

This is now a conflict between the akpm-current tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wUROmdlMdSgGnPMMDIarwSo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FWJYACgkQAVBC80lX
0GzP0gf/Sc5EMLCooF1Yy9HypdIBIAA2BNBwPMPQolo7juOPVrUI+betJQikWnHN
Sc/oEc5PyBDXFRU3t5nLbdxFkOrZEYsVSRZqcarEHeMwkcgfen8+fnc0eGmNuIa4
VBg90C7/Bd+XYTwLLrchgU3YdJNLdGnhs6dbJNwqex+PcwWawlXDSocn5eucDreU
CkbS+4LTtGeHb/bU9kNufsnx67uCgzZiaWICuPAUYmZ7S/HQm3V2XFMRvdk0HEAX
WvpkW/FoHm8GWwNAjyirBlgDc7+meeTiYd6zyZb2jfansyWPuv44klXIgVZgNSD2
gGKG9L46SN93CgavXVTaKNL5lP5kAA==
=FHGx
-----END PGP SIGNATURE-----

--Sig_/wUROmdlMdSgGnPMMDIarwSo--
