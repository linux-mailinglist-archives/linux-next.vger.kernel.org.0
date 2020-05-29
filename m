Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CA21E7B2F
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 13:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgE2LFG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 07:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2LFG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 07:05:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0474DC03E969;
        Fri, 29 May 2020 04:05:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YMCz3Rdsz9sSw;
        Fri, 29 May 2020 21:05:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590750304;
        bh=X9/iH2QW5nj+uSRfOVtvjzvMyjI9lS43iE4tK2tvSLI=;
        h=Date:From:To:Cc:Subject:From;
        b=MFezuS/Gk/MkKjvcezYd3HmpQh/ulca07s5Ny2N+9nAD6K+KuJGx+ZKzFxYYX8t/O
         PPXI/dAhQ7NuAde40BAeTaguqW7Hg7ba4vdIW2RfmqcByKvykl7x7gq9yfUAyL395v
         M9dD+5UkyJAg2ooHmkW7aO9ODC9lzA2PfIYG6pyfhySFvppXr7cXazsH+xx7tqT1K7
         pYV55ReP6IKa9fEaPE7vbNgDh+4uboqvpCiZ9fXh4dfnT+N99yY1QIHITk1Poz1ahq
         iHrMHbSJjo0R9m+tbyltMfseAzeLm2NIRfRjGkC5VsB/v0AK4mVRRuoeh7+rSlFMCh
         hoomyhA/k2SVQ==
Date:   Fri, 29 May 2020 21:05:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200529210502.0a594149@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3r/UW0HLudC_ic1rJBGbXa3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3r/UW0HLudC_ic1rJBGbXa3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/include/asm/efi.h

between commit:

  9b47c5275614 ("efi/libstub: Add definitions for console input and events")

from the tip tree and patch:

  "mm: reorder includes after introduction of linux/pgtable.h"

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 129e62146cbc..e7d2ccfdd507 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -3,13 +3,13 @@
 #define _ASM_X86_EFI_H
=20
 #include <asm/fpu/api.h>
-#include <linux/pgtable.h>
 #include <asm/processor-flags.h>
 #include <asm/tlb.h>
 #include <asm/nospec-branch.h>
 #include <asm/mmu_context.h>
 #include <linux/build_bug.h>
 #include <linux/kernel.h>
+#include <linux/pgtable.h>
=20
 extern unsigned long efi_fw_vendor, efi_config_table;
=20

--Sig_/3r/UW0HLudC_ic1rJBGbXa3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q7F4ACgkQAVBC80lX
0GyKHQgAjBvBS1s36FXrkwKecTmN3fVdiivvvhBeQrsYi9D+8+vgs8TGbxG32ydg
qczqcWQ9SkIXHrjD7QVvDKH7bz1hgah3jcjwo2YdvMH/BRJE+OTx1DoA3Cwlz+wS
VKlTHNYSk1YPdwlCaEiDZUnnHM9Z2f6xGKgpqRv8sDRZWSdVYUj3jTGm39KPfoRf
eFUqDxRJFSA+9IG4v815CsZbbvNZech/u7VWErPaLljzMKypCj2KIZsEi1dh/pyI
/yBFMb2fNEDDvE//I1Nj793+4Y97MA1qZPlQBu0pMvviSK9bawdvfbNSDJoPXHjZ
ve/KRxRDk5o0CBO3Srpli/tN2aYlzQ==
=28YW
-----END PGP SIGNATURE-----

--Sig_/3r/UW0HLudC_ic1rJBGbXa3--
