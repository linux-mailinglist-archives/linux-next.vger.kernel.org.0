Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40143B1343
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 07:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFWFft (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 01:35:49 -0400
Received: from ozlabs.org ([203.11.71.1]:40961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229665AbhFWFft (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 01:35:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8sPN5FpRz9sTD;
        Wed, 23 Jun 2021 15:33:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624426410;
        bh=64tLlGaTOi/LLT7b2hTB47bW7CwHahSkckgxZzshU/M=;
        h=Date:From:To:Cc:Subject:From;
        b=Dg/xHuKJy/D4uWGlRvQ9vUEhRO/duXXFfsElj8lQZeF0mmsQ44FrMnXL33MzHB9yP
         73xOcCXE9uKapfO66mPFU//E8dX7+waT7tOY40BiszNOvLoUbH0TDgNTU/PczNzkRQ
         vn76EJoGINlJ2fouhMYSG3oL8y8pDGBJTguNV+EFkiLj0ANNJW9ryC3l0qrkK5CWri
         kRBGiraPDw2ARi2TbosXmn7dbAMnJQAOQNnlxQ49x4iNzmhNRxXsJLhn/mtEH+cgL9
         HK0vlo04YQBuJM+m43C2nIX9W81vTKXtXOXzki9m8/Z/11s785t+vFDx0K6jPR/cVX
         G34x8Nx4dbRNw==
Date:   Wed, 23 Jun 2021 15:33:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20210623153327.0f27eadf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W.NxuIwS5jaxiWmWyqedpBm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W.NxuIwS5jaxiWmWyqedpBm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree_stall.h

between commit:

  2f064a59a11f ("sched: Change task_struct::state")

from the tip tree and commit:

  e44111ed20d8 ("rcu: Add ->rt_priority and ->gp_start to show_rcu_gp_kthre=
ads() output")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree_stall.h
index acb2288063b5,be648ab03906..000000000000
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@@ -734,21 -817,30 +817,30 @@@ void show_rcu_gp_kthreads(void
  	j =3D jiffies;
  	ja =3D j - data_race(rcu_state.gp_activity);
  	jr =3D j - data_race(rcu_state.gp_req_activity);
+ 	js =3D j - data_race(rcu_state.gp_start);
  	jw =3D j - data_race(rcu_state.gp_wake_time);
- 	pr_info("%s: wait state: %s(%d) ->state: %#x delta ->gp_activity %lu ->g=
p_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_s=
eq_needed %ld ->gp_flags %#x\n",
 -	pr_info("%s: wait state: %s(%d) ->state: %#lx ->rt_priority %u delta ->g=
p_start %lu ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp=
_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_max %lu ->gp_flags %#x\=
n",
++	pr_info("%s: wait state: %s(%d) ->state: %#x ->rt_priority %u delta ->gp=
_start %lu ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp_=
wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_max %lu ->gp_flags %#x\n=
",
  		rcu_state.name, gp_state_getname(rcu_state.gp_state),
- 		rcu_state.gp_state, t ? t->__state : 0x1ffff,
- 		ja, jr, jw, (long)data_race(rcu_state.gp_wake_seq),
 -		rcu_state.gp_state, t ? t->state : 0x1ffffL, t ? t->rt_priority : 0xffU,
++		rcu_state.gp_state, t ? t->__state : 0x1ffff, t ? t->rt_priority : 0xff=
U,
+ 		js, ja, jr, jw, (long)data_race(rcu_state.gp_wake_seq),
  		(long)data_race(rcu_state.gp_seq),
  		(long)data_race(rcu_get_root()->gp_seq_needed),
+ 		data_race(rcu_state.gp_max),
  		data_race(rcu_state.gp_flags));
  	rcu_for_each_node_breadth_first(rnp) {
- 		if (ULONG_CMP_GE(READ_ONCE(rcu_state.gp_seq),
- 				 READ_ONCE(rnp->gp_seq_needed)))
+ 		if (ULONG_CMP_GE(READ_ONCE(rcu_state.gp_seq), READ_ONCE(rnp->gp_seq_nee=
ded)) &&
+ 		    !data_race(rnp->qsmask) && !data_race(rnp->boost_tasks) &&
+ 		    !data_race(rnp->exp_tasks) && !data_race(rnp->gp_tasks))
  			continue;
- 		pr_info("\trcu_node %d:%d ->gp_seq %ld ->gp_seq_needed %ld\n",
- 			rnp->grplo, rnp->grphi, (long)data_race(rnp->gp_seq),
- 			(long)data_race(rnp->gp_seq_needed));
+ 		pr_info("\trcu_node %d:%d ->gp_seq %ld ->gp_seq_needed %ld ->qsmask %#l=
x %c%c%c%c ->n_boosts %ld\n",
+ 			rnp->grplo, rnp->grphi,
+ 			(long)data_race(rnp->gp_seq), (long)data_race(rnp->gp_seq_needed),
+ 			data_race(rnp->qsmask),
+ 			".b"[!!data_race(rnp->boost_kthread_task)],
+ 			".B"[!!data_race(rnp->boost_tasks)],
+ 			".E"[!!data_race(rnp->exp_tasks)],
+ 			".G"[!!data_race(rnp->gp_tasks)],
+ 			data_race(rnp->n_boosts));
  		if (!rcu_is_leaf_node(rnp))
  			continue;
  		for_each_leaf_node_possible_cpu(rnp, cpu) {

--Sig_/W.NxuIwS5jaxiWmWyqedpBm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSx6cACgkQAVBC80lX
0Gz7XAf8D1a4lh09BiOnrem5TJllF1dJ7XQS69u6iXP0QJ7McRgBfIMJASbncC7s
YoNZLcPp6sEffftM3b6/SwZqJpl8Vp5YaHAjfzt1brQF7vs94GIVsie4ahoqIy5k
P+ifAKQVV4eXHeQsNzJBQ+sEUP4erDO+d38fmnsdkmiREH79GN5IzFNIrs53vqZq
SOtN7r+vBCCrCkw+h2mFF0cnBcyHCDf57DvE9PHq8RUVWRvbqomzJYglUuWmj9zM
L8Hr8MYVakh+35Hu+UhQQzYISjPYvzuorKZUlDM84wRjA+9tqs0hosHXdKozVYPC
DWDWpH3itlqlSIaa6lpcwILPuP5J1g==
=6frl
-----END PGP SIGNATURE-----

--Sig_/W.NxuIwS5jaxiWmWyqedpBm--
