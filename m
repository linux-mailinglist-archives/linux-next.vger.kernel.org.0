Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B922220AA9D
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 05:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgFZDO3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 23:14:29 -0400
Received: from ozlabs.org ([203.11.71.1]:37461 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728169AbgFZDO3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jun 2020 23:14:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tMS22Tnzz9sQt;
        Fri, 26 Jun 2020 13:14:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593141267;
        bh=JeMlsd1fzjw1lX9izU3xDCD3UJI55jk+JTfxZIErcK8=;
        h=Date:From:To:Cc:Subject:From;
        b=JSkn6DOWw0DTPreLapTMrgfM5NW42EGfUEG3CBz7CCaI9qDuz+UMBKt8rvz5CI1WR
         M78I9vVKYhZNh9E9M5GmCmNF51gq4LhHhbCa9P2jXa8+I4vsMrLnN7Cdyz8reeeFKa
         lR9gGdPyWDAFXH04CVsedwh4hTlYH2g/dwbia3qA/EMBL/pifwsYS6dBg9AEiVHhAJ
         dq69eDABxDj42pHTluRltiNUFZRgSmk2uEd+ZecOxbw9B6xQJPXDjflNHBrSCS9nNe
         M+uH+Wq3/EK/6rSvU5EjJzQy1JSRh1QR+tmqpkEGI22bQTEnZP8QyeMCVvCLxUX/wA
         uz4vPKvSIMMiw==
Date:   Fri, 26 Jun 2020 13:14:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200626131425.73ee4e27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OvjiHl30+7kVmpNBxgBCCL_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OvjiHl30+7kVmpNBxgBCCL_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  include/linux/compiler.h

between commit:

  1d8fcbb76bb1 ("compiler.h: Move instrumentation_begin()/end() into new <l=
inux/instrumentation.h> header")

from the tip tree and commit:

  3b9946ebaf2b ("rcu: Fixup noinstr warnings")

from the rcu tree.

I fixed it up (I used the tip version and added the following patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Jun 2020 13:02:03 +1000
Subject: [PATCH] merge fix for "rcu: Fixup noinstr warnings"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/instrumentation.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/instrumentation.h b/include/linux/instrumentatio=
n.h
index 19cba99342c2..83d9a3c5204f 100644
--- a/include/linux/instrumentation.h
+++ b/include/linux/instrumentation.h
@@ -6,7 +6,7 @@
=20
 /* Begin/end of an instrumentation safe region */
 #define instrumentation_begin() ({					\
-	asm volatile("%c0:\n\t"						\
+	asm volatile("%c0: nop\n\t"					\
 		     ".pushsection .discard.instr_begin\n\t"		\
 		     ".long %c0b - .\n\t"				\
 		     ".popsection\n\t" : : "i" (__COUNTER__));		\
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/OvjiHl30+7kVmpNBxgBCCL_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl71aBEACgkQAVBC80lX
0GyCRwf/RgBVhUqPmWCoxGoAPoaYa9cfHbD9MS/wVbfT/XbucXy02WwGxsVUec5U
wIgyhMBIhsL05+XPZ0TzNp74JYx07hKD6Gxoh2RuAyPx92dm2e9Trw0SLqsw26tO
ReR2nwig1KHDN/JMEiraPR/CYVEON8Wq5/nQR+NqN2HBqQZVagWmSp1mpHmbk2Zh
knOC/nSJI+oBV47WJ6S2heNvJBV604xwhWexgFNlA5uEtPbxBgnDyo6TsKqAgpNf
AYcd3y6aM3SQbs3BT06Ecop0CSaFgDXrSxijAmPjGPEQ/mIqpQUCUGETYqNauSGM
s4QdwqltmbDJZgFxPPnxTNv/8dg9ig==
=8QME
-----END PGP SIGNATURE-----

--Sig_/OvjiHl30+7kVmpNBxgBCCL_--
