Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5271E429CB7
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 06:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhJLEue (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 00:50:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55433 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbhJLEud (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 00:50:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HT38F4bP5z4xb9;
        Tue, 12 Oct 2021 15:48:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634014111;
        bh=FJNzj0iQa+QNUJ+e+1TYvef3simjmmBQ7rllRp9fYRc=;
        h=Date:From:To:Cc:Subject:From;
        b=qngT4LJoE3IZjN6xmikS9obwg9Jh2apsGq+j8Th1NFmsGS5gXJmqBswLfu+g2c7yR
         MXegVhiJVGF5MQgk3/s2l3LKwfHt+GEn15CwVUw/zZbTSiuZ32Z7Gh+r0aC+htp/Zu
         DG1NKjCHjpc4etmSb3S2nFb9r6Ut+4oYQlSw3+G39iBXMaWweU1BGB/XGgEo6q/A5G
         pKkvRcFoIZamoT0c8HLqHCJ+RwESXuGxh0Ocez0FYYunSB0Z6L7wm89tkhftVnSK/p
         eo9E7d/jr0BjWmfBBoEyG8XKUCjdPHwe6Sa2776oq0WKqDQhoyJ4clJ+8NYz736isB
         a/h2cyTVpauqg==
Date:   Tue, 12 Oct 2021 15:48:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20211012154828.312f870f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kb.nPBRY5QO_NX+JtXLlX3y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kb.nPBRY5QO_NX+JtXLlX3y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tasks.h

between commit:

  9b3c4ab3045e ("sched,rcu: Rework try_invoke_on_locked_down_task()")

from the tip tree and commit:

  18f08e758f34 ("rcu-tasks: Add trc_inspect_reader() checks for exiting cri=
tical section")

from the rcu tree.

I fixed it up (I hope - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tasks.h
index 171bc848e8e3,e4a32db9f712..000000000000
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@@ -928,10 -919,10 +919,10 @@@ reset_ipi
  }
 =20
  /* Callback function for scheduler to check locked-down task.  */
 -static bool trc_inspect_reader(struct task_struct *t, void *arg)
 +static int trc_inspect_reader(struct task_struct *t, void *arg)
  {
  	int cpu =3D task_cpu(t);
- 	bool in_qs =3D false;
+ 	int nesting;
  	bool ofl =3D cpu_is_offline(cpu);
 =20
  	if (task_curr(t)) {
@@@ -951,18 -942,18 +942,18 @@@
  		n_heavy_reader_updates++;
  		if (ofl)
  			n_heavy_reader_ofl_updates++;
- 		in_qs =3D true;
+ 		nesting =3D 0;
  	} else {
  		// The task is not running, so C-language access is safe.
- 		in_qs =3D likely(!t->trc_reader_nesting);
+ 		nesting =3D t->trc_reader_nesting;
  	}
 =20
- 	// Mark as checked so that the grace-period kthread will
- 	// remove it from the holdout list.
- 	t->trc_reader_checked =3D true;
-=20
- 	if (in_qs)
- 		return 0;  // Already in quiescent state, done!!!
+ 	// If not exiting a read-side critical section, mark as checked
+ 	// so that the grace-period kthread will remove it from the
+ 	// holdout list.
+ 	t->trc_reader_checked =3D nesting >=3D 0;
+ 	if (nesting <=3D 0)
 -		return !nesting;  // If in QS, done, otherwise try again later.
++		return (!nesting) ? 0 : -EINVAL;  // If in QS, done, otherwise try agai=
n later.
 =20
  	// The task is in a read-side critical section, so set up its
  	// state so that it will awaken the grace-period kthread upon exit

--Sig_/Kb.nPBRY5QO_NX+JtXLlX3y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFlE5wACgkQAVBC80lX
0Gxl5gf8Ca1lWACFU7u842u1TQLwdNTyy5HhXOKhl97fnGDr42+SqdcBpyvvmWFC
ZDjxPOednIagRBPYf176EHx6ugqGC+vAq1YUK58GLxAaNhKoeltAxYhZZPHi4f6S
2dONeS51ic+m6swXyyWm700k26djbYqQCgdwjkTJydlc4W+e0HpRYfNEDhdlxROj
0iY1+Wu3cYiWKU8/aofpOj6p5MV4hTkAjB4qQrvg0OzUn5qPwvWACwX0BOjqBmFN
9dUNl7LKXP8BoD4lmdo5orxdKThzgfQh7Us46vVhs2zRnxAgqjp0ePiW/8xT6KY2
9c5pDm7gLZ2Ws/8C2Nrbyvos8v8HRA==
=2qKt
-----END PGP SIGNATURE-----

--Sig_/Kb.nPBRY5QO_NX+JtXLlX3y--
