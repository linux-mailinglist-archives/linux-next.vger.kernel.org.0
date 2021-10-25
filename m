Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BC43A821
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 01:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbhJYX2T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 19:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhJYX2N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 19:28:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0184C061745;
        Mon, 25 Oct 2021 16:25:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdWKK5VRgz4xbv;
        Tue, 26 Oct 2021 10:25:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635204343;
        bh=VHvXu8jidtv3kTWLWdoRRYKIL2ZuO+4h9NpaXGog0U8=;
        h=Date:From:To:Cc:Subject:From;
        b=muMFNQJnTIJhOXMdbrjt5X9NQkxD2wDY9JvnyKbyKzWORHyD7cYNCP2nw3yRRdxgd
         svGSt2I8DvqWwtNcpAcx5Zs2AEhkLsvg/1iSaP4MVFfehSMkB2QeGUubLx92Q19/RE
         38bRwvAjDX4iDL/tHkG5fH+y9pkXYVMkJ3oqjMSpfCDd7SJFPy4l937lYGxVT3QDfH
         geXVbaTH1Aoinv5noeYOK3EdWjcb/QD8HhCmy0LU34Cgmknh6GJOQpUGa9lsJkksd/
         zh4Bo2J5Wq/OKwmF9taV+WFhkazk3WxBs6DUo448baGI9CC2V23mHHaZacDy/Wm5+G
         DH2NzHnXAldQA==
Date:   Tue, 26 Oct 2021 10:25:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Quanyang Wang <quanyang.wang@windriver.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm tree
Message-ID: <20211026102536.31e5ab62@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fHb+4l+.nzvqRJ2xV5hqb5Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fHb+4l+.nzvqRJ2xV5hqb5Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from <command-line>:
arch/arm/mm/mmu.c: In function 'early_fixmap_init':
include/linux/compiler_types.h:328:38: error: call to '__compiletime_assert=
_295' declared with attribute error: BUILD_BUG_ON failed: (__fix_to_virt(__=
end_of_fixmap_region) >> PMD_SHIFT) !=3D FIXADDR_TOP >> PMD_SHIFT
  328 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler_types.h:309:4: note: in definition of macro '__compi=
letime_assert'
  309 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:328:2: note: in expansion of macro '_compile=
time_assert'
  328 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
arch/arm/mm/mmu.c:372:2: note: in expansion of macro 'BUILD_BUG_ON'
  372 |  BUILD_BUG_ON((__fix_to_virt(__end_of_fixmap_region) >> PMD_SHIFT)
      |  ^~~~~~~~~~~~

Exposed by commit

  9b89a073e1ca ("ARM: 9149/1: add BUILD_BUG_ON to check if fixmap range spa=
ns multiple pmds")

I have no idea why that BUILD_BUG_ON hits, so I have just reverted that
commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/fHb+4l+.nzvqRJ2xV5hqb5Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3PPAACgkQAVBC80lX
0GxG5gf/WRriTec3EAi7HqhDBJ4xokKIl0eXZUkyw4MWNEsEndyy4Yk0mIn2MygK
5fCCtYN/+I9Lc4nlSAY25ahPll7cYQHZUi+RWQDk00vPHGoWbFKLw/m9wUP7qX2o
jXry2znGq12xQa/MCu6xrMJ38Er4eosqS55ieVS0Bkd78WDZ463KEaBzVT3h0fBH
o9DQ7QS2CvCg+dx9GALox7B6nPlnS+VBnNb+cjEQn8G4viuAR2seQhhOuv3rDnvx
PEpdqdLbtKwvxBcOz0EKnFyJmBHiZybzhpJDbZ4wTaux+crV5dMBPDDkyu/xZlZc
Rg10CrdQJnwse6yPcNOypG0fZj+fNQ==
=y1qr
-----END PGP SIGNATURE-----

--Sig_/fHb+4l+.nzvqRJ2xV5hqb5Y--
