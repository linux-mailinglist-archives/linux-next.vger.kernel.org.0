Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8E626A603
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 15:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgIONNL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 09:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgIONLF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 09:11:05 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7181C06178A;
        Tue, 15 Sep 2020 06:11:04 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id ef16so1650609qvb.8;
        Tue, 15 Sep 2020 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Op4Uh59qL63YT0usxFuHkJ5g//0WvryB7nEITuGpAyc=;
        b=Oqj/bAONA2sJIdV5yutBnpoAGEHbw9fTdjKwNzNrTZz2NxlgFczbBVmY8gsXFf/xAk
         cTykHtIbYNMs4svrJOp3ggc3OMr9jmSpDfMdyQK0DWd8xf1HnlAfnETAflX/jvpnEaTd
         Gg9Mv+xbQgn2TaS91TAqnm4D6N969BlA10Hbf6IWCkTGpDeVX5OzLVpjUGp2wDhx3Wbt
         kZzW4CJABhvSEK+fdgiGs/9QWGc0BA403RLbf7FVs/fF58dLTLCL3cTcfjbFZxW605gn
         vNrImzCGQaerPs/HUmNASonfnOaQIoPm9n1Zh4pVbeeTTeFYElMJ6HCQc9OrB+MoBXNk
         nLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Op4Uh59qL63YT0usxFuHkJ5g//0WvryB7nEITuGpAyc=;
        b=tFre3+Nkj9dYA61VniZDPenc/xHh7whGbG/5HzpGRhe+vIYEVcRZogl85LhofWgpNs
         mmz0sd8MFf0Cc1w9MF4QhOBPiq0BbKmfrOIHxON3Gz5GhWU3Fr3aVDvPSG0jW9IoxAJm
         4mo31Lr/2sa+KUKNB41V2Fu0dt8U4yWniOxljMv6Tzpj6x+Kinw72DOiEJQfdYRvcpdn
         MSUEZlE5Cg38OEiRnnCgC3lcUM5Gdd/dHOFDpr53XpLGxaDavVhQELJIO6kKEjhDceMp
         xNuc/Zy6hIfMa76pBtAYPXjzyuPfrumaUsQ63wZ1SIN35bleENhua6fvm2PlvPGsZUat
         evNA==
X-Gm-Message-State: AOAM532Lc7plTz8b0yl1U9KFqKPiUVeO6msEhU/+0SaIUbM/XoNHeBej
        yOkSgr7FiykSmzOYFleccBA=
X-Google-Smtp-Source: ABdhPJy05oYi7s4PC56Edy9zJPTT0/PPHMpyT8eWNskZGJZtl2QRbpSCK/nd/kMp4G/ZZcJxS/ftvw==
X-Received: by 2002:a0c:b3d7:: with SMTP id b23mr1621388qvf.33.1600175464043;
        Tue, 15 Sep 2020 06:11:04 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id 192sm16643833qkm.110.2020.09.15.06.11.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:11:03 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailauth.nyi.internal (Postfix) with ESMTP id 946BB27C005A;
        Tue, 15 Sep 2020 09:11:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 15 Sep 2020 09:11:02 -0400
X-ME-Sender: <xms:Zb1gX8qRDhtX5w6CZFFdZGmlnCTO-MftyszEDnH7GAhlo2nmHK6nNQ>
    <xme:Zb1gXyqrXXb6aVbxaa9S3rLNb81AADl9V3pnuNI7UxW19fDO70RP0Y3oazy3Zmabp
    oUeVYQOMB1pV-DtNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddtgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeevieejtdfhieejfeduheehvdevgedugeethefggfdtvdeutdevgeetvddvfeeg
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeehvddrudehhedrudduud
    drjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    sghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtie
    egqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhi
    gihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:Zb1gXxP1wbur_9-ZJOtcxBZYh6hMkSfVy7A3KORuuq-XSsoOOWpIwQ>
    <xmx:Zb1gXz7XK-AqXKCYD0YFvwGudQinH4lYr57_1QBnv14eh01PdQGnFg>
    <xmx:Zb1gX74deEO9sXVagDCHd4qa5IReZtpVNfFXTWqFHb4nD84ntK_7yA>
    <xmx:Zr1gX_gK1QexdA2I8iiWXgA9X-F4ABBK1FNdmOahRaI7vo2BgKhW6PLpwF0>
Received: from localhost (unknown [52.155.111.71])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0CDD4328005D;
        Tue, 15 Sep 2020 09:11:00 -0400 (EDT)
Date:   Tue, 15 Sep 2020 21:10:59 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Qian Cai <cai@redhat.com>
Cc:     "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 0/5] seqlock: Introduce PREEMPT_RT support
Message-ID: <20200915131059.GB127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de>
 <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com>
 <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote:
> On Mon, Sep 14, 2020 at 08:20:53PM -0400, Qian Cai wrote:
> > On Fri, 2020-09-04 at 17:32 +0200, Ahmed S. Darwish wrote:
> > > Hi,
> > > 
> > > Changelog-v2
> > > ============
> > > 
> > >   - Standardize on seqcount_LOCKNAME_t as the canonical reference for
> > >     sequence counters with associated locks, instead of v1
> > >     seqcount_LOCKTYPE_t.
> > > 
> > >   - Use unique prefix "seqprop_*" for all seqcount_t/seqcount_LOCKNAME_t
> > >     property accessors.
> > > 
> > >   - Touch-up the lock-unlock rationale for more clarity. Enforce writer
> > >     non-preemitiblity using "__seq_enforce_writer_non_preemptibility()".
> > > 
> > > Cover letter (v1)
> > > =================
> > > 
> > > https://lkml.kernel.org/r/20200828010710.5407-1-a.darwish@linutronix.de
> > > 
> > > Preemption must be disabled before entering a sequence counter write
> > > side critical section.  Otherwise the read side section can preempt the
> > > write side section and spin for the entire scheduler tick.  If that
> > > reader belongs to a real-time scheduling class, it can spin forever and
> > > the kernel will livelock.
> > > 
> > > Disabling preemption cannot be done for PREEMPT_RT though: it can lead
> > > to higher latencies, and the write side sections will not be able to
> > > acquire locks which become sleeping locks (e.g. spinlock_t).
> > > 
> > > To remain preemptible, while avoiding a possible livelock caused by the
> > > reader preempting the writer, use a different technique: let the reader
> > > detect if a seqcount_LOCKNAME_t writer is in progress. If that's the
> > > case, acquire then release the associated LOCKNAME writer serialization
> > > lock. This will allow any possibly-preempted writer to make progress
> > > until the end of its writer serialization lock critical section.
> > > 
> > > Implement this lock-unlock technique for all seqcount_LOCKNAME_t with
> > > an associated (PREEMPT_RT) sleeping lock, and for seqlock_t.
> > 
> > Reverting this patchset [1] from today's linux-next fixed a splat below. The
> > splat looks like a false positive anyway because the existing locking dependency
> > chains from the task #1 here:
> > 
> > &s->seqcount#2 ---> pidmap_lock
> > 
> > [  528.078061][ T7867] -> #1 (pidmap_lock){....}-{2:2}:
> > [  528.078078][ T7867]        lock_acquire+0x10c/0x560
> > [  528.078089][ T7867]        _raw_spin_lock_irqsave+0x64/0xb0
> > [  528.078108][ T7867]        free_pid+0x5c/0x160
> > free_pid at kernel/pid.c:131
> > [  528.078127][ T7867]        release_task.part.40+0x59c/0x7f0
> > __unhash_process at kernel/exit.c:76
> > (inlined by) __exit_signal at kernel/exit.c:147
> > (inlined by) release_task at kernel/exit.c:198
> > [  528.078145][ T7867]        do_exit+0x77c/0xda0
> > exit_notify at kernel/exit.c:679
> > (inlined by) do_exit at kernel/exit.c:826
> > [  528.078163][ T7867]        kthread+0x148/0x1d0
> > [  528.078182][ T7867]        ret_from_kernel_thread+0x5c/0x80
> > 
> > It is write_seqlock(&sig->stats_lock) in __exit_signal(), but the &s->seqcount#2 
> > in read_mems_allowed_begin() is read_seqcount_begin(&current->mems_allowed_seq), 
> > so there should be no deadlock?
> > 
> 
> I think this happened because seqcount_##lockname##_init() is defined at
> function rather than macro, so when the seqcount_init() gets expand in
> that function, the lock_class_key of seqcount will be a static variable
> of seqcount_##lockname##_init() function, as a result, all
> seqcount_##lockname##_t in the same compile unit (in this case it's
> kernel/fork.c) share the same lock class key, and lockdep thought they
> are the same lock ;-)
> 

Don't know how to fix this properly, but below is an ugly attemption,
only build test, just food for thoughts.

Regards,
Boqun

--------------->8
diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index f73c7eb68f27..938a5053def3 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -84,14 +84,18 @@ static inline void __seqcount_init(seqcount_t *s, const char *name,
 # define SEQCOUNT_DEP_MAP_INIT(lockname)				\
 		.dep_map = { .name = #lockname }
 
+# define MSIOCU 8 /* MAX SEQCOUNT IN ON COMPILE UNIT */
 /**
  * seqcount_init() - runtime initializer for seqcount_t
  * @s: Pointer to the seqcount_t instance
  */
 # define seqcount_init(s)						\
 	do {								\
-		static struct lock_class_key __key;			\
-		__seqcount_init((s), #s, &__key);			\
+		static struct lock_class_key __key[MSIOCU];		\
+		static int idx = 0;					\
+									\
+		BUG_ON(idx >= MSIOCU);					\
+		__seqcount_init((s), #s, &__key[idx++]);		\
 	} while (0)
 
 static inline void seqcount_lockdep_reader_access(const seqcount_t *s)
