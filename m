Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B082218CB
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 02:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgGPA00 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 20:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGPA00 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 20:26:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E922CC061755;
        Wed, 15 Jul 2020 17:26:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B6Zmt2j4nz9sDX;
        Thu, 16 Jul 2020 10:26:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594859182;
        bh=Qm6tyrRZb6eunf+LW+9roC1agW0dpeCfwEPJ3E7wFl0=;
        h=Date:From:To:Cc:Subject:From;
        b=l/k9sQX53ckdpdWKbTmC3Lck2lnHJ8Rvgh6r72lccmrR+wgJkHaK+wRDeBJZg5kuE
         j1rL+mTC0yTtb1nHY0lRyi9W298xUeXFX8JO1XmrCOi7ivXgg2kxj6SRK1xYyCuicr
         w89KTQ22EWPsJryqJj3gSb2I80zULsiuz7T0BBjLhp12Xh/qpgsMrWwBto4U6TNMn/
         Lin6I441evl5iCn7oXxykNzgw/F1XqJUE+33Ua7rtEcCf9ccizU5XQEkpm1iO3ex/h
         QFrjX4q0bMEn5qL5RhZA6qVjEBkHEYA/KZjLwqIQk5eORp/eRhOyrCqjwzRdBqQr0N
         2+fdmn+bewSig==
Date:   Thu, 16 Jul 2020 10:26:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the drm-msm tree
Message-ID: <20200716102621.3dc1f8e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t.4YD+B_TuPMMrZRkM3APuL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t.4YD+B_TuPMMrZRkM3APuL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  bead89dec68a ("drm/msm: dsi: Use OPP API to set clk/perf state")
  4a66a5ce8137 ("drm/msm/dpu: Use OPP API to set clk/perf state")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/t.4YD+B_TuPMMrZRkM3APuL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Pnq0ACgkQAVBC80lX
0GznPQf/ZLVdh09l7fNNNDnr8lxA7AMuhX/z7Doy7fUddKCcBuB9Prd8E8rGdiY2
pIHV+qxUlmsKcmAdWpukHXE1Sk8ClPGY4iQFctMi6KVI/ouLtu+PoyzRk24hNXd0
zA67hXSyiLm3xW5c08P7ngQvVGOMsV5lxI6s3SAfQehXi8j5nVVsh9Ov4bD0dIqO
NDvNQMn/vip8WaRTOUbaeHkdQyRUJt7n+ZFdZm8/PI8u1Xk3qHIPWA49Jl2KZqvk
ralzbmGtB6lAB8YoxrTVypKNzDwIc85oFMirapxJopyDs9L/jL4+HjxOQzgdQo9r
b99St9hbcPz4jaWGvFISg/cRjxGLng==
=Ro98
-----END PGP SIGNATURE-----

--Sig_/t.4YD+B_TuPMMrZRkM3APuL--
