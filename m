Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1DB3439A6
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 07:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCVGki (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 02:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhCVGk2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Mar 2021 02:40:28 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B426C061574;
        Sun, 21 Mar 2021 23:40:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3lHX2qYkz9sS8;
        Mon, 22 Mar 2021 17:40:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616395225;
        bh=1nixCOUzlIxfcWyrKNO05b2wI9KlMHWHaMpD+huHV50=;
        h=Date:From:To:Cc:Subject:From;
        b=ceQiKo4JilnACfC/u2LG8c6c06QATLMBMBRYNz+eYb7hc2x4fRT3CrfNe9AQX6/Ux
         Hy2WWCe9ENY+6yiD88oWJvRA1uazzuuM3ELuIMbu1DwddT/F7PlzqurPwqSGCXLIJr
         FLThTA5oZaVhIgVIHUMRZRc/6nc5waz0oSj/uQL6w2mjFdQNJcMwRC2ZJNmURCw2Zd
         ahns8TN5dj1JE+p5IvvNCYcandRnJn2N16quCsboS5Az4cf2UDD0Pp8FvPcha+7PpW
         zKlSMaYURw/7cwx9h3sdGDtxAGPEF9wJfKA+WRKfkKFS/drDz6TV9NNMjbmdasDm5L
         rRdb7MajAAwsw==
Date:   Mon, 22 Mar 2021 17:40:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20210322174023.602a110b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gF60RUGOCeApvhNL8GKktWw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gF60RUGOCeApvhNL8GKktWw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  87143f404f33 ("arm64: mm: use XN table mapping attributes for the linear =
region")

from the arm64 tree and commit:

  0a2634348ef8 ("set_memory: allow querying whether set_direct_map_*() is a=
ctually enabled")

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/mmu.c
index 4c2305cca6d2,fb675069a3b7..000000000000
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@@ -503,20 -490,11 +504,20 @@@ static void __init map_mem(pgd_t *pgdp
  	phys_addr_t kernel_start =3D __pa_symbol(_stext);
  	phys_addr_t kernel_end =3D __pa_symbol(__init_begin);
  	phys_addr_t start, end;
 -	int flags =3D 0;
 +	int flags =3D NO_EXEC_MAPPINGS;
  	u64 i;
 =20
 +	/*
 +	 * Setting hierarchical PXNTable attributes on table entries covering
 +	 * the linear region is only possible if it is guaranteed that no table
 +	 * entries at any level are being shared between the linear region and
 +	 * the vmalloc region. Check whether this is true for the PGD level, in
 +	 * which case it is guaranteed to be true for all other levels as well.
 +	 */
 +	BUILD_BUG_ON(pgd_index(direct_map_end - 1) =3D=3D pgd_index(direct_map_e=
nd));
 +
- 	if (rodata_full || crash_mem_map || debug_pagealloc_enabled())
+ 	if (can_set_direct_map() || crash_mem_map)
 -		flags =3D NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 +		flags |=3D NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 =20
  	/*
  	 * Take care not to create a writable alias for the
@@@ -1468,9 -1446,8 +1469,8 @@@ int arch_add_memory(int nid, u64 start
  	 * KFENCE requires linear map to be mapped at page granularity, so that
  	 * it is possible to protect/unprotect single pages in the KFENCE pool.
  	 */
- 	if (rodata_full || debug_pagealloc_enabled() ||
- 	    IS_ENABLED(CONFIG_KFENCE))
+ 	if (can_set_direct_map() || IS_ENABLED(CONFIG_KFENCE))
 -		flags =3D NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 +		flags |=3D NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 =20
  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
  			     size, params->pgprot, __pgd_pgtable_alloc,

--Sig_/gF60RUGOCeApvhNL8GKktWw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBYO9cACgkQAVBC80lX
0GzopQgAkFk4g2CloXVbQ7aGEuYVvztOWu0M6JXZe742iQPibykojvIKMk0Kc0GK
o0cNm8ZM8ekUpf3pLfpipIJzCcF2e4Di4mW9/c9JzC74Klv6re5L+XlyrzkZRjv6
Ij3bwor6pz5zmUwvEIq6E2Dav+mLp/qF0Q5DUbMx0YRf4iznA0SoMhxJHwuGxGNx
Ei+MoKAEWD22QWk2fBD6KCszGKN0ZhUcP0kzaj7lN9ls8NxomYJfuVGFv4glZkk+
SSY2l7VMLI8DP5yqa6+T/BCM8e1pkna276WuPdQ3QrcNr/BsFcTnH+OBZSGlFgPS
xh5r2rRr3+rmL01FdQyVnfn+2Z0heA==
=KAyZ
-----END PGP SIGNATURE-----

--Sig_/gF60RUGOCeApvhNL8GKktWw--
