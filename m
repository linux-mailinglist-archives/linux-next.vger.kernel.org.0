Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D01250E48
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 03:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgHYBft (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 21:35:49 -0400
Received: from ozlabs.org ([203.11.71.1]:53049 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgHYBft (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Aug 2020 21:35:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbBQV4VJCz9sR4;
        Tue, 25 Aug 2020 11:35:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598319347;
        bh=8p7ww7B74nvM8w6zFS7pwO7BTZdUOOnKMN6mqG+iohE=;
        h=Date:From:To:Cc:Subject:From;
        b=Xc0Q9W1YSqV0W9TJ0zJqXa/5RZKA2mztUZn7K6U6p4iCNWaDBqm9iD4hzD4pbCMsI
         OQ/gL/pXWrlrNZ49N8MfkX9mnC1AW1b0/NeLfDTESoaiEpnnZL2GAXogwZnyeqnwPY
         jaBeQsGd90vdM/Ppf8bkKkGEjkeEHru/adAciIindCuUpCwrUzxhUSdXoV6xgtpvVO
         68diPef7+iX+HiQr9mSyCiOXv9FbqLKPoLmgmUs9iaS5Zqv/cDnGWQ7050I8DOhfWG
         5u9IX6HfIVU8zMTE1kVQeEkKN8+MvWPM3d0CrnIt+tnSf5kZjoNAK0w9crJhWyPfNL
         pMXFB0SSlA/AQ==
Date:   Tue, 25 Aug 2020 11:35:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Aaron Ma <aaron.ma@canonical.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20200825113545.6e8d3a4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NCXA+tX1bYtA+FnVdqiK0XF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NCXA+tX1bYtA+FnVdqiK0XF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  3b2e973dff59 ("drm/amd/display: add dmcub check on RENOIR")

from Linus' tree and commit:

  4a580877bdcb ("drm/amdgpu: Get DRM dev from adev by inline-f")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index df9338257ae0,785f21ea35df..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -1383,8 -1389,8 +1389,8 @@@ static int dm_late_init(void *handle
  	struct dmcu *dmcu =3D NULL;
  	bool ret =3D true;
 =20
 -	if (!adev->dm.fw_dmcu)
 +	if (!adev->dm.fw_dmcu && !adev->dm.dmub_fw)
- 		return detect_mst_link_for_all_connectors(adev->ddev);
+ 		return detect_mst_link_for_all_connectors(adev_to_drm(adev));
 =20
  	dmcu =3D adev->dm.dc->res_pool->dmcu;
 =20

--Sig_/NCXA+tX1bYtA+FnVdqiK0XF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9EavEACgkQAVBC80lX
0Gz/kgf+Jk6orunwf0oAkK8oP3E0FAVh2i3EzoTZXZjvqHehmXhupnuLh1MUiru/
gnqAwGDF5CcmTF4e46YZjRAQz1ABCw84+VprZn+hdSGpfNkM0+wPfhYO0bG+txyp
wpWtRSVh7OCxpV8waszCnJzaf48EOo4itJ+1chHAAZ9Wd7B1fV8bmhfHU7atXMOd
gHEAxJjr56kqqfXcZonQK/+Oj/vjdkfL2YQFcHLyajLLhZURGvGaIIWpuV4B3LnV
K65Tp1NoynVSsGJsTPlAoWEBNH3IYSJHDHbVc18Q5GyeyI1QImGG7EyNvzVJTkzF
ZBw5Rov81Po4HACln27nlfaGlEeqdg==
=la76
-----END PGP SIGNATURE-----

--Sig_/NCXA+tX1bYtA+FnVdqiK0XF--
