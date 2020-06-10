Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9156D1F5207
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 12:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgFJKPG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 06:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgFJKPG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2020 06:15:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5E2C03E96B;
        Wed, 10 Jun 2020 03:15:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49hjXf4CBYz9sQx;
        Wed, 10 Jun 2020 20:14:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591784098;
        bh=8UMlMKyh418ho0oWZQ7XY53wR1BrVLFmXQhMaFHpS/8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GhLDgR6tTFsJx79L7F+HPXR1BKGomT3NyUwq+blWaXzMoUJ07aAA48sTOeaLZvyAs
         aGsbEOegaXRMwvQ1qyNYZKn/npM6ZSBdPXX3evuYE/v2FiFRZmQmAxl0XMkKt7G+xG
         3rV2K24dE69frphNi830pI4xCAbMhcpGyC5NneLifK9sFop6uXwQoUR1QuGcshxWhm
         qhh2658tSbsP18wH3E4N7L/HcCpxdRD0TxkPCMLhSYOR0DqMEtqhYJKNyNuby6koWx
         MBNV+7qRBaqtqoNYfvVqxy33unnFyoDelv0muRlt8Fo2bsjsvJvdP4+XwD1W+lq6Ra
         O6WpKn/YI93Ug==
Date:   Wed, 10 Jun 2020 20:14:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200610201457.5698b119@canb.auug.org.au>
In-Reply-To: <20200609210137.e7aaf4efa9f8b9ff0bcdc1dc@linux-foundation.org>
References: <20200609224252.1704eff3@canb.auug.org.au>
        <20200610134425.6dd32bf6@canb.auug.org.au>
        <20200609210137.e7aaf4efa9f8b9ff0bcdc1dc@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BiVkGYbjM6ry4uwpZ9Rrkzi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BiVkGYbjM6ry4uwpZ9Rrkzi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, 9 Jun 2020 21:01:37 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> I've sent this in as well:
>=20
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: arch/sparc/mm/srmmu.c: fix build
>=20
> "mm: consolidate pte_index() and pte_offset_*() definitions" was supposed
> to remove arch/sparc/mm/srmmu.c:pte_offset_kernel().
>=20
> Fixes: 974b9b2c68f3d35 ("mm: consolidate pte_index() and pte_offset_*() d=
efinitions")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>=20
>  arch/sparc/mm/srmmu.c |   10 ----------
>  1 file changed, 10 deletions(-)
>=20
> --- a/arch/sparc/mm/srmmu.c~arch-sparc-mm-srmmuc-fix-build
> +++ a/arch/sparc/mm/srmmu.c
> @@ -140,16 +140,6 @@ void pmd_set(pmd_t *pmdp, pte_t *ptep)
>  	set_pte((pte_t *)&pmd_val(*pmdp), __pte(SRMMU_ET_PTD | ptp));
>  }
> =20
> -/* Find an entry in the third-level page table.. */
> -pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
> -{
> -	void *pte;
> -
> -	pte =3D __nocache_va((pmd_val(*dir) & SRMMU_PTD_PMASK) << 4);
> -	return (pte_t *) pte +
> -	    ((address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
> -}
> -
>  /*
>   * size: bytes to allocate in the nocache area.
>   * align: bytes, number to align at.
> _
>=20

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/BiVkGYbjM6ry4uwpZ9Rrkzi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7gsqEACgkQAVBC80lX
0GwGOggAij4ikq4ze7TVxoyBkxNel6dX4MOOaLgfCmNkxOtrWfo49e6p1SbCj+wR
OlHf/wm5NoZZVLnJJqT4jBc79tcqiDons5kZ9/zd+tsWAbPJob46qYqEOTuGeQoQ
Wiq3OqLeE6LjwB2fD8R7ydcC36hqDRCyTIYV4wZEX8HgNWvT0vtLeXBKTaEtyyKF
R2gVI+/U7iMVqkvM5ce1SdZKsv4QiAmrVsfM8ZLFP2Rq8WI4oqmcgG3QkHf0iSOP
IK9P7jSp8l6HDyz0niDM4B63HFGspNKUD8aAOzVKrVECJqZzNZ3Uc8xM2y7N6vGQ
vuhtollzg4+J8g4eKslVm2P7vhUAXA==
=OF1y
-----END PGP SIGNATURE-----

--Sig_/BiVkGYbjM6ry4uwpZ9Rrkzi--
