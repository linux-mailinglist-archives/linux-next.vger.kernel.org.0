Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D745F4078
	for <lists+linux-next@lfdr.de>; Tue,  4 Oct 2022 12:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiJDKAf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Oct 2022 06:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJDKAe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2022 06:00:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F014C1F2E1;
        Tue,  4 Oct 2022 03:00:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhY9V5b2yz4xFv;
        Tue,  4 Oct 2022 21:00:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1664877631;
        bh=0Ci8/uUmOT04hPf5Pe5xj4GFHiksvHxBWHES0kA602s=;
        h=Date:From:To:Cc:Subject:From;
        b=Ha4EyGe2tGv5iHR/nXG4182TK2vfcWT3BQ88cHE9e6opq9Ge9UNmYIJVkCEoeQoCH
         7cB/kPHNCQdsy/GL2cBJr9vR3LJXFY79gCTKWFbEVfOAvD4yd6/O6/5uqnkTvengfU
         6j4dcFbiMbNg923l2r1KonYf85Q5SqfECvT3eC8KFyylEFWrla0NEbwJ3vE8TfTTF6
         8tWYcPIE9xB/Fy8p1h4UQOQGz/Y+1s9VM8xTuzsSegf/szjKbwzwW5KUt/aSpxcmwJ
         HzGtyv7zP09J1Nrvb7MhzfgbG5G5eARTmn7IHbacotQKZKhcz/L4kfHqP34mp7gkGE
         DKIkBi11P1Wbw==
Date:   Tue, 4 Oct 2022 21:00:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Dave Airlie <airlied@redhat.com>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alistair Popple <apopple@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Philip Yang <Philip.Yang@amd.com>
Subject: linux-next: manual merge of the mm tree with the drm tree
Message-ID: <20221004210029.7412fcfd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=/oXt9/ITx=mXJPGED4dsZU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=/oXt9/ITx=mXJPGED4dsZU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c

between commit:

  3a876060892b ("drm/amdkfd: Migrate in CPU page fault use current mm")

from the drm tree and commit:

  c5f45c35acc4 ("mm/memory.c: fix race when faulting a device private page")

from the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c70c026c9a93,97a684568ae0..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@@ -949,11 -940,11 +951,12 @@@ static vm_fault_t svm_migrate_to_ram(st
  		goto out_unlock_prange;
  	}
 =20
 -	r =3D svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_=
CPU,
 -				vmf->page);
 +	r =3D svm_migrate_vram_to_ram(prange, vmf->vma->vm_mm,
- 				    KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU);
++				    KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
++				    vmf->page);
  	if (r)
 -		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
 -			 prange, prange->start, prange->last);
 +		pr_debug("failed %d migrate svms 0x%p range 0x%p [0x%lx 0x%lx]\n",
 +			 r, prange->svms, prange, prange->start, prange->last);
 =20
  	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
  	if (p->xnack_enabled && parent =3D=3D prange)

--Sig_/=/oXt9/ITx=mXJPGED4dsZU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM8BD0ACgkQAVBC80lX
0GxPywf/W/cftK6RJvXrF/dnFSE2Vpvp4uldszz8RtQxK/maCJ9oH9FqUhVWaQQx
wjARjFFN+gME4pnYoiZCB5WwFF2TH5ssGaDnw+AhBGzWAzVlVluQdXGj+ceq1mY+
InPxiPC2Z6FHKO4TgDQYDEbd5pDR+rM4T9DE6X0tiQl7AGSblU2SN93Slly4Rp26
fTIj9q/RU3jLjb5QqNrRHQ0HOYFxm4z90pgAYZUtx9L6rvVNbFWeZxVPotJIMpmI
GYRwijrqcSjiqCVBlLggALLVJeh/V1GqS+E1tuHg9OyoRYz71IbWHYl8TfRr2xWR
HY07184/VizpDow3c0+aLSlBnTvK6w==
=2syx
-----END PGP SIGNATURE-----

--Sig_/=/oXt9/ITx=mXJPGED4dsZU--
