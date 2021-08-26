Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51B3F8438
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 11:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240796AbhHZJOV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 05:14:21 -0400
Received: from ozlabs.org ([203.11.71.1]:45483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240758AbhHZJOU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 05:14:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwHFl44X7z9sXM;
        Thu, 26 Aug 2021 19:13:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629969211;
        bh=bft4eGyOMlagv0KSHy0Qm+Y1jZpIT/ivifj58HgBgMg=;
        h=Date:From:To:Cc:Subject:From;
        b=eIzIdN1C/WBpSIGjI117cPJxGlXkbR+OJY53NsIO9vdyar/Bqiy1Rup5Aut+zFdeL
         m+XtTitlv+Vi1Xo0QcytNJkGkbblSvw87wNtZfAT+gmhy703wrKSPnBwvTou2Rhg96
         17w7i5bpN4sFI+tj+xmIv/qKID8TTzITBvFWczsuwQvvXvySFkEy9rlA/I90r3BCIr
         0OqZgy/Wez4j0dFAzkOcomhfLMgygCRlK8odvYvMFppRM4bUO2SR0AFYgxwulzHPEn
         WYh4QausEJZaCQdYzh1D6bScDRmqyqmbW1//5KdnY6ZCG9eN51xjvnVz679CSoINob
         d6SyYn2pUhz/w==
Date:   Thu, 26 Aug 2021 19:13:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20210826191330.40dc43e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U1bHeKHMruMlep.1Q10of8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U1bHeKHMruMlep.1Q10of8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allnoconfig) failed like this:

make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '__bui=
ld'.

Caused by commit

  624a912f84bc ("kbuild: detect objtool changes correctly and remove .SECON=
DEXPANSION")

(at least, reverting that commit fixes it)

I use a separate object directory and, in this case, it is newly created.

A build with V=3D1 and -s removed (and no -j) gives this around the
failure:

make -f /home/sfr/next/next/scripts/Makefile.build obj=3Dscripts/mod
make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '__bui=
ld'.  Stop.
make[1]: *** [/home/sfr/next/next/Makefile:1309: prepare0] Error 2

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/U1bHeKHMruMlep.1Q10of8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEnWzoACgkQAVBC80lX
0Gxn2Af/RJx7HGrW975OAm0w0P8qtsW5bs+r96cKK2bO6pwvd7j4HuaR64P9MZDQ
7zMLXrtmcMhZBtrYjqG1ygiV+yRGSwA6MUfedH17Jxyh0jp0ZQSqwyQo5fSWHzDg
Nl1Do+2MVvgJ8zFSkmrqmmzEnovJ1L3cLBHWiJR5TgDrZ9XGpWRf8wBFN4tukD8e
57H92A/MnGYcF4kHsPe2KLL4WjP7E3Wj3bv409d+gI2lqQ5HsnS2/RlHDLeyFsmZ
o74/hJIHDQOf88E0+F7piWISWu4EY+w729oeHiZL18+yACg9UPfhb93WnRGbZOwc
J+nuPCddByJpC9g2iPJKNRcDkRdDeA==
=ZzY9
-----END PGP SIGNATURE-----

--Sig_/U1bHeKHMruMlep.1Q10of8D--
