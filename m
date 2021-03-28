Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2876D34BF45
	for <lists+linux-next@lfdr.de>; Sun, 28 Mar 2021 23:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhC1VYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 17:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhC1VYV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Mar 2021 17:24:21 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36059C061756;
        Sun, 28 Mar 2021 14:24:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F7pcd4WKrz9sWm;
        Mon, 29 Mar 2021 08:24:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616966657;
        bh=IGLnPqS1N2c54wBdV60WDs9h7JPWi2Jfhvczel1jzW8=;
        h=Date:From:To:Cc:Subject:From;
        b=h2XPPL0UCofdwxfRqW0Ky5X9K1FjrG36pNaCiMEBqMX7mCG6K7/BDFxBdbXIq1joS
         /171h87aESmq5v8DNE5bETSWeOGEa8v/dRgQwnvrJuLoUxJ2q0LHOOxEPW1lP+uql9
         vTHv+mLYkoQ3g8BM1eh2KotjbKIujpEBS3fEI0QdGMiJwDEfYcDnPb5VtgFt1EPW+B
         1h+gbi+spwbIdmY3lkfMJb2n2XMRbBCWfWWhAHedWsiDQwTRbodf/fzghP9hzDsKBv
         d26uRAxVjuemb6FU0yeGZZSG4trvSlun637wBxGmFYneR/EDl5sBOKDsX9gd4BFBf9
         yXkhSL19DVd6Q==
Date:   Mon, 29 Mar 2021 08:24:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Mark Yacoub <markyacoub@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20210329082416.40b7f449@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2P1chjycQd+Ag4CgBhF6Sko";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2P1chjycQd+Ag4CgBhF6Sko
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0ea5088407fa ("drm/amdgpu: Ensure that the modifier requested is supporte=
d by plane.")

is missing a Signed-off-by from its author.

The author is "Mark Yacoub <markyacoub@google.com>", but the SOB is
"default avatarMark Yacoub <markyacoub@chromium.org>" :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/2P1chjycQd+Ag4CgBhF6Sko
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBg9AAACgkQAVBC80lX
0GzxEAgAgB3BUAEs1wZoEvJOHndoBddTkgP5EihRSSoZkE2H4tLGH82Y+/236aaO
dEOI/9ph4i1lwRCUbkEbuVcwLXeUNc8FojUjU8E/q+cClBq2lg9dVak4Z1LVB2Wf
tbk2fkvR8ydIug2uQ/JCMqKnSzy+kL2qWR+cdqtgUM/oT+nJeBpmPaKVwAuRlWoc
1WPxc2by512Bly2sCoS5C4YDNbYKmJCi392gxSxSv+jLtMYUtgqmYoRXtRDwUsNF
V3im4hCiTAFK7EyNzbhUgG0fo6qm+oRePXie0bOLrd6rUrsrSeqmBZu/68WIzSaV
1eDud0RZyu0xzqd6JaZp/sIHA1GzWw==
=oR91
-----END PGP SIGNATURE-----

--Sig_/2P1chjycQd+Ag4CgBhF6Sko--
