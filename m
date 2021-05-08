Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D7A376E74
	for <lists+linux-next@lfdr.de>; Sat,  8 May 2021 04:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhEHCRt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 May 2021 22:17:49 -0400
Received: from ozlabs.org ([203.11.71.1]:34677 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhEHCRs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 May 2021 22:17:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FcWCf0RSsz9sRK;
        Sat,  8 May 2021 12:16:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620440206;
        bh=mqVltWUpXcWEjiqQaH8PEespOzgUO6oe5aRsIgD0Byk=;
        h=Date:From:To:Cc:Subject:From;
        b=ADnJO/blMW/DFWRlNfXN3o1er9wUeVodMNXs6fjIJil4zB2kwYw/A2pNJBkHVCXXo
         yrASZ8XiX0nu5wN8lc7IjI49uvaT/5pD32dxSzfRU23qUD9tcXZyWvM/C3B/rmpSdN
         AHRmKYtnSVxIWo3DFT9Fy2Ptj3ydv8o0kKMN3gHGkgiSGQPdHERLiHpjAV9oPos+/N
         FNCEANmsWAFSXwldPPoBhgFx5TlWow+SAVPjQnk5+BHDvzHbe3m5uVuvZ9PStuJ5kV
         003K0pMAVtwjoOVvNgj7MXwVcK5LnpchadTw9gtl+L7H9z6rI8bZnMcbY1FT8rEjVy
         ux/PssoibrCmw==
Date:   Sat, 8 May 2021 12:16:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20210508121645.678d0f4b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BKeLsENZQjPF.iV5w4Q/9qc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BKeLsENZQjPF.iV5w4Q/9qc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d9aa6571b28b ("drm/msm/dp: check sink_count before update is_connected st=
atus")

Fixes tag

  Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and=
 pm_resume")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: ea9f337ce81e ("drm/msm/dp: reset dp controller only at boot up and p=
m_resume")

--=20
Cheers,
Stephen Rothwell

--Sig_/BKeLsENZQjPF.iV5w4Q/9qc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCV9I0ACgkQAVBC80lX
0GwEcgf9ERTrbNCwP00UrYgHMPd/MPN0+Znh7sHUCoXuug+JBGskQmY1zJkkUdNk
oAWAd6YbRqqKshoJPzKP9ITtQRKZgX6u8vRy2uBu+OLhxN7b1jaEgjIYQEkbPbu/
SOxYnRJWan1mlfCtdsGO6aDwvXs62RwS3COvKe/2QP8yYT/6A9BayvHKzf97yjhM
Jzq64sUy9nWL8ieJ1cSRGIyen6IYZTjDLqB/Y5z1Hrbsohbw1Xc7meds9sk0DPFA
UgUgMrZ15Jxv60KBr25ucFTq+4SDGja0O/Mb/O/lawCivEVpfyxg5yrNRPBbhQnz
mJZAoM+lPPKeRXbHCX2Vl03B94CsTA==
=+tcw
-----END PGP SIGNATURE-----

--Sig_/BKeLsENZQjPF.iV5w4Q/9qc--
