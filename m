Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C92F34120C
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 02:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhCSBV5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 21:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbhCSBVW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 21:21:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25851C06174A;
        Thu, 18 Mar 2021 18:21:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1mLk2wLgz9sS8;
        Fri, 19 Mar 2021 12:21:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616116878;
        bh=MSKNZ1kC8T2iJgAgGCtWH+4uhSR1nvIZZMaad6Ml+wA=;
        h=Date:From:To:Cc:Subject:From;
        b=npUyXz0ayQkf+FcFAFwp78LbF9EIl7LBPSyn+214gfU+t9qiKQttI9bXgfgvbE1rg
         SQ19xDBTQbtuv6GTEXbPqVYr2GEeRnY19aPLNSQZUkcIXLRHH+EzIy/n7Q/9oZKdX1
         oE/EwpgQrpumap05S7XoqcqAFx+lIwpuW4rXVmTGND8+GrsZd5subivIjFAZVYuWbi
         D3qS73iqCkhmHiDsUFg470i7i1Ao3HrILYk4cQFiuiNl9a4IyRAFIhTqWIfPpynfZl
         r3vHOmpA/cdfi3Kqo3Wrg9Zc8f4ECht6RmwWbsBGwZUBjV/+7mC1LJio2LcOaIE3Wr
         YGRWkMvCSNLpg==
Date:   Fri, 19 Mar 2021 12:21:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Dillon Varone <dillon.varone@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210319122116.6c703583@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LkXALco0NdIPjGu2j9rsfUr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LkXALco0NdIPjGu2j9rsfUr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: modpost: "dc_dsc_stream_bandwidth_in_kbps" [drivers/gpu/drm/amd/amdg=
pu/amdgpu.ko] undefined!

Caused by commit

  a03f6c0e26b2 ("drm/amd/display: Add changes for dsc bpp in 16ths and unif=
y bw calculations")

I have used the amdgpu tree from next-20210318 fot today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LkXALco0NdIPjGu2j9rsfUr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBT/IwACgkQAVBC80lX
0Gx7vgf/YbKHa9bzIizcoZsCshbmfmZ93bOeK9xr4dPfaOiCMFM96H4E4Z2XZmCN
d1Nsrdk/BrWJkDiKYdnL0Gp3gYIzxmDc4AK8LOWv19NtEqZBb/A3eUTg6sq1mdJb
dQfAUxtPnCng88/goUr2KA8mIZkZCa8/IWeAU68WmB5IMkLq77ji5jpqznXV1ELc
nqJdIW0uw0z6v3sVYSeCsTpqoeJ/MOJXPQX0mqfErGya3RFMpW6VNC52+wIey3Kf
6BCL93axIChbPjKCLxp0WJDuxTSeo2zrMPaDkC20/3S1h/hxzMNBF6K3WqTGOxLk
wse8/JMNur/ITf4zLAX3+Iinhs0/4w==
=m0Dv
-----END PGP SIGNATURE-----

--Sig_/LkXALco0NdIPjGu2j9rsfUr--
