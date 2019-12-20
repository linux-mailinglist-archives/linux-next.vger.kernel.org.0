Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAE812730C
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 02:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfLTBxq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 20:53:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726963AbfLTBxq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 20:53:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47fBc65PtVz9sPT;
        Fri, 20 Dec 2019 12:53:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576806824;
        bh=V61oflJvWEqxzkw6SwVzXbZeO5cG362lxo1Q4I+Rwtg=;
        h=Date:From:To:Cc:Subject:From;
        b=HRoMj8SW0FWH77JrQJf2atoXVPYAW0UtKX9o7uyadyG5/PUonu0a9Mryn8hfdaJNf
         rby1DlDvsZ9pCCSEx7om44ewAQRF8WWg4DVMhRBnLhPLSCp8vh7Y8iZ8DYVPwv+eNQ
         m5Eb5PRmzzXAt+ip3G90OffWmNfRWiOHJh1lTkLHJW5r+VvCibow8tTuKusBxwIVMA
         j6WX/g4y0/+Vn4uBEgtajfNErChs/+EY5edg9WyPwnmPFYem7eBRMo6e1fbTY0vQr7
         u4njn21Cka5W/iYhS5xQzFYVF+qPg4NHAPWKhx6L89QiQhuXUkdeq+5Ol/GCF4eefu
         sUUxAHap1dz3g==
Date:   Fri, 20 Dec 2019 12:53:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Changbin Du <changbin.du@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20191220125341.51cd2448@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sxvwauLpjDBgVnETGxMFZ8T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sxvwauLpjDBgVnETGxMFZ8T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  lib/Kconfig.debug

between commit:

  045f6d7942be ("lib/Kconfig.debug: fix some messed up configurations")

from Linus' tree and commit:

  dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/Kconfig.debug
index 5ffe144c9794,bee08ed4a139..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -447,6 -447,6 +447,8 @@@ source "lib/Kconfig.kgdb
 =20
  source "lib/Kconfig.ubsan"
 =20
++source "lib/Kconfig.kcsan"
++
  endmenu
 =20
  config DEBUG_KERNEL
@@@ -2175,8 -2130,55 +2177,6 @@@ config MEMTES
  	        memtest=3D17, mean do 17 test patterns.
  	  If you are unsure how to answer this question, answer N.
 =20
 -source "samples/Kconfig"
 -
 -source "lib/Kconfig.kcsan"
 -
 -config ARCH_HAS_DEVMEM_IS_ALLOWED
 -	bool
 -
 -config STRICT_DEVMEM
 -	bool "Filter access to /dev/mem"
 -	depends on MMU && DEVMEM
 -	depends on ARCH_HAS_DEVMEM_IS_ALLOWED
 -	default y if PPC || X86 || ARM64
 -	---help---
 -	  If this option is disabled, you allow userspace (root) access to all
 -	  of memory, including kernel and userspace memory. Accidental
 -	  access to this is obviously disastrous, but specific access can
 -	  be used by people debugging the kernel. Note that with PAT support
 -	  enabled, even in this case there are restrictions on /dev/mem
 -	  use due to the cache aliasing requirements.
 -
 -	  If this option is switched on, and IO_STRICT_DEVMEM=3Dn, the /dev/mem
 -	  file only allows userspace access to PCI space and the BIOS code and
 -	  data regions.  This is sufficient for dosemu and X and all common
 -	  users of /dev/mem.
 -
 -	  If in doubt, say Y.
 -
 -config IO_STRICT_DEVMEM
 -	bool "Filter I/O access to /dev/mem"
 -	depends on STRICT_DEVMEM
 -	---help---
 -	  If this option is disabled, you allow userspace (root) access to all
 -	  io-memory regardless of whether a driver is actively using that
 -	  range.  Accidental access to this is obviously disastrous, but
 -	  specific access can be used by people debugging kernel drivers.
 -
 -	  If this option is switched on, the /dev/mem file only allows
 -	  userspace access to *idle* io-memory ranges (see /proc/iomem) This
 -	  may break traditional users of /dev/mem (dosemu, legacy X, etc...)
 -	  if the driver using a given range cannot be disabled.
 -
 -	  If in doubt, say Y.
 -
 -menu "$(SRCARCH) Debugging"
 -
 -source "arch/$(SRCARCH)/Kconfig.debug"
--
 -endmenu
--
  config HYPERV_TESTING
  	bool "Microsoft Hyper-V driver testing"
  	default n

--Sig_/sxvwauLpjDBgVnETGxMFZ8T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl38KaUACgkQAVBC80lX
0GzyHAf/SG+fdGKOkvu0j4KmnxABWrDJJN+FFhyInBNIOlarrH0K7JGeE/xy4BA2
w5wwfjpT+RwIeWviz11syW9APsl7R6O+humnvNGHRiRtZKPWDfK3dUl1Of8VZw0p
3y4nw1EEJbRzdHEgFMMZZ5rdCRqWyMO1XXj5cNa+eKJugx32Pxl3LLaDYoWsy1tI
9SzhC1zN1SuIvXoI8E0a1wSvhLD9A3H/Guw60MBLflR0CgZlW1de6ukAPPs1OgXg
Gf7DSdr0qZCdFblO/rNPNqbry0GaD+Jb1OHyuiBqpWAtsHSJ/1onIu0X672rFyDs
wKBmXyCu+okvP7BeukW8Q4jHPhGwTg==
=nOcc
-----END PGP SIGNATURE-----

--Sig_/sxvwauLpjDBgVnETGxMFZ8T--
