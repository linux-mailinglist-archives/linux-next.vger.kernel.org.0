Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF640FD3DA
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 06:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbfKOFDX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 00:03:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54151 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfKOFDX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 00:03:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DmT34pVtz9sP3;
        Fri, 15 Nov 2019 16:03:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573794200;
        bh=OAFeKSF/yqSzlXgKP5uS38QWQaYi2GwZ+7FrnVq8BjU=;
        h=Date:From:To:Cc:Subject:From;
        b=iZ8+aNotzcw9TY7qLrODyOb6zrReInMG0lEW+SoNA/r5Q1KTi1CM+bQBUPbVWTerv
         y/hdcXHwB/qgAducPo2liy1espz6bAWOQspMJboGGi804qqrVGIszNKgkev+lypPpb
         A1ge+12/a6wIQWrKwcydY9bUOfoQ+QP3goQExyywDuIyFdwgdunxSnQJjPKTvTWIMP
         Cwm0OXLDVKuW+a94UcNVeG/gAf03w6YRv+0M30dWfbbK0hw0Skir5ukeT3IpAXhW94
         ynlNQcjrB0OF6lj1x8P/FL9CepmJe+5bi0iiiGdkshW5orS1Yt6++Dx+NTSpHD6gIk
         rIHiPHgc0lsDg==
Date:   Fri, 15 Nov 2019 16:03:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the livepatching tree with the ftrace
 tree
Message-ID: <20191115160319.2d84224d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eccss_9xX3vHAyOCwFgNRNO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eccss_9xX3vHAyOCwFgNRNO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the livepatching tree got a conflict in:

  tools/testing/selftests/livepatch/Makefile

between commit:

  8c666d2ab576 ("selftests/livepatch: Test interaction with ftrace_enabled")

from the ftrace tree and commit:

  ecd25094c5f5 ("livepatch: Selftests of the API for tracking system state =
changes")

from the livepatching tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/livepatch/Makefile
index 1886d9d94b88,1cf40a9e7185..000000000000
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@@ -5,6 -5,6 +5,7 @@@ TEST_PROGS :=3D=20
  	test-livepatch.sh \
  	test-callbacks.sh \
  	test-shadow-vars.sh \
- 	test-ftrace.sh
++	test-ftrace.sh \
+ 	test-state.sh
 =20
  include ../lib.mk

--Sig_/eccss_9xX3vHAyOCwFgNRNO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OMZcACgkQAVBC80lX
0GyHmQf/cz1NtlRPqaLLVIA6avaiLzK767nq/yA9qj0HU6KxxIwyDT0geGObPIEM
yin7xkG+q6p7Ivl5iIJurhwfrQ53uOlqj7eHYzUvzQlcnTKfMdhn2IfqBBcHxUC/
N3mLd57Bv94xRe8v1SYwIiGwuue/TYOVEvidvJAG14BWHoRCt4RIUreQtXn6zx49
YyQjtxXsBCFGuk7XPw0emsY6PBgfOUg1sepWAACgZwdSDRr6KydnZq4m7uQ+jKI4
Ey0yOO4gFOU2lu4MpAXCokS8cbTkNlsCcCQc3kHS/BXyOqr7MLDzofuPmJIYCrwy
ARMxyzP/NnivzaMVmwG2Hk3Iad1/mw==
=lDdk
-----END PGP SIGNATURE-----

--Sig_/eccss_9xX3vHAyOCwFgNRNO--
