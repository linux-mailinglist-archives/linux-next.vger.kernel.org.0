Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F63A108681
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 03:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfKYCb3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Nov 2019 21:31:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46427 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbfKYCb3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Nov 2019 21:31:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Lrd83MmGz9s3Z;
        Mon, 25 Nov 2019 13:31:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574649085;
        bh=BzRBNWLSBnO1sMeoG28bNh55SJgbkWN8n682XaAPfPI=;
        h=Date:From:To:Cc:Subject:From;
        b=aSf2LBm7JDPh292XPXIwNfbOP34d0CyRIF7/eVcBRyHdhVjPPLGT31WOOBtt7N+ji
         u3RFPLTpPh/90eijAjgLJxpWGjQ0xQLLQA+YGmxP7YgswRYmSH6MgWt+cO2J5Vaoto
         5/gyklW2f7bP2NKpLX9lgd2xIa1rJevUzQY+Pu6oyDc101URbPCWnWzkUt4VK9nIpF
         VZSpTvhmVoTK7YeQMntGsKYBTnJcPezsDwJg7R+jHLA6lD3ofj4Zroj3EVsFs+VLs8
         RUDWWZyRP9beYKpCP67l88zbpHqFf0FqjPLCOKQW9+sTRnCGWbBUns0LEbkK56BzGU
         9tpiev54hUkgg==
Date:   Mon, 25 Nov 2019 13:31:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ingo Molnar <mingo@redhat.com>
Subject: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191125133120.553097b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DZ9/N/+VBIja8LnYfxmT.oj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DZ9/N/+VBIja8LnYfxmT.oj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  include/asm-generic/vmlinux.lds.h

between commit:

  a1326b17ac03 ("module/ftrace: handle patchable-function-entry")

from the arm64 tree and commits:

  b83b43ffc6e4 ("fgraph: Fix function type mismatches of ftrace_graph_retur=
n using ftrace_stub")
  46f9469247c6 ("ftrace: Rename ftrace_graph_stub to ftrace_stub_graph")

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
index 63cedc3c0c77,996db32c491b..000000000000
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@@ -136,19 -110,30 +136,28 @@@
  #endif
 =20
  #ifdef CONFIG_FTRACE_MCOUNT_RECORD
 -#ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
  /*
 + * The ftrace call sites are logged to a section whose name depends on the
 + * compiler option used. A given kernel image will only use one, AKA
 + * FTRACE_CALLSITE_SECTION. We capture all of them here to avoid header
 + * dependencies for FTRACE_CALLSITE_SECTION's definition.
++ *
+  * Need to also make ftrace_stub_graph point to ftrace_stub
+  * so that the same stub location may have different protocols
+  * and not mess up with C verifiers.
   */
 -#define MCOUNT_REC()	. =3D ALIGN(8);				\
 -			__start_mcount_loc =3D .;			\
 -			KEEP(*(__patchable_function_entries))	\
 -			__stop_mcount_loc =3D .;			\
 -			ftrace_stub_graph =3D ftrace_stub;
 -#else
  #define MCOUNT_REC()	. =3D ALIGN(8);				\
  			__start_mcount_loc =3D .;			\
  			KEEP(*(__mcount_loc))			\
 +			KEEP(*(__patchable_function_entries))	\
- 			__stop_mcount_loc =3D .;
+ 			__stop_mcount_loc =3D .;			\
+ 			ftrace_stub_graph =3D ftrace_stub;
 -#endif
  #else
- #define MCOUNT_REC()
+ # ifdef CONFIG_FUNCTION_TRACER
+ #  define MCOUNT_REC()	ftrace_stub_graph =3D ftrace_stub;
+ # else
+ #  define MCOUNT_REC()
+ # endif
  #endif
 =20
  #ifdef CONFIG_TRACE_BRANCH_PROFILING

--Sig_/DZ9/N/+VBIja8LnYfxmT.oj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3bPPgACgkQAVBC80lX
0GzvoAf9FF7bDyxJxWnKnIRuywcv/X+fqBtC/9M0+C06gSBaF5Px/FfU6CvgGiQ6
ROyXX/8gpqmcDzs7Qf3MRTKOuD9sh1k9IRuYYfOs48yfk1j0Ie9r52emO+J/ORKw
xrc80hXneNGZvFSk8qvEFGHvqWeTntGTrLwvxSeetBKFA6N499pvlN68J4cQKzV3
yyxi4uyHi+P1d4sOb7avF1O+URREKuy8Pviz46tU5pammDsivdutoF0wpN/PsAPT
Vy+9zzF5dYVDYUIqhOH5Bv7J/ugybJ9BObz03MyJV51IByTHS/OGZjupgkufgWzy
wOEC8h63hOXmfE6Ijw8vF2KQujVXzQ==
=KRiG
-----END PGP SIGNATURE-----

--Sig_/DZ9/N/+VBIja8LnYfxmT.oj--
