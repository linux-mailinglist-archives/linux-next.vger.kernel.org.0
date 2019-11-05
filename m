Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA4EEFACD
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 11:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388266AbfKEKT0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 05:19:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37707 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388412AbfKEKT0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 05:19:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476lyM0YrXz9sNT;
        Tue,  5 Nov 2019 21:19:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572949163;
        bh=covY6yTlcaI84s0A1lHYWzCPwHt9MFOpGYZb7sb8RcU=;
        h=Date:From:To:Cc:Subject:From;
        b=NrRCxb5G1qtko47PqU3QcVYBOD31+p8IjWlYaZ+1hBuzN1HggP4HiqEjhWdh3+nDM
         /pana4wie8Bxwtwb/yQKnIdFaigjDCBBn9AIeKOx61YZhQTU3gle4rZqTXkToi9XkO
         hlIoMG3lqNN0MlZOzmnckHcMyD8vAzgbdrEO9nZqVRkfmaSJdy6nIY8y0LAE9+mZUf
         wmPnIUZNulNztyjMV9hxB/9JmjqELMcbhrbsbaLw1ZdGymIvmpzcQ5Vo2ihMRIrgZf
         5S5qxwEmOr2Ls8h0Cu/H5H8Ihf/qS5xv9J48Vrn2maVK5qySPtn6cXMhBZ3M2g/Yes
         0Gprkn4HAqhYQ==
Date:   Tue, 5 Nov 2019 21:19:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20191105211920.787df2ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WegBfhr=Ou2BD8zYrz7yZ/g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WegBfhr=Ou2BD8zYrz7yZ/g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

In file included from arch/powerpc/mm/mem.c:30:
include/linux/hugetlb.h:233:19: error: redefinition of 'pmd_huge'
  233 | static inline int pmd_huge(pmd_t pmd)
      |                   ^~~~~~~~
In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
                 from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                 from arch/powerpc/include/asm/book3s/64/mmu.h:46,
                 from arch/powerpc/include/asm/mmu.h:356,
                 from arch/powerpc/include/asm/lppaca.h:47,
                 from arch/powerpc/include/asm/paca.h:17,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/sched.h:12,
                 from arch/powerpc/mm/mem.c:16:
arch/powerpc/include/asm/book3s/64/pgtable-4k.h:74:19: note: previous defin=
ition of 'pmd_huge' was here
   74 | static inline int pmd_huge(pmd_t pmd) { return 0; }
      |                   ^~~~~~~~
In file included from arch/powerpc/mm/mem.c:30:
include/linux/hugetlb.h:238:19: error: redefinition of 'pud_huge'
  238 | static inline int pud_huge(pud_t pud)
      |                   ^~~~~~~~
In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
                 from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                 from arch/powerpc/include/asm/book3s/64/mmu.h:46,
                 from arch/powerpc/include/asm/mmu.h:356,
                 from arch/powerpc/include/asm/lppaca.h:47,
                 from arch/powerpc/include/asm/paca.h:17,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/sched.h:12,
                 from arch/powerpc/mm/mem.c:16:
arch/powerpc/include/asm/book3s/64/pgtable-4k.h:75:19: note: previous defin=
ition of 'pud_huge' was here
   75 | static inline int pud_huge(pud_t pud) { return 0; }
      |                   ^~~~~~~~

Caused by commit

  9823e12e021f ("hugetlbfs: convert macros to static inline, fix sparse war=
ning")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/WegBfhr=Ou2BD8zYrz7yZ/g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BTKgACgkQAVBC80lX
0GzDZgf+OAeTyvWBr3E5uwVfBBzQc3uGkzBLNZytc40mKNsRgJ9OdTsR4XhBL3Yr
X+mCTvhBX2ba043vc5DAhZqT2kbIyLGNg8xISyNecrdQfySBSNBHeCgGXQWBZ1dI
riOEY1irZMssNvuGN95c8KRApu8oloydjdgLqqRs7gDLeiMzAz46kxDizAfuBTF6
Ql6ToSaRVxgtX25yEQAW6pjImVqh9Th3Nov5NPdhs1aUjrvcVGLlvKqTvOoY4yxW
3XOoz9+IxOBdv9xPbNb5Syr3yAIfH07f+mYd8Fzu7it07Rlg5IOFyUkf0CBLW67c
BNQ76UGLQkECtLiufRUVCKKsjgJWfA==
=lFVA
-----END PGP SIGNATURE-----

--Sig_/WegBfhr=Ou2BD8zYrz7yZ/g--
