Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04EE01D4580
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 08:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgEOGAV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 02:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726184AbgEOGAU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 May 2020 02:00:20 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5540FC061A0C;
        Thu, 14 May 2020 23:00:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Nd6j60Ldz9sT8;
        Fri, 15 May 2020 16:00:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589522417;
        bh=sXWQ6fcIr84bgQy2RgljVshFnRMy+/RUr4mrTKK1Q9I=;
        h=Date:From:To:Cc:Subject:From;
        b=M3zUE+EmjYYDok0HB/Hqt3Eq2i/wb2hIKY4TPvh/KDc/23Cn8QqJXFcBQLA8aqXa6
         eHO1SS7BEf80FusOTJc9UgNTDoQ/u8AeGRe9GTaw88pY0Psi2Hs3cdojP90Ny+thCt
         XJtkEeRIn7VLlqrOKXc0R4s9x7oX0pZvcuJEsnzid0D/4dadhG6B2bY21IRzALZW0f
         mok4QPNrNFRU41ozn69tpslr2iZCeOgKwrtDjsnxMxm3spLeDf8bbibvA4COs/TWNb
         jKRywOYgqtsOxdXY6iA+lHYLJBbRPpYwW2xVW2c/449PnRSCxo7U5ylUsM6WFIdpTz
         ylVHGNh8Z/Pyg==
Date:   Fri, 15 May 2020 16:00:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200515160011.538b848a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aIFIPZzGRhDfalNTWdkuys_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aIFIPZzGRhDfalNTWdkuys_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

arch/x86/kernel/ftrace.c: In function 'set_ftrace_ops_ro':
arch/x86/kernel/ftrace.c:444:32: error: 'ftrace_epilogue' undeclared (first=
 use in this function)
  444 |    end_offset =3D (unsigned long)ftrace_epilogue;
      |                                ^~~~~~~~~~~~~~~

Caused by commit

  0298739b7983 ("x86,ftrace: Fix ftrace_regs_caller() unwind")

from the tip tree ineracting with commit

  59566b0b622e ("x86/ftrace: Have ftrace trampolines turn read-only at the =
end of system boot up")

from Linus' tree.

I applied the following merge fix patch (I don't know if this is
correct, but it seemed reasonable):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 May 2020 15:51:17 +1000
Subject: [PATCH] fixup for "x86/ftrace: Have ftrace trampolines turn read-o=
nly
 at the end of system boot up"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index f8917a6f25b7..c84d28e90a58 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -441,7 +441,7 @@ void set_ftrace_ops_ro(void)
 			end_offset =3D (unsigned long)ftrace_regs_caller_end;
 		} else {
 			start_offset =3D (unsigned long)ftrace_caller;
-			end_offset =3D (unsigned long)ftrace_epilogue;
+			end_offset =3D (unsigned long)ftrace_caller_end;
 		}
 		size =3D end_offset - start_offset;
 		size =3D size + RET_SIZE + sizeof(void *);
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/aIFIPZzGRhDfalNTWdkuys_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6+L+sACgkQAVBC80lX
0GyM6wf+J7Ag1vO4AUONZMa+sHn9E9wVS2e0B/AHlQzO/k7sogVLAqaGSLBidZI3
SEtGM20ygAjD4yJHFk0cNY3w1T1xfsz/He3NwsoevpwsAR8ntp19PyiRkgifWqG7
kNgUrF50qgamQ6nMhhdJ8LVjwEn2ZGDFZIsDMNWipHQlGRY5IWMPy6AeywWsBYRP
EVrcfsvlmdzSjbuIeuknAa3HtLdMoFk5RLcB9ZgktooyzBIddnq2YMzbl+y4+USP
Kf1gGRF4E+OF4qa1dUK3Y8JDCn8YBQPGZWSe8g8xn3feRH0LPltXRQ+5iMZefHff
zA/22F7VkCxMpnuf10FhkeaFbcB0kA==
=vwup
-----END PGP SIGNATURE-----

--Sig_/aIFIPZzGRhDfalNTWdkuys_--
