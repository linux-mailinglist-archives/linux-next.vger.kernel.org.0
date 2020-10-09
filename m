Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442EC288190
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 06:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgJIE7j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 00:59:39 -0400
Received: from ozlabs.org ([203.11.71.1]:57781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbgJIE7j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 00:59:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6wpt4fS3z9sRk;
        Fri,  9 Oct 2020 15:59:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602219577;
        bh=H6cyr1kI+gSFy5XYw0DE7S35JWkfMtWI958sGxnRUKo=;
        h=Date:From:To:Cc:Subject:From;
        b=RWCwPiFtBdYGyRTvEYZVQwejYlvVcBRIJ7TZEXFmLUuwFbQczbL6Y+iNEAQ4FH7Iq
         glRpX7GUCcYYp/yiXkC5N3Eafx3+7IczQXXYxpvNtnCUmFoo9dUX2b97SVk9zw7014
         jID+EdMEbKjZVbAqutFlwXiGNNcRmjnteGe2YMCupJnL4iNhCgZ2r02hafyLXjK1o6
         l0/2So4F6NDGruKcjj4gRtG/y8Oj08NSZyfNbFMaXnxxgfW+skk+XcYvHV7rnBl+GQ
         0Ltcll+XV1ofXGc6FDvTu92Pbrx10VPPmMrarwv/IWiT1sj7DL/xOsyyNGE/SPSbWp
         WldyMqiJNH0Wg==
Date:   Fri, 9 Oct 2020 15:59:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20201009155933.72aa0644@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AJ8DdaNfuQwxZLeACw4ybmW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AJ8DdaNfuQwxZLeACw4ybmW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  include/linux/lockdep.h

between commit:

  a046a86082cc ("lockdep: Fix lockdep recursion")

from the tip tree and commit:

  0eb8743dc570 ("lockdep: Cleanup PREEMPT_COUNT leftovers")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/lockdep.h
index f5594879175a,8555fd128ebf..000000000000
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@@ -580,18 -566,16 +586,16 @@@ do {								=09
 =20
  #define lockdep_assert_preemption_enabled()				\
  do {									\
- 	WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)	&&		\
- 		     __lockdep_enabled			&&		\
 -	WARN_ON_ONCE(debug_locks			&&		\
++	WARN_ON_ONCE(__lockdep_enabled			&&		\
  		     (preempt_count() !=3D 0		||		\
 -		      !raw_cpu_read(hardirqs_enabled)));		\
 +		      !this_cpu_read(hardirqs_enabled)));		\
  } while (0)
 =20
  #define lockdep_assert_preemption_disabled()				\
  do {									\
- 	WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)	&&		\
- 		     __lockdep_enabled			&&		\
 -	WARN_ON_ONCE(debug_locks			&&		\
++	WARN_ON_ONCE(__lockdep_enabled			&&		\
  		     (preempt_count() =3D=3D 0		&&		\
 -		      raw_cpu_read(hardirqs_enabled)));			\
 +		      this_cpu_read(hardirqs_enabled)));		\
  } while (0)
 =20
  #else

--Sig_/AJ8DdaNfuQwxZLeACw4ybmW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9/7jUACgkQAVBC80lX
0Gxs5Qf/bLiFJnjdvZHDu0BNOzeUMw2uIUFdSfIYV0HU9TSfTCvKuowptfUMJTIW
bXD0IDILGJHzPBkanGWSzq7QOLRvLRqqOLex4pmsHILHRh02lMW6/1nOudylXx1n
sS5/ipyVWI3ad8KuRTCzndlg/jLmuYpSAPHIIn9e3Eyk6v6rDJXezvFNGkS09pyf
6p+OIsyGwoNfp89n4aQfZxSyZ7ly2UcEFwOxXBriBckpK4t7JHzjyMHzve1ansZI
nmqdlhZ5bnkX/eVldJeKsDBvhnw7Aop0mNOKHdtiZ1MlWPPXegmLoXdwKc/8V2UF
/vYiHt8H5ZCwpWoSrgj49Qlko3lK/w==
=8G5V
-----END PGP SIGNATURE-----

--Sig_/AJ8DdaNfuQwxZLeACw4ybmW--
