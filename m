Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABB71513A3
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2020 01:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgBDA0E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Feb 2020 19:26:04 -0500
Received: from ozlabs.org ([203.11.71.1]:47245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgBDA0E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Feb 2020 19:26:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48BQTh6513z9sVq;
        Tue,  4 Feb 2020 11:26:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580775961;
        bh=IzeSB1JA+5+yWUhdAoaDKlStkEb4KtlAKroT6KOh75k=;
        h=Date:From:To:Cc:Subject:From;
        b=o5qaJ+vMM312813ssE2+dDh2yC0BlXuxGklvhDwqFI2ZUK9B2yokVbGNich+TOfOF
         sAejUy0yjn5JuVJXch4cNGWzVP2yApBWJWgPWXqoA7QhPyISUrt8Qmo/Cz8qTEKTxz
         cu7DEnpE6gIcIebkuKOa9tEflnkW/qI2qYQ30kQVuHEXnki60cWOihgEJ+Yf5diABN
         t6fzfARVcdI+a5WPD8psk6jM+pYCRxCbSuC16vrXupznayFcISDiQKg9broVlNEuu+
         cmstvHMX76Kz2sYnKUyEmDpCmpsBv5osrd2Gt6YHwndvpgwbnEQOZeBcfJ+4vGQxX0
         Cm+pTHdvBPzGQ==
Date:   Tue, 4 Feb 2020 11:25:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200204112555.0f1b1490@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b/Aj3Hdi.3EGAh74frIhOng";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b/Aj3Hdi.3EGAh74frIhOng
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/eventfd.h:15,
                 from drivers/vhost/vhost.c:13:
include/linux/percpu-defs.h:50:34: error: 'PER_CPU_BASE_SECTION' undeclared=
 here (not in a function); did you mean 'PER_CPU_FIRST_SECTION'?
   50 |  __percpu __attribute__((section(PER_CPU_BASE_SECTION sec))) \
      |                                  ^~~~~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:101:9: note: in expansion of macro '__PCPU_ATTR=
S'
  101 |  extern __PCPU_ATTRS(sec) __typeof__(type) name
      |         ^~~~~~~~~~~~
include/linux/percpu-defs.h:112:2: note: in expansion of macro 'DECLARE_PER=
_CPU_SECTION'
  112 |  DECLARE_PER_CPU_SECTION(type, name, "")
      |  ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/eventfd.h:44:1: note: in expansion of macro 'DECLARE_PER_CPU'
   44 | DECLARE_PER_CPU(int, eventfd_wake_count);
      | ^~~~~~~~~~~~~~~
include/linux/percpu-defs.h:112:38: error: expected ')' before string const=
ant
  112 |  DECLARE_PER_CPU_SECTION(type, name, "")
      |                                      ^~
include/linux/percpu-defs.h:50:55: note: in definition of macro '__PCPU_ATT=
RS'
   50 |  __percpu __attribute__((section(PER_CPU_BASE_SECTION sec))) \
      |                                                       ^~~
include/linux/percpu-defs.h:112:2: note: in expansion of macro 'DECLARE_PER=
_CPU_SECTION'
  112 |  DECLARE_PER_CPU_SECTION(type, name, "")
      |  ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/eventfd.h:44:1: note: in expansion of macro 'DECLARE_PER_CPU'
   44 | DECLARE_PER_CPU(int, eventfd_wake_count);
      | ^~~~~~~~~~~~~~~
include/linux/percpu-defs.h:50:59: error: expected identifier or '(' before=
 ')' token
   50 |  __percpu __attribute__((section(PER_CPU_BASE_SECTION sec))) \
      |                                                           ^
include/linux/percpu-defs.h:101:9: note: in expansion of macro '__PCPU_ATTR=
S'
  101 |  extern __PCPU_ATTRS(sec) __typeof__(type) name
      |         ^~~~~~~~~~~~
include/linux/percpu-defs.h:112:2: note: in expansion of macro 'DECLARE_PER=
_CPU_SECTION'
  112 |  DECLARE_PER_CPU_SECTION(type, name, "")
      |  ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/eventfd.h:44:1: note: in expansion of macro 'DECLARE_PER_CPU'
   44 | DECLARE_PER_CPU(int, eventfd_wake_count);
      | ^~~~~~~~~~~~~~~
include/linux/eventfd.h: In function 'eventfd_signal_count':
include/linux/eventfd.h:48:23: error: 'eventfd_wake_count' undeclared (firs=
t use in this function); did you mean 'eventfd_signal_count'?
   48 |  return this_cpu_read(eventfd_wake_count);
      |                       ^~~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:319:9: note: in definition of macro '__pcpu_siz=
e_call_return'
  319 |  typeof(variable) pscr_ret__;     \
      |         ^~~~~~~~
include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
   48 |  return this_cpu_read(eventfd_wake_count);
      |         ^~~~~~~~~~~~~
include/linux/eventfd.h:48:23: note: each undeclared identifier is reported=
 only once for each function it appears in
   48 |  return this_cpu_read(eventfd_wake_count);
      |                       ^~~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:319:9: note: in definition of macro '__pcpu_siz=
e_call_return'
  319 |  typeof(variable) pscr_ret__;     \
      |         ^~~~~~~~
include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
   48 |  return this_cpu_read(eventfd_wake_count);
      |         ^~~~~~~~~~~~~
include/linux/percpu-defs.h:508:53: error: implicit declaration of function=
 'this_cpu_read_1'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-funct=
ion-declaration]
  508 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_,=
 pcp)
      |                                                     ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:322:23: note: in definition of macro '__pcpu_si=
ze_call_return'
  322 |  case 1: pscr_ret__ =3D stem##1(variable); break;   \
      |                       ^~~~
include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
   48 |  return this_cpu_read(eventfd_wake_count);
      |         ^~~~~~~~~~~~~
include/linux/percpu-defs.h:508:53: error: implicit declaration of function=
 'this_cpu_read_2'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-funct=
ion-declaration]
  508 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_,=
 pcp)
      |                                                     ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:323:23: note: in definition of macro '__pcpu_si=
ze_call_return'
  323 |  case 2: pscr_ret__ =3D stem##2(variable); break;   \
      |                       ^~~~
include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
   48 |  return this_cpu_read(eventfd_wake_count);
      |         ^~~~~~~~~~~~~
include/linux/percpu-defs.h:508:53: error: implicit declaration of function=
 'this_cpu_read_4'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-funct=
ion-declaration]
  508 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_,=
 pcp)
      |                                                     ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:324:23: note: in definition of macro '__pcpu_si=
ze_call_return'
  324 |  case 4: pscr_ret__ =3D stem##4(variable); break;   \
      |                       ^~~~
include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
   48 |  return this_cpu_read(eventfd_wake_count);
      |         ^~~~~~~~~~~~~
include/linux/percpu-defs.h:508:53: error: implicit declaration of function=
 'this_cpu_read_8'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-funct=
ion-declaration]
  508 | #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_,=
 pcp)
      |                                                     ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:325:23: note: in definition of macro '__pcpu_si=
ze_call_return'
  325 |  case 8: pscr_ret__ =3D stem##8(variable); break;   \
      |                       ^~~~
include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
   48 |  return this_cpu_read(eventfd_wake_count);
      |         ^~~~~~~~~~~~~

Caused by commit

  230665a4f25c ("eventfd: track eventfd_signal() recursion depth")

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 4 Feb 2020 11:20:12 +1100
Subject: [PATCH] eventfd: include percpu.h instead of percpu-defs.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/eventfd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/eventfd.h b/include/linux/eventfd.h
index 02e794816c12..224e8334042b 100644
--- a/include/linux/eventfd.h
+++ b/include/linux/eventfd.h
@@ -12,7 +12,7 @@
 #include <linux/fcntl.h>
 #include <linux/wait.h>
 #include <linux/err.h>
-#include <linux/percpu-defs.h>
+#include <linux/percpu.h>
=20
 /*
  * CAREFUL: Check include/uapi/asm-generic/fcntl.h when defining
--=20
2.24.1

--=20
Cheers,
Stephen Rothwell

--Sig_/b/Aj3Hdi.3EGAh74frIhOng
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl44uhMACgkQAVBC80lX
0GwzdAf/eU4AUYpoXQ41Sld5p8MfgaFsAu80RPyfs4OHZVDYpOmAuphYaxIekbuh
3BZs2jCGIZheOWa99f+pWme+ioNojbKwjdGcG7n0kzYVW3aFNYnEqWj23gsU0KMP
KEXXZqTH789vQq3Kn4laLAbH0iVkccjoIqaePidXs+AZtH7wdNMHriIQaYwVIgeq
zyVQeJ3lNB5CmbHE6FR7UsB71HF7v2QesoOjYzplsoGvUD4D2IF/4Ch2PvIjjpn1
rXcs2GDf2WEkQVEU0fUUbTemdfs4XYout4FMuiY7XTvsUkEeLg/1YpqFv04tzxhD
wfK4thaaXvYxDe3PqeP2K0f21gDVfA==
=/ysx
-----END PGP SIGNATURE-----

--Sig_/b/Aj3Hdi.3EGAh74frIhOng--
