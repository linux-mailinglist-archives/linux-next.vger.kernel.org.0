Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971BF2D52FF
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 05:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730949AbgLJE64 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 23:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729737AbgLJE64 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 23:58:56 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A93C0613CF;
        Wed,  9 Dec 2020 20:58:16 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cs1rf62xxz9sW1;
        Thu, 10 Dec 2020 15:58:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607576293;
        bh=R/SbbL3PKfVpoDNPmfMdTZ9gkk+m3oENNeMf3Ers1qM=;
        h=Date:From:To:Cc:Subject:From;
        b=KENCHhu5j8z9pOMPeuayWKvEuS4FIK1rbEYBnh+8drh0zY/3lRtyWsC/e6XDe0QNg
         bqoeRbGTVAG6VcG33nzS9e/exF22kwdTMCshOPi7i9048glMPnBsdYXqWZ9EwOiaKS
         4L8jD6Qc4khIMnN+z/tfo5gEovYBnGEutEuq2jhjJmQiABlWmW/hF4pewJ+Mm7RFvg
         FsIQESfit+UsReyFBbrijuMOLq1KAurgNxGdQl+TTGjV1+d2HspvYQhi2MhHeTYjms
         g+V5GB1WO0N8/DdlE2XDEmf3UOipCrf+zpycK7o5kWzSj+49080wNBOF3KayGvyI+j
         TbIJiOw5GHB4w==
Date:   Thu, 10 Dec 2020 15:58:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Simek <monstr@monstr.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the microblaze tree
Message-ID: <20201210155808.717a7257@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Px9Bv/_pfqEcRM/0cBgiQx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0Px9Bv/_pfqEcRM/0cBgiQx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  arch/microblaze/Kconfig
  arch/microblaze/mm/Makefile

between commit:

  05cdf457477d ("microblaze: Remove noMMU code")

from the microblaze tree and commit:

  7ac1b26b0a72 ("microblaze/mm/highmem: Switch to generic kmap atomic")

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

diff --cc arch/microblaze/Kconfig
index 6acbb4571b0f,7f6ca0ab4f81..000000000000
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@@ -139,8 -143,19 +139,9 @@@ config ADVANCED_OPTION
  comment "Default settings for advanced configuration options are used"
  	depends on !ADVANCED_OPTIONS
 =20
 -config XILINX_UNCACHED_SHADOW
 -	bool "Are you using uncached shadow for RAM ?"
 -	depends on ADVANCED_OPTIONS && !MMU
 -	default n
 -	help
 -	  This is needed to be able to allocate uncachable memory regions.
 -	  The feature requires the design to define the RAM memory controller
 -	  window to be twice as large as the actual physical memory.
 -
  config HIGHMEM
  	bool "High memory support"
 -	depends on MMU
+ 	select KMAP_LOCAL
  	help
  	  The address space of Microblaze processors is only 4 Gigabytes large
  	  and it has to accommodate user address space, kernel address
diff --cc arch/microblaze/mm/Makefile
index cd8a844bf29e,8ced71100047..000000000000
--- a/arch/microblaze/mm/Makefile
+++ b/arch/microblaze/mm/Makefile
@@@ -5,5 -5,4 +5,4 @@@
 =20
  obj-y :=3D consistent.o init.o
 =20
 -obj-$(CONFIG_MMU) +=3D pgtable.o mmu_context.o fault.o
 +obj-y +=3D pgtable.o mmu_context.o fault.o
- obj-$(CONFIG_HIGHMEM) +=3D highmem.o

--Sig_/0Px9Bv/_pfqEcRM/0cBgiQx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RquEACgkQAVBC80lX
0GwGKQgAknIQ1cKhiwukVfmkyHholoPB+hmqbxERg2Sa7XnmRmzZ9YE/x7y+hSON
LpJbj3+JqJP4Uwr61OsRz+dyjszzbynJlIE8zp9Wn3lxVGvebPEHkLkheuyUzN45
p3mScVTDz6FGoVJcX7v1JMFLwiv2j0IQFIb2ej6x5Bja3RJMClpKB5XY2tMZtnXU
PzM4qVrM1CI57NR8VPiiNPzsA8F4wKrSHyH19w/Ao/gRSvKoBDrZSnxI5zuk+f8J
6Utja/vnPNjtF6kLCI6mtjfEePFgFse7NKOyJvXDO9UA2MgbByJsaN2yBQuETm5N
IEYXE8YfXR5JDphR0d5GM8pojsKfoA==
=NHPY
-----END PGP SIGNATURE-----

--Sig_/0Px9Bv/_pfqEcRM/0cBgiQx--
