Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10721152271
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2020 23:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgBDWpG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Feb 2020 17:45:06 -0500
Received: from ozlabs.org ([203.11.71.1]:34401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727604AbgBDWpG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Feb 2020 17:45:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48C0Bk6P1yz9sRG;
        Wed,  5 Feb 2020 09:45:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580856303;
        bh=XjnKhWUeT2aA272cve5msZ/Tda9nKnRkTA8Pr4oy1n4=;
        h=Date:From:To:Cc:Subject:From;
        b=Qhm990WxfqRRwkRtSwa0SJBCa904qwiBhhS9hBAqPBr+d2VXcSzRmh4fvTLT1vR+B
         aoZpL0sKPjqjInpcQVSziNADhfNfTJWRFJcZHK9CmQlHuR9wtBH3JvlKDrp7mfTVKm
         EKYdM/JScO6FjxLxGhheXl8EtrP2xApE8SbxxNlXY1cjTuR6s1Q93WVi+Uc4Zf50TD
         ftki6fCnGiYruBRdxrvba+MEB77Vc3fHo7+tqDtxzFDF2f+VU+fryYVQPRPMLw3dn+
         BaAlv+9/H/Rin07MStjg+9MTtFp7KB56YXxxFPxvZoueV5WcZIbi+1gIqJxpglBM5Z
         cL41glO29ZoUw==
Date:   Wed, 5 Feb 2020 09:44:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Frank Min <Frank.Min@amd.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20200205094456.7f41ec4e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+4nzSf1pdYqPUBdli9k.RjM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+4nzSf1pdYqPUBdli9k.RjM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c: In function 'amdgpu_xgmi_remove_d=
evice':
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:466:3: warning: 'return' with no v=
alue, in function returning non-void [-Wreturn-type]
  466 |   return;
      |   ^~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:461:5: note: declared here
  461 | int amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:470:3: warning: 'return' with no v=
alue, in function returning non-void [-Wreturn-type]
  470 |   return;
      |   ^~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:461:5: note: declared here
  461 | int amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  2fe4750e8506 ("drm/amdgpu: move xgmi init/fini to xgmi_add/remove_device =
call")

--=20
Cheers,
Stephen Rothwell

--Sig_/+4nzSf1pdYqPUBdli9k.RjM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl458+gACgkQAVBC80lX
0GxITwf/cH9GSswlD1acan05JLq1aabo0qjT7kk5myR7hvtjwt1e9UQnPzTVp+hN
mzyV9+MpqOdn3WetotHQnSccPIIVTh2/bj8X9BXtDj8huv9EtV9/SAfHlvUUWHDy
qJluJeySzqMOWtZWCj9x5l41Pq6BIXv1UZ3oBjn/49+UkvrdcyPGx5qpGQJW97XT
Uv6RmP6VmSfSWXC5Am9R3qWem9Tph2QeBcbn25mfWVKjzsvgpF3GgqcnWlFLXfd7
WdRh0z9TCMgkh4BwKtDPT5YVsbJMQQQVIhPZZc54y0YmkdhcE60zEWdxu4VRe5Ke
edmxd2/vqT/UWyFyc0YSYi7Rm+xGpg==
=+ka6
-----END PGP SIGNATURE-----

--Sig_/+4nzSf1pdYqPUBdli9k.RjM--
