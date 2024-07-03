Return-Path: <linux-next+bounces-2820-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0B924F75
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 05:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2847A28354B
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 03:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF8B101C5;
	Wed,  3 Jul 2024 03:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KUpk/ty5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91DC567D;
	Wed,  3 Jul 2024 03:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719976707; cv=none; b=bpq6h4mfYd1x8fsHtNPDKZXxzfjHKamMmTM9oWRUbIIk2BGmok6vLAq0bn7ykOeoR8s9GvJLyYUA30ud6aSvXNJfr6EpK9GHuJLrwSQCR3RaARraZ/bQVSOiMMMiOg4I68oqhcaNByTO8ZG0ytQJCCqA1p9TW5IyfoYP+uMJfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719976707; c=relaxed/simple;
	bh=nZ8GdcS05NR+1mVQOQm/Z1hkRRUcSyJ3iuSGGYgk+qY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=azjP/v1J1hckNSQlYgc5FAmwuV/vfao1bpHwlEOa+oBClVEXPVuoOrXOjX8xncmzf+RIbZs84glkxuAQvS2t6vMO04qLMjWoeR/gFT+kjeePuB33793R7yn/rqHVksApe/X96zQPQU0trCalZ78CgMmz4oGDnqrf9ouSGMcOO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KUpk/ty5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719976702;
	bh=mrPZie3LJ0M08hiUXfEviuAx1x2OTBhxP80Lkee0cgo=;
	h=Date:From:To:Cc:Subject:From;
	b=KUpk/ty5vqX/4UxVH61zCRLeslFzUtrP2nGJlZBb5Ut2Al1lB+lF9PVecWHiubp9B
	 1AWr+6W0Z5vO+eeWL4/32l2Gl8Xy6pp7o37L8QInPx6t+KxTaNXbsl3vgf4y5XGn/B
	 SbYaPg+CljGzuY841ywDxnMVvDO6KltfpK4pc2BbBShppt+pAoIYE77M8bXPUPjVWJ
	 DKfkQSQWaLwadIJr0z26gyI2P9t9HPxRCUFiGtpUH9Zq1s0/UfbHmkOI39JOLljofW
	 rWiW5L+1Z2h/3FEJx8aRuzEWIbM9EHD/d5MQKb6CzBpnAeSjlJBJhfsL8q8/Wy3siz
	 Bw9MzfeKbIAgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDQ310Vz7z4w2D;
	Wed,  3 Jul 2024 13:18:21 +1000 (AEST)
Date: Wed, 3 Jul 2024 13:18:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the paulmck tree with the printk tree
Message-ID: <20240703131820.02eb8021@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HTkGw2i4JoMI8c1Amolbd9g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HTkGw2i4JoMI8c1Amolbd9g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the paulmck tree got a conflict in:

  kernel/rcu/tree_exp.h

between commit:

  9a30ceb4d93e ("rcu: Mark emergency sections in rcu stalls")

from the printk tree and commit:

  c19a6725b019 ("rcu: Extract synchronize_rcu_expedited_stall() from synchr=
onize_rcu_expedited_wait()")

from the paulmck tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree_exp.h
index be2d251e84f8,d4be644afb50..000000000000
--- a/kernel/rcu/tree_exp.h
+++ b/kernel/rcu/tree_exp.h
@@@ -543,6 -542,69 +543,70 @@@ static bool synchronize_rcu_expedited_w
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
+ 			preempt_disable(); // For smp_processor_id() in dump_cpu_task().
+ 			dump_cpu_task(cpu);
+ 			preempt_enable();
++			nbcon_cpu_emergency_flush();
+ 		}
+ 		rcu_exp_print_detail_task_stall_rnp(rnp);
+ 	}
+ }
+=20
  /*
   * Wait for the expedited grace period to elapse, issuing any needed
   * RCU CPU stall warnings along the way.
@@@ -597,60 -654,8 +659,11 @@@ static void synchronize_rcu_expedited_w
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

--Sig_/HTkGw2i4JoMI8c1Amolbd9g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEwvwACgkQAVBC80lX
0GwGDAf/W2tu4iHW+DEnwI3i9dD9QWYcorw0K0d5FGY1lh8/fqkEMk+GCjxYrDDg
Lr5gX178YoDYszRerzCLSCsCFbXIaPrLuS5owevS21qqrzfyFcEK+sT6P9NL/mhu
lDtzYkoWRAWEhPjDSzEk3PK8FYiPAFXRk16MsfhwI+wdRS7M6WkhnHdiCxP9lBj1
kJxEzQbpAOix6yv/c9P97YYMZJ6cKHt+eg2ySIPqIejFGPhSLBhW+3KPvMzY6kLu
MIEyoS9LHTwFgJwez4DTLb68x9+C59KsSfxbcCqB0rGEVRd5Hb49xIgwBaRSK9W/
ecPdCTYJyXTMuX3yCflVQWYvwks7rg==
=OMag
-----END PGP SIGNATURE-----

--Sig_/HTkGw2i4JoMI8c1Amolbd9g--

