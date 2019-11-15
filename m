Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5BDFD311
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 03:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfKOCyJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 21:54:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfKOCyI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 21:54:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Djbx2VWfz9s7T;
        Fri, 15 Nov 2019 13:54:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573786445;
        bh=SybDljMw+M7nx2Wto9NsHQOdfYnh2eeHcpMdwIVCDAA=;
        h=Date:From:To:Cc:Subject:From;
        b=jgqVFC5iHnWnn2/4nG1ptrdqn1fiEZsaWabD/7/W/c5LzP1LIxZ34jw24V1k2HSOw
         wU4/QqtCq9jcs0ATEHTvzxWBzrDXL3b0DpQSbhr0n62jxQUK+5DJk5MXXYQWVWy03j
         vlhJQiTQzFZVHDMEm6+sKVb8hND43kY+KzTdD9GEK/RvJOoIeaA3qjaJHWDvXSYYkb
         RzxOXrm5Gf3tpQf6z1avftPzm16ljpJsJJmFxjcgmH1VyMNJmfayaJM3Btw1whRYYm
         IGCycHZnkzMcjs3OifihlU2xBSpRlwWteLkL2LJR0UgAKDmzLNUA5hvyxOvdFx0fHR
         TeHkNG+uQY2+Q==
Date:   Fri, 15 Nov 2019 13:53:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191115135357.10386fac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wu9x9N7Ps.0tRtcEvyvCnHK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wu9x9N7Ps.0tRtcEvyvCnHK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  include/asm-generic/vmlinux.lds.h

between commit:

  a1326b17ac03 ("module/ftrace: handle patchable-function-entry")

from the arm64 tree and commit:

  b83b43ffc6e4 ("fgraph: Fix function type mismatches of ftrace_graph_retur=
n using ftrace_stub")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/asm-generic/vmlinux.lds.h
index 63cedc3c0c77,0f358be551cd..000000000000
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@@ -136,19 -110,30 +136,29 @@@
  #endif
 =20
  #ifdef CONFIG_FTRACE_MCOUNT_RECORD
 -#ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
 +/*
 + * The ftrace call sites are logged to a section whose name depends on the
 + * compiler option used. A given kernel image will only use one, AKA
 + * FTRACE_CALLSITE_SECTION. We capture all of them here to avoid header
 + * dependencies for FTRACE_CALLSITE_SECTION's definition.
 + */
+ /*
+  * Need to also make ftrace_graph_stub point to ftrace_stub
+  * so that the same stub location may have different protocols
+  * and not mess up with C verifiers.
+  */
 -#define MCOUNT_REC()	. =3D ALIGN(8);				\
 -			__start_mcount_loc =3D .;			\
 -			KEEP(*(__patchable_function_entries))	\
 -			__stop_mcount_loc =3D .;			\
 -			ftrace_graph_stub =3D ftrace_stub;
 -#else
  #define MCOUNT_REC()	. =3D ALIGN(8);				\
  			__start_mcount_loc =3D .;			\
  			KEEP(*(__mcount_loc))			\
 +			KEEP(*(__patchable_function_entries))	\
- 			__stop_mcount_loc =3D .;
+ 			__stop_mcount_loc =3D .;			\
+ 			ftrace_graph_stub =3D ftrace_stub;
 -#endif
  #else
- #define MCOUNT_REC()
+ # ifdef CONFIG_FUNCTION_TRACER
+ #  define MCOUNT_REC()	ftrace_graph_stub =3D ftrace_stub;
+ # else
+ #  define MCOUNT_REC()
+ # endif
  #endif
 =20
  #ifdef CONFIG_TRACE_BRANCH_PROFILING

--Sig_/wu9x9N7Ps.0tRtcEvyvCnHK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OE0UACgkQAVBC80lX
0Gy90wf8DG2g3bXYzLlXAN+vkX/Q8pIVdoD/eRfWodPH9RHC/Z0p+J9OLJFIl3Q4
4VNwsAgQcYgvj+W8m4zMz0ZX88uzKCjsM5DfOeZ7I7pKHxwGhihJDTC8YzlhZFln
i7G1qoSdovqc9IVSJw58n93GjO5m85rIhiQpsUK3YLTvYRy5CPDPwNlQXv+y592/
P/cAgZBFSSPjrdjVMWVJ2DZ3IawJ0ViT4xOb2oOYdZVoVotiSFWCLQcP84M+nncx
Y+1a9SdYtcHQnBg+v8LCFIps+bbU7u732IPJg5pTHitV3yT4fmNhW4NvRPESnUGZ
rvEglKw1e/k0j2pMq4IrIX4epGw0Xg==
=rW2a
-----END PGP SIGNATURE-----

--Sig_/wu9x9N7Ps.0tRtcEvyvCnHK--
