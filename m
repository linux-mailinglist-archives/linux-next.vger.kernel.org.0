Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B78BE32A
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2019 19:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502218AbfIYRO6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Sep 2019 13:14:58 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53976 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfIYRO6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Sep 2019 13:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aLQzNm39tdIMTQRnIptN+pzSYiE/srlJQZjWMcvGrPc=; b=vIRk7UL9EyuwGru+KShQfdlrX
        1SilWNO9Nh+evGCOaUaZNXyXXVz8E9diVHiYEX4kTwWkhyazb3ycaLvYxx6fWgy4hIV4EFbgrxnb9
        p7x0RK3wnE5UftcSnfEDz+HhqT7F39Ftd5z7NCCf2nwYCU3G/Dvs/sVqrDa9AAK7LF1TE=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iDAsQ-000812-IP; Wed, 25 Sep 2019 17:14:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 03BCAD01D66; Wed, 25 Sep 2019 18:14:53 +0100 (BST)
Date:   Wed, 25 Sep 2019 10:14:52 -0700
From:   Mark Brown <broonie@kernel.org>
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the risc-v-fixes tree with Linus' tree
Message-ID: <20190925171452.GK2036@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mEgWsss+US7fWyVR"
Content-Disposition: inline
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--mEgWsss+US7fWyVR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v-fixes tree got a conflict in:

  arch/riscv/include/asm/pgtable.h

between commit:

  782de70c42930ba ("mm: consolidate pgtable_cache_init() and pgd_cache_init=
()")

=66rom Linus' tree and commit:

  b6f2b2e600a27b7 ("RISC-V: Fix building error when CONFIG_SPARSEMEM_MANUAL=
=3Dy")

=66rom the risc-v-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/include/asm/pgtable.h
index c60123f018f50,4f4162d90586d..0000000000000
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@@ -424,18 -436,11 +436,6 @@@ extern void *dtb_early_va
  extern void setup_bootmem(void);
  extern void paging_init(void);
 =20
- #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
- #define VMALLOC_END      (PAGE_OFFSET - 1)
- #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
-=20
- #define FIXADDR_TOP      VMALLOC_START
- #ifdef CONFIG_64BIT
- #define FIXADDR_SIZE     PMD_SIZE
- #else
- #define FIXADDR_SIZE     PGDIR_SIZE
- #endif
- #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
 -static inline void pgtable_cache_init(void)
 -{
 -	/* No page table caches to initialize */
 -}
--
  /*
   * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
   * Note that PGDIR_SIZE must evenly divide TASK_SIZE.

--mEgWsss+US7fWyVR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2LoIwACgkQJNaLcl1U
h9Ap6Qf8DT2faMTcscCRsAs0NR57fTzrUkbKVVZkwGSjhZAgaZ3cFeHpVYqlloZg
X9KOdOG2JhrlvrYmEoyX9aKh4/c3GLs25PC3FidQG6RULOasgJvJYaO8/UDct6iz
MEilerQKUPLlye3fyOAz45hhmDe80CLCpVFKlXHZGOilpBTrl4jfBeMEWEU24LPh
wkLXsv4keO2e40Krgex05d7GztnQQIWLpZXlUfZmVv+2Bx6N2hLtsUfiDOLGz0hJ
fk3CodIheoNwtIB1JARf4wvn0KsYp6krXLM+Wsd0x55jvC120BVRsxl8YknDW4LM
ux/jkLDUkjij8WhzclqD9uvEuzlBjg==
=EJ+I
-----END PGP SIGNATURE-----

--mEgWsss+US7fWyVR--
