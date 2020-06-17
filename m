Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BFD1FC31C
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 03:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFQA7e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 20:59:34 -0400
Received: from ozlabs.org ([203.11.71.1]:54721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgFQA7d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 20:59:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mmtW0xJVz9sSd;
        Wed, 17 Jun 2020 10:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592355571;
        bh=GFBSasXQo+uKQuNXeDI+CzG7gcS5dADb2nU/NU1RmL4=;
        h=Date:From:To:Cc:Subject:From;
        b=tisa0g4ZLJgX+QiU36LhpZcJNT42ogc/PRfwTOAqnU0LEQIAD9jWxS43n72ir6KvS
         1eDE+I9Kbk8fAmWfDTYRTyG7AYY7/sZyGh+iU5+gthhJUZ+N8+j4gop48If+Nc8j2M
         Ckq+E4xAozMEQPssnMtaBDt+QvM9haHCfUF6LG6Da0ApJ8KW3XCZbUpDFL349oKOfu
         m+zStYxj16NDNpgAVAhsB5gJ24ZeJK61/gu/3Km/gf7LBu96GsYhlePcOliazbz3NE
         AcB67UNcRk7+5fpGof/j979y9Oj44Zw9Ey2aCkft2X7/+DrHheXAcs8FNZjNv7X61v
         Fc9XiKlbmR0Hw==
Date:   Wed, 17 Jun 2020 10:59:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200617105929.534edd34@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MxT6_+HvYX.kK/4n6ZLF/AO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MxT6_+HvYX.kK/4n6ZLF/AO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: In function 'amdgpu_amdkf=
d_gpuvm_free_memory_of_gpu':
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1357:2: error: implicit de=
claration of function 'drm_gem_object_put_unlocked'; did you mean 'drm_gem_=
object_put_locked'? [-Werror=3Dimplicit-function-declaration]
 1357 |  drm_gem_object_put_unlocked(&mem->bo->tbo.base);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |  drm_gem_object_put_locked

Caused by commit

  ab15d56e27be ("drm: remove transient drm_gem_object_put_unlocked()")

interacting with commit

  fd9a9f8801de ("drm/amdgpu: Use GEM obj reference for KFD BOs")

from Linus' tree.

I have applied the following merge fix up patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Jun 2020 10:55:32 +1000
Subject: [PATCH] drm/amdgpu: remove stray drm_gem_object_put_unlocked

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b91b5171270f..9015c7b76d60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1354,7 +1354,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
=20
 	/* Free the BO*/
-	drm_gem_object_put_unlocked(&mem->bo->tbo.base);
+	drm_gem_object_put(&mem->bo->tbo.base);
 	mutex_destroy(&mem->lock);
 	kfree(mem);
=20
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/MxT6_+HvYX.kK/4n6ZLF/AO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7pavEACgkQAVBC80lX
0GzgoAf+Nw2Z91LEhAIuWthscZ3FUv247hC1EDpWFk0MKhUpIcihVubiiShVF9Kb
7MssDXDyYaXRPkeMRHdP359SDpcoixOJtTUjKt0PF8PlReWTD/DludpGSQzPVBvc
rUHMaW4yvzEOhCpaBr2/JhiTCldajXoyukUZhF7tm13aYvlJGtJLGcW0nvr5vT6z
tLIVFM2B4SFyM08qf3vEJY/CRsBxpNWHGXnsPYDoGtQDrFygpqhJVa0oY0geCSoi
FyAn3flNWJPP4H6RUYKPoHw20pQ38FOHX2L5eews5Zq+uZWMLV4AlnjFPVZ92p+A
I4UosxsUfqXshjy3wsa1EHxO+ptreg==
=zGIh
-----END PGP SIGNATURE-----

--Sig_/MxT6_+HvYX.kK/4n6ZLF/AO--
