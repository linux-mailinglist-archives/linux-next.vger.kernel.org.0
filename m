Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB4EBD04A6
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 02:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbfJIAMt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 20:12:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58123 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbfJIAMt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Oct 2019 20:12:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nvmv0mWQz9sPJ;
        Wed,  9 Oct 2019 11:12:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570579967;
        bh=vAup+659lPd1ASmnyomCIW0xLz9wRcLPa+2Do81bXgM=;
        h=Date:From:To:Cc:Subject:From;
        b=WF41jcLYgu4Uv+GBMZ/Mp1L3os8q3hZDunmWQz1BIrDEFo1cGbAqTspEE2tDjoMe/
         DyQkGU4hAiJILAqKwbOHS+uwWkVwGPT1sS2ljMxQm3qDIj5leXfeWVMrzc+BLRgAAi
         FejNY7FDWTDoY+htXiWDIAlkazkAqjhd4YtgoOfknEkIQvYKy56/S2eXa3TdEFdA7h
         MojgoJ5WP1siksuZzZ2hre2ee+z6movEb235m6loU6jCOePQ3dRxyIC5NKogtA9xLB
         3Rv5kPvF0f85NUr5DmLFz4mHyYTpLRvRxINQWYo3LNRnKnhOOOYzNPPOrJd8os4jJ+
         8g6/r1kv0E2lQ==
Date:   Wed, 9 Oct 2019 11:12:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Auld <matthew.auld@intel.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20191009111246.243cf33d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i1R2DXqdvhH8qO80EbdFI30";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i1R2DXqdvhH8qO80EbdFI30
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_gtt.c

between commit:

  1e0a96e50882 ("drm/i915: export color_differs")

from the drm tree and commit:

  71724f708997 ("drm/mm: Use helpers for drm_mm_node booleans")

from the drm-misc tree.

I fixed it up (I used the former change) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/i1R2DXqdvhH8qO80EbdFI30
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2dJf4ACgkQAVBC80lX
0GysLwf+IO36ficMeJST+QHGnwBRRQVIvGtXwdnZ1vcH2MkDjf/CduplUQEq1w4Q
eMiQDKKfLHf3g0rzCkTCzMYGjBbY98ybBsns58LL6aBj1iaUKXCkgSFnkwen91/3
qsPrvfWB1qpg24pQsUneg7n1vuVogXX8cepiYqgcPNjAqMrW5+kzbI7IeYo/6tI9
R1c1Uo3kS94yntorQFTZxan/lhsEEUUyGSCd2jZNauhmBhCPdsjkyhndwrrgfWav
FqI+HtHA4NINK26xAc2pm+NnfWGGxnixPcVYJSvDNzyat3tQgORkqy7IxI2/D+ZW
7halNB3GB+bz7s/VyNNzBcoqjNr+mg==
=IIun
-----END PGP SIGNATURE-----

--Sig_/i1R2DXqdvhH8qO80EbdFI30--
