Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBA613CDA7
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 21:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgAOUEF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 15:04:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729103AbgAOUEF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 15:04:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ydZ82Y1Yz9sPW;
        Thu, 16 Jan 2020 07:04:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579118641;
        bh=bMK70VT+a4uTycbYfiMAcjuMfQMZVRmhzrSCEXfzST0=;
        h=Date:From:To:Cc:Subject:From;
        b=AHMZxRKDj72RK8VQXJ59IbiPYc8ngGHzZDug4pyTeUWFPJtusWm/kJkUJMoaVjCjr
         MVQp07EO3AxH47XKCXxmrKVttds0/P/jtXbubBfys3aa0nKxNoZu/H6WXU2WQLMiKj
         3DjQeNzgeZLglKOVOgczp2+wytn4n8Fg4EvUDBPX78PDr8TrFagnz6MrMsyc62vEIo
         2VqpDa99d4Tr85LbBWsTmVF7neEZ618AXqsZN8gW+4YoPVomQDm2KMzo2nFELjpnTA
         oE+yX6rJjoPwazPG9L9o2vOYqMo04lzOHEwYs2HMsfj2QFRW/pWJUz1LZRmcLwWEb/
         GQrLxTm9mN2Jw==
Date:   Thu, 16 Jan 2020 07:03:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vitaly Chikunov <vt@altlinux.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20200116070356.10b48388@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=YRc/mVh7aeiDaUht4LXYDW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=YRc/mVh7aeiDaUht4LXYDW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6c4798d3f08b ("tools lib: Fix builds when glibc contains strlcpy()")

Fixes tag

  Fixes: ce99091 ("perf tools: Move strlcpy() from perf to tools/lib/string=
.c")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Fixes tag

  Fixes: 0215d59 ("tools lib: Reinstate strlcpy() header guard with __UCLIB=
C__")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/=YRc/mVh7aeiDaUht4LXYDW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fcCwACgkQAVBC80lX
0GwS9QgAglHMf3cKSb5CpRgtEBLbKKnal771mNEax6YCvNDP8g4EYvOfuScwwEYe
yAapi0WswjvfXzowZYynspK8e8AsYoxMn3CXsgehKt7QO6FD6oSfGMR3nQUfUZyU
Xq+OgHhwGCnN+k6HTOCP/oPianDMERUgnvTf8tnooBJb7MHpmx4vVWaPqHCAxMgW
np5maMJBFjVIaRHvMxYUxr6dQ41RbA3aDGwW7FIERrq5thmfaUiOxG+zKivekITy
ENtFx8oMQVA9XAYBamlT2IBRHtl07pmOVeUe7aJhbU4BHs57ImZsu2LrN/PBrfJr
MnPojJ2WkCw64KiXO4txyH5GuKWozA==
=EkNw
-----END PGP SIGNATURE-----

--Sig_/=YRc/mVh7aeiDaUht4LXYDW--
