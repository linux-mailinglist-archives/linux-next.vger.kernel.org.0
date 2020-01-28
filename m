Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6F714AEBB
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 05:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgA1Emb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 23:42:31 -0500
Received: from ozlabs.org ([203.11.71.1]:51603 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgA1Emb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 23:42:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 486DVr1gM1z9sP3;
        Tue, 28 Jan 2020 15:42:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580186548;
        bh=mdFAlO4xqDSxUJvby4gyYXsCSkEtFdc1ndNP7fQ7gaY=;
        h=Date:From:To:Cc:Subject:From;
        b=LJ6J9ShT0EGSyYxosF0fADdsq9URPFj9N1Zxn7klEv/GvwdvVlz6O7zBbxVtSIJrV
         XITaRDT2HCRyh65DaGgvnHsW85Fnc7rXRPcBFOfHI6AqeUyO+wWBR/TBzeYIO09KAH
         /qV5zpH6BQ88KZy0030jw1TZufueISLVDq+CO0fZvsRcOMEtL9tv0S8n6J4MOVdfQV
         QmYYTXqbb87WNpDpqveUEWqJXruumFKJisj5rr6szVBlWNZ3S/5s2WW+SWrfyrQ1/b
         /Ov3M1XbT8LudfzbMqJAoiUEmSwCD3zmiLSLYsOCdsHkvML/c1F1Q5I0g0srycRyS9
         BmfmdKyFT1RcA==
Date:   Tue, 28 Jan 2020 15:42:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Tianci.Yin" <tianci.yin@amd.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20200128154227.43f15a1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_fqnv+_6hBGTPV2SB6_uoQe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_fqnv+_6hBGTPV2SB6_uoQe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/psp_v11_0.c: In function 'psp_v11_0_memory_train=
ing':
drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:1047:9: error: implicit declaration =
of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=3Dimplicit-functio=
n-declaration]
 1047 |   buf =3D vmalloc(sz);
      |         ^~~~~~~
      |         kvmalloc
drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:1047:7: warning: assignment to 'void=
 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
 1047 |   buf =3D vmalloc(sz);
      |       ^
drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:1057:4: error: implicit declaration =
of function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-de=
claration]
 1057 |    vfree(buf);
      |    ^~~~~
      |    kvfree

Caused by commit

  240c811ccde4 ("drm/amdgpu: fix VRAM partially encroached issue in GDDR6 m=
emory training(V2)")

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 28 Jan 2020 15:33:44 +1100
Subject: [PATCH] amdgpu: using vmalloc requires includeing vmalloc.h

Fixes: 240c811ccde4 ("drm/amdgpu: fix VRAM partially encroached issue in GD=
DR6 memory training(V2)")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/psp_v11_0.c
index ac173d2eb809..0829188c1a5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -22,6 +22,7 @@
=20
 #include <linux/firmware.h>
 #include <linux/module.h>
+#include <linux/vmalloc.h>
=20
 #include "amdgpu.h"
 #include "amdgpu_psp.h"
--=20
2.24.1

--=20
Cheers,
Stephen Rothwell

--Sig_/_fqnv+_6hBGTPV2SB6_uoQe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vu7MACgkQAVBC80lX
0GzDEwf/eOakLMi/zmYAX55knylSvMVaF+QmQKA7pbz5RumsuD/XL97BnI1RtO0U
3TyeZySkyxuWAtMNqkXxPJIaPWBApUcSVQVt2ECRRzWQLB84+JxlqfG6Wx0WDgkO
68ekuZOQvqws38EMrxEFzbu18EL558kNyAWRsqIufdiVnqeY8lnG5ao/QlzHLRWe
37M3ed+1BUWrRx7Z2T+buvIlzYebWJiGGzJz+B5tpl3Zuxht/PweSsaJfJUosUFK
4lQDTbqsvDF+5KG7Om2PltU8YJoyL//jBZZQNz28v1taM8B8svo2D+PO4Zo+KeqK
6Ptmy+5DjgNrxqkgPdoDHae3EuHW2A==
=IAbN
-----END PGP SIGNATURE-----

--Sig_/_fqnv+_6hBGTPV2SB6_uoQe--
