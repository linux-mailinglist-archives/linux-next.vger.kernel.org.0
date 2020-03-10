Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E104D17EFBF
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 05:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgCJErA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 00:47:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56465 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgCJEq7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 00:46:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48c2cb63Dkz9sRN;
        Tue, 10 Mar 2020 15:46:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583815616;
        bh=uZVru08ZcwV3CJvUrWNv3wJ5KlB6+idQYNsw8XOiMX8=;
        h=Date:From:To:Cc:Subject:From;
        b=j3E9quZB6a/4mO6ssCf/I2vy1BEeYj6G5ISbUtnnguqcmO1/+FI9JbFFZRuL+Zmqd
         zVfhhO6vos9LcHgTO6DGB7v5ZaniYQXyt+YirFzYuxpfXgcegkAXxu0A08s6NoZVdH
         ejGtthWxk/cT1ylD2MOwdlmu3Rv3eliCOT4nt6SSJ3zL12s6ALpx0uPugLU2cr/pCG
         SQhf7yZTSMfr3p/TLXzPV96FSPBQQJ8f1zDcRg1XVC8HNIeOmhIeLK+Hc690bDUSWE
         VSjGVQ6j2j/7/yqEfEzlX2xGjUz4BDOCaUkRugrteNlRjNhP6lnShXhY+5YzVant8y
         phXjpUCcN7Auw==
Date:   Tue, 10 Mar 2020 15:46:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Christian Brauner <christian@brauner.io>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Corey Minyard <cminyard@mvista.com>
Subject: linux-next: manual merge of the userns tree with the pidfd-fixes
 tree
Message-ID: <20200310154651.27cf84f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f0rP32LNCnRWHOpHRwg.9UW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f0rP32LNCnRWHOpHRwg.9UW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  kernel/pid.c

between commits:

  b26ebfe12f34 ("pid: Fix error return value in some cases")
  8deb24dcb89c ("pid: make ENOMEM return value more obvious")

from the pidfd-fixes tree and commit:

  69879c01a0c3 ("proc: Remove the now unnecessary internal mount of proc")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/pid.c
index be43122eb876,60820e72634c..000000000000
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@@ -247,21 -244,6 +244,16 @@@ struct pid *alloc_pid(struct pid_namesp
  		tmp =3D tmp->parent;
  	}
 =20
 +	/*
 +	 * ENOMEM is not the most obvious choice especially for the case
 +	 * where the child subreaper has already exited and the pid
 +	 * namespace denies the creation of any new processes. But ENOMEM
 +	 * is what we have exposed to userspace for a long time and it is
 +	 * documented behavior for pid namespaces. So we can't easily
 +	 * change it even if there were an error code better suited.
 +	 */
 +	retval =3D -ENOMEM;
 +
- 	if (unlikely(is_child_reaper(pid))) {
- 		if (pid_ns_prepare_proc(ns))
- 			goto out_free;
- 	}
-=20
  	get_pid_ns(ns);
  	refcount_set(&pid->count, 1);
  	for (type =3D 0; type < PIDTYPE_MAX; ++type)

--Sig_/f0rP32LNCnRWHOpHRwg.9UW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5nG7sACgkQAVBC80lX
0GyY2Qf/QkFdktb8LvpWJPTtCQA0ov3TmxgllsLj8CsccNlidAj4QPHQ5ywWXZ5g
fQbXiT4eV29TXyTxf5cGR70Fw6lMkjQYpRyM29Ns6qcvKb9A96I7FNAe5I3sb10T
j8Z1ZCCVCLa+ii8tyGEmUvefHL/3E+JO5PpvoJ9YWTasPTmdSq9Fw1xMp4wjbcc5
Dt4HV4k27k+6D5c76Tw5Eo3rxEqHe1cTlAslRjMrLxiREPjsgQx4K/BDkpk5LmZd
wmTig00SnBadnDsJcOC1P3xbd7FZjmED9v/Cz0+JuRcII9+IMaz+3wpcfofog3Ji
5CCpZzTZt9DbruTmdBUCFu7vXrwjFg==
=YKmT
-----END PGP SIGNATURE-----

--Sig_/f0rP32LNCnRWHOpHRwg.9UW--
