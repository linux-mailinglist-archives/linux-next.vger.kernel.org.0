Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDF11DDFAD
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 08:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgEVGL0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 02:11:26 -0400
Received: from ozlabs.org ([203.11.71.1]:41225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgEVGL0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 May 2020 02:11:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Sx2K5TbKz9sT2;
        Fri, 22 May 2020 16:11:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590127884;
        bh=POXp2o6ccuFtkUvHfg8zMlXB2EykfL/xG7UAhpphrQ4=;
        h=Date:From:To:Cc:Subject:From;
        b=T064W+kFio9k335X7JvBmhhhBuqU0qoINJ1D1SVfjTGgo21e8GjWtvbYLRwMB6T6H
         ulH9RAWXvUK198XW2pgmav0uUZYN9FaoxRZjl97sRRol/opAYE7/2lvvf0jT2OgAY6
         u0cevv1fali/Gc1DdY7Gzifd/WoK/f2TwEUQ4n9mwe9O9k3aRwv+yOqJNNMz6+RsJw
         Mrl+XLCTgFk0DQud3gPBQU0VvctI0HQNuuk8s1zYKx2Cep4jyRbj2chFYDHtbETM2q
         KMOGJlTLgHv3MqkWGa5Z+LPRl1kmNm9abz0z59DCi2kO4YkYxKlboKKEAk9xYtCL+E
         pXK8eGOxAvDxQ==
Date:   Fri, 22 May 2020 16:11:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20200522161119.75b21d82@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m=u+LavwKQpPyzYpRoe8lAc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m=u+LavwKQpPyzYpRoe8lAc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/Makefile

between commit:

  d08b9f0ca660 ("scs: Add support for Clang's Shadow Call Stack (SCS)")

from the arm64 tree and commit:

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

diff --cc kernel/Makefile
index c332eb9d4841,5d935b63f812..000000000000
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@@ -103,7 -107,7 +107,8 @@@ obj-$(CONFIG_TRACEPOINTS) +=3D trace
  obj-$(CONFIG_IRQ_WORK) +=3D irq_work.o
  obj-$(CONFIG_CPU_PM) +=3D cpu_pm.o
  obj-$(CONFIG_BPF) +=3D bpf/
 +obj-$(CONFIG_SHADOW_CALL_STACK) +=3D scs.o
+ obj-$(CONFIG_KCSAN) +=3D kcsan/
 =20
  obj-$(CONFIG_PERF_EVENTS) +=3D events/
 =20

--Sig_/m=u+LavwKQpPyzYpRoe8lAc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HbQcACgkQAVBC80lX
0GzkBAf/f4W5fKSszRsrTxmGZ3h/0t6sPmqRUjWi1tzBqqSohbY4hy+TQqySnLEG
ytTqhlpoFas6npqnS0pJnjLxqHP5KyuqcDJupiDfwTQPzs7gphtFB3wjO7jK9MTl
r5r+0rPg1+hSev9tHIKYl9ZDNVMNTnpFrgTOqGQ+jlm6EjyiouZYdGIy8Sr19iwe
R3UoFyc5ZonbX60aObEKmQCaHEaYBwMV2lTYqGNRLXQUfIylk75YQtpEuNqvQgH7
fM1ShK6zOX3uJDPHtDMSgTNuLDHK/09/k1vKUG60uRrrUc2YZUOizlzMqciyvgQP
m0oTIlCJKCLw3J7WOUcximq1WHpfZg==
=c87j
-----END PGP SIGNATURE-----

--Sig_/m=u+LavwKQpPyzYpRoe8lAc--
