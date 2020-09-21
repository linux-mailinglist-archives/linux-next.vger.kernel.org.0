Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714972719C0
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 06:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIUEJO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 00:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgIUEJN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Sep 2020 00:09:13 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7EBC061755;
        Sun, 20 Sep 2020 21:09:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BvrXz6Zr1z9sSn;
        Mon, 21 Sep 2020 14:09:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600661349;
        bh=3v9jQEpjc+WZkN+YkJLb/PKJrBJXSbxO/6dNR1q9i3k=;
        h=Date:From:To:Cc:Subject:From;
        b=Z6YRPgwqot5pxF1eMLIKHe7pIBbntu6oTB2JQKB5OUK2iJMI4IRfDOlq2v21yvzCb
         KQXfZzntW+aXi7bUJ4XLAuLuNeSfsslL284l0JmjYTSEh0Et+0mWqp2w4AefvNBKmx
         hFPKhH352a1Ob+T+NDTtpgX9GZGMyhpi42cS2YHGm6p1Q7vicuEv4BtDilc15fOQs4
         AAoyBtCT2NTcysdqBUCluU0nJxfwYMxQvAtBCRV/LEal/TQoEAW/2lDbcaPSwKIiku
         mQSXWy1ZVN6X2uFzTqAOJL3rKZq2pLgOKuk21kVuY7xsr8NPJ/0ZT6OOh04eB44nje
         cYrRNVKZ9xy1g==
Date:   Mon, 21 Sep 2020 14:09:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Tom Murphy <murphyt7@tcd.ie>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the iommu tree
Message-ID: <20200921140901.16adf8c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=tJLjgMi0YT_2e4JbYtQ+Xw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=tJLjgMi0YT_2e4JbYtQ+Xw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/msm_iommu.c: In function 'msm_iommu_pagetable_unmap':
drivers/gpu/drm/msm/msm_iommu.c:46:2: error: implicit declaration of functi=
on 'iommu_flush_tlb_all'; did you mean 'iommu_flush_iotlb_all'? [-Werror=3D=
implicit-function-declaration]
   46 |  iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
      |  ^~~~~~~~~~~~~~~~~~~
      |  iommu_flush_iotlb_all

Caused by commit

  aae4c8e27bd7 ("iommu: Rename iommu_tlb_* functions to iommu_iotlb_*")

interacting with commit

  b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")

from the drm-msm tree.

I have applied the following merge fix patch.  Someone will need to tell
Linus about this fix up when the trees get merged.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Sep 2020 14:04:14 +1000
Subject: [PATCH] merge fix upt for iommu_flush_iotlb_all() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/msm/msm_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iomm=
u.c
index 3a83ffdb3b90..22ac7c692a81 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -43,7 +43,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu,=
 u64 iova,
 		size -=3D 4096;
 	}
=20
-	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
+	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
=20
 	return (unmapped =3D=3D size) ? 0 : -EINVAL;
 }
@@ -199,7 +199,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_m=
mu *parent)
=20
 	/*
 	 * TODO we would like each set of page tables to have a unique ASID
-	 * to optimize TLB invalidation.  But iommu_flush_tlb_all() will
+	 * to optimize TLB invalidation.  But iommu_flush_iotlb_all() will
 	 * end up flushing the ASID used for TTBR1 pagetables, which is not
 	 * what we want.  So for now just use the same ASID as TTBR1.
 	 */
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/=tJLjgMi0YT_2e4JbYtQ+Xw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oJ10ACgkQAVBC80lX
0GzqhAgAgI5bvNANY/dpO3XbDnaqIvof5KBq4oIgY+R/5raInQLxtzFMgpspd/y8
yNX8ndiP3j4xT3xO/v7QBGfKK13qkYNQI1ZfGecvnQTQ1BalLrDuEbRH3d/qR3R3
TEMQAPy+t/v2kIaMDVDVhTwm75xcMbhbTNjw3HaWfCpYmTOOeVqU2Mcfd8QIKGsv
DysXjU+Wx/KrA0b5pFS5yCQi8/TqMDUmT2/KkLBmTgZcAmKNYmogLlIEOQGR8EKT
42u4nM+5lpxMvR/Kj7jBOnc2XrOdkk87Uz1ot+MWgFU+JAUH6XMvw+UZZDQGn86s
uq+avB9gMlh9jQAdp1XaCxhu274cXQ==
=wtfn
-----END PGP SIGNATURE-----

--Sig_/=tJLjgMi0YT_2e4JbYtQ+Xw--
