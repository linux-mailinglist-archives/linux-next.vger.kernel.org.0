Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F7C2A3ADC
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 04:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgKCDK1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 22:10:27 -0500
Received: from ozlabs.org ([203.11.71.1]:40777 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbgKCDK1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Nov 2020 22:10:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQFCL6zX8z9sTD;
        Tue,  3 Nov 2020 14:10:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604373023;
        bh=Ges7C/ArmWXFW7iXv4In31BW3V8JG3ZYIfuu2ZQ/2Eo=;
        h=Date:From:To:Cc:Subject:From;
        b=ihTKrRAAmZV55x3NC2ail+/22dwge79zOKTUdMXsR5E16ngd+5GMpvIwhZMiSlNIq
         wyz/6eW8N/hvlCpAisSw+OgS8zbcIp+B4E08wPddFqFByO8JjPPWh+HCWgmxKd/VUa
         ryOvXEh/XY2ncxPRa0U8/neehB1YqBhaBsPN9uJ3dSxpqTBhanERYr7J6p3Hssb4ZB
         my58L21LYozpYr2TJb7OmNfIXfnCm9ErUexWatF6vXnl815FdzPAuxSz3d+OgKuprk
         jp3cyJBvJgDc1KVI6CZwf2XhpzTJ1qAlreYj4lDBCUGJyEZ36kYTBRipLg3S0651t+
         1Gy+P0TMbPtOg==
Date:   Tue, 3 Nov 2020 14:10:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20201103141021.2ee64034@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dV=H1/m1EVRXXYbS0uMdmQQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dV=H1/m1EVRXXYbS0uMdmQQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commit:

  0a667b500703 ("drm/ttm: remove bdev from ttm_tt")

from Linus' tree and commit:

  c4c5ae67d179 ("drm/amdgpu/amdgpu: use "*" adjacent to data name")

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
index 8039d2399584,69ebd07f3eee..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -63,16 -63,13 +63,16 @@@
 =20
  #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
 =20
 +static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 +				   struct ttm_tt *ttm,
 +				   struct ttm_resource *bo_mem);
 +
  static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
  				    unsigned int type,
- 				    uint64_t size)
+ 				    uint64_t size_in_page)
  {
  	return ttm_range_man_init(&adev->mman.bdev, type,
- 				  false, size >> PAGE_SHIFT);
 -				  TTM_PL_FLAG_UNCACHED, TTM_PL_FLAG_UNCACHED,
+ 				  false, size_in_page);
  }
 =20
  /**
@@@ -1107,12 -1111,11 +1107,12 @@@ gart_bind_fail
   * Called by ttm_tt_bind() on behalf of ttm_bo_handle_move_mem().
   * This handles binding GTT memory to the device address space.
   */
 -static int amdgpu_ttm_backend_bind(struct ttm_tt *ttm,
 +static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 +				   struct ttm_tt *ttm,
  				   struct ttm_resource *bo_mem)
  {
 -	struct amdgpu_device *adev =3D amdgpu_ttm_adev(ttm->bdev);
 +	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
- 	struct amdgpu_ttm_tt *gtt =3D (void*)ttm;
+ 	struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
  	uint64_t flags;
  	int r =3D 0;
 =20

--Sig_/dV=H1/m1EVRXXYbS0uMdmQQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+gyh0ACgkQAVBC80lX
0Gy8fgf/UpmdpGoqG9MhMzVybDdehT9ooRhhVvYV0bd5it86taYyXudjRo6CxRUp
4TS6M1A6TKjRY9DXAtQZsmHJ/kBagcTYUbhurylHmtlqDP493apOB29O1/VtBRi3
IRHk13rXjHp57L6TvRWJTm89JlXA6hDgo34bhg62nOh6aou9qkRmnvUAdf5cRwLd
UVg/wc7WOcvQ8C8cc44UZ+/41iEAyO2SweR83qcn80WO2hPwecB3eE3DUp1TS5uF
OatbXOtbo7dbrIQINH1xOLJzYxKBB8EhoGtryn3eyahqMqgmQwjw0z60tk6v+d6F
T9KgKJBd5RWx4+tDR6DYhlY0XliTrQ==
=tmF5
-----END PGP SIGNATURE-----

--Sig_/dV=H1/m1EVRXXYbS0uMdmQQ--
