Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08DF11C0A4
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 00:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfLKXhm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 18:37:42 -0500
Received: from ozlabs.org ([203.11.71.1]:46837 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfLKXhm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 18:37:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YCyq3Kvhz9sPf;
        Thu, 12 Dec 2019 10:37:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576107459;
        bh=anOBSm0Hx5W98+Fik5tTRV+QdfBiQItlqQqJav57vzM=;
        h=Date:From:To:Cc:Subject:From;
        b=GUvuPFbxC70xmhfrjEQWZfz2aKHdNG3Yve6C0r2zZfA3GwSFmKwB5/3NFxrIQUYiI
         hPkcGGxayHNIP3O098mURkMII/B28kP1GJhi0/t5g4b76l+fg1vgYQ0B3RF0JnbSnx
         +Qmtz24vm579q7TraZ3PuMNUy8SML949G8LxjLU5fOdeyk6rfQXnaadHCEqxzDGL1k
         FyCwpSyyFYCZfD4NM6wzBba0Wv/vStgkipdTCiLDypG/QbTNbuu9RZz+VOhacDXykE
         CpofE7X3UTcEQS15/tNgoiRCNCFoACbdf3WI22IaPKrkauIaOxZbUq6Nw1oy9QKLYF
         TsTQnWHotaO6g==
Date:   Thu, 12 Dec 2019 10:37:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yintian Tao <yttao@amd.com>, Jason Gunthorpe <jgg@mellanox.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20191212103738.1b3b085c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2g+4lXBbe75hosTkGlpOraX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2g+4lXBbe75hosTkGlpOraX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

between commit:

  62914a99dee5 ("drm/amdgpu: Use mmu_interval_insert instead of hmm_mirror")

from Linus' tree and commit:

  8497d2bcdee1 ("drm/amd/powerplay: enable pp one vf mode for vega10")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c17505fba988,8992506541d8..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@@ -2794,8 -2828,6 +2828,7 @@@ int amdgpu_device_init(struct amdgpu_de
  	mutex_init(&adev->virt.vf_errors.lock);
  	hash_init(adev->mn_hash);
  	mutex_init(&adev->lock_reset);
 +	mutex_init(&adev->notifier_lock);
- 	mutex_init(&adev->virt.dpm_mutex);
  	mutex_init(&adev->psp.mutex);
 =20
  	r =3D amdgpu_device_check_arguments(adev);

--Sig_/2g+4lXBbe75hosTkGlpOraX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xfcIACgkQAVBC80lX
0Gx0qwf8C8ZKnyjMlYh9MF74yk4zH0ETeMLjH1+ePAUejEtOM9LzI8NYiFLj6M3q
xsagMfZTDQ0p9ufLxeeSKK0wVzMMnHb9uasCJZmoRzrE1/nvkAtFDdUt515BEcoU
56kc56eDjNcGzCaqHkdekHI3lr0EVIKwHUr26FxRMWSV/Lpd+EVPGPsSBWIwxOxO
bF0eUgayGXHQ6VT4m6nNjIM4JIO/YRH2dW66XLQOIlJOd5kePDiT8gxab+xxAjrb
LOuh1Lfsw3e2z5iPZ9LSkQqDhAhQhubkS3cmThTIkuLjTfIaGHWbjW2gdNDgpm/x
Ii7FMrrecu+7zZ7wpN3Yry34X6P3nw==
=5dF8
-----END PGP SIGNATURE-----

--Sig_/2g+4lXBbe75hosTkGlpOraX--
