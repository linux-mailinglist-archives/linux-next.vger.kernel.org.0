Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99ED2D0706
	for <lists+linux-next@lfdr.de>; Sun,  6 Dec 2020 21:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgLFUGA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 15:06:00 -0500
Received: from ozlabs.org ([203.11.71.1]:56101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgLFUGA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Dec 2020 15:06:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cpy996JsBz9sW0;
        Mon,  7 Dec 2020 07:05:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607285118;
        bh=wYgxx6MyAif0XDhUwOA30OGouNV8tUyuxPFR1rfu5wo=;
        h=Date:From:To:Cc:Subject:From;
        b=kx/uSzU8vQeDTWvRXauXWNe83V0NC58SZtnZeh1W3etXC4Bdpr1NwdSPIZHylEu3e
         VcHhyOj1MV4cnoX1Nkq9eBCR7B0lSAw939nz4fW+X5ZxMqe07pVbtfSjyiGptr4YHs
         0PmygBhKk36nhBhnl+x6AV0wXV2FeJrH20fsTLhQWwCWdRS36YC9jGe9pizu28ImPw
         KpBW0u7LztI721B0jL2HIZj0BokVN9OQ3h1sghGlMYriWeX4AeZWG8el4dIRHh0yC4
         B+O5+1cK9++AIIR1wCH81ox7BT2yR1cLo8KvQn8R2h8imOoq9z49v2SwTCppMZZj2g
         ekie3qty9USMg==
Date:   Mon, 7 Dec 2020 07:05:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Iskren Chernev <iskren.chernev@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20201207070517.28951ed0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X/tk6r_NtoH3C/EMPWAcH=Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X/tk6r_NtoH3C/EMPWAcH=Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9b73bde39cf2 ("drm/msm: Fix use-after-free in msm_gem with carveout")

Fixes tag

  Fixes: 4b85f7f5cf7 ("drm/msm: support for an arbitrary number of address =
spaces")

has these problem(s):

  - SHA1 should be at least 12 digits long

In the furture, this can be avoided by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/X/tk6r_NtoH3C/EMPWAcH=Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/NOX0ACgkQAVBC80lX
0GwvBgf/UtKexj/EgmdeVayzcaxUcdrWHHakeLz8O898t6IoFHHyxG0jM+F1BbQV
TZME/HBLJ/0vBymUJ1CisKGyDOxvIHe7u//ydB0ycusqztuQq+3f93TLtzoTejNy
I+Ag42VU3tqTiahLF6TuV6joN8/m9mywo7UFOTbB22k8AC6mJIr+n4M1wDswf9sb
oRdoaAtHY+8LsOJYI4RCSTiqz8SsAewzmlutzxRZNf69hByoKCEsXMZ/e+G/eBWD
2njerUSr/271pS/UGthlfZinTP0PV2MjbjjQBF5MGbrJZUBmE+NFSs3rvn7bVDsY
g6CoJdtCEja1Sj/LcXOLtYfkc+wDMA==
=KDvo
-----END PGP SIGNATURE-----

--Sig_/X/tk6r_NtoH3C/EMPWAcH=Z--
