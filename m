Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D55711FCF4
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2019 03:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLPCoF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Dec 2019 21:44:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbfLPCoF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Dec 2019 21:44:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47blvz1Pzrz9sPT;
        Mon, 16 Dec 2019 13:43:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576464242;
        bh=mwTmF/orU3wxOqHiDxX05Eq3VuWMUDRQgKa8U4iZlQI=;
        h=Date:From:To:Cc:Subject:From;
        b=FO1+7e5pfrfo+AVb6t3W/8NFRt5uxz8q4eejd0i/rKl3STvTdmk1TqqL4rm6c9wSt
         A2ADMgHrv5Q05wq7veDmkH9YZh0fLv1Fddqo1FWywsmSK3cqD0hne3rQwGZfAOMGDe
         ZRwlqDoxAtP4gSsfmLtOa6dYpPGM55FbX1wJdzWcv9jQcO3spyoV4ebLcxL7lmoKZ0
         OoZpXmfSRQIiz7yHdIB8/eqL0twjCpGnOpBAd2QnMjoeW1/37Kteu91+uRwWIg2ID8
         KuVgmkjOCFOs8tUOzd8YG1ubQWmvWTHAiHQdV7ucBMaS2sZ9UaEA9s8wL2fxrm4faT
         toUt162y+tECQ==
Date:   Mon, 16 Dec 2019 13:43:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20191216134351.7bc39894@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GYZsxuoQ/5fTlkH+PtsGgc9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GYZsxuoQ/5fTlkH+PtsGgc9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  init/main.c

between commit:

  8243186f0cc7 ("fs: remove ksys_dup()")

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

diff --cc init/main.c
index ec3a1463ac69,4d814de017ee..000000000000
--- a/init/main.c
+++ b/init/main.c
@@@ -93,7 -93,7 +93,8 @@@
  #include <linux/rodata_test.h>
  #include <linux/jump_label.h>
  #include <linux/mem_encrypt.h>
 +#include <linux/file.h>
+ #include <linux/kcsan.h>
 =20
  #include <asm/io.h>
  #include <asm/bugs.h>

--Sig_/GYZsxuoQ/5fTlkH+PtsGgc9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3272cACgkQAVBC80lX
0GxVXAgAnBPo2cbQuIIqPQNNrG6l9AI1VsFD//t2mLp56qVdMSwyVY+GRMrHa0nc
BEe7AabmwJHw/dbZ/4EFYTl3XjEB9W1ydbgdKeASSh//vawMHgAUaRmlUgfHWYLK
33f7WxAon5Ybn0lDm54XMarJNEFcu5i/hrAm4fA9eBg6FzyRdg3rG7hu8f/JBvU4
11BUWluPlg4sPrTS71tZLuqI2mkKWIryIHM5GsTq96yNujY3g9Pedve3anahAXGd
JQMMN7kqsD6OY1qSZWIrIBRxx55YGBO0q6yskVZzZ8yUBkl8XjS14sPLImhRJe4C
+DOejq439Cd9aWPpvcFiCw5QYWE90A==
=Ti2i
-----END PGP SIGNATURE-----

--Sig_/GYZsxuoQ/5fTlkH+PtsGgc9--
