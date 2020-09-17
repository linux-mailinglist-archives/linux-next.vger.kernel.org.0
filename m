Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF51426D2F0
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 07:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgIQFTO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 01:19:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41599 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgIQFTO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 01:19:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsQHg3SN9z9sS8;
        Thu, 17 Sep 2020 15:19:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600319951;
        bh=8x6My4yLymL23hkhEsIHQUGZQoyJSvjsNsvTSj03kIw=;
        h=Date:From:To:Cc:Subject:From;
        b=qLtoO//7IC9Z/8+Oxt81ogveZDHKPWgSDwPsPFijew/I9sGpn6KoZFl3OF59W7NAA
         hYbHU4PMaSJubsLNSyleRnD00/tFkIVxPACauBLeS0WgM4zphk8XpBf5z/wwXAzL4q
         Bi/GoqgcpmK7u+2+Al+WFIMKRslZeaY9DeUOAva30j8raBcpwPF7Zz5xyDbGQcmGmc
         nzSmZyPEUvSJ8aUEIE7R+grJBOoH6u5yPZZhibVM6rCA23U7FNwKlqyG33IObFpkyn
         wM3JyChOMI4WucXUiIsCaeFqNUhGi85YY0v7pBFJlrGFRPfmEPwXtV35fqXeNZXUOQ
         t1JUdbJIFbEow==
Date:   Thu, 17 Sep 2020 15:19:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20200917151909.01fa6684@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ugjVfSCQeVwOcREAaml3/2R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ugjVfSCQeVwOcREAaml3/2R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from kernel/rcu/update.c:578:
kernel/rcu/tasks.h:601:20: error: static declaration of 'show_rcu_tasks_cla=
ssic_gp_kthread' follows non-static declaration
  601 | static inline void show_rcu_tasks_classic_gp_kthread(void) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from kernel/rcu/update.c:49:
kernel/rcu/rcu.h:537:6: note: previous declaration of 'show_rcu_tasks_class=
ic_gp_kthread' was here
  537 | void show_rcu_tasks_classic_gp_kthread(void);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  675d3ca52626 ("rcutorture: Make grace-period kthread report match RCU fla=
vor being tested")

I have used the rcu tree from next-20200916 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ugjVfSCQeVwOcREAaml3/2R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9i8c0ACgkQAVBC80lX
0GzynQf7BMwrVYierw5HXRqoGbXZpWWbOsG1vSEXbhyYunuvAn7oC7empBoh4TAb
oQo+6hxJQPolXaoEU0wOIz0BWlWkN4PTjO5UXapXO18iXiDLKu0KzkaVYmGUBE+f
lYPRx8mfFo7pt1ap1mSSXUizM4LjQe80jd59I0f+5cir7pPJJj70uyPLUpys6FXI
KPyXj0StpahULiqI3eIxIdxYVNt/cIPbSPPv018yZmI3XbatGm2V9JuV/FwYnBIW
dN5N6fOKQDBYszp3jfRYYbOxTw37xdd8aAzspmJyhOt0HznvfRYbwpkJ1k3RcLUA
3L55E15E0u1raFxUyslr4tF7GGF+6A==
=VncY
-----END PGP SIGNATURE-----

--Sig_/ugjVfSCQeVwOcREAaml3/2R--
