Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2861D9C21
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 18:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbgESQM5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 12:12:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41257 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728953AbgESQM4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 May 2020 12:12:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49RLWm3bKVz9sT4;
        Wed, 20 May 2020 02:12:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589904774;
        bh=0Yoi3CqZc1WFUBb8Tmjse0L1YOY34nPIrRmd1lGuNrA=;
        h=Date:From:To:Cc:Subject:From;
        b=I1SXffh1QO1XPbUZXKoFW2dvr8E1vgKj0TUFJMv7nrR6Obgw/c75HrjPXwSyuG20Z
         YO8G95nkrFIXgK9CZyz9GhYYGKzX0eKnGRvrQhc2ho9mwyMqk52iwJOJCAJZxzAVcT
         uHdTAaoIN/CWISnF0YNk4r4opnLkznVN6PDpe2sYN4Y3yuXqrpqqcSlUJ/odFklG81
         Ppdl2+Hg5xRHwlZIze/xovO3EfM4u/4qeuPnA6Q6xM6/7hfJ8N+6a84/t3MiA4Ju8y
         RTw1L+aNh48KvoJjLt8asINCJrRPJe7B3gzZlMMoVHOh6ywNjtkrmdu2N2TfLYGchp
         V0hoL6/5NVzZA==
Date:   Wed, 20 May 2020 02:12:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: linux-next: manual merge of the akpm-current tree with the rcu tree
Message-ID: <20200520021250.412e1d11@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WdWOqOb/FrjC87P__422RJN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WdWOqOb/FrjC87P__422RJN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/sched.h

between commit:

  7df6cae06c3b ("x86/mce: Send #MC singal from task work")

from the rcu tree and commit:

  c0218a9a3a60 ("fs/buffer.c: add debug print for __getblk_gfp() stall prob=
lem")

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

diff --cc include/linux/sched.h
index 33cb5f822054,98060427c53f..000000000000
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@@ -1301,12 -1293,13 +1305,19 @@@ struct task_struct=20
  	unsigned long			prev_lowest_stack;
  #endif
 =20
 +#ifdef CONFIG_X86_MCE
 +	u64				mce_addr;
 +	u64				mce_status;
 +	struct callback_head		mce_kill_me;
 +#endif
 +
+ #ifdef CONFIG_DEBUG_AID_FOR_SYZBOT
+ 	unsigned long			getblk_stamp;
+ 	unsigned int			getblk_executed;
+ 	unsigned int			getblk_bh_count;
+ 	unsigned long			getblk_bh_state;
+ #endif
+=20
  	/*
  	 * New fields for task_struct should be added above here, so that
  	 * they are included in the randomized portion of task_struct.

--Sig_/WdWOqOb/FrjC87P__422RJN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7EBYIACgkQAVBC80lX
0GyLWQf/b1mdknl35g38oD5m1XOQTA716G/yR0lgslZ+ATeBPtD64HelUB9rzAJY
Cs6Q/vhA4y0J+O3KVjvr7GVTdMp3bkjPZIAMIvM3jr/h2suo31mIuevpTsXjvwW1
EQxMXNIZjXwjX5AqEMqkIx7LAYcCTPvvUQx8NjQU3i32891jxMRC5tT2foiOl2O+
cu30FcGsBSj1KBHLtzRNhMCR0D8TxvF1n5s7sqb/59hgPPvFmKW7lguOIATm63MK
abvT88llLs6Xj8i5uBwSTQ9CvfJUUjP/sIS8YPPP2YUOz7BRlFPqBI77F2DRnC3w
BGyMCUIVoYUXkspeDIs95N2TmvUUug==
=gh9N
-----END PGP SIGNATURE-----

--Sig_/WdWOqOb/FrjC87P__422RJN--
