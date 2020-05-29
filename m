Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87531E7B08
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 12:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2K5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 06:57:44 -0400
Received: from ozlabs.org ([203.11.71.1]:32899 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2K5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 06:57:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YM3T23jlz9sSp;
        Fri, 29 May 2020 20:57:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590749861;
        bh=BcOfzFUItv/6aevkHrUDyABwpERRKV8woWnSX4CldgI=;
        h=Date:From:To:Cc:Subject:From;
        b=IzCDR2TFxxqa0UJPXbZvYIayfAcQzECuO4PRH+YLwS6sJLopIcH0iEw1RajuwmZ/D
         bMGcDBfCkgTw6Q56ICj5uPkPWd3Qk5Q9ikk6UTKt7Kl2+Hyw09o2q4A9aNjKTF6VR3
         d9FPotuEI1+kppQ9neXFa9d7H0qTlrDbtpLn93k7oPNa2ZCyV2XoRlTv4k9InG1C3l
         TcE217bzRdxKgwnSFhV+goAO9NZg4mlaH9VpTv7UID6hTICgFm+zpVZH+AV2FFnROg
         wLIPjD87q/T7bbTowYntictt721GcZgj7FaJYXfKvpN5f84Ceo0ZP+MSVYZt691H0A
         zDB35RKy999og==
Date:   Fri, 29 May 2020 20:57:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Message-ID: <20200529205740.3ba0e6fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z92ZKzvO13=zn.L+iD1FCN3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z92ZKzvO13=zn.L+iD1FCN3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/x86/xen/smp_pv.c

between commit:

  66a07b44e765 ("x86/entry: Switch XEN/PV hypercall entry to IDTENTRY")

from the tip tree and patch:

  "mm: introduce include/linux/pgtable.h"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index ae4d0f283df3..679d7e87a68b 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -26,7 +26,7 @@
=20
 #include <asm/paravirt.h>
 #include <asm/desc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/idtentry.h>
 #include <asm/cpu.h>
=20

--Sig_/Z92ZKzvO13=zn.L+iD1FCN3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q6qQACgkQAVBC80lX
0GyOaQf9HmwLBdz5FipAX8csuU9dO+zOnk/i/INeZmjdlJYoILUkxTdgh4cRSeQ5
pYTNZ7cT2um+htiD7LGoiQNi1G3FYMZKySp4dmrXwsSfFkZ63PiZyVPXH7Gl7RER
7vyqb3eh57NSv3KsWThZNYuz1/ZKK07ppKgHe9uWXevY1BB6mJ+xiRjWrIBAeS56
IqXEQdELb272zsI/cvHt/Bs054/Rqgy7abIjH6WCPO+HMu/LDJ1u2kYumHquzAfk
DOu9vVVjrzemjhyyUAhxcW2hbqAYfxxdGpDUiTyVd32W75tg6mALhnk//MvsEBBc
us1N4QpsyH4kY9XnS8p9Is5SkDpfag==
=iCSR
-----END PGP SIGNATURE-----

--Sig_/Z92ZKzvO13=zn.L+iD1FCN3--
