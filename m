Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8C5F237B
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 01:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfKGAqM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 19:46:12 -0500
Received: from ozlabs.org ([203.11.71.1]:53073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732064AbfKGAqM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 19:46:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477l826FKPz9sP7;
        Thu,  7 Nov 2019 11:46:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573087570;
        bh=nkq5hFWwX1Aoq4w6IgOgECJ2w29yHF3XV8iPziMY2zM=;
        h=Date:From:To:Cc:Subject:From;
        b=FfgAeGQzeTqx8PGY+C0YnSce/jYm5sBC95kAs7JPFGRg7sZidQxdq91+FWQ9brtzZ
         Be5ZlPGtZfY8/6wW0fhul2JqbbPhgvMMfUwHOd8LVnCDCrIscakIClbiioYMPF3C/t
         4Rlyws60j8qpXGu3iXmamS0ORrd+xFtGBJIILHzkbHkybzERlVU4uUxHJPtcptXBwI
         OoT3giQyul0+UgkKKH5mSJU0+wDtTAL+FWm9R1nb/sCAAE6+LUdekRNcCOGJrEhoyL
         oABC3N+fHOJRruyV80r6kDPPEhc9lvOtiLDyPvTzsK/008TNejEr2jMqcENii9oeS9
         ewyc5ZUm14T0Q==
Date:   Thu, 7 Nov 2019 11:46:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20191107114608.43ed5708@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ig=bSjCG9CkA2qjYOV.YwOS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ig=bSjCG9CkA2qjYOV.YwOS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "dc_dsc_parse_dsc_dpcd" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!
ERROR: "dc_dsc_compute_config" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undef=
ined!

I am not sure what caused this, but CONFIG_DRM_AMD_DC_DCN is not set
for this build.

I have used the amdgpu tree from next-20191106 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ig=bSjCG9CkA2qjYOV.YwOS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3DaVAACgkQAVBC80lX
0GwREAgAisQ16G8CKcIge0FsaDkQSN8pL8i0AZ/LIt9kXstMhxfFMRqjr2Uc+wV0
q/ThBcvRe2JDDALoguSXPHsyiIxo2c0KDRR9dyyv/qMeJcjf8RgUS/SoJrrOHmH7
Cdv3Chbyo0tjEuUXZkbXrJi8fclzM2ehDOTpjnia/8j/e8erxOXfHy4Tdod8nNBu
M97T+bKzw6d7RvH9qkeKTWqrgP2kT95Ic9LDIdcalaSFCHz3+MP0tIDmh2KkH62x
6PIYr7IniwCmfGVNwcWleoehweYUGJNtDMYoxkrUyeaip2aG6RbMDb+ArdCHURnl
B6IazqwdQ4j0BBkHe3ol8Ib5WFkJvw==
=K6cQ
-----END PGP SIGNATURE-----

--Sig_/ig=bSjCG9CkA2qjYOV.YwOS--
