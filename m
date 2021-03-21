Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE53343500
	for <lists+linux-next@lfdr.de>; Sun, 21 Mar 2021 22:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhCUVSf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 17:18:35 -0400
Received: from ozlabs.org ([203.11.71.1]:56103 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230167AbhCUVRb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Mar 2021 17:17:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3Vp14Nsbz9sS8;
        Mon, 22 Mar 2021 08:17:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616361449;
        bh=k+agQqVxBtQXBT8BgyXCm0llAnynlqY1Ioi1736IMIQ=;
        h=Date:From:To:Cc:Subject:From;
        b=OGDiNRiv+9hgUpDA3ocWZk6pkadZCD+ikvsAK+nYfYmU/X4IMG+63SC7rvfiSxFGG
         DgdiL7YyD76FPZTOF4bJej+S9ZMW+eoUesqkuN8Uy9dSFH5AgeuhOSdhAVuNBe9edE
         06uUf18SN4dCiY2Gl5maBKXtA9boO7o4YwSyGrIMM0ax056ZTgqYSJpWIJTfpkLjwZ
         N6FVKoY334O5neBFTiKqcN3P5zau2eeJonEE3NqWDF4wVku3l9mSpNdc6fm4JTN1z9
         ys3flE4TiQfhcHGbcRAzLTRUbsExrGzuceCbZRYsflRXKpxb2SWXSfmAVfGD5bE6Zo
         qB3p3ZMTbKtcg==
Date:   Mon, 22 Mar 2021 08:17:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20210322081728.68875899@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Fi0oKBQKUhGtxmFkx_N9sx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+Fi0oKBQKUhGtxmFkx_N9sx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  42b44dbf555c ("drm/amdgpu: Enable VCN/JPEG CG on aldebaran")
  19eb0ec1d1a2 ("drm/amdgpu: add codes to capture invalid hardware access w=
hen recovery")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/+Fi0oKBQKUhGtxmFkx_N9sx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBXt+gACgkQAVBC80lX
0Gwzuwf8CT0eopEwyZ99TJSsJedfutOtpvViU8yhDEgukTs9WU1Q/uFzISWf74jD
Iwd787Vhw2sqVLmYViUlDcFgYq/B3BRF39ExYCgjfpQ+8uANw1xpbVESP3J6RnVR
qobmXccABjT8YLfRV/0Br1KyFVRwjVSRNlGqmDGMiC+p+flbczNNvRVBmnJNuQfn
6kcRGGM4/2jn8hm02J78F0HRSi8D/iMILKmUnK6zuHCvz1hx4kANPpdnAy3ll3I1
Vp4VITtSUvE5e96o1cokX/5RqVFDKEovhOYejWBH24OG6vYuhY1OdZxmcN+Rk4zc
oJ7BeUKieyjJqs+vQ0u2NxVFCvchNg==
=8owB
-----END PGP SIGNATURE-----

--Sig_/+Fi0oKBQKUhGtxmFkx_N9sx--
