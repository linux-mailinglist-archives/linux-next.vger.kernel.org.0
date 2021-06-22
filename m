Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565F73AFC2F
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 06:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFVEuR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 00:50:17 -0400
Received: from ozlabs.org ([203.11.71.1]:59603 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhFVEuR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 00:50:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8DRL3tQdz9sXk;
        Tue, 22 Jun 2021 14:47:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624337280;
        bh=feyUlm2lPr6OPTDxyZobtFU9Com7RjHlMIUgTOXfRwo=;
        h=Date:From:To:Cc:Subject:From;
        b=eXlVyVXR9QTrh/dr6Khl3fp1Uf6QVEmWdawn0M4u3+MliE4nS9/43VqW0iK+HWOvt
         Nsi7fchqxUpM/WWgtVx7K0BFOypnWqtpcjZk7SP4EOJhF5YpZA1bW9BS4gMvmbgrku
         JqIVLzViwkC4LVjBGOLOsyGiYVulVPcfwDiAZnlSI3MxJgybzjDbjspGBqb+pw8f28
         eEVIvTsY3qXvHwQmE1nBvsbn3iu/YI8mN3fE4qYk03dIq5DkaFuxN5Zv0vbgsvu6EG
         owQ30cFNkENDHHih24BHRWG8IzhUsHXwjBoDCNqdbCLhSv4fk+4+mZuNxx2ZXoDoSu
         xeDp5UmPplmaA==
Date:   Tue, 22 Jun 2021 14:47:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20210622144757.055a4137@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0pli+SemqieRD8tXE_QHrwJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0pli+SemqieRD8tXE_QHrwJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree_stall.h

between commit:

  2f064a59a11f ("sched: Change task_struct::state")

from the tip tree and commit:

  367455053a76 ("rcu: Mark accesses in tree_stall.h")

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
index acb2288063b5,24065f1acb8b..000000000000
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@@ -460,12 -462,13 +462,13 @@@ static void rcu_check_gp_kthread_starva
 =20
  	if (rcu_is_gp_kthread_starving(&j)) {
  		cpu =3D gpk ? task_cpu(gpk) : -1;
 -		pr_err("%s kthread starved for %ld jiffies! g%ld f%#x %s(%d) ->state=3D=
%#lx ->cpu=3D%d\n",
 +		pr_err("%s kthread starved for %ld jiffies! g%ld f%#x %s(%d) ->state=3D=
%#x ->cpu=3D%d\n",
  		       rcu_state.name, j,
  		       (long)rcu_seq_current(&rcu_state.gp_seq),
- 		       data_race(rcu_state.gp_flags),
- 		       gp_state_getname(rcu_state.gp_state), rcu_state.gp_state,
- 		       gpk ? gpk->__state : ~0, cpu);
+ 		       data_race(READ_ONCE(rcu_state.gp_flags)),
+ 		       gp_state_getname(rcu_state.gp_state),
+ 		       data_race(READ_ONCE(rcu_state.gp_state)),
 -		       gpk ? data_race(READ_ONCE(gpk->state)) : ~0, cpu);
++		       gpk ? data_race(READ_ONCE(gpk->__state)) : ~0, cpu);
  		if (gpk) {
  			pr_err("\tUnless %s kthread gets sufficient CPU time, OOM is now expec=
ted behavior.\n", rcu_state.name);
  			pr_err("RCU grace-period kthread stack dump:\n");
@@@ -508,7 -511,7 +511,7 @@@ static void rcu_check_gp_kthread_expire
  		       (long)rcu_seq_current(&rcu_state.gp_seq),
  		       data_race(rcu_state.gp_flags),
  		       gp_state_getname(RCU_GP_WAIT_FQS), RCU_GP_WAIT_FQS,
- 		       gpk->__state);
 -		       data_race(READ_ONCE(gpk->state)));
++		       data_race(READ_ONCE(gpk->__state)));
  		pr_err("\tPossible timer handling issue on cpu=3D%d timer-softirq=3D%u\=
n",
  		       cpu, kstat_softirqs_cpu(TIMER_SOFTIRQ, cpu));
  	}
@@@ -732,23 -816,34 +816,34 @@@ void show_rcu_gp_kthreads(void
  	struct task_struct *t =3D READ_ONCE(rcu_state.gp_kthread);
 =20
  	j =3D jiffies;
- 	ja =3D j - data_race(rcu_state.gp_activity);
- 	jr =3D j - data_race(rcu_state.gp_req_activity);
- 	jw =3D j - data_race(rcu_state.gp_wake_time);
- 	pr_info("%s: wait state: %s(%d) ->state: %#x delta ->gp_activity %lu ->g=
p_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_s=
eq_needed %ld ->gp_flags %#x\n",
+ 	ja =3D j - data_race(READ_ONCE(rcu_state.gp_activity));
+ 	jr =3D j - data_race(READ_ONCE(rcu_state.gp_req_activity));
+ 	js =3D j - data_race(READ_ONCE(rcu_state.gp_start));
+ 	jw =3D j - data_race(READ_ONCE(rcu_state.gp_wake_time));
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
- 		(long)data_race(rcu_state.gp_seq),
- 		(long)data_race(rcu_get_root()->gp_seq_needed),
- 		data_race(rcu_state.gp_flags));
+ 		data_race(READ_ONCE(rcu_state.gp_state)),
 -		t ? data_race(READ_ONCE(t->state)) : 0x1ffffL, t ? t->rt_priority : 0xf=
fU,
++		t ? data_race(READ_ONCE(t->__state)) : 0x1ffffL, t ? t->rt_priority : 0=
xffU,
+ 		js, ja, jr, jw, (long)data_race(READ_ONCE(rcu_state.gp_wake_seq)),
+ 		(long)data_race(READ_ONCE(rcu_state.gp_seq)),
+ 		(long)data_race(READ_ONCE(rcu_get_root()->gp_seq_needed)),
+ 		data_race(READ_ONCE(rcu_state.gp_max)),
+ 		data_race(READ_ONCE(rcu_state.gp_flags)));
  	rcu_for_each_node_breadth_first(rnp) {
- 		if (ULONG_CMP_GE(READ_ONCE(rcu_state.gp_seq),
- 				 READ_ONCE(rnp->gp_seq_needed)))
+ 		if (ULONG_CMP_GE(READ_ONCE(rcu_state.gp_seq), READ_ONCE(rnp->gp_seq_nee=
ded)) &&
+ 		    !data_race(READ_ONCE(rnp->qsmask)) && !data_race(READ_ONCE(rnp->boo=
st_tasks)) &&
+ 		    !data_race(READ_ONCE(rnp->exp_tasks)) && !data_race(READ_ONCE(rnp->=
gp_tasks)))
  			continue;
- 		pr_info("\trcu_node %d:%d ->gp_seq %ld ->gp_seq_needed %ld\n",
- 			rnp->grplo, rnp->grphi, (long)data_race(rnp->gp_seq),
- 			(long)data_race(rnp->gp_seq_needed));
+ 		pr_info("\trcu_node %d:%d ->gp_seq %ld ->gp_seq_needed %ld ->qsmask %#l=
x %c%c%c%c ->n_boosts %ld\n",
+ 			rnp->grplo, rnp->grphi,
+ 			(long)data_race(READ_ONCE(rnp->gp_seq)),
+ 			(long)data_race(READ_ONCE(rnp->gp_seq_needed)),
+ 			data_race(READ_ONCE(rnp->qsmask)),
+ 			".b"[!!data_race(READ_ONCE(rnp->boost_kthread_task))],
+ 			".B"[!!data_race(READ_ONCE(rnp->boost_tasks))],
+ 			".E"[!!data_race(READ_ONCE(rnp->exp_tasks))],
+ 			".G"[!!data_race(READ_ONCE(rnp->gp_tasks))],
+ 			data_race(READ_ONCE(rnp->n_boosts)));
  		if (!rcu_is_leaf_node(rnp))
  			continue;
  		for_each_leaf_node_possible_cpu(rnp, cpu) {

--Sig_/0pli+SemqieRD8tXE_QHrwJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRa30ACgkQAVBC80lX
0GzKMQf9E56ZA22IgAD67IFMcvCjmal1DY4h3qPonHIziTgMXzSdW6wu0itzPbyT
eQP2K7JQ1vCKUG1AoauS+jXxuh5KzxXu79vNjWsS8AsfeKgqaFoFqoK/F/mpjf/J
2e8DnFJ1m9GfhLTvGjfEUEkGdYRZr4vtCMMXRl9YYv2sDc9jlPanAvwsHKa7Fi/o
pJzVsX9NkMhDcHiZGlAV3omHdztS+/ENWtuMSPvlZNRJkp2nutqCHkx/AnCAk1Pj
ha4iMQjQlgHPIQxEIXFIc4Jeba/jF1vr7TtAgWJ9OYmg+DOVjqcqKZDVn50pLaLP
E7yIS93WUwwBV6wizMnfDc2dv8Crsw==
=htPc
-----END PGP SIGNATURE-----

--Sig_/0pli+SemqieRD8tXE_QHrwJ--
