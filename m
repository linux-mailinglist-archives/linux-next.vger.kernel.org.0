Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BF82EEAAC
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 02:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbhAHBE7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Jan 2021 20:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbhAHBE7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2021 20:04:59 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E49C0612F4;
        Thu,  7 Jan 2021 17:04:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DBlHL0VKWz9sW4;
        Fri,  8 Jan 2021 12:04:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610067855;
        bh=P3vN2qEY9eEOP134v3r4wMOqQouZR6UCpEjkj4ZByRs=;
        h=Date:From:To:Cc:Subject:From;
        b=M7PE0w2wMYHACTqVbfkb1AQJWXwZBqXjqMeexV+86ct5RVbfKLsq8ISvPnXn+6GvT
         cjf1CCJ3vuADOmwYY5K17tXgcIJY+0/BSElfpVw6pXWEuI/kUvnTySN52pwTtgMVtE
         5SXfl+Lr4woY2Mqrd/oWUb+Z8iFngc6puqPO3M0oWHKJ+P5Y+B5bZVr4dp3BzY1/VF
         Gj+pG/Ff6+JPZJw94gRPFzdwodG+vNwoxE869w0C2N08a82MNKnp86kJS4dFh9QSgH
         uQ2yVS7CNKRookVVDHqTqsB3t/9E+LfvknIa4EFqaaSA1k4z8M4TdDOLgoy8N+O6C5
         NP7prj2N48rTw==
Date:   Fri, 8 Jan 2021 12:04:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20210108120413.4eabad36@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cktADPlE+pR5ptT1Ac46jd_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cktADPlE+pR5ptT1Ac46jd_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c

between commit:

  eca22edb37d2 ("drm: Pass the full state to connectors atomic functions")

from Linus' tree and commit:

  540b60f9fc7f ("drm/amd/display: remove unused including <linux/version.h>=
")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 8ab0b9060d2b,5340c41b85f0..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@@ -23,8 -23,6 +23,7 @@@
   *
   */
 =20
- #include <linux/version.h>
 +#include <drm/drm_atomic.h>
  #include <drm/drm_atomic_helper.h>
  #include <drm/drm_dp_mst_helper.h>
  #include <drm/drm_dp_helper.h>

--Sig_/cktADPlE+pR5ptT1Ac46jd_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/3r40ACgkQAVBC80lX
0Gw4TQf+OTyyJdn5hmWWi9YQ8e5akeZM1pBcfBwYQNNwuxJKh2CX9y0F9af5FgoW
Jo5o1zb18yztGIJKch3BX7sjEpsYLDw2biwxHXbCUC8Y98uWUAMJwK3Hz4agLWhk
Q5hBP1wFIBkjrXTFGOYTgobPOLaRd0SDPWJMTJ/IAvRHS7ibJRyjQ2iE5fN4U6f7
p1+hMuAYNJiQBUgYwgxpJpynpHu5Hu/N6P/xScQD3AGc5ETtTnhd6MmVT6ibsPJi
tkrLOB1sZBvYqCCBkzp5GehPMMYJSAuCg67bdnJVQCUha6Sd6vIwxWkgJwb7b5wD
gThDGRTLMB8+XmiNZE4DW6vVnzlENA==
=WaCp
-----END PGP SIGNATURE-----

--Sig_/cktADPlE+pR5ptT1Ac46jd_--
