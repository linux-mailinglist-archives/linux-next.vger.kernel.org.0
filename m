Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E06A2327E0
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 01:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgG2XId (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 19:08:33 -0400
Received: from ozlabs.org ([203.11.71.1]:42177 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727982AbgG2XId (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 19:08:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BH8NZ5hK0z9sRX;
        Thu, 30 Jul 2020 09:08:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596064111;
        bh=3TIZptqaLur6ByBwZ0vZMzoVPzvhFjSMOQtX0tNgRuI=;
        h=Date:From:To:Cc:Subject:From;
        b=mNpaoTHZm6BwcNug8KK4vdHWUlOtHxZfMe56+UNIVYkCAhX8eY9iytzyWz3g+yD3n
         HZhaBKx7n7vfSuPBK58XRTqISAovPAabaWz+g0dR5/1YxCH3e+cA+R1FndwmXG/yr2
         p6LQxWaHj5Zqh7IOOaOhSU8TI9phLbPh8sJ1+7G8f3fQ1cVvaRSf448duB4hwUqKZT
         9LoUu/Al5Y/1q/hV6539WP7maatfIj544KwEBNrCT8dECXBfq34lVNar3BpF8PmtI4
         6JJNLCnpm2dByLetvD4Q13sFWmHn8CoY9UkLI8oCHlX7K6lx6RBoZo68oFit+O32yL
         ayKXTlIcK2ZUw==
Date:   Thu, 30 Jul 2020 09:08:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20200730090828.2349e159@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9YxQlK5X1J.WRE0K0KyhhdY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9YxQlK5X1J.WRE0K0KyhhdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/asm-generic/percpu.h:7,
                 from arch/x86/include/asm/percpu.h:556,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/seqlock.h:36,
                 from include/linux/time.h:6,
                 from include/linux/stat.h:19,
                 from include/linux/module.h:13,
                 from arch/x86/crypto/glue_helper.c:13:
include/linux/random.h:123:24: error: variable 'net_rand_state' with 'laten=
t_entropy' attribute must not be local
  123 | DECLARE_PER_CPU(struct rnd_state, net_rand_state) __latent_entropy;
      |                        ^~~~~~~~~
include/linux/percpu-defs.h:88:38: note: in definition of macro 'DECLARE_PE=
R_CPU_SECTION'
   88 |  extern __PCPU_ATTRS(sec) __typeof__(type) name
      |                                      ^~~~
include/linux/random.h:123:1: note: in expansion of macro 'DECLARE_PER_CPU'
  123 | DECLARE_PER_CPU(struct rnd_state, net_rand_state) __latent_entropy;
      | ^~~~~~~~~~~~~~~

Caused by commit

  f227e3ec3b5c ("random32: update the net random state on interrupt and act=
ivity")

I have reverted that commit for today.

In case it matters:

$ x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 9.3.0-13) 9.3.0

--=20
Cheers,
Stephen Rothwell

--Sig_/9YxQlK5X1J.WRE0K0KyhhdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iAWwACgkQAVBC80lX
0GziuAgAjAXsBgi4iq9EMuta/vAArg+cDrJL6d6Q1Qn1t3nEvEi8IDRBqWmj39eI
Y5aHZGp0imuXDK+pCVHjZWYlIM1zxoUwIEmumvzjmIZ1y64Hr2aG54OTtT3x1UIm
3WqOfqK/8SZuUDEalQRI2WsFoCZzY04v2ANgzuAqWKCHpusLC4paZ24e4z/E5QhQ
FDzc0dt8qagw7Lo2Jep45IDyBOyfek99Y0I/BeHAQIaPFhHAM5i4Z2EI0X6dU93c
AuOsRJ3cAcR8C4S/co8IIH72vu5xm0762W4CAgT5PyLsNCLXegwP1eSeJ7kFahfE
V7HgRw47tVWU+E3Dv2ca381aDX3kag==
=mm0d
-----END PGP SIGNATURE-----

--Sig_/9YxQlK5X1J.WRE0K0KyhhdY--
