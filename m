Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6DA3B188D
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 13:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhFWLPE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 07:15:04 -0400
Received: from ozlabs.org ([203.11.71.1]:33723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230031AbhFWLPD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 07:15:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G90wr0nFlz9sWc;
        Wed, 23 Jun 2021 21:12:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624446764;
        bh=IkVYzZy1Eixb0a/1pC8cijkffVYK6r9jjj+DZ1Ks3mw=;
        h=Date:From:To:Cc:Subject:From;
        b=AQzd1brT7PccId51QSVbUab181j686pH4KMgfqO36ecv7hP+twQ0q5QJQzOwzXOIF
         zdls+pVgJ0oLkvWToxRP4LXj5t4m4X2twqqZTnMHDMSJC6kgWNMDDG2IpIld4XCf+S
         IGk3ypZvy9cOuAW/AuDmVPGLfP3nOQMXudOZhUIS6x74BZ40l8nTJ0WqVkUT5STl6p
         YXoBg8wlQ1adEMTpC9CKKj0sqhnVGr3hSqKbshQWgjAvSEniUHvJhdTy6/tHgc0NXr
         4wMoHfFePioiBUAGz2/wy/1eSiGBhrEq3ed1nyZILwSTBJ0OmrOTKP1iH4Cby2r7rQ
         0+I5zloxFeoBQ==
Date:   Wed, 23 Jun 2021 21:12:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>
Cc:     Alexander Potapenko <glider@google.com>,
        John Ogness <john.ogness@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the printk
 tree
Message-ID: <20210623211225.77170b73@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rqh.RPoprM7=toxfUZkXLhL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Rqh.RPoprM7=toxfUZkXLhL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/dump_stack.c

between commit:

  766c268bc6d3 ("lib/dump_stack: move cpu lock to printk.c")

from the printk tree and commit:

  250da8183544 ("printk: introduce dump_stack_lvl()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/dump_stack.c
index 5ebf4375fa8c,586e3f2c6a15..000000000000
--- a/lib/dump_stack.c
+++ b/lib/dump_stack.c
@@@ -84,16 -84,56 +84,22 @@@ static void __dump_stack(const char *lo
   *
   * Architectures can override this implementation by implementing its own.
   */
- asmlinkage __visible void dump_stack(void)
 -#ifdef CONFIG_SMP
 -static atomic_t dump_lock =3D ATOMIC_INIT(-1);
 -
+ asmlinkage __visible void dump_stack_lvl(const char *log_lvl)
  {
  	unsigned long flags;
 -	int was_locked;
 -	int old;
 -	int cpu;
 =20
  	/*
  	 * Permit this cpu to perform nested stack dumps while serialising
  	 * against other CPUs
  	 */
 -retry:
 -	local_irq_save(flags);
 -	cpu =3D smp_processor_id();
 -	old =3D atomic_cmpxchg(&dump_lock, -1, cpu);
 -	if (old =3D=3D -1) {
 -		was_locked =3D 0;
 -	} else if (old =3D=3D cpu) {
 -		was_locked =3D 1;
 -	} else {
 -		local_irq_restore(flags);
 -		/*
 -		 * Wait for the lock to release before jumping to
 -		 * atomic_cmpxchg() in order to mitigate the thundering herd
 -		 * problem.
 -		 */
 -		do { cpu_relax(); } while (atomic_read(&dump_lock) !=3D -1);
 -		goto retry;
 -	}
 -
 -	__dump_stack(log_lvl);
 -
 -	if (!was_locked)
 -		atomic_set(&dump_lock, -1);
 -
 -	local_irq_restore(flags);
 -}
 -#else
 -asmlinkage __visible void dump_stack_lvl(const char *log_lvl)
 -{
 +	printk_cpu_lock_irqsave(flags);
- 	__dump_stack();
+ 	__dump_stack(log_lvl);
 +	printk_cpu_unlock_irqrestore(flags);
  }
 -#endif
+ EXPORT_SYMBOL(dump_stack_lvl);
+=20
+ asmlinkage __visible void dump_stack(void)
+ {
+ 	dump_stack_lvl(KERN_DEFAULT);
+ }
  EXPORT_SYMBOL(dump_stack);

--Sig_/Rqh.RPoprM7=toxfUZkXLhL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDTFyQACgkQAVBC80lX
0Gw0Awf/W7tzBNfgFFxa4XzoIrH5RCVemFC+koj9SucTH+cBF7UuHxwGJp1QOZBI
POZfbeuPOqnuY0q6gzvihMP2pzSc7mzV3CQ6S27Kx91o4z2ivE2EhR769SoxEqqT
yDANH189V3vyz+NXVWTAV54WnKh03bDSK+EyC4lq6/EJFq2ns2bCFw3PDwm8rcM0
odeL8FlHvzwvjvuCjqpR5E5yXsDb4+y1NncEOPuCigwL/Yvh7c17SR+bMk1efbGn
TyjkzL5LbQTNAfsrEje6RAhC60jmUvpZ5Lm4U5rEoqYbU2vQy+M9u45HH0ESrzjG
utwt1Uk/GRvnKsv0dUqjyDPNNDLvhw==
=Ck8K
-----END PGP SIGNATURE-----

--Sig_/Rqh.RPoprM7=toxfUZkXLhL--
