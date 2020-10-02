Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1029280C88
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 05:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387502AbgJBDmQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 23:42:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54455 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727780AbgJBDmQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 23:42:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2bQr3vLyz9sPB;
        Fri,  2 Oct 2020 13:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601610134;
        bh=j5vGAk2m5xIhyg7SquaATB4YzkE8TxVVBcZ8BR5MTE4=;
        h=Date:From:To:Cc:Subject:From;
        b=gSaJ4Q0AK97zVYof45s9TECWj1RSE8s1/1viB2n3wyUarvrifZ5Lin7a8b49goiiZ
         WgTbiJbuwnU9/vlzjK2x+YaAwDdcExd29alD/23nbMIHXMIgs66GXH4IwBe7dNKCYD
         vyPiMLANXDgjKxGhE8Ags2RztcktZIe1Gptv9EVRVc12gOft7xE0ML77es/HBDr+nn
         L2qWZrN1ehxop4z+wLXR3qcXXMmcL9a4YKF/PmcQPBv2YpDIWYRr1u0aNHcIVFDsu3
         G9IgDyz0AwoDxzCetPgv1ntDzsiw6ezd/My8BzuYwD0QTDQHanBOhJ7ADuozmCjYnA
         HAEIAfVUGpZ5w==
Date:   Fri, 2 Oct 2020 13:42:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20201002134210.15a612d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0BquIwnRWKQZ7jmSvoMBe1a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0BquIwnRWKQZ7jmSvoMBe1a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c

between commit:

  b19515253623 ("drm/amd/pm: setup APU dpm clock table in SMU HW initializa=
tion")

from the Linus tree and commits:

  82cac71c1b64 ("drm/amd/pm: put Navi1X umc cdr workaround in post_smu_init=
")
  236b156f7388 ("drm/amd/pm: apply no power source workaround if dc reporte=
d by gpio")
  1653a179c822 ("drm/amd/pm: move NAVI1X power mode switching workaround to=
 post_init")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 8dc5abb6931e,5c4b74f964fc..000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@@ -955,35 -1013,6 +1002,17 @@@ static int smu_smc_hw_setup(struct smu_
  		return ret;
  	}
 =20
- 	ret =3D smu_disable_umc_cdr_12gbps_workaround(smu);
- 	if (ret) {
- 		dev_err(adev->dev, "Workaround failed to disable UMC CDR feature on 12G=
bps SKU!\n");
- 		return ret;
- 	}
-=20
- 	/*
- 	 * For Navi1X, manually switch it to AC mode as PMFW
- 	 * may boot it with DC mode.
- 	 */
- 	ret =3D smu_set_power_source(smu,
- 				   adev->pm.ac_power ? SMU_POWER_SOURCE_AC :
- 				   SMU_POWER_SOURCE_DC);
- 	if (ret) {
- 		dev_err(adev->dev, "Failed to switch to %s mode!\n", adev->pm.ac_power =
? "AC" : "DC");
- 		return ret;
- 	}
-=20
 +	/*
 +	 * Set initialized values (get from vbios) to dpm tables context such as
 +	 * gfxclk, memclk, dcefclk, and etc. And enable the DPM feature for each
 +	 * type of clks.
 +	 */
 +	ret =3D smu_set_default_dpm_table(smu);
 +	if (ret) {
 +		dev_err(adev->dev, "Failed to setup default dpm clock tables!\n");
 +		return ret;
 +	}
 +
  	ret =3D smu_notify_display_change(smu);
  	if (ret)
  		return ret;

--Sig_/0BquIwnRWKQZ7jmSvoMBe1a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl92oZIACgkQAVBC80lX
0GxfqAf/f5jTLg43luBoQHAtH/Tf7I/vaxvyt7gPA4g14nlq42t98GaSB08EVAw6
B0Z1xQlqZWx/sm7Uj9cSIdYAL62Kb/mF+0IlJQwD3g1q2SAjuC3+I5AqRnrf2Cmc
JGJpHjOaodnuei7ZuIowq6rp543cKBRB71aho8k/eVCu8/YNh+h/D0EM/R5pQxLy
znL5p9sgJ8W9JL3oX+snFy5BytJaBRpWVx5vNSLsHez0DLsUOucLKsfkCj71iYcG
qUSIyPCg+9E1PHjo+KfOcZSXJjIdAfHADJEKKBpGLy/UuryOCEfIJQnkl4+64t3A
PcnZ7d9wAVvjzn7w6MaO872yVB6alw==
=WkEO
-----END PGP SIGNATURE-----

--Sig_/0BquIwnRWKQZ7jmSvoMBe1a--
