Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2773C34F1F1
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 22:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhC3UEy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 16:04:54 -0400
Received: from ozlabs.org ([203.11.71.1]:37513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233306AbhC3UEo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Mar 2021 16:04:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F90lr4F22z9sWP;
        Wed, 31 Mar 2021 07:04:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617134680;
        bh=Zs4RzorDdvSMKoXYwLp/KSSXvogaK3fB+iwRJUwCcjs=;
        h=Date:From:To:Cc:Subject:From;
        b=gsBpTMh6l0RTOnSLHDfIpwJWm6ndE7M6FD092e7ckwXOwY/36yTU1nisy/ZmeUbUZ
         jgfn8YH8Ln0KtQ4I2t1waPVoEM30NooHaqff8re3oPEhq7+BLsFO4BpXGUhxz2pgNz
         MS4NianJjersqMGfVPYbUOPifEij+fe95PSeZbChX2pB5Y/F4aeUw3MF2/22T47RrM
         Hb1zXl6TqVba3mHDweFq8Cb2rzrGV7FITdkukwAhr4iwautbYJze9pNmj5SzOgh4VS
         gA5jKDnynlkOuadEhGTcJwVVxsWgYetzCjZ8+auW5IDXLd4wrLCpBL5yGapnT0o+TO
         1XIys3ljC2nIw==
Date:   Wed, 31 Mar 2021 07:04:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210331070437.3af43553@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LjXLsYtyRd/5TQshfa1gVS9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LjXLsYtyRd/5TQshfa1gVS9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, yesterday's linux-next build
(htmldocs) produced this warning:

mm/vmalloc.c:425: warning: expecting prototype for vunmap_range_noflush(). =
Prototype was for vunmap_range() instead

Introduced by commit

  cde193f42509 ("mm/vmalloc: remove unmap_kernel_range")

--=20
Cheers,
Stephen Rothwell

--Sig_/LjXLsYtyRd/5TQshfa1gVS9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBjhFUACgkQAVBC80lX
0Gx2EAgAkASL3MqDYoM9G17ftzBJfE1m1skh//Pn9U602LvhaUfPhRw77e2L56ia
tLeH/OCYB2bGeQ8lYE/bk1hOcu44m5+qpFd3rpumUf/ppf+VInci72wJH76/qGkt
wYsV2XBQEY54lJE8gybtVNvm6zhsEDahFUDMmaJ4RLxoA28W6rC4eG5491XzJFQo
Wnpzj46pai/XzHhLwPtX9z3BIkzVaGUjmJRC4Gsxqk3Nobdlibp68TEAmdtfHIMH
xch5ThYFc5EFLk8a3UkgOMvPWMvOA1fblLEykiyMviP+ynczRb8srvy9me2IavdO
3HFRG61tOou2sRC8p/Vh3fmXKm5iiw==
=B3lc
-----END PGP SIGNATURE-----

--Sig_/LjXLsYtyRd/5TQshfa1gVS9--
