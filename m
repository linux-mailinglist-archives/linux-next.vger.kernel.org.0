Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6BB3C6763
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 02:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhGMAZ2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 20:25:28 -0400
Received: from ozlabs.org ([203.11.71.1]:37901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhGMAZ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jul 2021 20:25:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GP1YM33s6z9sX3;
        Tue, 13 Jul 2021 10:22:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626135758;
        bh=FWH8HLtm1hryJxRvwHFQLT94wClg8s2NsdsjWhHD3xw=;
        h=Date:From:To:Cc:Subject:From;
        b=qxqWeQ3Kbz3O+BuGj1I6X6ffZ3Ovk81/1GhYRobLYGXf62C7zeEtJTl8Mlem4UCR4
         P0vmIZVZqLuZVpac9rbn6x81GflLiZfMOZX3fUb2ymfkYeBKVq/0hnMV/1aBxFDDOm
         ei4H017MwdbCbcREAVwVGqt624leZe1fZpprSZhqXtsFGNqEao4WQLfWKAuqkO6iKi
         B4fWlTsBcEkmA2Sv7QatjnSNrral713MU0KBABw4xnmFm0/IaBfTSNXiJzuizEL0a6
         a3uuFJJdNcnWgFE0L1+u61ghOD9mNIH77eLl1v4TBKnE3k4yvTXCejmpcqJmIzmGWp
         sLnb/p2rap4jA==
Date:   Tue, 13 Jul 2021 10:22:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20210713102230.728b4899@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Evgy5G4NybMi.Hd6Km+ewXS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Evgy5G4NybMi.Hd6Km+ewXS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

/home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c: In function 'msm_gem_new=
_impl':
/home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c:1170:6: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
 1170 |   if (priv->has_cached_coherent)
      |      ^
/home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c:1173:2: note: here
 1173 |  default:
      |  ^~~~~~~

Introduced by commit

  d12e339044a0 ("drm/msm: add MSM_BO_CACHED_COHERENT")

Presumably exposed by commit

  73ffc61f4a8b ("Makefile: Enable -Wimplicit-fallthrough for Clang")

though I am not sure why since I am building with gcc.  The first
commit above introduces a new use of /* fallthrough */

--=20
Cheers,
Stephen Rothwell

--Sig_/Evgy5G4NybMi.Hd6Km+ewXS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDs3MYACgkQAVBC80lX
0GylYggAoZ50fQuJjc3YNtsQYjjlsdFw7nsvdc2cQIXjQ309sFiXH5Of3YqMaNnN
/QQ7jNRcKEu3BB1VLthxx+Mg68rUQ3hf2xuMo2WT3Zpt2MszrMs4/juPpR9Fal2V
+/nKSHMqrtlYpG4rNAp0zRHJYS6sv4/LoAcqOQu75HoInKJv5gn2MNyW9ocaOh4B
3BYYcc4sGHRMIDhQ99Y+0SZe8rOMx6tLsxuAekGewd1yXJlyWjYBvx+lrRb7YOP7
XX7sY4iKQCFG4S+TRUR3hG5Jv+K0XSd2pdy25Vt0w6o+XMm2GDjviTCuU8o4rfGX
Ta8G1U3kYHhZavneAyPvbX0V6mG6Sw==
=dFzA
-----END PGP SIGNATURE-----

--Sig_/Evgy5G4NybMi.Hd6Km+ewXS--
