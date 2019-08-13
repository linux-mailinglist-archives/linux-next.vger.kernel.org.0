Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 736D88B209
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 10:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfHMIKn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 04:10:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56685 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfHMIKn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 04:10:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46754c19vBz9sND;
        Tue, 13 Aug 2019 18:10:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565683840;
        bh=9YJW9vbhfXHgmO+AE93B2gmuMZ72onYOjLAtidZ8cT0=;
        h=Date:From:To:Cc:Subject:From;
        b=Uk8mQ7LHnhwY+ePMPLV6BVuFzJ10/9IQ9/381w52PvEGTmCsGRCILaHka5SZ/vCUI
         Sujv0jh41el57+wyU6yyyFT321y9coBU8Wuud7V4hKgUBvD4yv/YYq9T8g5xfp49Eq
         u9R3hNxKHVnvuK5P+kINrBb1S4LS6UDmwjbSN1JWLZrrzwskowlUNSxL9S2HJA6vzo
         uIplZj+aM+g0leu3A2P6JtiYOkfRWYnVeBmpp3L8eNtq6Dm4AERq1tFy6OyXBM570K
         tXXCM1C3pkaiHbKWMzyYDHnlbQ9sKVYAhVIDtj01xl+vKiKkRob4WSCA62DDTj6Fti
         4kxJPl7GPNrqQ==
Date:   Tue, 13 Aug 2019 18:10:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aaron Liu <aaron.liu@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20190813181038.2c6aafb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B1oqMGW08RKx81c05ysn+GP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B1oqMGW08RKx81c05ysn+GP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/psp_v12_0.c:39:17: error: expected declaration s=
pecifiers or '...' before string constant
 MODULE_FIRMWARE("amdgpu/renoir_asd.bin");
                 ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  6a7a0bdbfa0c ("drm/amdgpu: add psp_v12_0 for renoir (v2)")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Aug 2019 18:03:16 +1000
Subject: [PATCH] drm/amdgpu: MODULE_FIRMWARE requires linux/module.h

Fixes: 6a7a0bdbfa0c ("drm/amdgpu: add psp_v12_0 for renoir (v2)")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/a=
mdgpu/psp_v12_0.c
index f37b8af4b986..b474dfb79375 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -21,6 +21,7 @@
  */
=20
 #include <linux/firmware.h>
+#include <linux/module.h>
 #include "amdgpu.h"
 #include "amdgpu_psp.h"
 #include "amdgpu_ucode.h"
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/B1oqMGW08RKx81c05ysn+GP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ScH4ACgkQAVBC80lX
0GwKzAf9FckYRRBgv8b2Eqg/TRBHfijH0ezvMYt2kh65TKYbH0iScMg2onU/z5sJ
HyI7jfnq/4tZtYXWKw7GeshhnY89hdf92U0DJLH6KEFKt7T1NPsXVmGqQzgQJcC6
RLY25MO8YdoaWB7f8SjyqMwgps52AUDdOS/z5nyFACRzHN1vZIqXUDDaE1mvt0fb
u8wzHo3opVzYE8N/En6GCSzBI8WqfOjY0w4PKgyeJmmDXNZz/osmtmkyrYHD+dIZ
GW9U/eKMgXY66S80jCg5YaUBG9p9yTRk1IUcbsNL6XDm7Z2wBeSppMoOo8vFVkVV
SeNxzJIqVDtEad/kLd3zzQN+1Pqk3A==
=c4NM
-----END PGP SIGNATURE-----

--Sig_/B1oqMGW08RKx81c05ysn+GP--
