Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00232B3B41
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 03:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgKPCDj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Nov 2020 21:03:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728010AbgKPCDj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Nov 2020 21:03:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZC6G6pxkz9sPB;
        Mon, 16 Nov 2020 13:03:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605492215;
        bh=86aHr/WDWqqYM5YXmz5R5Fn1puSspOFGF/WvLNrT74M=;
        h=Date:From:To:Cc:Subject:From;
        b=VNt8DeXjXlHuFWwYpIolKi3bTCLSVK4tv/6EH7EM/ZGXoBrhm3Cgz6FelG/8X6mWj
         gpNfhQxk66+Y9oDwGbEcdr2PhL0gDfe66OZYhNse/2DYXKSZbhB4GKNx77fO0LIS3y
         rovnCMwE+u4bGmJbaz0XcfmRxBILIjIEi/lzENI6XFgf0puZ7hD067juVKPQSio8TG
         /crHg5POWUBbapcxtP33PSqevtvz4l3vNn92lzu8MGWKV8Q4aGMzVc8CNwnRC2Kosb
         zfnud7Z2cK+0LDOQBzmHrDtwA2bWxP055bHQ6nBA+IIpxDSDEvTzGEEtkMi2o+GmmE
         t8k7+wtGmNpRg==
Date:   Mon, 16 Nov 2020 13:03:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20201116130333.74aedc21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o7e3_q.FzK=BMzS7UJF8lku";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o7e3_q.FzK=BMzS7UJF8lku
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commit:

  f5a89a5cae81 ("drm/amdgpu/ttm: use multihop")

from the drm tree and commit:

  75501872b4af ("drm/amd/amdgpu/amdgpu_ttm: Demote non-conformant kernel-do=
c headers, fix slightly lacking ones")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 676fb520e044,761dd68d7ced..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -512,7 -512,120 +512,7 @@@ error
  	return r;
  }
 =20
 -/**
 - * amdgpu_move_vram_ram - Copy VRAM buffer to RAM buffer
 - *
 - * Called by amdgpu_bo_move().
 - */
 -static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 -				struct ttm_operation_ctx *ctx,
 -				struct ttm_resource *new_mem)
 -{
 -	struct ttm_resource *old_mem =3D &bo->mem;
 -	struct ttm_resource tmp_mem;
 -	struct ttm_place placements;
 -	struct ttm_placement placement;
 -	int r;
 -
 -	/* create space/pages for new_mem in GTT space */
 -	tmp_mem =3D *new_mem;
 -	tmp_mem.mm_node =3D NULL;
 -	placement.num_placement =3D 1;
 -	placement.placement =3D &placements;
 -	placement.num_busy_placement =3D 1;
 -	placement.busy_placement =3D &placements;
 -	placements.fpfn =3D 0;
 -	placements.lpfn =3D 0;
 -	placements.mem_type =3D TTM_PL_TT;
 -	placements.flags =3D 0;
 -	r =3D ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
 -	if (unlikely(r)) {
 -		pr_err("Failed to find GTT space for blit from VRAM\n");
 -		return r;
 -	}
 -
 -	r =3D ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 -	if (unlikely(r))
 -		goto out_cleanup;
 -
 -	/* Bind the memory to the GTT space */
 -	r =3D amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
 -	if (unlikely(r)) {
 -		goto out_cleanup;
 -	}
 -
 -	/* blit VRAM to GTT */
 -	r =3D amdgpu_move_blit(bo, evict, &tmp_mem, old_mem);
 -	if (unlikely(r)) {
 -		goto out_cleanup;
 -	}
 -
 -	r =3D ttm_bo_wait_ctx(bo, ctx);
 -	if (unlikely(r))
 -		goto out_cleanup;
 -
 -	amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
 -	ttm_resource_free(bo, &bo->mem);
 -	ttm_bo_assign_mem(bo, new_mem);
 -out_cleanup:
 -	ttm_resource_free(bo, &tmp_mem);
 -	return r;
 -}
 -
--/**
 - * amdgpu_move_ram_vram - Copy buffer from RAM to VRAM
 - *
 - * Called by amdgpu_bo_move().
 - */
 -static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
 -				struct ttm_operation_ctx *ctx,
 -				struct ttm_resource *new_mem)
 -{
 -	struct ttm_resource *old_mem =3D &bo->mem;
 -	struct ttm_resource tmp_mem;
 -	struct ttm_placement placement;
 -	struct ttm_place placements;
 -	int r;
 -
 -	/* make space in GTT for old_mem buffer */
 -	tmp_mem =3D *new_mem;
 -	tmp_mem.mm_node =3D NULL;
 -	placement.num_placement =3D 1;
 -	placement.placement =3D &placements;
 -	placement.num_busy_placement =3D 1;
 -	placement.busy_placement =3D &placements;
 -	placements.fpfn =3D 0;
 -	placements.lpfn =3D 0;
 -	placements.mem_type =3D TTM_PL_TT;
 -	placements.flags =3D 0;
 -	r =3D ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
 -	if (unlikely(r)) {
 -		pr_err("Failed to find GTT space for blit to VRAM\n");
 -		return r;
 -	}
 -
 -	/* move/bind old memory to GTT space */
 -	r =3D ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 -	if (unlikely(r))
 -		return r;
 -
 -	r =3D amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
 -	if (unlikely(r)) {
 -		goto out_cleanup;
 -	}
 -
 -	ttm_bo_assign_mem(bo, &tmp_mem);
 -	/* copy to VRAM */
 -	r =3D amdgpu_move_blit(bo, evict, new_mem, old_mem);
 -	if (unlikely(r)) {
 -		goto out_cleanup;
 -	}
 -out_cleanup:
 -	ttm_resource_free(bo, &tmp_mem);
 -	return r;
 -}
 -
+ /*
   * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move_=
memcpy
   *
   * Called by amdgpu_bo_move()

--Sig_/o7e3_q.FzK=BMzS7UJF8lku
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+x3fUACgkQAVBC80lX
0GzOIQf/QhG3CAnXcQFFnHj+B7GI8IIfro7e6RXSAELuRFkrjDUT+xsDn5McfRe4
zzAXN0E/7+8KcDOzYYGq3x4Cc7isDn0cF0X06U902r6tcIknzLrh7HmlIt3pNy7m
KGWlnadrHOHCJhgztK9pznNgc0Jn7/9XxUE9ss01NT0JazsBjMmDlnTxT4jI7a3a
OmwaitIRUbgu/ba1hDvsvKN/78YRw8kqfQoxFgJINbtB3v/kz9BGC2TOAkwb3ug/
ah1T0QcjKQg74JKWbP81zAjWoaz9oYBedU3Qhev5jLRca3MmXcDdbBniBJGMJCMI
Z+mVINv77E7lxUyjKcVFOPMAF66NzQ==
=PK9s
-----END PGP SIGNATURE-----

--Sig_/o7e3_q.FzK=BMzS7UJF8lku--
