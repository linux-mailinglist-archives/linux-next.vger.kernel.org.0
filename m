Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F212524A7
	for <lists+linux-next@lfdr.de>; Wed, 26 Aug 2020 02:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgHZAS7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 20:18:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45271 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726570AbgHZAS7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Aug 2020 20:18:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbmgM1tBkz9sTS;
        Wed, 26 Aug 2020 10:18:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598401136;
        bh=tJVsIHj3u8pdSw38FTMaRa/EF/oKBc71jDbiOCWeoJk=;
        h=Date:From:To:Cc:Subject:From;
        b=NS2gmW2BL/p44MaUi2rdYGMc8fdMUvSP99HWSejz+Ckq2/c0d1Jbmwbm1y4BNV/ST
         sYOBsvro7GFWS/rXeuoXWx5WBq3abQg6XouW3vJfypa9FnJumV5ViDxdAMrGMnUo0A
         s8C4PGrBuJz/hxAWz4qgZsK/HjKbW8yO9ac6+MyInlwNRvfntr0536Gclb/v5CLlc9
         wrlfKEwfgmpb+wZFoyRVL7mi4oJMdSvNfmcNwnMwVELfXZIYIkojp8l06Z63P93UkY
         sYD44wt7Vx5Xnv4hzitv4OodYH2gV78X0geltDzAx/+nbf9KA5syQPDcazpbfwYo7h
         fvgXKCkSuw4zw==
Date:   Wed, 26 Aug 2020 10:18:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20200826101853.59136e16@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UgIurNh8g2YWcQcqwF_dMY+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UgIurNh8g2YWcQcqwF_dMY+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

between commits:

  cacbbe7c0065 ("drm/amdgpu: move stolen memory from gmc to mman")
  72de33f8f7ba ("drm/amdgpu: move IP discovery data to mman")
  87ded5caeec3 ("drm/amdgpu: move vram usage by vbios to mman (v2)")
  1348969ab68c ("drm/amdgpu: drm_device to amdgpu_device by inline-f (v2)")

from the amdgpu tree and commits:

  6c28aed6e5b7 ("drm/amdgfx/ttm: use wrapper to get ttm memory managers")
  9de59bc20149 ("drm/ttm: rename ttm_mem_type_manager -> ttm_resource_manag=
er.")
  4f297b9c82e1 ("drm/amdgpu/ttm: move vram/gtt mgr allocations to mman.")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index e1b66898cb76,697bc2c6fdb2..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@@ -47,10 -46,10 +46,10 @@@ static ssize_t amdgpu_mem_info_gtt_tota
  		struct device_attribute *attr, char *buf)
  {
  	struct drm_device *ddev =3D dev_get_drvdata(dev);
 -	struct amdgpu_device *adev =3D ddev->dev_private;
 +	struct amdgpu_device *adev =3D drm_to_adev(ddev);
-=20
+ 	struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_TT);
  	return snprintf(buf, PAGE_SIZE, "%llu\n",
- 			(adev->mman.bdev.man[TTM_PL_TT].size) * PAGE_SIZE);
+ 			man->size * PAGE_SIZE);
  }
 =20
  /**
@@@ -65,10 -64,10 +64,10 @@@ static ssize_t amdgpu_mem_info_gtt_used
  		struct device_attribute *attr, char *buf)
  {
  	struct drm_device *ddev =3D dev_get_drvdata(dev);
 -	struct amdgpu_device *adev =3D ddev->dev_private;
 +	struct amdgpu_device *adev =3D drm_to_adev(ddev);
-=20
+ 	struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_TT);
  	return snprintf(buf, PAGE_SIZE, "%llu\n",
- 			amdgpu_gtt_mgr_usage(&adev->mman.bdev.man[TTM_PL_TT]));
+ 			amdgpu_gtt_mgr_usage(man));
  }
 =20
  static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 63e541409549,fc5f7ac53d0a..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -2316,8 -2251,8 +2261,8 @@@ static int amdgpu_mm_dump_table(struct=20
  	struct drm_info_node *node =3D (struct drm_info_node *)m->private;
  	unsigned ttm_pl =3D (uintptr_t)node->info_ent->data;
  	struct drm_device *dev =3D node->minor->dev;
 -	struct amdgpu_device *adev =3D dev->dev_private;
 +	struct amdgpu_device *adev =3D drm_to_adev(dev);
- 	struct ttm_mem_type_manager *man =3D &adev->mman.bdev.man[ttm_pl];
+ 	struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman.bdev, =
ttm_pl);
  	struct drm_printer p =3D drm_seq_file_printer(m);
 =20
  	man->func->debug(man, &p);
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index de37ceff0e56,7ba2be37e6ba..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@@ -60,22 -75,8 +75,24 @@@ struct amdgpu_mman=20
  	/* Scheduler entity for buffer moves */
  	struct drm_sched_entity			entity;
 =20
 +	uint64_t		stolen_vga_size;
 +	struct amdgpu_bo	*stolen_vga_memory;
 +	uint64_t		stolen_extended_size;
 +	struct amdgpu_bo	*stolen_extended_memory;
 +	bool			keep_stolen_vga_memory;
 +
 +	/* discovery */
 +	uint8_t				*discovery_bin;
 +	uint32_t			discovery_tmr_size;
 +	struct amdgpu_bo		*discovery_memory;
 +
 +	/* firmware VRAM reservation */
 +	u64		fw_vram_usage_start_offset;
 +	u64		fw_vram_usage_size;
 +	struct amdgpu_bo	*fw_vram_usage_reserved_bo;
 +	void		*fw_vram_usage_va;
+ 	struct amdgpu_vram_mgr vram_mgr;
+ 	struct amdgpu_gtt_mgr gtt_mgr;
  };
 =20
  struct amdgpu_copy_mem {
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 91098a385ed6,7574be6cd7a0..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@@ -81,10 -84,10 +84,10 @@@ static ssize_t amdgpu_mem_info_vram_use
  		struct device_attribute *attr, char *buf)
  {
  	struct drm_device *ddev =3D dev_get_drvdata(dev);
 -	struct amdgpu_device *adev =3D ddev->dev_private;
 +	struct amdgpu_device *adev =3D drm_to_adev(ddev);
-=20
+ 	struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_VRAM);
  	return snprintf(buf, PAGE_SIZE, "%llu\n",
- 		amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]));
+ 			amdgpu_vram_mgr_usage(man));
  }
 =20
  /**
@@@ -99,10 -102,10 +102,10 @@@ static ssize_t amdgpu_mem_info_vis_vram
  		struct device_attribute *attr, char *buf)
  {
  	struct drm_device *ddev =3D dev_get_drvdata(dev);
 -	struct amdgpu_device *adev =3D ddev->dev_private;
 +	struct amdgpu_device *adev =3D drm_to_adev(ddev);
-=20
+ 	struct ttm_resource_manager *man =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_VRAM);
  	return snprintf(buf, PAGE_SIZE, "%llu\n",
- 		amdgpu_vram_mgr_vis_usage(&adev->mman.bdev.man[TTM_PL_VRAM]));
+ 			amdgpu_vram_mgr_vis_usage(man));
  }
 =20
  static ssize_t amdgpu_mem_info_vram_vendor(struct device *dev,

--Sig_/UgIurNh8g2YWcQcqwF_dMY+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9Fqm0ACgkQAVBC80lX
0GzUQwf/Ryy6DRYQzcDaTBzLLF2sfGXEGGWy7NrSMCHOVy0MbA32RtAfrcwzy7Zb
gWpgLIAg/UJrARMkHTMvoIhqGMlIshXDoLttkkQzshNqm7AcsC0VoFRk2dc7HYc8
16kmqge/+aspqdW3y9zPkkCk2LxsUYEm2o2X8ro208Dv/B7hGD5OAqb9Z5ZSSw8n
bKiJRO/Rq5RdwhwEqO4gxpAJSSBRL+SaV4ACFkcPz8lm43mbTrSfWVWplXV4NPG1
/r65ejUJpl2Xy2NL+eyPD106zXZT7dFZ1B+M9xljWP9eJfW72J5tIJDMtzv9BsVd
FV1SkntXeZfaTlD2S9eVTE8PIaPwtw==
=RcOa
-----END PGP SIGNATURE-----

--Sig_/UgIurNh8g2YWcQcqwF_dMY+--
