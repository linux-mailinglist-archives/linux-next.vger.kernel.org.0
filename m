Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE875453C7F
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 00:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhKPXFZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Nov 2021 18:05:25 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:48369 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhKPXFZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Nov 2021 18:05:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hv1mJ4PSYz4xbM;
        Wed, 17 Nov 2021 10:02:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637103746;
        bh=5DEATmn6MEnai5qTpQy2X9uIyJ+NQ+vZgcENf6p1Oeo=;
        h=Date:From:To:Cc:Subject:From;
        b=WQQ/9tcCtUOXNzeLutCLDat9RYhmdosvdGq6qcRh/EFqyqHShB5rjBwYRj/G+P+Tc
         ptXzslEruMp5TIAv9uqUIO5k1SwFCnsb1SltES0TjEYs++IFTgC+vZBWxFX3ZxZZ1R
         97lIq+5KDpaUdRqzkllQAWiksg99HwPmK0FWwbQDk2gqulxypLUUzIZ8P+m0JURHsh
         CyR7cobpU98mpjHLxX8nIgCdwFvWd5BazUC2iD9HpgMP3NgcDyh7wh1Z8dZP01Yrnk
         IUasdjZU04Mu0Tjtp4dCNknsgbQcRHjvoSPp5r8s0r0aS4ghSwaEkuNtxfEENVVY4b
         cuA/nqbXYj17w==
Date:   Wed, 17 Nov 2021 10:02:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-intel-gt tree
Message-ID: <20211117100223.52c7460a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HyY3mkcO0SKpLL.Za5=zlAf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HyY3mkcO0SKpLL.Za5=zlAf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the etnaviv tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'vm_fault_ttm':
drivers/gpu/drm/i915/gem/i915_gem_ttm.c:862:9: error: too many arguments to=
 function 'ttm_bo_vm_fault_reserved'
  862 |   ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/drm/ttm/ttm_bo_driver.h:42,
                 from drivers/gpu/drm/i915/gem/i915_gem_ttm.c:6:
include/drm/ttm/ttm_bo_api.h:585:12: note: declared here
  585 | vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  ebd4a8ec7799 ("drm/i915/ttm: move shrinker management into adjust_lru")

interacting with commit

  0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()")

from Linus' tree.

I applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Nov 2021 09:57:09 +1100
Subject: [PATCH] fix up for "drm/ttm: remove ttm_bo_vm_insert_huge()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915=
/gem/i915_gem_ttm.c
index d08a270b0921..68cfe6e9ceab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -860,7 +860,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
=20
 	if (drm_dev_enter(dev, &idx)) {
 		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT, 1);
+					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/HyY3mkcO0SKpLL.Za5=zlAf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGUOH8ACgkQAVBC80lX
0Gx0lgf/duysNW+6PPbRRIYTuvq/Z8o9d6FFtldIFl0l5MUZuhLAIJoGtAeP4oHj
kj6RCPUj9RN22Y7Zcz4Yb82w/VpdfDO5FvG3tBGg2mmqQvxrsAGRLwY+ZKL2RPio
QpgGfx5sRKqXInPrDXllTQ6355267UVc/IUPPY+wPbAH3JKSQzgBVwjtOT+tP1Gm
t2PInyrM9AaRadQTR0zMIt4i2EpAcSoRK8B35oQ/YdgE/3u34GVsKqq7vtMG0wSe
ei6sr1VwJB26sd/E9lh7nGO/SuAQKHKLwxVL2hiBwHaBZOqhfhEoXQAUv7AGz/Fg
nhWb89rG0ZSCNycad7Ymo7ex5WYtoA==
=Mclm
-----END PGP SIGNATURE-----

--Sig_/HyY3mkcO0SKpLL.Za5=zlAf--
