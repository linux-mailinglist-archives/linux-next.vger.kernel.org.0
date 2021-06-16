Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B850D3A8E75
	for <lists+linux-next@lfdr.de>; Wed, 16 Jun 2021 03:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhFPBko (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 21:40:44 -0400
Received: from ozlabs.org ([203.11.71.1]:55669 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhFPBko (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 21:40:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4SWd089wz9sXG;
        Wed, 16 Jun 2021 11:38:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623807517;
        bh=ntMpLfRzfPiBebhmvNxEkqBnOA/8znb4d401tkYzjmw=;
        h=Date:From:To:Cc:Subject:From;
        b=VET4KqLi3WEoYZPYs6SMGusriHoMB2384EBcYMS759c5l69N7rI3YFi8x3dkKn68v
         bsJWh6TkzXiKYfA4XiL/eNwRMMiT0NtFhxf2JeHYzI6JaxK82pPwjJRvJC7rtfmSWO
         eZzn22q8oQw9W8nKbb3IdVEfY9ZZ+g9v8Q0jTDJMpaFns0QP9BTRe3BnIMdAApFuUy
         OrTRgBgZKdGtDhfybfMhNVmS7Bc3vbGUHB0nWhDaeIti6mWqqlUay+K9tfw1O4BMFk
         8fxDFSlL0f6cMKFV0IT9nk6CAU+uAWjAmnJJmWDfwGzClkPH2gLLI4XCGej6yXFl9J
         rfKAmPnFoO73w==
Date:   Wed, 16 Jun 2021 11:38:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Bumyong Lee <bumyong.lee@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the swiotlb tree
Message-ID: <20210616113835.0f0d4952@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dfzgBL0PQx.njFrR.cC8VMl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dfzgBL0PQx.njFrR.cC8VMl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the swiotlb tree, today's linux-next build (powerpc
ppc64_defconfig and x86_64 allmodconfig) produced this warning:

In file included from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from arch/powerpc/include/asm/mmu.h:147,
                 from arch/powerpc/include/asm/lppaca.h:46,
                 from arch/powerpc/include/asm/paca.h:17,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/sched.h:12,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/dma-mapping.h:7,
                 from include/linux/dma-direct.h:9,
                 from kernel/dma/swiotlb.c:24:
kernel/dma/swiotlb.c: In function 'swiotlb_bounce':
include/linux/dev_printk.h:242:23: warning: format '%lu' expects argument o=
f type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wforma=
t=3D]
  242 |  WARN_ONCE(condition, "%s %s: " format, \
      |                       ^~~~~~~~~
include/asm-generic/bug.h:97:17: note: in definition of macro '__WARN_print=
f'
   97 |   __warn_printk(arg);     \
      |                 ^~~
include/asm-generic/bug.h:161:3: note: in expansion of macro 'WARN'
  161 |   WARN(1, format);    \
      |   ^~~~
include/linux/dev_printk.h:242:2: note: in expansion of macro 'WARN_ONCE'
  242 |  WARN_ONCE(condition, "%s %s: " format, \
      |  ^~~~~~~~~
kernel/dma/swiotlb.c:355:3: note: in expansion of macro 'dev_WARN_ONCE'
  355 |   dev_WARN_ONCE(dev, 1,
      |   ^~~~~~~~~~~~~

Introduced by commit

  17eb5dcf1f15 ("swiotlb: manipulate orig_addr when tlb_addr has offset")

--=20
Cheers,
Stephen Rothwell

--Sig_/dfzgBL0PQx.njFrR.cC8VMl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDJVhsACgkQAVBC80lX
0GzqawgAizFVDQMp4DV845O5rEiWkw9rOjMmgZVyoX1oiop/IYfr+494NmsaTNVt
FgwYw55T4qmtY4juN1AV06MhoA57HrN1HEIg+cuh9+ybErSJR5b3dg3PqgUvmIpd
tM2oam7l5VxYnx+rqj8zuFvzS45UtmJ0RAiloLXPzLD59QAiP0gpDWNKSZLTwU5b
kIo2yYUdxPXESMmMlT422dFwf5LLkFcS+By0PEb8YSpiYZwuFeD7DmcofSvDbCkg
zmpx+kCdhfUuD917N9bHuUCYPEASwgHFdIL9OsJXFH4UTp4CdcuNY1UTpf6rusny
r+Jwc3lEywxX4p5ZZxPZ7L3wPYibsQ==
=k7j+
-----END PGP SIGNATURE-----

--Sig_/dfzgBL0PQx.njFrR.cC8VMl--
