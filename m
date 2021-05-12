Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BCA37B580
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 07:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhELFe7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 01:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhELFe7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 01:34:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9235C061574;
        Tue, 11 May 2021 22:33:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg3P91bfrz9sWY;
        Wed, 12 May 2021 15:33:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620797629;
        bh=Jt9fjmiYDPAo79c/vHFKOcrMlmW/NShAz/ZIMt8foPU=;
        h=Date:From:To:Cc:Subject:From;
        b=NqMMWU40+m5Hsi7FfbFaIFqG/zCrzuOHSTX28pMcZtDroxkHhkWA4gJvg0RAHhcvf
         R93+kXCpVFrhpwblCaw+32UhbPSkywUjJVBmbFnqu5WfgXXAHSXhigix6Sb3fsmfRk
         2g/tQdZ6p6k92ZJIrJ5mnAeTmNkjkzukMPu1YPj5XFZifeGAaofz4Bu755lsMq4X0Z
         eyf/BA1sYWmAzG/B2/72ZEqR93ds9ELeqlMHjFJzyencfajNhqls5i0AQ56oQZjwUv
         OEku68vfjsi9R5BujwwdivQatyTlszXbuQT6/5FLVCe8A2SkKOLYHNezo1/jgindaT
         1ne+RJUsdyLCg==
Date:   Wed, 12 May 2021 15:33:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210512153348.2ef4d1a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mNTt96jBPaR9.mJBDh24Cdd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mNTt96jBPaR9.mJBDh24Cdd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                 from arch/powerpc/include/asm/book3s/64/mmu.h:31,
                 from arch/powerpc/include/asm/mmu.h:402,
                 from arch/powerpc/include/asm/lppaca.h:46,
                 from arch/powerpc/include/asm/paca.h:17,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/thread_info.h:22,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/vmalloc.h:5,
                 from mm/ioremap.c:9:
arch/powerpc/include/asm/book3s/64/pgtable.h:246:21: error: initializer ele=
ment is not constant
  246 | #define PGDIR_SHIFT (PUD_SHIFT + PUD_INDEX_SIZE)
      |                     ^
include/asm-generic/pgtable-nop4d.h:11:20: note: in expansion of macro 'PGD=
IR_SHIFT'
   11 | #define P4D_SHIFT  PGDIR_SHIFT
      |                    ^~~~~~~~~~~
mm/ioremap.c:19:60: note: in expansion of macro 'P4D_SHIFT'
   19 | static unsigned int __ro_after_init iomap_max_page_shift =3D P4D_SH=
IFT;
      |                                                            ^~~~~~~~~

Caused by commit

  9054fd6cce6c ("mm/ioremap: fix iomap_max_page_shift")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/mNTt96jBPaR9.mJBDh24Cdd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbaLwACgkQAVBC80lX
0Gy4DAgAi0ZwrsRw+KeOZSH/GsXl1NxpF1zxSkZ6eigW5f2k56CUrk/87duehq1U
y2XDlPukrB/HiH3TAf8cfg60kFHdXoHpAXYkvljmJcmXbV5PkBn42KBlQuFkVSXF
fFU8jg19vBqNcO6tVUTv3mSMimwUUVJxDDS7WosONCLZug39oNCC5xXKhJ7xQWt4
DwzawsERpHk4WLJhAsJu7G1+ffTBiouEWUgRQ0/A2fqmBvVydgQqddgep2dtDp2a
8RvuSXMGHm9e7a8K2RzACCd1Kzm8UDmE7FhTdTmSFYQG10Hq+olWNjdP+RTXfdCl
upCce7aJKZcQMbL2mvBHhlC1oVJ+NA==
=ySdW
-----END PGP SIGNATURE-----

--Sig_/mNTt96jBPaR9.mJBDh24Cdd--
