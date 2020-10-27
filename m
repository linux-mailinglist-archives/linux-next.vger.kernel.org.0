Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7014729A1E7
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 01:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442752AbgJ0Asa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 20:48:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442734AbgJ0As3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 20:48:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKtNp16w1z9sRR;
        Tue, 27 Oct 2020 11:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603759707;
        bh=822m9qPrS+s1QTXC9KKA+PRBV5PsASCb6wd+PHD2IGk=;
        h=Date:From:To:Cc:Subject:From;
        b=PK2x0obBl2hfCbbRMAxLpWaKbgU1lMndwYIVlfzoaL8Yzl79HT2/ZrJVv7rz4L4a7
         39pfCGuLEQ043M44cWnJd+H+Irrrz+r6cA80fsIYASWS2YklUxR1A8H5fv17UEiCR9
         lp8L+RtX5XKF78pmsM1hCeEN+z4xHRnKjOhcn+L0pxRnwHO4k5ILkS4PTfW8SH+4ov
         CA7VQyntNNADU0Pq8vwiCnLO4sSJpxvS96xJRA0UUXUcVWq8fnzf01Xa5VBa7/I1mT
         OXOyiU1HNaGYAgtzFeOoEVv2TJXOg3bvRjisLlwsP2zkacixkXRCTPksOQ7Jq1IOAD
         FV4iba+idpI9A==
Date:   Tue, 27 Oct 2020 11:48:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        xinhui pan <xinhui.pan@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20201027114823.09453419@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qr/RIjtqx3ZIyJFFILrt6ka";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qr/RIjtqx3ZIyJFFILrt6ka
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commits:

  0fe438cec9e1 ("drm/ttm: remove default caching")
  9c3006a4cc1b ("drm/ttm: remove available_caching")

from Linus' tree and commit:

  d836917da7e5 ("drm/amdgpu: Fix size calculation when init onchip memory")

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
index 8039d2399584,11dd3d9eac15..000000000000
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

--Sig_/qr/RIjtqx3ZIyJFFILrt6ka
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XblcACgkQAVBC80lX
0GwsQwf+NNOmLmYkDDIOs7m//Rmr/GoZzfMviPlSKzg3K8YXO6kbuAzjY4EwPPWl
X4wtUYBdStPPrY0GbRjAXwo//Sm/z3TM7ZaMUOzInAswVBkqz7npCyqVDhbftkiu
3lVCC+zna2m7fMe68TxTedsEBKbGVd9kyXe7OcK4o8dthcYg+k3y8Ndc7EVktpDl
4QSBO/6im1Ar2XMmYMkqXNi8iVP6supr5Iew1X2R67+73qzoDRSvEnFW0HEstGhv
cBGTbK24y2lTWZSa/dippuCmoJAdP5KcjDTnSzsUHDdC715j0unyIc5vKG3H7nCN
NmcCTm88jM1aBSD0Bv0kQVflpZKr9g==
=iZ5l
-----END PGP SIGNATURE-----

--Sig_/qr/RIjtqx3ZIyJFFILrt6ka--
