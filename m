Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0F83580A9
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 12:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhDHKfG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 06:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhDHKfG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 06:35:06 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FE6C061760;
        Thu,  8 Apr 2021 03:34:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGHhC2N2Mz9sW4;
        Thu,  8 Apr 2021 20:34:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617878091;
        bh=jUXCd8jpTMFusIz4eACry0Qzn/TltbrC6W47iwYIquU=;
        h=Date:From:To:Cc:Subject:From;
        b=nOYOU/sH20G5DBxWMAcmhPiOcOpooT581YmEyoqdaryvMibSIWaSksDHqWFBg5j8k
         08Vn/amO7nYgJrfnRUTYRyQ9r04HV3JwwvWDG3zNAxYIlzSXQR4LQboYvVl5Jg/QPL
         CgA9MqlsEbLvIU892QIMmFoLBjS60y7c0g39e81CpcWMzDK1Dd6RdbsNUhZCJ6+LUT
         xXmZniEax/1cGi8wXtLVQgzw+E9c9R1H4rQ746JlClmeRZkid23pF6AYFJ0/lltl7f
         R7P3s0ITCreffAaZbUr6KQAouiU5SyCXDH0Zfswqsj6gwSVTf+9QRaRaNn10rLaHtL
         gGqOoA0BYyvPw==
Date:   Thu, 8 Apr 2021 20:34:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Message-ID: <20210408203449.58e5edf8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KK4O+FssatnWPvkegeP70BJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KK4O+FssatnWPvkegeP70BJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Makefile

between commit:

  2f8864dbe668 ("kbuild: move module strip/compression code into scripts/Ma=
kefile.modinst")

from the kbuild tree and commit:

  7b35c1a01c2e ("init: add support for zstd compressed modules")

from the akpm-current tree.

Also commit

  ee2305118fc3 ("kbuild: add support for zstd compressed modules")

from the kbuild tree seems to do the same as the akpm-current commit
above, so I just effectively reverted the akpm-current commit.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/KK4O+FssatnWPvkegeP70BJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBu3EkACgkQAVBC80lX
0GxYdAf/f3h3FOwlIeC9NM1mgYukyeCm3KNx6206B9Bej5FYBXID1CQ2Whh98yOq
niHwIWQpOPPRbjRjyGdJN5XqEfdQpbCb7kZOeoXcrexxXAPS76NmyTSfMi+Jm92V
U0eZfpCrFgT+n7LdmgLJSQ6UBI4g5TKHDKBXm7dMPhZDDpi7SHgyhDmyL/nuCy+u
JmUkWY2XMGoAyVJqjpZzKAxVj1gX7RnfAmdFeykUotyGfPv34EnFczZQq5v0X9KI
5dmZONPVqwvkq0R4Xxmt/i13DZ2jWajGjcRBdii8Ia0FeE9pJWOZ58XEkF6eUPLO
QuxMMpXuwbk2eSLd3qBQuq2g8sVcZQ==
=x0RU
-----END PGP SIGNATURE-----

--Sig_/KK4O+FssatnWPvkegeP70BJ--
