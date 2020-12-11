Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A802D70CC
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 08:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403874AbgLKH0L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Dec 2020 02:26:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41415 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391090AbgLKHZv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Dec 2020 02:25:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Csj3Y20Mnz9sSs;
        Fri, 11 Dec 2020 18:24:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607671503;
        bh=8skycGbsrfc5wfL1EouoHeVOQSIruhc7LAagb6lYQmw=;
        h=Date:From:To:Cc:Subject:From;
        b=cnYgzaZgt0umFJolwh55s6uD+rcltZr4ifiP+hryARjRxKDy57SLB0NS7jJonT5zn
         8EJFfHM9K3/BcqDTccj+IP0EP/i0DDiMEp0YScE7CfeAoHJGE1i8F0gk4vASnv0LeH
         xUurTUS+39HNWBa0ZwIfQQqMhxr13N8r/FhapPBj5nm5qBiWMLhlhYggk6uGOOGSix
         raA2JST6qgui1LRDvWp+vd7ZgxjctNNudHsNPbGUPf7gJCRQwCCNvesL+KjcigiU1H
         fKFONmQAyV2WtxKOlZhgCHPqeCk+dyFebqnnWer46jnHz2Q/E3t/0HvhGDJuqLb2+I
         iRgv7sTDqIDaA==
Date:   Fri, 11 Dec 2020 18:24:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the userns tree with the tip tree
Message-ID: <20201211182453.2522566c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wm1YiRztek5/GjFixXqx0ej";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wm1YiRztek5/GjFixXqx0ej
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  kernel/events/core.c

between commit:

  78af4dc949da ("perf: Break deadlock involving exec_update_mutex")

from the tip tree and commit:

  f7cfd871ae0c ("exec: Transform exec_update_mutex into a rw_semaphore")

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

diff --cc kernel/events/core.c
index 19ae6c931c52,55b2330b556c..000000000000
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@@ -11958,24 -11864,6 +11958,24 @@@ SYSCALL_DEFINE5(perf_event_open
  		goto err_context;
  	}
 =20
 +	if (task) {
- 		err =3D mutex_lock_interruptible(&task->signal->exec_update_mutex);
++		err =3D down_read_interruptible(&task->signal->exec_update_lock);
 +		if (err)
 +			goto err_file;
 +
 +		/*
 +		 * Preserve ptrace permission check for backwards compatibility.
 +		 *
- 		 * We must hold exec_update_mutex across this and any potential
++		 * We must hold exec_update_lock across this and any potential
 +		 * perf_install_in_context() call for this new event to
 +		 * serialize against exec() altering our credentials (and the
 +		 * perf_event_exit_task() that could imply).
 +		 */
 +		err =3D -EACCES;
 +		if (!perfmon_capable() && !ptrace_may_access(task, PTRACE_MODE_READ_REA=
LCREDS))
 +			goto err_cred;
 +	}
 +
  	if (move_group) {
  		gctx =3D __perf_event_ctx_lock_double(group_leader, ctx);
 =20
@@@ -12151,10 -12039,7 +12151,10 @@@ err_locked
  	if (move_group)
  		perf_event_ctx_unlock(group_leader, gctx);
  	mutex_unlock(&ctx->mutex);
 -/* err_file: */
 +err_cred:
 +	if (task)
- 		mutex_unlock(&task->signal->exec_update_mutex);
++		up_read(&task->signal->exec_update_lock);
 +err_file:
  	fput(event_file);
  err_context:
  	perf_unpin_context(ctx);

--Sig_/Wm1YiRztek5/GjFixXqx0ej
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/THsUACgkQAVBC80lX
0GzntQf/SLt5qMBNNPSZ3K8+t1ceSSjjKx8mystdq5qoQHTJ7kYYZgAHMkE7mdoe
QJV5Cp1L4xoayj0wPUTlDzCb3wikogJ7fOkIlAQ1Wsb8zoaC0vG2F9y6mPGsI0Ws
5xewMWGmkpoTN6uaVMge9XEJdq5B6Sz71IVWxgKQ4Y78NtSgGlSoH0TtFCIfpuU1
P+e+394spWPBg1yOiyZeTCgf3QzG9wlTKyz9PH3hIthvU9145/Cupu66bHp1xsuo
6f+YmsjUCY86pMjOflHzXEN3ywyGB8T7ZN+INmKoaPOfwWeiMcD4wgxdsv7A/+5Z
7OHXRA+rPCELK487sXGtquj5HwW5UA==
=ajBt
-----END PGP SIGNATURE-----

--Sig_/Wm1YiRztek5/GjFixXqx0ej--
