Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D32C263BCE
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 06:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgIJEPo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 00:15:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgIJEOk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Sep 2020 00:14:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bn5BL0mdDz9sTd;
        Thu, 10 Sep 2020 14:14:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599711274;
        bh=0ToNN+SCr03vWf6DxJB0MIG2Mo+TsLsMYC5dxYA4kUg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=So88vAqEzvdX4eiqnXBaUrFzOiZeEGbUgWanrGhwcx7Li/KsibW6bynji+39yHMEn
         AuCuIdWqr0SOdRD0dWQfr1en70Uc6/5zDDp+JZOq5AXcA8pkRnakS0YXfPutE4/mfs
         2DZGP+YZsXHQiwk6W2RirPBAayETQjjryD0+bw27wTpB83aoySgmaleCWOidTAqH+s
         IP35F99jNQZtqkarJb9rvX1oFqF19nL8TV68LV+9cgaIy4PkcsM1H2056Km3CG+3+K
         wR5jxEXjmlaYkJizKmjlvDIFB50xg5HvPiWzM8/JyE+u65IpA6WaVkovPiiilXnXDn
         swzLwu6/F0v6w==
Date:   Thu, 10 Sep 2020 14:14:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     paulmck@kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 26
Message-ID: <20200910141432.565c8cf7@canb.auug.org.au>
In-Reply-To: <CADYN=9+BkXePzNr9u_sXtPZcziufb+eYkxVxdqPVLR9czR6Otg@mail.gmail.com>
References: <20200826163330.16e5b0d4@canb.auug.org.au>
        <CADYN=9KQcdLH=BfXZ2riuH0icw7d+2HbfPxvww7fiJG2G=8ALQ@mail.gmail.com>
        <20200826193945.GT2855@paulmck-ThinkPad-P72>
        <CADYN=9+XRhPOkds36JdHU-h2h3va=JJj6aeDHmNUzrpCHWEJ0A@mail.gmail.com>
        <20200828132944.GN2855@paulmck-ThinkPad-P72>
        <CADYN=9JBB6EntswRtVuUezoOzqCai2PkFP-7FDpYmAUU1+SYJA@mail.gmail.com>
        <20200828225914.GQ2855@paulmck-ThinkPad-P72>
        <CADYN=9K+g430cJZ_ay4o3ivDKdpTSTSnJMDPsEq0uDTQ7LMvSA@mail.gmail.com>
        <20200903161437.GP29330@paulmck-ThinkPad-P72>
        <CADYN=9+BkXePzNr9u_sXtPZcziufb+eYkxVxdqPVLR9czR6Otg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QGFC1LuwA57VoEB5gDvnLMd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QGFC1LuwA57VoEB5gDvnLMd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 Sep 2020 10:55:47 +0200 Anders Roxell <anders.roxell@linaro.org> =
wrote:
>
> On Thu, 3 Sep 2020 at 18:14, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Sep 03, 2020 at 10:39:10AM +0200, Anders Roxell wrote: =20
> > > Hi Paul,
> > >
> > > On Sat, 29 Aug 2020 at 00:59, Paul E. McKenney <paulmck@kernel.org> w=
rote: =20
> > > >
> > > > On Fri, Aug 28, 2020 at 09:24:19PM +0200, Anders Roxell wrote: =20
> > > > > On Fri, 28 Aug 2020 at 15:29, Paul E. McKenney <paulmck@kernel.or=
g> wrote: =20
> > > > > >
> > > > > > On Fri, Aug 28, 2020 at 09:37:17AM +0200, Anders Roxell wrote: =
=20
> > > > > > > On Wed, 26 Aug 2020 at 21:39, Paul E. McKenney <paulmck@kerne=
l.org> wrote: =20
> > > > > > > >
> > > > > > > > On Wed, Aug 26, 2020 at 08:19:01PM +0200, Anders Roxell wro=
te: =20
> > > > > > > > > On Wed, 26 Aug 2020 at 08:33, Stephen Rothwell <sfr@canb.=
auug.org.au> wrote: =20
> > > > > > > >
> > > > > > > > [ . . . ]
> > > > > > > > =20
> > > > > > > > > I've built and run an arm64 allmodconfig kernel where I u=
se the
> > > > > > > > > defconfig as the base, I do this for testing purposes.
> > > > > > > > > I can see the following call trace [1]:
> > > > > > > > >
> > > > > > > > > [ 2595.811453][    T1] Running tests on all trace events:
> > > > > > > > > [ 2595.860933][    T1] Testing all events:
> > > > > > > > > [ 4316.066072][    T8] kworker/dying (8) used greatest st=
ack depth:
> > > > > > > > > 27056 bytes left
> > > > > > > > > [ 8561.924871][    C0] watchdog: BUG: soft lockup - CPU#0=
 stuck for
> > > > > > > > > 22s! [migration/0:14]
> > > > > > > > > [ 8561.934498][    C0] Modules linked in:
> > > > > > > > > [ 8561.942303][    C0] irq event stamp: 4044
> > > > > > > > > [ 8561.949044][    C0] hardirqs last  enabled at (4043):
> > > > > > > > > [<ffffa000126b530c>] _raw_spin_unlock_irqrestore+0xac/0x1=
38
> > > > > > > > > [ 8561.960848][    C0] hardirqs last disabled at (4044):
> > > > > > > > > [<ffffa000126a89f8>] __schedule+0xf8/0x7e0
> > > > > > > > > [ 8561.971418][    C0] softirqs last  enabled at (3698):
> > > > > > > > > [<ffffa00010001b04>] __do_softirq+0x524/0x5f8
> > > > > > > > > [ 8561.982191][    C0] softirqs last disabled at (3689):
> > > > > > > > > [<ffffa000101216c8>] __irq_exit_rcu+0x128/0x1a0
> > > > > > > > > [ 8561.993068][    C0] CPU: 0 PID: 14 Comm: migration/0 T=
ainted: G
> > > > > > > > >    W         5.9.0-rc2-next-20200826-00005-g24628bb4c0bf =
#1
> > > > > > > > > [ 8562.005684][    C0] Hardware name: linux,dummy-virt (D=
T)
> > > > > > > > > [ 8562.013247][    C0] pstate: 80400005 (Nzcv daif +PAN -=
UAO BTYPE=3D--)
> > > > > > > > > [ 8562.021657][    C0] pc : arch_local_irq_enable+0x58/0x=
80
> > > > > > > > > [ 8562.029323][    C0] lr : _raw_spin_unlock_irq+0x84/0xc0
> > > > > > > > > [ 8562.036739][    C0] sp : ffff0000698efaa0
> > > > > > > > > [ 8562.042984][    C0] x29: ffff0000698efaa0 x28: ffff000=
06ad0f270
> > > > > > > > > [ 8562.053814][    C0] x27: ffff00006ad0f248 x26: ffff000=
0698d4718
> > > > > > > > > [ 8562.064687][    C0] x25: ffff00006ad0e798 x24: ffffa00=
0139e3a40
> > > > > > > > > [ 8562.075506][    C0] x23: 0000000000000001 x22: ffffa00=
0154f5000
> > > > > > > > > [ 8562.086425][    C0] x21: ffff00006ad0e798 x20: ffff000=
06ad0e780
> > > > > > > > > [ 8562.097255][    C0] x19: ffffa000126a905c x18: 0000000=
0000014c0
> > > > > > > > > [ 8562.108071][    C0] x17: 0000000000001500 x16: 0000000=
000001440
> > > > > > > > > [ 8562.118918][    C0] x15: 00000000f1f1f1f1 x14: 003d090=
000000000
> > > > > > > > > [ 8562.129739][    C0] x13: 00003d0900000000 x12: ffff800=
00d31df41
> > > > > > > > > [ 8562.140544][    C0] x11: 1fffe0000d31df40 x10: ffff800=
00d31df40
> > > > > > > > > [ 8562.151366][    C0] x9 : dfffa00000000000 x8 : ffff000=
0698efa07
> > > > > > > > > [ 8562.162247][    C0] x7 : 0000000000000001 x6 : 00007ff=
ff2ce20c0
> > > > > > > > > [ 8562.173072][    C0] x5 : ffff0000698d4040 x4 : dfffa00=
000000000
> > > > > > > > > [ 8562.183954][    C0] x3 : ffffa0001040f904 x2 : 0000000=
000000007
> > > > > > > > > [ 8562.194811][    C0] x1 : ffffa00014080000 x0 : 0000000=
0000000e0
> > > > > > > > > [ 8562.205858][    C0] Call trace:
> > > > > > > > > [ 8562.211739][    C0]  arch_local_irq_enable+0x58/0x80
> > > > > > > > > [ 8562.219076][    C0]  _raw_spin_unlock_irq+0x84/0xc0
> > > > > > > > > [ 8562.226394][    C0]  __schedule+0x75c/0x7e0
> > > > > > > > > [ 8562.233074][    C0]  preempt_schedule_notrace+0x64/0xc0
> > > > > > > > > [ 8562.268210][    C0]  ftrace_ops_list_func+0x494/0x4e0
> > > > > > > > > [ 8562.275735][    C0]  ftrace_graph_call+0x0/0x4
> > > > > > > > > [ 8562.282647][    C0]  preempt_count_add+0xc/0x240
> > > > > > > > > [ 8562.289686][    C0]  schedule+0xe4/0x160
> > > > > > > > > [ 8562.296187][    C0]  smpboot_thread_fn+0x47c/0x540
> > > > > > > > > [ 8562.303377][    C0]  kthread+0x23c/0x260
> > > > > > > > > [ 8562.309906][    C0]  ret_from_fork+0x10/0x18
> > > > > > > > > [ 8562.316604][    C0] Kernel panic - not syncing: softlo=
ckup: hung tasks
> > > > > > > > > [ 8562.325230][    C0] CPU: 0 PID: 14 Comm: migration/0 T=
ainted: G
> > > > > > > > >    W    L    5.9.0-rc2-next-20200826-00005-g24628bb4c0bf =
#1
> > > > > > > > > [ 8562.337861][    C0] Hardware name: linux,dummy-virt (D=
T)
> > > > > > > > > [ 8562.345374][    C0] Call trace:
> > > > > > > > > [ 8562.351228][    C0]  dump_backtrace+0x0/0x320
> > > > > > > > > [ 8562.358070][    C0]  show_stack+0x38/0x60
> > > > > > > > > [ 8562.364728][    C0]  dump_stack+0x1c0/0x280
> > > > > > > > > [ 8562.371447][    C0]  panic+0x32c/0x614
> > > > > > > > > [ 8562.377868][    C0]  watchdog_timer_fn+0x49c/0x560
> > > > > > > > > [ 8562.385076][    C0]  __run_hrtimer+0x1cc/0x360
> > > > > > > > > [ 8562.392021][    C0]  __hrtimer_run_queues+0x1a0/0x220
> > > > > > > > > [ 8562.399500][    C0]  hrtimer_interrupt+0x1f8/0x440
> > > > > > > > > [ 8562.406807][    C0]  arch_timer_handler_virt+0x68/0xa0
> > > > > > > > > [ 8562.414338][    C0]  handle_percpu_devid_irq+0x118/0x2=
a0
> > > > > > > > > [ 8562.421992][    C0]  __handle_domain_irq+0x150/0x1c0
> > > > > > > > > [ 8562.429315][    C0]  gic_handle_irq+0x98/0x120
> > > > > > > > > [ 8562.436297][    C0]  el1_irq+0xd4/0x1c0 =20
> > > > > > > >
> > > > > > > > We appear to have taken an interrupt here, just after relea=
sing
> > > > > > > > an irq-disabled lock and enabling interrupts.
> > > > > > > > =20
> > > > > > > > > [ 8562.442748][    C0]  arch_local_irq_enable+0x58/0x80
> > > > > > > > > [ 8562.450116][    C0]  _raw_spin_unlock_irq+0x84/0xc0
> > > > > > > > > [ 8562.457360][    C0]  __schedule+0x75c/0x7e0
> > > > > > > > > [ 8562.464142][    C0]  preempt_schedule_notrace+0x64/0xc0
> > > > > > > > > [ 8562.471745][    C0]  ftrace_ops_list_func+0x494/0x4e0
> > > > > > > > > [ 8562.479195][    C0]  ftrace_graph_call+0x0/0x4
> > > > > > > > > [ 8562.486159][    C0]  preempt_count_add+0xc/0x240
> > > > > > > > > [ 8562.493210][    C0]  schedule+0xe4/0x160 =20
> > > > > > > >
> > > > > > > > We are trying to sleep, so we took a pass through the sched=
uler and
> > > > > > > > did some tracing.
> > > > > > > > =20
> > > > > > > > > [ 8562.499737][    C0]  smpboot_thread_fn+0x47c/0x540 =20
> > > > > > > >
> > > > > > > > Here we might be bringing up a CPU?  Except that according =
to your
> > > > > > > > dmesg, there is only one CPU.  ("RCU restricting CPUs from =
NR_CPUS=3D256
> > > > > > > > to nr_cpu_ids=3D1").  So this seems unlikely.
> > > > > > > >
> > > > > > > > Huh.  The first dmesg in output-next-20200826.log is instea=
d a
> > > > > > > > DEBUG_LOCKS_WARN_ON() from lockdep.  Might this be related?=
  Or do you
> > > > > > > > also see this warning when boot happens quickly?
> > > > > > > >
> > > > > > > > (I do see the soft lockup later on.)
> > > > > > > > =20
> > > > > > > > > [ 8562.506960][    C0]  kthread+0x23c/0x260
> > > > > > > > > [ 8562.513496][    C0]  ret_from_fork+0x10/0x18
> > > > > > > > > [ 8562.521052][    C0] Kernel Offset: disabled
> > > > > > > > > [ 8562.527725][    C0] CPU features: 0x0240002,20002004
> > > > > > > > > [ 8562.534950][    C0] Memory Limit: none
> > > > > > > > > [ 8562.543830][    C0] ---[ end Kernel panic - not syncin=
g:
> > > > > > > > > softlockup: hung tasks ]---
> > > > > > > > >
> > > > > > > > > When I tested to checkout and build e6df9766894d ("Merge =
remote-tracking branch
> > > > > > > > > 'irqchip/irq/irqchip-next' into master") that was merged =
into today's
> > > > > > > > > tag I was able to
> > > > > > > > > boot [2]. When I checked out 25e6e115dd1d ("Merge remote-=
tracking
> > > > > > > > > branch 'rcu/rcu/next' into master") and built and tested =
that I was
> > > > > > > > > able to boot [3] after a
> > > > > > > > > looong time. To clarify, the rcu merge comes after the ir=
qchip merge.
> > > > > > > > >
> > > > > > > > > I also tried to only revert the rcu tree from todays next=
 tag like this:
> > > > > > > > > "git diff e6df9766894d..25e6e115dd1d | patch -Rp1". When =
I built that
> > > > > > > > > I was able to
> > > > > > > > > boot [4] too.
> > > > > > > > >
> > > > > > > > > Any idea what's going on here? =20
> > > > > > > >
> > > > > > > > Could you please try bisecting the RCU commits? =20
> > > > > > >
> > > > > > > I did a bisect and found:
> > > > > > > 3c8e1e3eca23 ("rcu: Always set .need_qs from __rcu_read_lock(=
) for strict GPs")
> > > > > > >
> > > > > > > When I reverted that on next-20200826 and on next-20200827 the
> > > > > > > allmodconfig kernel boots [1], there's other issues that I ca=
n see in
> > > > > > > the log but not this one. =20
> > > > > >
> > > > > > Thank you for bisecting!
> > > > > >
> > > > > > I take it that you have CONFIG_RCU_STRICT_GRACE_PERIOD=3Dy in y=
our .config? =20
> > > > >
> > > > > Correct.
> > > > > =20
> > > > > > Ah, you do, according to this line in your dmesg:
> > > > > >
> > > > > >         rcu:    RCU strict (and thus non-scalable) grace period=
s enabled. =20
> > > > >
> > > > > Yup.
> > > > > =20
> > > > > >
> > > > > > And much else besides, serious debugging enabled!  ;-) =20
> > > > >
> > > > > as you can see from the time it takes to boot it is alot =3D)
> > > > > =20
> > > > > >
> > > > > > Does this reproduce with CONFIG_RCU_STRICT_GRACE_PERIOD=3Dn? =20
> > > > >
> > > > > I trying that now.
> > > > > =20
> > > > > > My guess,
> > > > > > given the commit that your bisection converged on, is that it w=
ill not
> > > > > > reproduce in that case. =20
> > > > >
> > > > > Your guess was correct, it worked =3D) =20
> > > >
> > > > I cannot reproduce this.  I would suggest enabling KASAN, but you h=
ave
> > > > already enabled it.  At this point, I suggest clearing up the other
> > > > issues.  If this issue remains, please let me know and I will see w=
hat
> > > > additional diagnostics I can provide. =20
> > >
> > > On tag next-20200902 I see this workqueue lockup [1], does that give
> > > you any ideas?
> > > when I disable CONFIG_RCU_STRICT_GRACE_PERIOD it works. =20
> >
> > Does exactly the same commit as you bisected to last time determine
> > whether this happens or not? =20
>=20
> Yes it's the exact same commit.

Has this been fixed?

--=20
Cheers,
Stephen Rothwell

--Sig_/QGFC1LuwA57VoEB5gDvnLMd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ZqCgACgkQAVBC80lX
0Gzz6gf/TA3J8ddSfEAsaA85YPgW+hVO5mTafP8BY+TNCXHuyLfEeN88V/lI3a/i
F0buSwgjjhJqwjt5KXt4Hp4h5TEaLDn5P6UbDddfeI4/XN00Egi06Mvc8Szbon2n
5fqH4J6CgutHzPyBFE8mcNZQc0nap9nBklmWX08TZzmyKTZKg6EY9Rg3q4Nwkptc
igh+HqQ3bym6LSVxjIxH84bIfTuehk8RkrEI6Tu9jhRoI17IAHA7ARTfaR08wls9
5XX6+cK5ltwOKbJNcBlqqn6VeN0oEt6+qP3tIeVjpcKrzcwwHnuEbwG/bqLq/Otu
E83/KzmTmPX49r+I84aDbqoiFLb2EA==
=O5NU
-----END PGP SIGNATURE-----

--Sig_/QGFC1LuwA57VoEB5gDvnLMd--
