Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C85447645
	for <lists+linux-next@lfdr.de>; Sun,  7 Nov 2021 23:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbhKGWeG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Nov 2021 17:34:06 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58357 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbhKGWeF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Nov 2021 17:34:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HnTVZ1jgRz4xd4;
        Mon,  8 Nov 2021 09:31:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636324281;
        bh=9Z5GYdWA78hrsdCWSQ0i9WtTgQ98iIso88MZBedtccY=;
        h=Date:From:To:Cc:Subject:From;
        b=f3MuNWNv9vKPg87fW5H/sVmBgXMepxqtJOBGuVdmAMEAWTwU6iKdidcKY9sbGXMfy
         lUAIg0CM/CSahYfxUiI5gnc+uueJR0s0SPHUVx5VasIuvs4HWPIY5WubRSpbYpvJ2Z
         DgNSSkA7EiGGdxmuRf5kpXMwJRyfAO3WBgv7WjGbp3WkRdW9TtWO27zbg/xI8HJ/Vx
         G09fponfjEMjacfE7WzCW+M9fi2lt1Hjc+Ro5rzW42Djc6GxLP9yutSYz+afNi89bt
         M+bo3odiRZbb7Teejfcc5mgBXfLBcpWs0TiD9OkSvnKZseXQpD/n0yBPfmakqRE31s
         BVLvFcK08YL4Q==
Date:   Mon, 8 Nov 2021 09:31:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20211108093114.12dde19b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xVuPQyygmteliXR405bmI+I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xVuPQyygmteliXR405bmI+I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

between commit:

  9ae807f0ec6a ("drm/amdgpu: clean up inconsistent indenting")

from the origin tree and commit:

  0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a573424a6e0b,a1e63ba4c54a..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@@ -60,9 -60,10 +60,9 @@@ static vm_fault_t amdgpu_gem_fault(stru
  			goto unlock;
  		}
 =20
 -		 ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 -						TTM_BO_VM_NUM_PREFAULT);
 -
 -		 drm_dev_exit(idx);
 +		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
- 					       TTM_BO_VM_NUM_PREFAULT, 1);
++					       TTM_BO_VM_NUM_PREFAULT);
 +		drm_dev_exit(idx);
  	} else {
  		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
  	}

--Sig_/xVuPQyygmteliXR405bmI+I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGIU7IACgkQAVBC80lX
0GzmTAf9HYnSJ+9qZoiBiBmrkMU2I9mv4K1XRQmu/9ShHGdTV3/eb7ImO/q9HHOD
YAafVU6JOjuvNTTfouoM1o1CEhPuetF0wyTRYJI0QzJchrUsQlBhpff/SHcaNbfl
RzBbn+dAx+kRfqIBiYzBYuVI8xoov/5PhhsnxUnis0uz9XZP+40UDTBtrWkBFXu3
Oii5r+BsbIg0VBvpuvYi+9vA7RozQn957fL0OfXk4GhWHImTm0rucIHPsD9fwb3E
8zuAZfCIsXO86SQP8lV/R9qmYAT0KxJsmJdhAKdclSrpsTWqRxRyfhcQSVbKcfbs
UsiUr5FtMnVs7TR9ghnDG5CM0eDwdw==
=9aE7
-----END PGP SIGNATURE-----

--Sig_/xVuPQyygmteliXR405bmI+I--
