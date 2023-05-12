Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96786FFE0C
	for <lists+linux-next@lfdr.de>; Fri, 12 May 2023 02:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjELAih (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 May 2023 20:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjELAig (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 May 2023 20:38:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6742459D0;
        Thu, 11 May 2023 17:38:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QHVHX1Dn9z4x4k;
        Fri, 12 May 2023 10:38:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1683851914;
        bh=My2tDJ8+k3Zx2VnVNOEnNcWKiimgFTnpNXvSNUsAFzk=;
        h=Date:From:To:Cc:Subject:From;
        b=b07awEOvIwNjEgI8mYHtiYB07uNIcIQlQv/Kk5QuiYgB0pbJC6u7cNi8jbWoDg6NK
         NuUNN6fEDwmd01Kvbbv9TrowtHP5tbSUURHjIFDHzS1hrSVfRibl/Y4P1/uRY60y+c
         FSb0yOZ4b4Zq+tCAyyqgFwyI6ZL3JkNmFlb+1d5DFp6xYMKlEC4+HIC8W9QlsTg89s
         kR6edLTjnMMWU0TYwVe78Xmam8SP9x7ZYtQE8n1y8MnfCqtRDSDkwS4OkakQJA37fe
         T7sN14bZfb3Io+7/9LWzOmSek+eFycrLGVuYNSXGl6tFkEE3gWQ92epgQA8XTuBUmz
         uwv2fLDXPJRpg==
Date:   Fri, 12 May 2023 10:38:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        WANG Xuerui <kernel@xen0n.name>,
        Dave Airlie <airlied@redhat.com>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20230512103829.4136c741@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7aoyIV5=co.LNCbJp15662H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7aoyIV5=co.LNCbJp15662H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/Kconfig

between commits:

  78f0929884d4 ("powerpc/64: Always build with 128-bit long double")
  70cc1b5307e8 ("Merge tag 'powerpc-6.4-1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/powerpc/linux")

from Linus' tree and commit:

  d3295311e589 ("drm/amdgpu/display: Enable DC_FP for LoongArch")

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

diff --cc drivers/gpu/drm/amd/display/Kconfig
index 2d8e55e29637,b015c7d19531..000000000000
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@@ -8,7 -8,7 +8,7 @@@ config DRM_AMD_D
  	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
  	select SND_HDA_COMPONENT if SND_HDA_CORE
  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
- 	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_M=
ODE_NEON && !CC_IS_CLANG))
 -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || PPC64 || (ARM64 && KERNEL_M=
ODE_NEON && !CC_IS_CLANG))
++	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM6=
4 && KERNEL_MODE_NEON && !CC_IS_CLANG))
  	help
  	  Choose this option if you want to use the new display engine
  	  support for AMDGPU. This adds required support for Vega and

--Sig_/7aoyIV5=co.LNCbJp15662H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRdioUACgkQAVBC80lX
0Gw9UQf+Mh+RtHJTlV+ldpdC9D86sraukz0JrSnxLzz7iKO9K4IxD6078JYTYLFk
2RoTTI8Yo5qXhdTZoMQmkoCrFXUVtU4CqqWDtrEtzTEPN1BEJ++SccWSGdXM1l9+
LIqandQQ94qSRHhrBXlsa5Fa5Cp7SamKd/OLk4y/OqnlR/IhXipllvg4notliwpR
vPfMfEiSpaaeJWNFCJyOc2ZpD0hOMVhbDP6sTf7KOxdB68wNCFMEMl+/wLLknx1d
UGogaDbKUx+Zj3CUUEgNsRfOylHtM/etEclegQZ/KTydP/YA09SNkzgOle9iRTZ0
ZHEsjutAaykA64e0NsrYOoMoucV0Mw==
=VxGd
-----END PGP SIGNATURE-----

--Sig_/7aoyIV5=co.LNCbJp15662H--
