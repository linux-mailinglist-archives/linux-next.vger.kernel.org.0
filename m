Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63A33B147F
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 09:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhFWHV6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 03:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWHV5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 03:21:57 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64553C061756
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 00:19:40 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u11so1368342wrw.11
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=21puqW29t86xGfSi5HSzmOjJvQHm057n0q9wPA/grvU=;
        b=xGjn4ldnrXPkexrjRtVGXZTBnCC4cjeCdjwd6WS3YMI3YJeOvl7B9ozn9i0JfzZqZl
         llPgA8CVDqhYrZlFHS8Eq+SPkJHTs7kWPUMTdsYwH/YtC4CyaODTbuDylJpamyF6s/I+
         EmhAXNc8SG6DJq4bDY0k1kif13meb4qWpJ45Epe44N5mi783SMmBxkCiGkH9JWcJMl56
         bG5fAkpgseEVh3pdQcs4m+QBNZ84tMbRc5EzgjslapjNU1jlXf4UiN+fyB7bw6cr8bwn
         DM5HDgyQUTF39F3sbnpY6Hvh1FzgqdH7s70U7RR9oVDSlrADR7DAnt7vK0UUQbuU+sdW
         ru3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=21puqW29t86xGfSi5HSzmOjJvQHm057n0q9wPA/grvU=;
        b=pu+iXrePdvhOfablS7FCHPIKCPdGQbe9ERwaqXy1IX5T0mymArtTKfknR8w79lAVSz
         fXAhQVo5cCmNwTPNfa2MwO9vyftgR0iukoTRk3MzNXB9yHxrTdIf7QIKhgsOwh6WzcRX
         9OL/4MHeCpl1wYnaoBYBPifdKYVa4h45zpZV2j70m6R2bHxcjCJuzH217ykwzPxI8XQb
         tdwXR85JpIVLaIBBE3rzZIkzY5vB3iXIxwax29tL+VeKn4MKdMZiUsVlO9ztGwfHbKTh
         tgWK0Ln8wE74/1kbbVx/nVVSddq8kTzecioh9gmE5wWGvJJ122H3ds9l8/4gzr7ZQuoz
         OYyQ==
X-Gm-Message-State: AOAM532VGuTzIG/SAE/cF2T11dSvonju+zmJ58e5nnu6RfuheMqnfJzk
        covIIMslh+tx23PeGKm6Xhf4+w==
X-Google-Smtp-Source: ABdhPJyJVP+XY/bgHu6Q1O5YRjDlIWDO7nU7d0s33iuIhkuqN3W49MCTNTdewvpGaMo6r8WnsUab2g==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr9722185wri.152.1624432778211;
        Wed, 23 Jun 2021 00:19:38 -0700 (PDT)
Received: from vingu-book (91-160-61-128.subs.proxad.net. [91.160.61.128])
        by smtp.gmail.com with ESMTPSA id m5sm5227329wmg.32.2021.06.23.00.19.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Jun 2021 00:19:37 -0700 (PDT)
Date:   Wed, 23 Jun 2021 09:19:36 +0200
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Odin Ugedal <odin@uged.al>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
Message-ID: <20210623071935.GA29143@vingu-book>
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Sachin,

Le mardi 22 juin 2021 à 21:29:36 (+0530), Sachin Sant a écrit :
> >> On Tue, 22 Jun 2021 at 09:39, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
> >>> 
> >>> While booting 5.13.0-rc7-next-20210621 on a PowerVM LPAR following warning
> >>> is seen
> >>> 
> >>> [   30.922154] ------------[ cut here ]------------
> >>> [   30.922201] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || cfs_rq->avg.runnable_avg
> >>> [   30.922219] WARNING: CPU: 6 PID: 762 at kernel/sched/fair.c:3277 update_blocked_averages+0x758/0x780
> >> 
> >> Yes. That was exactly the purpose of the patch. There is one last
> >> remaining part which could generate this. I'm going to prepare a patch
> > 
> > Could you try the patch below ? I have been able to reproduce the problem locally and this
> > fix it on my system:
> > 
> I can recreate the issue with this patch.

ok, so your problem seem to be different from my assumption. Could you try
the patch below on top of the previous one ?

This will help us to confirm that the problem comes from load_avg and that
it's linked to the cfs load_avg and it's not a problem happening earlier in
the update of PELT.


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da91db1c137f..8a6566f945a0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3030,8 +3030,9 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static inline void
 enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
+       u32 divider = get_pelt_divider(&se->avg);
        cfs_rq->avg.load_avg += se->avg.load_avg;
-       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
+       cfs_rq->avg.load_sum = cfs_rq->avg.load_avg * divider;
 }
 
 static inline void
@@ -3304,9 +3305,9 @@ static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
         * Make sure that rounding and/or propagation of PELT values never
         * break this.
         */
-       SCHED_WARN_ON(cfs_rq->avg.load_avg ||
-                     cfs_rq->avg.util_avg ||
-                     cfs_rq->avg.runnable_avg);
+       SCHED_WARN_ON(cfs_rq->avg.load_avg);
+       SCHED_WARN_ON(cfs_rq->avg.util_avg);
+       SCHED_WARN_ON(cfs_rq->avg.runnable_avg);
 
        return true;
 }


> 
>          Starting Terminate Plymouth Boot Screen...
>          Starting Hold until boot process finishes up...
> [FAILED] Failed to start Crash recovery kernel arming.
> See 'systemctl status kdump.service' for details.
> [   10.737913] ------------[ cut here ]------------
> [   10.737960] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || cfs_rq->avg.runnable_avg
> [   10.737976] WARNING: CPU: 27 PID: 146 at kernel/sched/fair.c:3279 update_blocked_averages+0x758/0x780
> [   10.738010] Modules linked in: stp llc rfkill sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables xfs libcrc32c sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp dm_mirror dm_region_hash dm_log dm_mod fuse
> [   10.738089] CPU: 27 PID: 146 Comm: ksoftirqd/27 Not tainted 5.13.0-rc7-next-20210621-dirty #2
> [   10.738103] NIP:  c0000000001b2768 LR: c0000000001b2764 CTR: c000000000729120
> [   10.738116] REGS: c000000015973840 TRAP: 0700   Not tainted  (5.13.0-rc7-next-20210621-dirty)
> [   10.738130] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48000224  XER: 00000005
> [   10.738161] CFAR: c00000000014d120 IRQMASK: 1 
> [   10.738161] GPR00: c0000000001b2764 c000000015973ae0 c0000000029bb900 0000000000000048 
> [   10.738161] GPR04: 00000000fffeffff c0000000159737a0 0000000000000027 c00000154f9f7e18 
> [   10.738161] GPR08: 0000000000000023 0000000000000001 0000000000000027 c00000167f1d7fe8 
> [   10.738161] GPR12: 0000000000000000 c00000154ffd7e80 c00000154fa82580 000000000000b78a 
> [   10.738161] GPR16: 000000028007883c 00000000000002ed c000000038d31000 0000000000000000 
> [   10.738161] GPR20: 0000000000000000 c0000000029fdfe0 0000000000000000 000000000000037b 
> [   10.738161] GPR24: 0000000000000000 c00000154fa82f90 0000000000000001 c00000003d4ca400 
> [   10.738161] GPR28: 00000000000002ed c000000038d311c0 c000000038d31100 0000000000000000 
> [   10.738281] NIP [c0000000001b2768] update_blocked_averages+0x758/0x780
> [   10.738290] LR [c0000000001b2764] update_blocked_averages+0x754/0x780
> [   10.738299] Call Trace:
> [   10.738303] [c000000015973ae0] [c0000000001b2764] update_blocked_averages+0x754/0x780 (unreliable)
> [   10.738315] [c000000015973c00] [c0000000001be720] run_rebalance_domains+0xa0/0xd0
> [   10.738326] [c000000015973c30] [c000000000cf9acc] __do_softirq+0x15c/0x3d4
> [   10.738337] [c000000015973d20] [c000000000158464] run_ksoftirqd+0x64/0x90
> [   10.738346] [c000000015973d40] [c00000000018fd24] smpboot_thread_fn+0x204/0x270
> [   10.738357] [c000000015973da0] [c000000000189770] kthread+0x190/0x1a0
> [   10.738367] [c000000015973e10] [c00000000000ceec] ret_from_kernel_thread+0x5c/0x70
> [   10.738381] Instruction dump:
> [   10.738388] 3863c808 9be9eefe 4bf9a979 60000000 0fe00000 4bfff980 e9210070 e8610088 
> [   10.738410] 39400001 99490003 4bf9a959 60000000 <0fe00000> 4bfffc24 3d22fff6 8929eefb 
> [   10.738431] ---[ end trace 9ca80b55840c53f0 ]—
> 
> Thanks
> -Sachin
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8cc27b847ad8..da91db1c137f 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -3037,8 +3037,9 @@ enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> > static inline void
> > dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> > {
> > +       u32 divider = get_pelt_divider(&se->avg);
> >        sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> > -       sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> > +       cfs_rq->avg.load_sum = cfs_rq->avg.load_avg * divider;
> > }
> > #else
> > static inline void
> > 
