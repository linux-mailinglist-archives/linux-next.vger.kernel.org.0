Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5E140D20A
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 05:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhIPDgD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Sep 2021 23:36:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58163 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233856AbhIPDgB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Sep 2021 23:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631763279;
        bh=eBov+n1/uBoCRnrzk4x06tNIZBMArXXVDMb1h7AYBzg=;
        h=Date:From:To:Cc:Subject:From;
        b=an8H6VqJ/mp9oCMEQ7NvXR4UsUmD3MDvIKpFJBMfjFWV73nyZga4/t7D2tleBePvg
         YMVeoFNtCZ6fINu8JQWdaH/Pu48V922Pjb9rRqOH8BM0lHF6TpyvZXGRFF5VL8m/ZW
         mqUmCOi8TEiuZfYDZoFoiDq5popl7JUQARnK4keMpslZDFcMcsLsVwKrRj/Y5GugJu
         XQHrK5/UK1cgvS3PIMpcfZAb3bfBcw+2fHd5yHb2tFMmeHAy0x+p0ECRPrQOjnbgje
         MZgPw8AvVzPSdza7M6VYA/AGq/2WDi4ajGr0xt5o3yK6dXS1OmFc38N3PaE1tIz+WY
         CKI+zbvGKWvyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H92l33TyZz9sXS;
        Thu, 16 Sep 2021 13:34:39 +1000 (AEST)
Date:   Thu, 16 Sep 2021 13:34:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20210916133433.3b309895@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gYi9_JKCDiHfUoDq+qkGbmf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gYi9_JKCDiHfUoDq+qkGbmf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/compiler_types.h:85,
                 from <command-line>:
include/linux/compiler-gcc.h:44: warning: "__compiletime_warning" redefined
   44 | #define __compiletime_warning(message) __attribute__((__warning__(m=
essage)))
      |=20

And many more.

Caused by commit

  0fc9374deb67 ("compiler_types.h: Remove __compiletime_object_size()")

Something went badly wrong in the rebase :-(

I have used the kspp tree from next-20210916 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/gYi9_JKCDiHfUoDq+qkGbmf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFCu0kACgkQAVBC80lX
0GyrWAf9G3i/+RuHjeyYfltlZRhJZhs33M2hGRuYcSm2zIdX7qmN7PQfjVnhMygE
6Fj9+skbeHJJVChelTnw0wyskRsazIqlxjWnO6NLJMoRV/kv6jhZme1/nKfuSB2C
47SXEsAiuWsKNW2gk5YeQkVWJOP7fkI6LJ/pdhge4iGtqNVcW0UpOP1iTKxf1EOy
4X7MPjm1maB9KWyaywHWdab9T7gFT7mFvpc7lwz1R0iCNUIP7azr5BHEQODRh3Ov
o5wUPEjAcjeToiVRw91Jlc/wA0pCBtgMLFSdwndQEjRqOvPUILAuOM1DJzCLr/al
xmDfS0TZsVM0qA+ZhKIVWAnBVUurBg==
=1CSg
-----END PGP SIGNATURE-----

--Sig_/gYi9_JKCDiHfUoDq+qkGbmf--
