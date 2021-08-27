Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D203F936A
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 06:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhH0EKJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 00:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhH0EKI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 00:10:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F64C061757;
        Thu, 26 Aug 2021 21:09:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwmSC2pHtz9sPf;
        Fri, 27 Aug 2021 14:09:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630037357;
        bh=HrzSWAQwOwjPU1v6TeYmsOkX4v4YrwL3sEtfva0WF8M=;
        h=Date:From:To:Cc:Subject:From;
        b=n+LBkEvRGlKvl0uMs9yCvvxtaRSMfuBS3iSjSuOY27XgsrZlLBjhdVBPMk4dKslqA
         ai6InSB+9CsWSrV8SlhWTN6RyNvQN7JR0bekHOM5cEt2xj720jtBUQOQebvsUfdkfo
         aa35/ZaayR7QK/i7EaVejPZj0H2n1IJ2lSa+RsJ9w/0YBp8jowmBfiTrXuLs5DSp1D
         s2hY1/Ox/t6BVrk2pfRsrnl9ScQL2BiEALjvXiPBKTp3rYNAhq6s1uBw2Ocb61/7ij
         C+gXr7kfbE9cTSviBckT89cgVglqSit34/FbHlQT39I579cE9kGFcU7ZIHuvIp0J3J
         f312RhPhhJnvA==
Date:   Fri, 27 Aug 2021 14:09:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20210827140913.422a7a06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9PALBqedgw3k4ZMv4nAMTM+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9PALBqedgw3k4ZMv4nAMTM+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  arch/arm64/kernel/process.c
  arch/arm64/kernel/signal.c

between commits:

  d2e0d8f9746d ("arm64: move preemption disablement to prctl handlers")
  4d1c2ee2709f ("arm64: entry: move bulk of ret_to_user to C")

from the arm64 tree and commit:

  94f9c00f6460 ("arm64: Remove logic to kill 32-bit tasks on 64-bit-only co=
res")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/process.c
index 8334facd5356,e0e7f4e9b607..000000000000
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@@ -469,22 -469,7 +470,13 @@@ static void erratum_1418040_thread_swit
  	write_sysreg(val, cntkctl_el1);
  }
 =20
- static void compat_thread_switch(struct task_struct *next)
- {
- 	if (!is_compat_thread(task_thread_info(next)))
- 		return;
-=20
- 	if (static_branch_unlikely(&arm64_mismatched_32bit_el0))
- 		set_tsk_thread_flag(next, TIF_NOTIFY_RESUME);
- }
-=20
 -static void update_sctlr_el1(u64 sctlr)
 +/*
 + * __switch_to() checks current->thread.sctlr_user as an optimisation. Th=
erefore
 + * this function must be called with preemption disabled and the update to
 + * sctlr_user must be made in the same preemption disabled block so that
 + * __switch_to() does not see the variable update before the SCTLR_EL1 on=
e.
 + */
 +void update_sctlr_el1(u64 sctlr)
  {
  	/*
  	 * EnIA must not be cleared while in the kernel as this is necessary for
diff --cc arch/arm64/kernel/signal.c
index e42743134ae2,22899c86711a..000000000000
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@@ -917,20 -912,8 +917,7 @@@ static void do_signal(struct pt_regs *r
  	restore_saved_sigmask();
  }
 =20
- static bool cpu_affinity_invalid(struct pt_regs *regs)
- {
- 	if (!compat_user_mode(regs))
- 		return false;
-=20
- 	/*
- 	 * We're preemptible, but a reschedule will cause us to check the
- 	 * affinity again.
- 	 */
- 	return !cpumask_test_cpu(raw_smp_processor_id(),
- 				 system_32bit_el0_cpumask());
- }
-=20
 -asmlinkage void do_notify_resume(struct pt_regs *regs,
 -				 unsigned long thread_flags)
 +void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
  {
  	do {
  		if (thread_flags & _TIF_NEED_RESCHED) {

--Sig_/9PALBqedgw3k4ZMv4nAMTM+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoZWkACgkQAVBC80lX
0Gw7dQf9FDuexBWAMjFE9oqH4ltqtekf3WuqBHqaguL5DmYRD5uMmpK+d1Plqplh
6Uad+j1JnHOIubI1wEiNdNE7iIfDP+DGwGdXS+fus5nRwMtpVVr9wKDmFqUCTCxk
ytPHd1vz5uSEpSBPuoywP2Hfcqh96GidSdixi8iOcy194nq90CBTKI1B79L6/9xN
ZXw0Sex7vPo1SVTYuxumII5qBu9qkOBtTSqGAOAzOe82W1GLqqi0PcDq5GPRsw7a
kc1QWDZqk6PD19pockBCz/JhF8/4EPfsZQyOIdbQ2jNgjAA39EmKpPgL8WfkzT/4
/XtwXPqykyuleVBL6gnRMUpCmkRI/Q==
=u3lP
-----END PGP SIGNATURE-----

--Sig_/9PALBqedgw3k4ZMv4nAMTM+--
