Return-Path: <linux-next+bounces-3268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117C94C871
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 04:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 651701C21B40
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 02:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BDC168B7;
	Fri,  9 Aug 2024 02:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fhFF6jfh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF311CA0;
	Fri,  9 Aug 2024 02:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723170210; cv=none; b=kJ6tWdPJTEQDpgVuypChjw5zc/YkddSb5V1rsSNstHwHuyXHAhkH1PeI0BcWqK+aXk4Or269vilzubwWlJwHMkNff1b4usQm7n1Q/OS+jLxgwea0yxm6gGqrsrxcKpYsdjZ/B96HFCPvktMoiE2/UNBtyhEKnan/BtqtYvapfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723170210; c=relaxed/simple;
	bh=ovwy5+sl/P0yufLZpwDaAzkUe1cY3mnZs7VPW131SsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rvmokSyEzXyWaR+ucGcK2b5bmMcJyyMPI3LlwJGOY6iElti/hoyNOU8jsemT7GGVkguYCTJxtI79xU3V5H0dm1H22DC2K/ciLLD6lcLuO2uGMjn8GwUvnU9+NI+vLlcqoruj8ACSDTeF0/DAYITXQ/ghPtaKGsExR3L2kwuOwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fhFF6jfh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723170203;
	bh=yHgvlylgas7/GoNmkuDQlo6AotHW9+Om52I5m+AxM3Y=;
	h=Date:From:To:Cc:Subject:From;
	b=fhFF6jfhZO+rC6ozv5VQAT95pbJwU2GcVqnnOzPNDIDJVeaNmzAiv2LZuJn9q8v9V
	 MPsOiqmz3V2/4bM4jA3/2yxKhzemoXr8/a75sRnLBA9fdjymMlGkKPpZiFplHgnDeA
	 +D7l2BsijhSOY4bJyLNoBqAzMHxErFyMnOn0OGmy5QZcgzr1hpN/qU9eOKWStUbPi9
	 JEey57C6qPwvjuVO7P4m0zeXoGmlovf5SwYHfzuGWCmDRbOUkyfk0SscdQ5eZD5BOK
	 9SzvjEUFVstS6xhAhaSf/vkUAgdcnTfK5UU43/X9T/mL2IGkt5r/dhMbKatvol7I8x
	 YUVOSsyWr97uw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wg74T6Kybz4w2D;
	Fri,  9 Aug 2024 12:23:21 +1000 (AEST)
Date: Fri, 9 Aug 2024 12:23:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Petr
 Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ryo Takakura <takakura@valinux.co.jp>
Subject: linux-next: manual merge of the rcu tree with the printk tree
Message-ID: <20240809122321.5675db8f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_9kKt58FFrX9AngOo.ehqbs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_9kKt58FFrX9AngOo.ehqbs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree_exp.h

between commit:

  9a30ceb4d93e ("rcu: Mark emergency sections in rcu stalls")

from the printk tree and commits:

  34863005f96e ("rcu: Extract synchronize_rcu_expedited_stall() from synchr=
onize_rcu_expedited_wait()")
  c925e2f61399 ("rcu: Let dump_cpu_task() be used without preemption disabl=
ed")

from the rcu tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree_exp.h
index be2d251e84f8,c3266bf709d5..000000000000
--- a/kernel/rcu/tree_exp.h
+++ b/kernel/rcu/tree_exp.h
@@@ -543,6 -542,67 +543,68 @@@ static bool synchronize_rcu_expedited_w
  	return false;
  }
 =20
+ /*
+  * Print out an expedited RCU CPU stall warning message.
+  */
+ static void synchronize_rcu_expedited_stall(unsigned long jiffies_start, =
unsigned long j)
+ {
+ 	int cpu;
+ 	unsigned long mask;
+ 	int ndetected;
+ 	struct rcu_node *rnp;
+ 	struct rcu_node *rnp_root =3D rcu_get_root();
+=20
+ 	if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
+ 		pr_err("INFO: %s detected expedited stalls, but suppressed full report =
due to a stuck CSD-lock.\n", rcu_state.name);
+ 		return;
+ 	}
+ 	pr_err("INFO: %s detected expedited stalls on CPUs/tasks: {", rcu_state.=
name);
+ 	ndetected =3D 0;
+ 	rcu_for_each_leaf_node(rnp) {
+ 		ndetected +=3D rcu_print_task_exp_stall(rnp);
+ 		for_each_leaf_node_possible_cpu(rnp, cpu) {
+ 			struct rcu_data *rdp;
+=20
+ 			mask =3D leaf_node_cpu_bit(rnp, cpu);
+ 			if (!(READ_ONCE(rnp->expmask) & mask))
+ 				continue;
+ 			ndetected++;
+ 			rdp =3D per_cpu_ptr(&rcu_data, cpu);
+ 			pr_cont(" %d-%c%c%c%c", cpu,
+ 				"O."[!!cpu_online(cpu)],
+ 				"o."[!!(rdp->grpmask & rnp->expmaskinit)],
+ 				"N."[!!(rdp->grpmask & rnp->expmaskinitnext)],
+ 				"D."[!!data_race(rdp->cpu_no_qs.b.exp)]);
+ 		}
+ 	}
+ 	pr_cont(" } %lu jiffies s: %lu root: %#lx/%c\n",
+ 		j - jiffies_start, rcu_state.expedited_sequence, data_race(rnp_root->ex=
pmask),
+ 		".T"[!!data_race(rnp_root->exp_tasks)]);
+ 	if (ndetected) {
+ 		pr_err("blocking rcu_node structures (internal RCU debug):");
+ 		rcu_for_each_node_breadth_first(rnp) {
+ 			if (rnp =3D=3D rnp_root)
+ 				continue; /* printed unconditionally */
+ 			if (sync_rcu_exp_done_unlocked(rnp))
+ 				continue;
+ 			pr_cont(" l=3D%u:%d-%d:%#lx/%c",
+ 				rnp->level, rnp->grplo, rnp->grphi, data_race(rnp->expmask),
+ 				".T"[!!data_race(rnp->exp_tasks)]);
+ 		}
+ 		pr_cont("\n");
+ 	}
+ 	rcu_for_each_leaf_node(rnp) {
+ 		for_each_leaf_node_possible_cpu(rnp, cpu) {
+ 			mask =3D leaf_node_cpu_bit(rnp, cpu);
+ 			if (!(READ_ONCE(rnp->expmask) & mask))
+ 				continue;
+ 			dump_cpu_task(cpu);
++			nbcon_cpu_emergency_flush();
+ 		}
+ 		rcu_exp_print_detail_task_stall_rnp(rnp);
+ 	}
+ }
+=20
  /*
   * Wait for the expedited grace period to elapse, issuing any needed
   * RCU CPU stall warnings along the way.
@@@ -597,60 -652,8 +657,11 @@@ static void synchronize_rcu_expedited_w
  		j =3D jiffies;
  		rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_EXP, (void *)(j - jiffie=
s_start));
  		trace_rcu_stall_warning(rcu_state.name, TPS("ExpeditedStall"));
- 		pr_err("INFO: %s detected expedited stalls on CPUs/tasks: {",
- 		       rcu_state.name);
- 		ndetected =3D 0;
- 		rcu_for_each_leaf_node(rnp) {
- 			ndetected +=3D rcu_print_task_exp_stall(rnp);
- 			for_each_leaf_node_possible_cpu(rnp, cpu) {
- 				struct rcu_data *rdp;
-=20
- 				mask =3D leaf_node_cpu_bit(rnp, cpu);
- 				if (!(READ_ONCE(rnp->expmask) & mask))
- 					continue;
- 				ndetected++;
- 				rdp =3D per_cpu_ptr(&rcu_data, cpu);
- 				pr_cont(" %d-%c%c%c%c", cpu,
- 					"O."[!!cpu_online(cpu)],
- 					"o."[!!(rdp->grpmask & rnp->expmaskinit)],
- 					"N."[!!(rdp->grpmask & rnp->expmaskinitnext)],
- 					"D."[!!data_race(rdp->cpu_no_qs.b.exp)]);
- 			}
- 		}
- 		pr_cont(" } %lu jiffies s: %lu root: %#lx/%c\n",
- 			j - jiffies_start, rcu_state.expedited_sequence,
- 			data_race(rnp_root->expmask),
- 			".T"[!!data_race(rnp_root->exp_tasks)]);
- 		if (ndetected) {
- 			pr_err("blocking rcu_node structures (internal RCU debug):");
- 			rcu_for_each_node_breadth_first(rnp) {
- 				if (rnp =3D=3D rnp_root)
- 					continue; /* printed unconditionally */
- 				if (sync_rcu_exp_done_unlocked(rnp))
- 					continue;
- 				pr_cont(" l=3D%u:%d-%d:%#lx/%c",
- 					rnp->level, rnp->grplo, rnp->grphi,
- 					data_race(rnp->expmask),
- 					".T"[!!data_race(rnp->exp_tasks)]);
- 			}
- 			pr_cont("\n");
- 		}
- 		rcu_for_each_leaf_node(rnp) {
- 			for_each_leaf_node_possible_cpu(rnp, cpu) {
- 				mask =3D leaf_node_cpu_bit(rnp, cpu);
- 				if (!(READ_ONCE(rnp->expmask) & mask))
- 					continue;
- 				preempt_disable(); // For smp_processor_id() in dump_cpu_task().
- 				dump_cpu_task(cpu);
- 				preempt_enable();
- 				nbcon_cpu_emergency_flush();
- 			}
- 			rcu_exp_print_detail_task_stall_rnp(rnp);
- 		}
+ 		synchronize_rcu_expedited_stall(jiffies_start, j);
  		jiffies_stall =3D 3 * rcu_exp_jiffies_till_stall_check() + 3;
 +
 +		nbcon_cpu_emergency_exit();
 +
  		panic_on_rcu_stall();
  	}
  }

--Sig_/_9kKt58FFrX9AngOo.ehqbs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma1fZkACgkQAVBC80lX
0GxFlQf/Yrvh9dxp/F/yYclDTAMS055oXjgif6dR/yWi3E83dv8nztFN7dofzDJr
i8hXybLU7PH7na8xiicmasldkC0ga3rrKkN6Tik1tzfzrpKCHobEuEydej6cZpmg
+lZBHnl+DiIp9BkJjzAjq3/EOGDbLQ/XyZKBZWSLmpGtl+LRsOeR0fj04ZLgMoMp
xAKtTzLnq9CTY1Vw87ueygZHKdGdtMC0S1tjMixDJqTDZZ8gS2L1H/s/ZnzdAIu9
dow4cXJWXROrAdtyWmYZ8cG8QGTWWqhGxhS0PJYE6mL3TfuVW9bAsWlQ+y58JqBf
GD/i3bteiBlRkTIwBZe7eogxJ7zHAg==
=oHQf
-----END PGP SIGNATURE-----

--Sig_/_9kKt58FFrX9AngOo.ehqbs--

