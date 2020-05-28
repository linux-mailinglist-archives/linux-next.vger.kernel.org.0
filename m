Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B9F1E5B65
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 11:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgE1JFE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 05:05:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728028AbgE1JFD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 05:05:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xhbx5gPCz9sSF;
        Thu, 28 May 2020 19:05:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590656701;
        bh=hFZCXpwyF+voqr0buEwSw32UU9jdGOvmsOlYam8KpIM=;
        h=Date:From:To:Cc:Subject:From;
        b=IonMW0yPWVEYu1nwvMMNlAhhFEBeUZ79eHQa7qhUgaZMDOJ0VYDmkSwkq5xaqnO/1
         dDI/VI3vQ3dXIMF//oEzTHIqShjv3Z8+mXrDGbKtQepYRTR/KNOoZ9MLoTZaXuaiaA
         usopWvlmbN1xH9TmzKPKwQ9GwiaIjVyDlEdzA6v7s0+HcTWpmArWZ7wOFzElmVbhid
         2lbySI0se/Db+1bXGGTyaEDheJ1ATTU2TMQUQgTt7C4Bpe9KT/pvyTrkEMoOuHHlFd
         unWfUpMRUocTarfpHSgsAOcuVpxwH9C2Ak8PaOnFlpY6Hlpj3tIjvyrQNTo9ZATqjv
         AjIEQ2WB/InjA==
Date:   Thu, 28 May 2020 19:05:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20200528190501.10135e9f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3kczfIxexzGb0HAvK.fAKWI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3kczfIxexzGb0HAvK.fAKWI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (powercp
allyesconfig) failed like this:

ld: kernel/rcu/refperf.o:(.discard+0x0): multiple definition of `__pcpu_uni=
que_srcu_ctl_perf_srcu_data'; kernel/rcu/rcuperf.o:(.discard+0x0): first de=
fined here

Caused by commit

  786a25497743 ("refperf: Add a test to measure performance of read-side sy=
nchronization")

=46rom srcutree.h:

 * Note that although DEFINE_STATIC_SRCU() hides the name from other
 * files, the per-CPU variable rules nevertheless require that the
 * chosen name be globally unique.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 May 2020 18:57:17 +1000
Subject: [PATCH] refperf: uniqify name

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/rcu/refperf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/refperf.c b/kernel/rcu/refperf.c
index 8c4a63257be9..47df72c492b3 100644
--- a/kernel/rcu/refperf.c
+++ b/kernel/rcu/refperf.c
@@ -133,8 +133,8 @@ static struct ref_perf_ops rcu_ops =3D {
=20
=20
 // Definitions for SRCU ref perf testing.
-DEFINE_STATIC_SRCU(srcu_ctl_perf);
-static struct srcu_struct *srcu_ctlp =3D &srcu_ctl_perf;
+DEFINE_STATIC_SRCU(ref_srcu_ctl_perf);
+static struct srcu_struct *srcu_ctlp =3D &ref_srcu_ctl_perf;
=20
 static void srcu_ref_perf_read_section(int nloops)
 {
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/3kczfIxexzGb0HAvK.fAKWI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Pfr0ACgkQAVBC80lX
0GzeoAf9HZs3neZGaTiBsG7YqSByje0kTcGIY4ABqQIzts4GrpSRKAPMJMjcgbhm
abwLJYbCJDwYBKWEeBRr+QINOvf5wGNseCuzPhQTl+eLcJl9TcRDu8VA3gDH3JKr
SnGy/S8qydZ0LpbMS912g4c86ruPsg3JB5/Y7HvvoGLxWFfu0EC8tPv460ZV+f6f
4s1NSOMB5Cz0fUYFwBFkXpMuiNq3XSy//hH/rrTUA4q6ypIFzHzRttSdKqjLMhO2
2dbohP/uDaFkco+zvnNmmgbvkavbfh2ZFW7QaRYaZ8XhEAEvRXlOB9xBJNrLdwv9
DSpRwJTwWpm87oivgmybYAjfr3beSg==
=D0aF
-----END PGP SIGNATURE-----

--Sig_/3kczfIxexzGb0HAvK.fAKWI--
