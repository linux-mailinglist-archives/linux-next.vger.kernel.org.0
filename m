Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E9B45D5CE
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 08:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhKYH6c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 02:58:32 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:41105 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhKYH4b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 02:56:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J099758TQz4xbs;
        Thu, 25 Nov 2021 18:53:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637826799;
        bh=m6sipBcVTJjllE1ha3s2FeaLnzEFuD5JT7WBAgFhJfE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SN0pN1tQiLdxjjIBmnzzGmT9w2Mm6cRc4j1UDezCutpYIdE9sJtb/KoFTBNteH7N7
         TFp1bPXEjQg7B+DrIW6jku/LrrcEv9quR1lR1tq9vVxSFVlbm9GTY/OFMwQJs6Gg64
         yQxmFEveynh2+4bMKaAiAy0qmYo2yLqfEzVTFcp5iyh14DlxE+6irYZbhrkoQmjsro
         fW48a4g/jxyMUrcdnldl6fr5zg+QMxMGLXiO2IYzBfAk+nbqUiJs1sMeR39FU3BR3d
         tgRmHqnZd9ZFNjlsjSIbkpCMQr87GXQa/GoxB0t/mq+WAKow4dK0XyhEiHoENQrkIh
         YywmnFLQnLXuA==
Date:   Thu, 25 Nov 2021 18:53:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Yongqiang Liu <liuyongqiang13@huawei.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alexander Potapenko <glider@google.com>
Subject: Re: [next] kasan: shadow.c:528:33: error: 'VM_DELAY_KMEMLEAK'
 undeclared
Message-ID: <20211125185313.77e20bc5@canb.auug.org.au>
In-Reply-To: <CA+G9fYuLv7491Q2AHcaUAQ2AQeFBQgx8w0DzK95Qf6Fh9gGFfQ@mail.gmail.com>
References: <CA+G9fYuLv7491Q2AHcaUAQ2AQeFBQgx8w0DzK95Qf6Fh9gGFfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.DyF2x5Y=NaNAowk5G14Joj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.DyF2x5Y=NaNAowk5G14Joj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Thu, 25 Nov 2021 12:43:41 +0530 Naresh Kamboju <naresh.kamboju@linaro.or=
g> wrote:
>
> [ Please ignore this email if it is already reported ]
>=20
> While building Linux next 20211125 x86 with CONFIG_KASAN=3Dy gcc-11
> following warnings / errors noticed.
>=20
> mm/kasan/shadow.c: In function 'kasan_module_alloc':
> mm/kasan/shadow.c:528:33: error: 'VM_DELAY_KMEMLEAK' undeclared (first
> use in this function); did you mean 'VM_DEFER_KMEMLEAK'?
>   528 |                 if (vm->flags & VM_DELAY_KMEMLEAK)
>       |                                 ^~~~~~~~~~~~~~~~~
>       |                                 VM_DEFER_KMEMLEAK
> mm/kasan/shadow.c:528:33: note: each undeclared identifier is reported
> only once for each function it appears in
> make[3]: *** [scripts/Makefile.build:288: mm/kasan/shadow.o] Error 1
>=20
> Build config:
> https://builds.tuxbuild.com/21OjEyx87iCX9bqOwJrZdl1wFFj/config
>=20
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> meta data:
> -----------
>     git describe: next-20211125
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_sha: f81e94e91878bded599cc60f2881cfd50991aeb9
>     git_short_log: f81e94e91878 (\"Add linux-next specific files for 2021=
1125\")
>     target_arch: x86
>     toolchain: gcc-11
>=20
> steps to reproduce:
> tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
> --kconfig defconfig \
> --kconfig-add https://builds.tuxbuild.com/21OjEyx87iCX9bqOwJrZdl1wFFj/con=
fig
>=20
> https://builds.tuxbuild.com/21OjEyx87iCX9bqOwJrZdl1wFFj/tuxmake_reproduce=
r.sh
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org

Caused by commit

  f61bc9ffcab1 ("mm: defer kmemleak object creation of module_alloc()")

from the akpm-current tree.  The define is VM_DEFER_KMEMLEAK :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/.DyF2x5Y=NaNAowk5G14Joj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGfQOkACgkQAVBC80lX
0GwUCwf/c0EEARMBwDYIgb1onsp9z7UjATvVkcBnNVbPcZbLLqQ1ZAFNVBuYz0FY
zR6eUDVuIinxV1f+0qNnZ+0UrlXOnVXB8dyQGQk1nuwdRO/q4yqgS/s/l3wb/tMd
dH4hFSbCb61V8opBuQ9XykPoOkY3fpI9J0G1QMlp5FdDVWKLC6VvPE3HwtTUoAvq
BWRDFRc8RivX0YzI2gdP+x7vi/ol4ENUyq5hjjEZhmpzyT7tozDhY894fSv+sSFa
Wa8yJPaRDXLuyyRnLumkOrOOVzgJsWakjM73hjvzavqek+wAts8QDSKqCHt2bg2l
a304CvmUneLHJlBru4lSBjRbGiBU4Q==
=DEkn
-----END PGP SIGNATURE-----

--Sig_/.DyF2x5Y=NaNAowk5G14Joj--
