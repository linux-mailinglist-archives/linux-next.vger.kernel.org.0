Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D4A21AD0A
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 04:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgGJC2a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 22:28:30 -0400
Received: from ozlabs.org ([203.11.71.1]:57797 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgGJC2a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jul 2020 22:28:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2xmV71xPz9sT6;
        Fri, 10 Jul 2020 12:28:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594348108;
        bh=3UhviLMUqD9vkJnzTQoViNLx2PeG7wMUIHUZ6W92kz4=;
        h=Date:From:To:Cc:Subject:From;
        b=fNBpOMlqVvVei7QiZfgZbCobi7jQNQp0YVejBN+Qo/7shqN1tkIHok6AoobT160w3
         UldU1/qC88VzKixAXIoca0pOpQ0Q4a1x1PHXucDMH12kd7PhP18gtooi0ZuOy1T9l3
         coP15P5zrGjxgb2eiOwHLzr+6Q6hwKS3swEHVB46lRwczxxGU9N4PmI0gkkcPEBA2p
         YKOqcqLbVmNhdQiE+YIlOaM9Ne9EpE6hopk3DJv+JNUxn93lRF2K7v5oR1wm/yJNFS
         XVd/Fm4k0NmCPUj8GXU4C042h247KQhfb7kr70Gu9VPVjMWL9GrZVqatKMVndRgWbu
         ZoME1IzD92xbg==
Date:   Fri, 10 Jul 2020 12:28:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huang Rui <ray.huang@amd.com>, Emily Deng <Emily.Deng@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20200710122824.3fe55d0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C0Nb2/ZIyty39cOe0lCugE.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C0Nb2/ZIyty39cOe0lCugE.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

between commit:

  c564b8601ae9 ("drm/amdgpu: add TMR destory function for psp")

from the drm-fixes tree and commit:

  3bda8acd974e ("drm/amdgpu/sriov: Add clear vf fw support")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index ef3269c43d4f,9342a9e8cadf..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@@ -1825,6 -1866,9 +1912,7 @@@ static int psp_hw_fini(void *handle
  {
  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
  	struct psp_context *psp =3D &adev->psp;
 -	void *tmr_buf;
 -	void **pptr;
+ 	int ret;
 =20
  	if (psp->adev->psp.ta_fw) {
  		psp_ras_terminate(psp);
@@@ -1833,10 -1877,16 +1921,15 @@@
  	}
 =20
  	psp_asd_unload(psp);
+ 	ret =3D psp_clear_vf_fw(psp);
+ 	if (ret) {
+ 		DRM_ERROR("PSP clear vf fw!\n");
+ 		return ret;
+ 	}
 =20
 +	psp_tmr_terminate(psp);
  	psp_ring_destroy(psp, PSP_RING_TYPE__KM);
 =20
 -	pptr =3D amdgpu_sriov_vf(psp->adev) ? &tmr_buf : NULL;
 -	amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, pptr);
  	amdgpu_bo_free_kernel(&psp->fw_pri_bo,
  			      &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
  	amdgpu_bo_free_kernel(&psp->fence_buf_bo,

--Sig_/C0Nb2/ZIyty39cOe0lCugE.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8H0kgACgkQAVBC80lX
0GziFgf/cZ3jHfAxtm69nBK92mdd+xv+aTRVOenQo+j4VyZw3RWEemvVG5FQBl/b
FyJ5ZC0zlBZ9lknvf2PGB0ibK7r1RDGHrPf6hu/zzNu+Lu4pGsQw9GKQ9Y7yA1Md
qmG11mKoI6fC82UqvvlEELbTNcJWV2YdlOyqRhCQsKf+JOkjjjSumQ6oOai6laUG
CCrdgab3hZCCi8aBe9SPIISUHA+TZqt9Y4i7+ZOPqmM1SbEEGI7/DsEHQDnSQ6xt
7AYWe6n0bALfwUaV11luAl9Qsb5aItB7EcsOHadzgNUbTupkecmfyNhHF6UUZFio
ZyC2oKv2Iq/gIUfv47L+cxoPCX9STQ==
=jkn0
-----END PGP SIGNATURE-----

--Sig_/C0Nb2/ZIyty39cOe0lCugE.--
