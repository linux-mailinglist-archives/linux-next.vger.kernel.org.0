Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7146D3184FF
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 06:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhBKFuB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 00:50:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35429 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhBKFuA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 00:50:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dbm056p4Kz9sB4;
        Thu, 11 Feb 2021 16:48:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613022534;
        bh=e3y7O4e1jX4gorlapOgMU4zQ0jtDWRdVOEsbBEuVhtw=;
        h=Date:From:To:Cc:Subject:From;
        b=Nz/bqOcSvJMbF/peti69RvHNYwAJbRSSihVCVX16pB8TcHsnZcMl8xsmHIZ/5x8Ho
         Pk335hyyneTwTmOIn3QwKTpqvtcEoawV6wURGc8bzh47YP5R8HdBMtY2YMs2P4Fdpx
         cGUIoperzyoohNT2+HGC5FP3ml22qLDjfEaiO0+lBT/2kqxZbrACb19r6AnfoDUftP
         RCqMR8dL9Xn/e/fw+M+RWHnr/CG9BWjw75tmqRgmFrircTwbi5FHUiCkvlLgm+bxOL
         EBvLHVSv9S2Zf6rkztAX3tUDDZEjazGrQftyLimWU5c5QGm3RCs0u9LrqxlFX8ZJCQ
         GxqkFrl4CWoMA==
Date:   Thu, 11 Feb 2021 16:48:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Frederic Weisbecker <frederic@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <20210211164852.7489b87d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BTBkdtIAxlkLc_A6mNAlQSF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BTBkdtIAxlkLc_A6mNAlQSF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got conflicts in:

  include/linux/rcupdate.h
  kernel/rcu/tree.c
  kernel/rcu/tree_plugin.h

between commits:

  3a7b5c87a0b2 ("rcu/nocb: Perform deferred wake up before last idle's need=
_resched() check")
  e4234f21d2ea ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() caller=
s")
  14bbd41d5109 ("entry/kvm: Explicitly flush pending rcuog wakeup before la=
st rescheduling point")

from the block tree and commits:

  d97b07818240 ("rcu/nocb: De-offloading CB kthread")
  254e11efde66 ("rcu/nocb: Re-offload support")
  eba362724509 ("rcu: Remove superfluous rdp fetch")

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

diff --cc include/linux/rcupdate.h
index 36c2119de702,fa819f878cb1..000000000000
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@@ -110,10 -112,12 +112,14 @@@ static inline void rcu_user_exit(void)=20
 =20
  #ifdef CONFIG_RCU_NOCB_CPU
  void rcu_init_nohz(void);
 +void rcu_nocb_flush_deferred_wakeup(void);
+ int rcu_nocb_cpu_offload(int cpu);
+ int rcu_nocb_cpu_deoffload(int cpu);
  #else /* #ifdef CONFIG_RCU_NOCB_CPU */
  static inline void rcu_init_nohz(void) { }
 +static inline void rcu_nocb_flush_deferred_wakeup(void) { }
+ static inline int rcu_nocb_cpu_offload(int cpu) { return -EINVAL; }
+ static inline int rcu_nocb_cpu_deoffload(int cpu) { return 0; }
  #endif /* #else #ifdef CONFIG_RCU_NOCB_CPU */
 =20
  /**
diff --cc kernel/rcu/tree.c
index ce17b8477442,c1ae1e52f638..000000000000
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@@ -643,7 -649,7 +649,6 @@@ static noinstr void rcu_eqs_enter(bool=20
  	instrumentation_begin();
  	trace_rcu_dyntick(TPS("Start"), rdp->dynticks_nesting, 0, atomic_read(&r=
dp->dynticks));
  	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(=
current));
- 	rdp =3D this_cpu_ptr(&rcu_data);
 -	do_nocb_deferred_wakeup(rdp);
  	rcu_prepare_for_idle();
  	rcu_preempt_deferred_qs(current);
 =20
diff --cc kernel/rcu/tree_plugin.h
index cdc1b7651c03,ba1ae1e4b215..000000000000
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@@ -2186,19 -2341,201 +2346,208 @@@ static void do_nocb_deferred_wakeup_tim
   * This means we do an inexact common-case check.  Note that if
   * we miss, ->nocb_timer will eventually clean things up.
   */
 -static void do_nocb_deferred_wakeup(struct rcu_data *rdp)
 +static bool do_nocb_deferred_wakeup(struct rcu_data *rdp)
  {
  	if (rcu_nocb_need_deferred_wakeup(rdp))
 -		do_nocb_deferred_wakeup_common(rdp);
 +		return do_nocb_deferred_wakeup_common(rdp);
 +	return false;
 +}
 +
 +void rcu_nocb_flush_deferred_wakeup(void)
 +{
 +	do_nocb_deferred_wakeup(this_cpu_ptr(&rcu_data));
  }
 +EXPORT_SYMBOL_GPL(rcu_nocb_flush_deferred_wakeup);
 =20
+ static int rdp_offload_toggle(struct rcu_data *rdp,
+ 			       bool offload, unsigned long flags)
+ 	__releases(rdp->nocb_lock)
+ {
+ 	struct rcu_segcblist *cblist =3D &rdp->cblist;
+ 	struct rcu_data *rdp_gp =3D rdp->nocb_gp_rdp;
+ 	bool wake_gp =3D false;
+=20
+ 	rcu_segcblist_offload(cblist, offload);
+=20
+ 	if (rdp->nocb_cb_sleep)
+ 		rdp->nocb_cb_sleep =3D false;
+ 	rcu_nocb_unlock_irqrestore(rdp, flags);
+=20
+ 	/*
+ 	 * Ignore former value of nocb_cb_sleep and force wake up as it could
+ 	 * have been spuriously set to false already.
+ 	 */
+ 	swake_up_one(&rdp->nocb_cb_wq);
+=20
+ 	raw_spin_lock_irqsave(&rdp_gp->nocb_gp_lock, flags);
+ 	if (rdp_gp->nocb_gp_sleep) {
+ 		rdp_gp->nocb_gp_sleep =3D false;
+ 		wake_gp =3D true;
+ 	}
+ 	raw_spin_unlock_irqrestore(&rdp_gp->nocb_gp_lock, flags);
+=20
+ 	if (wake_gp)
+ 		wake_up_process(rdp_gp->nocb_gp_kthread);
+=20
+ 	return 0;
+ }
+=20
+ static int __rcu_nocb_rdp_deoffload(struct rcu_data *rdp)
+ {
+ 	struct rcu_segcblist *cblist =3D &rdp->cblist;
+ 	unsigned long flags;
+ 	int ret;
+=20
+ 	pr_info("De-offloading %d\n", rdp->cpu);
+=20
+ 	rcu_nocb_lock_irqsave(rdp, flags);
+ 	/*
+ 	 * If there are still pending work offloaded, the offline
+ 	 * CPU won't help much handling them.
+ 	 */
+ 	if (cpu_is_offline(rdp->cpu) && !rcu_segcblist_empty(&rdp->cblist)) {
+ 		rcu_nocb_unlock_irqrestore(rdp, flags);
+ 		return -EBUSY;
+ 	}
+=20
+ 	ret =3D rdp_offload_toggle(rdp, false, flags);
+ 	swait_event_exclusive(rdp->nocb_state_wq,
+ 			      !rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_CB |
+ 							SEGCBLIST_KTHREAD_GP));
+ 	rcu_nocb_lock_irqsave(rdp, flags);
+ 	/* Make sure nocb timer won't stay around */
+ 	WRITE_ONCE(rdp->nocb_defer_wakeup, RCU_NOCB_WAKE_OFF);
+ 	rcu_nocb_unlock_irqrestore(rdp, flags);
+ 	del_timer_sync(&rdp->nocb_timer);
+=20
+ 	/*
+ 	 * Flush bypass. While IRQs are disabled and once we set
+ 	 * SEGCBLIST_SOFTIRQ_ONLY, no callback is supposed to be
+ 	 * enqueued on bypass.
+ 	 */
+ 	rcu_nocb_lock_irqsave(rdp, flags);
+ 	rcu_nocb_flush_bypass(rdp, NULL, jiffies);
+ 	rcu_segcblist_set_flags(cblist, SEGCBLIST_SOFTIRQ_ONLY);
+ 	/*
+ 	 * With SEGCBLIST_SOFTIRQ_ONLY, we can't use
+ 	 * rcu_nocb_unlock_irqrestore() anymore. Theoretically we
+ 	 * could set SEGCBLIST_SOFTIRQ_ONLY with cb unlocked and IRQs
+ 	 * disabled now, but let's be paranoid.
+ 	 */
+ 	raw_spin_unlock_irqrestore(&rdp->nocb_lock, flags);
+=20
+ 	return ret;
+ }
+=20
+ static long rcu_nocb_rdp_deoffload(void *arg)
+ {
+ 	struct rcu_data *rdp =3D arg;
+=20
+ 	WARN_ON_ONCE(rdp->cpu !=3D raw_smp_processor_id());
+ 	return __rcu_nocb_rdp_deoffload(rdp);
+ }
+=20
+ int rcu_nocb_cpu_deoffload(int cpu)
+ {
+ 	struct rcu_data *rdp =3D per_cpu_ptr(&rcu_data, cpu);
+ 	int ret =3D 0;
+=20
+ 	if (rdp =3D=3D rdp->nocb_gp_rdp) {
+ 		pr_info("Can't deoffload an rdp GP leader (yet)\n");
+ 		return -EINVAL;
+ 	}
+ 	mutex_lock(&rcu_state.barrier_mutex);
+ 	cpus_read_lock();
+ 	if (rcu_rdp_is_offloaded(rdp)) {
+ 		if (cpu_online(cpu))
+ 			ret =3D work_on_cpu(cpu, rcu_nocb_rdp_deoffload, rdp);
+ 		else
+ 			ret =3D __rcu_nocb_rdp_deoffload(rdp);
+ 		if (!ret)
+ 			cpumask_clear_cpu(cpu, rcu_nocb_mask);
+ 	}
+ 	cpus_read_unlock();
+ 	mutex_unlock(&rcu_state.barrier_mutex);
+=20
+ 	return ret;
+ }
+ EXPORT_SYMBOL_GPL(rcu_nocb_cpu_deoffload);
+=20
+ static int __rcu_nocb_rdp_offload(struct rcu_data *rdp)
+ {
+ 	struct rcu_segcblist *cblist =3D &rdp->cblist;
+ 	unsigned long flags;
+ 	int ret;
+=20
+ 	/*
+ 	 * For now we only support re-offload, ie: the rdp must have been
+ 	 * offloaded on boot first.
+ 	 */
+ 	if (!rdp->nocb_gp_rdp)
+ 		return -EINVAL;
+=20
+ 	pr_info("Offloading %d\n", rdp->cpu);
+ 	/*
+ 	 * Can't use rcu_nocb_lock_irqsave() while we are in
+ 	 * SEGCBLIST_SOFTIRQ_ONLY mode.
+ 	 */
+ 	raw_spin_lock_irqsave(&rdp->nocb_lock, flags);
+ 	/* Re-enable nocb timer */
+ 	WRITE_ONCE(rdp->nocb_defer_wakeup, RCU_NOCB_WAKE_NOT);
+ 	/*
+ 	 * We didn't take the nocb lock while working on the
+ 	 * rdp->cblist in SEGCBLIST_SOFTIRQ_ONLY mode.
+ 	 * Every modifications that have been done previously on
+ 	 * rdp->cblist must be visible remotely by the nocb kthreads
+ 	 * upon wake up after reading the cblist flags.
+ 	 *
+ 	 * The layout against nocb_lock enforces that ordering:
+ 	 *
+ 	 *  __rcu_nocb_rdp_offload()   nocb_cb_wait()/nocb_gp_wait()
+ 	 * -------------------------   ----------------------------
+ 	 *      WRITE callbacks           rcu_nocb_lock()
+ 	 *      rcu_nocb_lock()           READ flags
+ 	 *      WRITE flags               READ callbacks
+ 	 *      rcu_nocb_unlock()         rcu_nocb_unlock()
+ 	 */
+ 	ret =3D rdp_offload_toggle(rdp, true, flags);
+ 	swait_event_exclusive(rdp->nocb_state_wq,
+ 			      rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_CB) &&
+ 			      rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_GP));
+=20
+ 	return ret;
+ }
+=20
+ static long rcu_nocb_rdp_offload(void *arg)
+ {
+ 	struct rcu_data *rdp =3D arg;
+=20
+ 	WARN_ON_ONCE(rdp->cpu !=3D raw_smp_processor_id());
+ 	return __rcu_nocb_rdp_offload(rdp);
+ }
+=20
+ int rcu_nocb_cpu_offload(int cpu)
+ {
+ 	struct rcu_data *rdp =3D per_cpu_ptr(&rcu_data, cpu);
+ 	int ret =3D 0;
+=20
+ 	mutex_lock(&rcu_state.barrier_mutex);
+ 	cpus_read_lock();
+ 	if (!rcu_rdp_is_offloaded(rdp)) {
+ 		if (cpu_online(cpu))
+ 			ret =3D work_on_cpu(cpu, rcu_nocb_rdp_offload, rdp);
+ 		else
+ 			ret =3D __rcu_nocb_rdp_offload(rdp);
+ 		if (!ret)
+ 			cpumask_set_cpu(cpu, rcu_nocb_mask);
+ 	}
+ 	cpus_read_unlock();
+ 	mutex_unlock(&rcu_state.barrier_mutex);
+=20
+ 	return ret;
+ }
+ EXPORT_SYMBOL_GPL(rcu_nocb_cpu_offload);
+=20
  void __init rcu_init_nohz(void)
  {
  	int cpu;

--Sig_/BTBkdtIAxlkLc_A6mNAlQSF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAkxUQACgkQAVBC80lX
0GzAeQf9F9VeukME0Ihgf3VHFtUzhJ6Y/S8yPhZbZMOyvQzbE0HF1UtPCw7PT8Iy
Dw1bFlnSTDikk7CzMHhY5bQ1VyMZPO8ZiPolGgNSiPcGQEwA6fQXbxPJ8InmqWoZ
35b/NUdRxlPc0Y+iXQN00SczSlTeF3YUpSISlk3m1BRbZEJmgj6yMN+jQ/kzK+jB
RTSFXn2qJDITY5g1jN+PtHugY9DZMMLMKmIsnFsnnicQ1X2oDgIrUckU3dEDioFa
V/LH1/kzxq2fp/D2Goh5kmX9cWLQV+7n5oEfrJ26GhqacL80FHDl8ngrA7YzH6rI
lnk6Lp0E8Ra6YCpJXAKh4teARm+smA==
=RwEk
-----END PGP SIGNATURE-----

--Sig_/BTBkdtIAxlkLc_A6mNAlQSF--
