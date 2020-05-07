Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D641C8A4C
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 14:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgEGMRc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 08:17:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54227 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgEGMRc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 May 2020 08:17:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Hssj0d5Rz9sSg;
        Thu,  7 May 2020 22:17:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588853849;
        bh=a1iuU7BDFXNW9XIQlcpHXEd1WD74mjRtsagUGjpCkjQ=;
        h=Date:From:To:Cc:Subject:From;
        b=EW+Al6Hwv1/3gOfv8USeIsUZRIsiECaKV9gax5lQpS4TuWCD5ZDjpDNzJFWA1lZnE
         KyWs9Y/K6d8u2jfEfHKYYtm1R1LlNCmuqFSxhjcHi5eJmk8wBiZAkg5B93rbMw1SSU
         i1trT7CQywLlb561O1rqzPAZYiDtn+KXK0VpxQriQJEVtPvYMWDfJvHgEkzj39RYFa
         OXfYfpwkZLWphHGIAF08GMadbQWh6KJnsZB9SDk2/rOhY6+RtCVSFTjIaEkHHOxJg+
         I1+uW3MYb8oLDnkPyiMtUbJZlCeYKQaphZEm0WBHSVV5w9VdNo917IjWm7kbtJy975
         X5d8n15C3wsCw==
Date:   Thu, 7 May 2020 22:17:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200507221721.0330271c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2euMQcBNsrba+=M.o_o9Irw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2euMQcBNsrba+=M.o_o9Irw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
collie_defconfig and many others) failed like this:

arch/arm/mm/dma-mapping.c: In function 'dma_cache_maint_page':
arch/arm/mm/dma-mapping.c:892:6: error: implicit declaration of function 'k=
unmap_high' [-Werror=3Dimplicit-function-declaration]
      kunmap_high(page);
      ^
arch/arm/mm/flush.c: In function '__flush_dcache_page':
arch/arm/mm/flush.c:221:6: error: implicit declaration of function 'kunmap_=
high' [-Werror=3Dimplicit-function-declaration]
      kunmap_high(page + i);
      ^

Caused by commit

  6b66ab470b4d ("arch/kunmap: remove duplicate kunmap implementations")

kunmap_high() is now only declared when CONFIG_HIGHMEM is defined.

--=20
Cheers,
Stephen Rothwell

--Sig_/2euMQcBNsrba+=M.o_o9Irw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6z/FEACgkQAVBC80lX
0Gy7fggAga0k5aI1f+7F72PVnE1weLx4PFwzQhL3YSS5lpadGkNVrNlXY4Fqrnpa
ZKSHr5PyN/sNygWrfMmig4nzbWF1LxgYn02I9afHLn95cq8sCdZ7SDbOUOdoolxf
1DgeBZMyB41NoxwWZu0F7S1rbaMsoEKWzv8Z1MliOw+TXICxM08J2YkW6UX38onx
rrrWYV/m2jMIfpM1zNZS1a/GP7ej+FYS1GEyf6Z6CVYIZnB+Jy92VaMZ2XI3jjvi
yozpRGI2VcoO9z9QXAYHsab/4BsRM9QnpcrJ5lNxFKQedMIYE/zSM+sdYP7iaIy9
pXR8THLpIz/J+w6WY90F5PVUSHIlQA==
=Xgnm
-----END PGP SIGNATURE-----

--Sig_/2euMQcBNsrba+=M.o_o9Irw--
