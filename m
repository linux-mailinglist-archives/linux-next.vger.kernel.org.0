Return-Path: <linux-next+bounces-3746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09B974A7A
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 08:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDF5DB251B7
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 06:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13090770ED;
	Wed, 11 Sep 2024 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RVDS4oEv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D452BAE3;
	Wed, 11 Sep 2024 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726036855; cv=none; b=j3fXtEfAhYdCCa4G5NtzolkZPEy0XvIoexIHm5hjY9AJO86FoUOEpMEjxrYQzSRh1AKQVDw4No9RL5ZHTLMJvEHPjIXZgLJ2Dyx2NckzXJ/RLb0dxYvulOllnI1fcFUXMHXZpMyRpmRXHXEzHee8MIJQoNga8T0nCNuv545rdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726036855; c=relaxed/simple;
	bh=HTyrCGRnO8IJ/YTMkc28EzUOnC2WB0EPA29mlwsPQiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KyL86akzPqWjDk8eJteMG5NQoLOQedkf85hUprrFHxyygPDWX7qXrxOJXk3SXbLlHsLM5SzO6sjM6fWU7wg2R3PvUNa3RrNkT+08hjCfpxvhQdOhmffMD+XXfTWsekFUKxpTbN1zovNqsEI42j4b4wKlgeJ408Im01+oy1XgNjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RVDS4oEv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726036849;
	bh=r1awy6sqi3TYaGOEqCF8Y53VqhxPh2kIlkOVwdfOF2g=;
	h=Date:From:To:Cc:Subject:From;
	b=RVDS4oEvOWs4uKVWMKCksiDJBcoLFEa2g/EX0bYzqD9seCM+uHFyVsTf6ITb2kOr4
	 Yl6ek/KeFIRGphrOWVBbWiByHTVv/gusiDIIWNEv33OwFr2PmfZcf29r7eKFWnpAo6
	 4JnARRXb3L/LZoDANWEtaHDNDGe0upEdAIq8Cf0u9aLtrBFpkiTNIW4oslE6K3CpO6
	 MThfcEa7/u8b8fITonnRNCVXsvD6HoD567gfzoHypjeVBjRWulCjR+D7eUwBwzHudM
	 algRftsLrtVzGqUxB77OD5oxK0QmFqWY1Y/mFAUgdOSg8/REjDoqZ47Yt0+Ol12TTH
	 msI4IqwGfSUdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3WDH6g1bz4wc1;
	Wed, 11 Sep 2024 16:40:46 +1000 (AEST)
Date: Wed, 11 Sep 2024 16:40:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Chen Yu
 <yu.c.chen@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <20240911164046.2c97e2b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s.quQoGObOJ+Xl/v8R8Iq2j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s.quQoGObOJ+Xl/v8R8Iq2j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got conflicts in:

  kernel/sched/fair.c
  kernel/sched/syscalls.c

between commits:

  84d265281d6c ("sched/pelt: Use rq_clock_task() for hw_pressure")
  5d871a63997f ("sched/fair: Move effective_cpu_util() and effective_cpu_ut=
il() in fair.c")

from the tip tree and commit:

  96fd6c65efc6 ("sched: Factor out update_other_load_avgs() from __update_b=
locked_others()")

from the sched-ext tree.

I fixed it up (I used the latter version of kernel/sched/fair.c and see
below) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sched/syscalls.c
index cb03c790c27a,7ecade89eada..000000000000
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@@ -258,6 -258,126 +258,28 @@@ int sched_core_idle_cpu(int cpu
 =20
  #endif
 =20
+ #ifdef CONFIG_SMP
+ /*
+  * Load avg and utiliztion metrics need to be updated periodically and be=
fore
+  * consumption. This function updates the metrics for all subsystems exce=
pt for
+  * the fair class. @rq must be locked and have its clock updated.
+  */
+ bool update_other_load_avgs(struct rq *rq)
+ {
+ 	u64 now =3D rq_clock_pelt(rq);
+ 	const struct sched_class *curr_class =3D rq->curr->sched_class;
+ 	unsigned long hw_pressure =3D arch_scale_hw_pressure(cpu_of(rq));
+=20
+ 	lockdep_assert_rq_held(rq);
+=20
++	/* hw_pressure doesn't care about invariance */
+ 	return update_rt_rq_load_avg(now, rq, curr_class =3D=3D &rt_sched_class)=
 |
+ 		update_dl_rq_load_avg(now, rq, curr_class =3D=3D &dl_sched_class) |
 -		update_hw_load_avg(now, rq, hw_pressure) |
++		update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure) |
+ 		update_irq_load_avg(rq, 0);
+ }
 -
 -/*
 - * This function computes an effective utilization for the given CPU, to =
be
 - * used for frequency selection given the linear relation: f =3D u * f_ma=
x.
 - *
 - * The scheduler tracks the following metrics:
 - *
 - *   cpu_util_{cfs,rt,dl,irq}()
 - *   cpu_bw_dl()
 - *
 - * Where the cfs,rt and dl util numbers are tracked with the same metric =
and
 - * synchronized windows and are thus directly comparable.
 - *
 - * The cfs,rt,dl utilization are the running times measured with rq->cloc=
k_task
 - * which excludes things like IRQ and steal-time. These latter are then a=
ccrued
 - * in the IRQ utilization.
 - *
 - * The DL bandwidth number OTOH is not a measured metric but a value comp=
uted
 - * based on the task model parameters and gives the minimal utilization
 - * required to meet deadlines.
 - */
 -unsigned long effective_cpu_util(int cpu, unsigned long util_cfs,
 -				 unsigned long *min,
 -				 unsigned long *max)
 -{
 -	unsigned long util, irq, scale;
 -	struct rq *rq =3D cpu_rq(cpu);
 -
 -	scale =3D arch_scale_cpu_capacity(cpu);
 -
 -	/*
 -	 * Early check to see if IRQ/steal time saturates the CPU, can be
 -	 * because of inaccuracies in how we track these -- see
 -	 * update_irq_load_avg().
 -	 */
 -	irq =3D cpu_util_irq(rq);
 -	if (unlikely(irq >=3D scale)) {
 -		if (min)
 -			*min =3D scale;
 -		if (max)
 -			*max =3D scale;
 -		return scale;
 -	}
 -
 -	if (min) {
 -		/*
 -		 * The minimum utilization returns the highest level between:
 -		 * - the computed DL bandwidth needed with the IRQ pressure which
 -		 *   steals time to the deadline task.
 -		 * - The minimum performance requirement for CFS and/or RT.
 -		 */
 -		*min =3D max(irq + cpu_bw_dl(rq), uclamp_rq_get(rq, UCLAMP_MIN));
 -
 -		/*
 -		 * When an RT task is runnable and uclamp is not used, we must
 -		 * ensure that the task will run at maximum compute capacity.
 -		 */
 -		if (!uclamp_is_used() && rt_rq_is_runnable(&rq->rt))
 -			*min =3D max(*min, scale);
 -	}
 -
 -	/*
 -	 * Because the time spend on RT/DL tasks is visible as 'lost' time to
 -	 * CFS tasks and we use the same metric to track the effective
 -	 * utilization (PELT windows are synchronized) we can directly add them
 -	 * to obtain the CPU's actual utilization.
 -	 */
 -	util =3D util_cfs + cpu_util_rt(rq);
 -	util +=3D cpu_util_dl(rq);
 -
 -	/*
 -	 * The maximum hint is a soft bandwidth requirement, which can be lower
 -	 * than the actual utilization because of uclamp_max requirements.
 -	 */
 -	if (max)
 -		*max =3D min(scale, uclamp_rq_get(rq, UCLAMP_MAX));
 -
 -	if (util >=3D scale)
 -		return scale;
 -
 -	/*
 -	 * There is still idle time; further improve the number by using the
 -	 * IRQ metric. Because IRQ/steal time is hidden from the task clock we
 -	 * need to scale the task numbers:
 -	 *
 -	 *              max - irq
 -	 *   U' =3D irq + --------- * U
 -	 *                 max
 -	 */
 -	util =3D scale_irq_capacity(util, irq, scale);
 -	util +=3D irq;
 -
 -	return min(scale, util);
 -}
 -
 -unsigned long sched_cpu_util(int cpu)
 -{
 -	return effective_cpu_util(cpu, cpu_util_cfs(cpu), NULL, NULL);
 -}
+ #endif /* CONFIG_SMP */
+=20
  /**
   * find_process_by_pid - find a process with a matching PID value.
   * @pid: the pid in question.

--Sig_/s.quQoGObOJ+Xl/v8R8Iq2j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhO24ACgkQAVBC80lX
0GxAcQf9EMQmK2Gl0YcQlnzjI/Psp/DRLAJEfhhW1gu9TFJFG3phn2Qsmpq3LAKB
ZYDFeVi9CEQ18VzKoi5LRTqomjmpfrlfoy2rTkIrL9/dR9xA3TBK6hWuVpVxHW5v
yeLMzO76UemKiX9F2HgUEMaf6/B1bm96zthzFPAJN3DM8FR8PK+iTeMgLEOGAlR+
qQ5etf8wtrrn1eYZLVzMSET/n86l/nnY/cYiHof67G1OlM6kQCD5MHsrGsXiFdl7
j7okeuaEhJi95KqFTX7pXx9mK7h+NZPK/Mxe+UTVkXXIkDm4cy+TIc3zVeFJmdkl
UTxjRL29Om7zSsk2wjU2d2E2Db/ORg==
=py34
-----END PGP SIGNATURE-----

--Sig_/s.quQoGObOJ+Xl/v8R8Iq2j--

