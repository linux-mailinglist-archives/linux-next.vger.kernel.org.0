Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAE0220101
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 01:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgGNXVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 19:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgGNXVg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jul 2020 19:21:36 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B98C061755
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2020 16:21:36 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id a14so92215qvq.6
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2020 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0S4rzQ5/zvexxxcuzJPXf7xkIdsgLMrb/V44WQQh6fo=;
        b=piekuHQga7M6Ghik8sU3iKy+H+wCXmCt1HR1uR6bzKRxNnvEfP3H0YUhJ9gLF01AkL
         mjDRj63WdfzdUpjo+TuYDQYdX+jbeI0zILUTjBG+6TysUdkuK4OPl/xMHs3MevOBg27A
         XtdhBf0hb0aeDtEKwtBzsV3ddMaAD1/vwfUn0cPhUiIPwFiLydM5zhA+eZcaiwUTySeM
         fWNfhnq3kfajcAg6x/EckNS3hw47UW/DTOuJQO56sSy9/uBy0yjszhAaivphI0se5JzE
         f2il/YU6/beUph7MUdY/3EhVU942fNxx1Ezz5fsYIigbSbpKJTpf3DVciqIbKZySSFk0
         KicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0S4rzQ5/zvexxxcuzJPXf7xkIdsgLMrb/V44WQQh6fo=;
        b=fh2zc3XanwshiyYyblbKQUbS9ZKeAONSkLsDwEWdufeuL70Si9IYnnA4hzKm+y/oQF
         704tkw2dBqLCCZserK4MQQBwVE4no4uoCbxQPyIFK4yKnf6GGASLQk2DAc0KGOHoWxKA
         98rmatQHGbuTU9scWZiQGd8NnROdGkWNrcxZ+6ULyj+yKUV7+w+tZBF7F7UxLasA6i3N
         2PdXsCX9o7pE3w3P+2fBj8NAJnh4dzKvFj2GbWLd2GtMLQ5Xp9Cd1XJeM9zdqgk8goRp
         K2tTKBD3WIsb51fGSRWb/nfUyAJNJG4QKKlkafj+KHuf9H+evh5R1i/nDTkMmulrSFDv
         Hz4A==
X-Gm-Message-State: AOAM531cBW6ekmXr/NrHhoWQ5aZ19fH2CTmwrqN9sFf3XLAxGzlf/X/k
        RQikASjgbCnJcTLAVZ+Pikyacg==
X-Google-Smtp-Source: ABdhPJzYKlLbfgFnC68dOVTPCBNmNZMMqjqhMtgm49eQ+QrFcYEpJSgag4MBZQqF8Yz8Wnz4d7yOGw==
X-Received: by 2002:a0c:9e52:: with SMTP id z18mr6853976qve.59.1594768891932;
        Tue, 14 Jul 2020 16:21:31 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id i26sm310592qkh.14.2020.07.14.16.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 16:21:31 -0700 (PDT)
Date:   Tue, 14 Jul 2020 19:21:24 -0400
From:   Qian Cai <cai@lca.pw>
To:     Guo Xuenan <guoxuenan@huawei.com>
Cc:     axboe@kernel.dk, linux-block@vger.kernel.org, wangli74@huawei.com,
        fangwei1@huawei.com, ming.lei@redhat.com, josef@toxicpanda.com,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] blk-rq-qos: remove redundant finish_wait to
 rq_qos_wait.
Message-ID: <20200714232123.GA49251@lca.pw>
References: <20200628135625.3396636-1-guoxuenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200628135625.3396636-1-guoxuenan@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jun 28, 2020 at 09:56:25AM -0400, Guo Xuenan wrote:
> It is no need do finish_wait twice after acquiring inflight.
> 
> Signed-off-by: Guo Xuenan <guoxuenan@huawei.com>
> ---
>  block/blk-rq-qos.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/block/blk-rq-qos.c b/block/blk-rq-qos.c
> index 656460636ad3..18f3eab9f768 100644
> --- a/block/blk-rq-qos.c
> +++ b/block/blk-rq-qos.c
> @@ -273,8 +273,6 @@ void rq_qos_wait(struct rq_wait *rqw, void *private_data,
>  		if (data.got_token)
>  			break;
>  		if (!has_sleeper && acquire_inflight_cb(rqw, private_data)) {
> -			finish_wait(&rqw->wait, &data.wq);
> -
>  			/*
>  			 * We raced with wbt_wake_function() getting a token,
>  			 * which means we now have two. Put our local token
> -- 
> 2.25.4

Reverting this commit fixed an issue that swapping workloads will stall for
days without being able to make any progress below.

One reproducer:
# git clone https://gitlab.com/cailca/linux-mm
# cd linux-mm; make
# ./random 5 (just mmap and CoW)

(x86.config is also in the repo. May need to run a few times.)

This happens on a few x86 bare-metal servers and is reproducible within 30
iterations. Reverting the commit makes it run smoothly to recover from the
kernel OOM-killer for hundreds of interations. For example, this affected
server,

Dell Poweredge R6415
AMD EPYC 7401P 24-Core Processor
24576 MB memory, 239 GB disk space

has the swapping partition on LVM and megaraid_sas.

[ 1244.008647][  T329] INFO: task NetworkManager:1191 blocked for more than 120 seconds.
[ 1244.102508][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1244.174462][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1244.276589][  T329] NetworkManager  D22456  1191      1 0x00000000
[ 1244.350636][  T329] Call Trace:
[ 1244.388292][  T329]  __schedule+0x768/0x1ba0
context_switch at kernel/sched/core.c:3448
(inlined by) __schedule at kernel/sched/core.c:4169
[ 1244.439457][  T329]  ? __sched_text_start+0x8/0x8
[ 1244.495826][  T329]  ? prepare_to_wait_exclusive+0x132/0x300
[ 1244.563623][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1244.621041][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1244.675322][  T329]  schedule+0xc1/0x2b0
[ 1244.722331][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1244.775583][  T329]  io_schedule+0x17/0x60
[ 1244.824664][  T329]  rq_qos_wait+0x1ce/0x330
[ 1244.875838][  T329]  ? __wbt_done+0x30/0x30
[ 1244.925965][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1244.985452][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1245.042855][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1245.103386][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1245.157667][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1245.221321][  T329]  wbt_wait+0x144/0x290
[ 1245.269369][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1245.324694][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1245.382103][  T329]  __rq_qos_throttle+0x47/0x90
[ 1245.437437][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1245.495882][  T329]  ? lock_downgrade+0x720/0x720
[ 1245.552242][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1245.620068][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1245.684743][  T329]  ? lock_downgrade+0x720/0x720
[ 1245.741111][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1245.802681][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1245.860081][  T329]  ? lock_downgrade+0x720/0x720
[ 1245.916447][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1245.978029][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1246.042708][  T329]  submit_bio_noacct+0x845/0xe90
[ 1246.100119][  T329]  ? _cond_resched+0x10/0x20
[ 1246.153365][  T329]  ? write_cache_pages+0x6c3/0xf40
[ 1246.212850][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1246.270262][  T329]  ? submit_bio+0xe7/0x480
[ 1246.321423][  T329]  submit_bio+0xe7/0x480
[ 1246.370511][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1246.430006][  T329]  ? lock_downgrade+0x720/0x720
[ 1246.486366][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1246.541698][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1246.600143][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1246.657551][  T329]  iomap_submit_ioend+0x105/0x200
[ 1246.716001][  T329]  ? iomap_writepages+0x3d/0xa0
[ 1246.772369][  T329]  xfs_vm_writepages+0xd7/0x130
[ 1246.828739][  T329]  ? xfs_iomap_swapfile_activate+0x160/0x160
[ 1246.898624][  T329]  ? find_held_lock+0x33/0x1c0
[ 1246.953953][  T329]  do_writepages+0xcd/0x250
[ 1247.006158][  T329]  ? lock_downgrade+0x720/0x720
[ 1247.062531][  T329]  ? page_writeback_cpu_online+0x10/0x10
[ 1247.128258][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1247.186701][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1247.244118][  T329]  __filemap_fdatawrite_range+0x247/0x310
[ 1247.310884][  T329]  ? delete_from_page_cache_batch+0xac0/0xac0
[ 1247.381811][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1247.446491][  T329]  file_write_and_wait_range+0x85/0xe0
[ 1247.510146][  T329]  xfs_file_fsync+0x19a/0x7a0
[ 1247.564428][  T329]  ? xfs_file_read_iter+0x6b0/0x6b0
[ 1247.624953][  T329]  do_fsync+0x33/0x70
[ 1247.670931][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1247.729371][  T329]  __x64_sys_fsync+0x2a/0x40
[ 1247.782626][  T329]  do_syscall_64+0x5f/0x310
[ 1247.834833][  T329]  ? trace_hardirqs_off+0x12/0x1a0
[ 1247.894316][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1247.951722][  T329]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1248.020573][  T329] RIP: 0033:0x7feaeccf1107
[ 1248.071736][  T329] Code: Bad RIP value.
[ 1248.118745][  T329] RSP: 002b:00007ffd031c7650 EFLAGS: 00000293 ORIG_RAX: 000000000000004a
[ 1248.217755][  T329] RAX: ffffffffffffffda RBX: 0000000000000018 RCX: 00007feaeccf1107
[ 1248.311557][  T329] RDX: 0000000000000000 RSI: 00007ffd031c7680 RDI: 0000000000000018
[ 1248.405368][  T329] RBP: 0000000000000018 R08: 0000000000000000 R09: 0000000000027c38
[ 1248.499173][  T329] R10: 000000000000003d R11: 0000000000000293 R12: 00007feaef4beec8
[ 1248.592990][  T329] R13: 00005594769c3be0 R14: 00005594769d2a8d R15: 0000000000000000
[ 1248.686829][  T329] INFO: task gmain:1219 blocked for more than 124 seconds.
[ 1248.771246][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1248.843204][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1248.945333][  T329] gmain           D20120  1219      1 0x00004000
[ 1249.019374][  T329] Call Trace:
[ 1249.057034][  T329]  __schedule+0x768/0x1ba0
[ 1249.108197][  T329]  ? __sched_text_start+0x8/0x8
[ 1249.164608][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1249.232374][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1249.289777][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1249.344062][  T329]  schedule+0xc1/0x2b0
[ 1249.391086][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1249.444330][  T329]  io_schedule+0x17/0x60
[ 1249.493413][  T329]  rq_qos_wait+0x1ce/0x330
[ 1249.544581][  T329]  ? __wbt_done+0x30/0x30
[ 1249.594706][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1249.654193][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1249.711602][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1249.772126][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1249.826415][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1249.890070][  T329]  wbt_wait+0x144/0x290
[ 1249.938113][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1249.993437][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1250.050851][  T329]  __rq_qos_throttle+0x47/0x90
[ 1250.106175][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1250.164621][  T329]  ? lock_downgrade+0x720/0x720
[ 1250.221035][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1250.288806][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1250.353489][  T329]  ? lock_downgrade+0x720/0x720
[ 1250.409851][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1250.471419][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1250.528831][  T329]  ? lock_downgrade+0x720/0x720
[ 1250.585198][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1250.646766][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1250.711454][  T329]  submit_bio_noacct+0x845/0xe90
[ 1250.768859][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1250.826266][  T329]  ? find_held_lock+0x33/0x1c0
[ 1250.881598][  T329]  ? mark_held_locks+0xb0/0x110
[ 1250.937959][  T329]  ? submit_bio+0xe7/0x480
[ 1250.989130][  T329]  submit_bio+0xe7/0x480
[ 1251.038220][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1251.097704][  T329]  ? lock_downgrade+0x720/0x720
[ 1251.154076][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1251.230206][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1251.300129][  T329]  __swap_writepage+0xb29/0x15d0
[ 1251.357493][  T329]  ? get_swap_bio+0x390/0x390
[ 1251.411806][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1251.479587][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1251.534917][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1251.593363][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1251.650773][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1251.716498][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1251.777026][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1251.836514][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1251.892882][  T329]  ? page_swapcount+0xeb/0x180
[ 1251.948210][  T329]  ? try_to_free_swap+0x487/0x670
[ 1252.006660][  T329]  pageout+0x44b/0x1060
[ 1252.054706][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1252.107955][  T329]  ? page_not_mapped+0x10/0x10
[ 1252.163279][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1252.222768][  T329]  ? page_mapped+0xf2/0x2e0
[ 1252.274977][  T329]  shrink_page_list+0x250f/0x3f10
[ 1252.333425][  T329]  ? pageout+0x1060/0x1060
[ 1252.384591][  T329]  ? mark_lock+0x50/0x1800
[ 1252.435761][  T329]  ? find_held_lock+0x33/0x1c0
[ 1252.491088][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1252.554737][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1252.617343][  T329]  ? mark_held_locks+0xb0/0x110
[ 1252.673710][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1252.743597][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1252.804125][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1252.862571][  T329]  shrink_inactive_list+0x362/0xa10
[ 1252.923101][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1252.986747][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1253.048316][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1253.118204][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1253.175614][  T329]  shrink_lruvec+0x841/0x19e0
[ 1253.229899][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1253.299788][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1253.362395][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1253.422922][  T329]  ? lock_downgrade+0x720/0x720
[ 1253.479291][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1253.543979][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1253.602425][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1253.665032][  T329]  shrink_node+0x42b/0x1700
[ 1253.717241][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1253.778809][  T329]  ? shrink_node+0x1700/0x1700
[ 1253.834136][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1253.898823][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1253.960395][  T329]  try_to_free_pages+0x244/0x690
[ 1254.017801][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1254.073127][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1254.143014][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1254.203542][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1254.261993][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1254.339158][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1254.404886][  T329]  ? warn_alloc+0x120/0x120
[ 1254.457093][  T329]  ? mark_held_locks+0xb0/0x110
[ 1254.513463][  T329]  ? _raw_spin_unlock_irqrestore+0x39/0x40
[ 1254.581270][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1254.639719][  T329]  ? __isolate_free_page+0x570/0x570
[ 1254.701284][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1254.763893][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1254.844181][  T329]  xfs_buf_allocate_memory+0x33c/0xdf0
[ 1254.907828][  T329]  xfs_buf_get_map+0x13b/0xe80
[ 1254.963156][  T329]  ? xfs_buf_incore+0xd0/0xd0
[ 1255.017440][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1255.079009][  T329]  ? xfs_buf_iowait+0x441/0x560
[ 1255.135377][  T329]  xfs_buf_read_map+0xad/0x1130
[ 1255.191747][  T329]  ? xfs_da_read_buf+0x1d4/0x2c0
[ 1255.249156][  T329]  ? xfs_da_read_buf+0x1d4/0x2c0
[ 1255.306559][  T329]  ? _xfs_buf_read+0x70/0x70
[ 1255.359810][  T329]  xfs_trans_read_buf_map+0x2db/0xef0
[ 1255.422415][  T329]  ? xfs_da_read_buf+0x1d4/0x2c0
[ 1255.479823][  T329]  ? xfs_trans_read_buf_map+0x2db/0xef0
[ 1255.544512][  T329]  ? xfs_trans_getsb+0x670/0x670
[ 1255.601920][  T329]  ? mark_lock+0x147/0x1800
[ 1255.654127][  T329]  xfs_da_read_buf+0x1d4/0x2c0
[ 1255.709455][  T329]  ? xfs_da_read_buf+0x1f2/0x2c0
[ 1255.766863][  T329]  ? xfs_da3_root_split+0xd50/0xd50
[ 1255.827392][  T329]  ? xfs_da3_root_split+0xd50/0xd50
[ 1255.887919][  T329]  ? mark_lock+0x147/0x1800
[ 1255.940129][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1256.003774][  T329]  ? xfs_dir3_leaf_log_header+0xc0/0xc0
[ 1256.068460][  T329]  xfs_dir3_data_read+0x20/0x290
[ 1256.125869][  T329]  xfs_dir2_leaf_lookup_int+0x45e/0xaa0
[ 1256.190557][  T329]  ? xfs_dir2_leaf_addname+0x1c10/0x1c10
[ 1256.256285][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1256.320972][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1256.382541][  T329]  xfs_dir2_leaf_lookup+0x12c/0x630
[ 1256.443068][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1256.498396][  T329]  ? xfs_dir2_leaf_lookup_int+0xaa0/0xaa0
[ 1256.565163][  T329]  ? xfs_dir2_isleaf+0x84/0x1d0
[ 1256.621533][  T329]  ? xfs_ilock+0x2ef/0x370
[ 1256.672698][  T329]  xfs_dir_lookup+0x4e1/0x930
[ 1256.726986][  T329]  ? xfs_dir_canenter+0x10/0x10
[ 1256.783353][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1256.848039][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1256.909608][  T329]  xfs_lookup+0x13f/0x4a0
[ 1256.959737][  T329]  ? xfs_ip2xflags+0xe0/0xe0
[ 1257.012987][  T329]  ? __d_lookup_rcu+0x830/0x830
[ 1257.069351][  T329]  xfs_vn_lookup+0x139/0x180
[ 1257.122600][  T329]  ? xfs_vn_link+0x1b0/0x1b0
[ 1257.175849][  T329]  ? lockdep_init_map_waits+0x267/0x7b0
[ 1257.240534][  T329]  ? __raw_spin_lock_init+0x34/0x100
[ 1257.302104][  T329]  __lookup_slow+0x211/0x3d0
[ 1257.355350][  T329]  ? vfs_rmdir+0x440/0x440
[ 1257.406519][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1257.461847][  T329]  ? __lock_acquire+0x1920/0x4da0
[ 1257.520292][  T329]  walk_component+0x37b/0x5f0
[ 1257.574582][  T329]  ? handle_dots.part.44+0x11d0/0x11d0
[ 1257.638232][  T329]  ? generic_permission+0x3a/0x3b0
[ 1257.697716][  T329]  link_path_walk+0x4d4/0xa30
[ 1257.752002][  T329]  ? path_init+0xbbc/0x1490
[ 1257.804212][  T329]  ? create_object+0x756/0xa70
[ 1257.859539][  T329]  ? walk_component+0x5f0/0x5f0
[ 1257.915910][  T329]  ? lock_downgrade+0x720/0x720
[ 1257.972276][  T329]  path_lookupat+0x112/0x3a0
[ 1258.025525][  T329]  filename_lookup.part.47+0x15c/0x290
[ 1258.089171][  T329]  ? do_renameat2+0x900/0x900
[ 1258.143460][  T329]  ? strncpy_from_user+0x8e/0x370
[ 1258.201907][  T329]  ? getname_flags+0x88/0x3e0
[ 1258.256195][  T329]  __x64_sys_inotify_add_watch+0x17e/0x930
[ 1258.324005][  T329]  ? do_syscall_64+0x1f/0x310
[ 1258.378289][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1258.442978][  T329]  ? switch_fpu_return+0x196/0x400
[ 1258.502466][  T329]  ? __do_sys_inotify_init+0x10/0x10
[ 1258.564033][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1258.633920][  T329]  ? do_syscall_64+0x24/0x310
[ 1258.688209][  T329]  do_syscall_64+0x5f/0x310
[ 1258.740416][  T329]  ? trace_hardirqs_off+0x12/0x1a0
[ 1258.799905][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1258.857310][  T329]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1258.926159][  T329] RIP: 0033:0x7feaeca198fb
[ 1258.977325][  T329] Code: Bad RIP value.
[ 1259.024331][  T329] RSP: 002b:00007feae6955818 EFLAGS: 00000202 ORIG_RAX: 00000000000000fe
[ 1259.123341][  T329] RAX: ffffffffffffffda RBX: 0000559476a1a900 RCX: 00007feaeca198fb
[ 1259.217148][  T329] RDX: 0000000001002fce RSI: 0000559476a21ff0 RDI: 000000000000000e
[ 1259.310956][  T329] RBP: 00007feae6955844 R08: 00007ffd031d0090 R09: 0000000000027a90
[ 1259.404765][  T329] R10: 0000000000027a90 R11: 0000000000000202 R12: 0000000000000000
[ 1259.498571][  T329] R13: 0000000000000000 R14: 00007feaed369120 R15: 0000559476a1ed60
[ 1259.592428][  T329] INFO: task runtest.sh:1543 blocked for more than 135 seconds.
[ 1259.682033][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1259.754012][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1259.856126][  T329] runtest.sh      D21304  1543   1518 0x00004000
[ 1259.930173][  T329] Call Trace:
[ 1259.967820][  T329]  __schedule+0x768/0x1ba0
[ 1260.018990][  T329]  ? __sched_text_start+0x8/0x8
[ 1260.075355][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1260.143162][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1260.200573][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1260.254856][  T329]  schedule+0xc1/0x2b0
[ 1260.301870][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1260.355116][  T329]  io_schedule+0x17/0x60
[ 1260.404202][  T329]  rq_qos_wait+0x1ce/0x330
[ 1260.455370][  T329]  ? __wbt_done+0x30/0x30
[ 1260.505499][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1260.564985][  T329]  ? find_held_lock+0x33/0x1c0
[ 1260.620313][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1260.680844][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1260.735127][  T329]  ? lock_downgrade+0x720/0x720
[ 1260.791499][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1260.846841][  T329]  wbt_wait+0x144/0x290
[ 1260.894871][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1260.950199][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1261.006569][  T329]  __rq_qos_throttle+0x47/0x90
[ 1261.061896][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1261.120345][  T329]  ? lock_downgrade+0x720/0x720
[ 1261.176712][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1261.244525][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1261.309209][  T329]  ? lock_downgrade+0x720/0x720
[ 1261.365573][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1261.427147][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1261.484551][  T329]  ? lock_downgrade+0x720/0x720
[ 1261.540915][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1261.602487][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1261.667173][  T329]  submit_bio_noacct+0x845/0xe90
[ 1261.724581][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1261.781985][  T329]  ? find_held_lock+0x33/0x1c0
[ 1261.837317][  T329]  ? mark_held_locks+0xb0/0x110
[ 1261.893698][  T329]  ? submit_bio+0xe7/0x480
[ 1261.944850][  T329]  submit_bio+0xe7/0x480
[ 1261.993941][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1262.053427][  T329]  ? lock_downgrade+0x720/0x720
[ 1262.109794][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1262.185923][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1262.255808][  T329]  __swap_writepage+0xb29/0x15d0
[ 1262.313219][  T329]  ? get_swap_bio+0x390/0x390
[ 1262.367501][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1262.435310][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1262.490643][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1262.549085][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1262.606494][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1262.672225][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1262.732749][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1262.792236][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1262.848608][  T329]  ? page_swapcount+0xeb/0x180
[ 1262.903936][  T329]  ? try_to_free_swap+0x487/0x670
[ 1262.962380][  T329]  pageout+0x44b/0x1060
[ 1263.010446][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1263.063675][  T329]  ? page_not_mapped+0x10/0x10
[ 1263.119003][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1263.178493][  T329]  ? page_mapped+0xf2/0x2e0
[ 1263.230701][  T329]  shrink_page_list+0x250f/0x3f10
[ 1263.289149][  T329]  ? pageout+0x1060/0x1060
[ 1263.340319][  T329]  ? mark_lock+0x50/0x1800
[ 1263.391482][  T329]  ? find_held_lock+0x33/0x1c0
[ 1263.446813][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1263.510460][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1263.573067][  T329]  ? mark_held_locks+0xb0/0x110
[ 1263.629433][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1263.699324][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1263.759849][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1263.818296][  T329]  shrink_inactive_list+0x362/0xa10
[ 1263.878830][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1263.942471][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1264.004039][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1264.073928][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1264.131358][  T329]  shrink_lruvec+0x841/0x19e0
[ 1264.185624][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1264.255515][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1264.318117][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1264.378651][  T329]  ? lock_downgrade+0x720/0x720
[ 1264.435013][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1264.499699][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1264.558151][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1264.620756][  T329]  shrink_node+0x42b/0x1700
[ 1264.672965][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1264.734536][  T329]  ? shrink_node+0x1700/0x1700
[ 1264.789857][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1264.854548][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1264.916119][  T329]  try_to_free_pages+0x244/0x690
[ 1264.973526][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1265.046532][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1265.101858][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1265.171748][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1265.248930][  T329]  ? get_page_from_freelist+0x8e9/0x3930
[ 1265.314645][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1265.378293][  T329]  ? warn_alloc+0x120/0x120
[ 1265.430497][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1265.495187][  T329]  ? lock_downgrade+0x720/0x720
[ 1265.551550][  T329]  ? __isolate_free_page+0x570/0x570
[ 1265.613119][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1265.675731][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1265.756017][  T329]  __get_free_pages+0xc/0x90
[ 1265.809269][  T329]  pgd_alloc+0x86/0x500
[ 1265.857313][  T329]  ? lock_downgrade+0x720/0x720
[ 1265.913679][  T329]  ? pgd_page_get_mm+0x30/0x30
[ 1265.969008][  T329]  ? dup_mm+0x81/0xfc0
[ 1266.016011][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1266.080700][  T329]  ? lockdep_init_map_waits+0x267/0x7b0
[ 1266.145392][  T329]  ? lockdep_init_map_waits+0x267/0x7b0
[ 1266.210078][  T329]  mm_init.isra.47+0x567/0x8e0
[ 1266.265406][  T329]  ? memcpy+0x38/0x60
[ 1266.311373][  T329]  dup_mm+0xa8/0xfc0
[ 1266.356314][  T329]  ? lock_downgrade+0x720/0x720
[ 1266.412664][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1266.467998][  T329]  ? vm_area_dup+0x2a0/0x2a0
[ 1266.521242][  T329]  ? lockdep_init_map_waits+0x267/0x7b0
[ 1266.585932][  T329]  copy_process+0x2875/0x6150
[ 1266.640222][  T329]  ? __cleanup_sighand+0x60/0x60
[ 1266.697624][  T329]  ? sigprocmask+0x14e/0x270
[ 1266.750873][  T329]  ? find_held_lock+0x33/0x1c0
[ 1266.806204][  T329]  _do_fork+0xbd/0xd60
[ 1266.853208][  T329]  ? lock_downgrade+0x720/0x720
[ 1266.909576][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1266.970109][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1267.028556][  T329]  ? copy_init_mm+0x10/0x10
[ 1267.080759][  T329]  __do_sys_clone+0xc3/0x100
[ 1267.134010][  T329]  ? _do_fork+0xd60/0xd60
[ 1267.184135][  T329]  ? do_syscall_64+0x24/0x310
[ 1267.238425][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1267.296872][  T329]  do_syscall_64+0x5f/0x310
[ 1267.349079][  T329]  ? trace_hardirqs_off+0x12/0x1a0
[ 1267.408582][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1267.465977][  T329]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1267.534821][  T329] RIP: 0033:0x7f58395ed2e2
[ 1267.585987][  T329] Code: Bad RIP value.
[ 1267.633000][  T329] RSP: 002b:00007ffdfbafb490 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
[ 1267.732001][  T329] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f58395ed2e2
[ 1267.825815][  T329] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
[ 1267.919623][  T329] RBP: 0000000000000000 R08: 0000000000000000 R09: 00007f5839f30740
[ 1268.013429][  T329] R10: 00007f5839f30a10 R11: 0000000000000246 R12: 00007ffdfbafb4e0
[ 1268.107233][  T329] R13: 00007ffdfbafb560 R14: 0000555cc739aeb9 R15: 0000555cc80f4950
[ 1268.201105][  T329] INFO: task random:2918 blocked for more than 144 seconds.
[ 1268.286534][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1268.358516][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1268.460628][  T329] random          D23704  2918   2020 0x00004002
[ 1268.534669][  T329] Call Trace:
[ 1268.572322][  T329]  __schedule+0x768/0x1ba0
[ 1268.623494][  T329]  ? __sched_text_start+0x8/0x8
[ 1268.679857][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1268.747664][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1268.805074][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1268.859357][  T329]  schedule+0xc1/0x2b0
[ 1268.906370][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1268.959618][  T329]  io_schedule+0x17/0x60
[ 1269.008702][  T329]  rq_qos_wait+0x1ce/0x330
[ 1269.059870][  T329]  ? __wbt_done+0x30/0x30
[ 1269.110001][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1269.169484][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1269.226896][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1269.287423][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1269.341708][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1269.405357][  T329]  wbt_wait+0x144/0x290
[ 1269.453408][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1269.508731][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1269.566138][  T329]  __rq_qos_throttle+0x47/0x90
[ 1269.621470][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1269.679915][  T329]  ? lock_downgrade+0x720/0x720
[ 1269.736282][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1269.804099][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1269.868776][  T329]  ? lock_downgrade+0x720/0x720
[ 1269.925145][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1269.986717][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1270.044124][  T329]  ? lock_downgrade+0x720/0x720
[ 1270.100490][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1270.162065][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1270.226746][  T329]  submit_bio_noacct+0x845/0xe90
[ 1270.284153][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1270.341563][  T329]  ? find_held_lock+0x33/0x1c0
[ 1270.396886][  T329]  ? mark_held_locks+0xb0/0x110
[ 1270.453257][  T329]  ? submit_bio+0xe7/0x480
[ 1270.504424][  T329]  submit_bio+0xe7/0x480
[ 1270.553511][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1270.613001][  T329]  ? lock_downgrade+0x720/0x720
[ 1270.669369][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1270.745494][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1270.815386][  T329]  __swap_writepage+0xb29/0x15d0
[ 1270.872791][  T329]  ? get_swap_bio+0x390/0x390
[ 1270.927076][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1270.994890][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1271.050214][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1271.108658][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1271.166071][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1271.231799][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1271.292325][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1271.351808][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1271.408177][  T329]  ? page_swapcount+0xeb/0x180
[ 1271.463508][  T329]  ? try_to_free_swap+0x487/0x670
[ 1271.521951][  T329]  pageout+0x44b/0x1060
[ 1271.570000][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1271.623254][  T329]  ? page_not_mapped+0x10/0x10
[ 1271.678578][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1271.738063][  T329]  ? page_mapped+0xf2/0x2e0
[ 1271.790276][  T329]  shrink_page_list+0x250f/0x3f10
[ 1271.848721][  T329]  ? pageout+0x1060/0x1060
[ 1271.899888][  T329]  ? mark_lock+0x50/0x1800
[ 1271.951059][  T329]  ? find_held_lock+0x33/0x1c0
[ 1272.006383][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1272.070033][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1272.132641][  T329]  ? mark_held_locks+0xb0/0x110
[ 1272.189007][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1272.258897][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1272.319421][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1272.377868][  T329]  shrink_inactive_list+0x362/0xa10
[ 1272.438400][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1272.502047][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1272.563612][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1272.633501][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1272.690908][  T329]  shrink_lruvec+0x841/0x19e0
[ 1272.745194][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1272.815087][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1272.877693][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1272.938222][  T329]  ? lock_downgrade+0x720/0x720
[ 1272.994588][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1273.059277][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1273.117721][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1273.180333][  T329]  shrink_node+0x42b/0x1700
[ 1273.232537][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1273.294104][  T329]  ? shrink_node+0x1700/0x1700
[ 1273.349437][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1273.414119][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1273.475688][  T329]  try_to_free_pages+0x244/0x690
[ 1273.533097][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1273.606102][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1273.661434][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1273.731317][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1273.808491][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1273.874214][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1273.931621][  T329]  ? warn_alloc+0x120/0x120
[ 1273.983832][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1274.048517][  T329]  ? lock_downgrade+0x720/0x720
[ 1274.104884][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1274.174775][  T329]  ? __isolate_free_page+0x570/0x570
[ 1274.236340][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1274.298950][  T329]  ? handle_mm_fault+0x1f3/0x2ef0
[ 1274.357398][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1274.437686][  T329]  ? mark_held_locks+0xb0/0x110
[ 1274.494052][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1274.548346][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1274.605749][  T329]  ? copy_page_range+0x580/0x580
[ 1274.663158][  T329]  do_user_addr_fault+0x2af/0x824
[ 1274.721602][  T329]  exc_page_fault+0x56/0xa0
[ 1274.773811][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1274.831214][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1274.887583][  T329] RIP: 0033:0x7fef56ee9ed2
[ 1274.938754][  T329] Code: Bad RIP value.
[ 1274.985758][  T329] RSP: 002b:00007ffe2b9ddbf0 EFLAGS: 00010246
[ 1275.056691][  T329] RAX: 00007fe7203f9000 RBX: 00007fe720bf9700 RCX: 00007fef56c1599b
[ 1275.150496][  T329] RDX: 0000000000000003 RSI: 0000000000800000 RDI: 00007fe7203fa000
[ 1275.244301][  T329] RBP: 00007ffe2b9ddcc0 R08: 00000000ffffffff R09: 0000000000000000
[ 1275.338112][  T329] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000001000
[ 1275.431915][  T329] R13: 00007ffe2b9ddc50 R14: 0000000000000000 R15: 0000000000801000
[ 1275.525754][  T329] INFO: task random:2925 blocked for more than 151 seconds.
[ 1275.611212][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1275.683189][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1275.785310][  T329] random          D22792  2925   2020 0x00004000
[ 1275.859359][  T329] Call Trace:
[ 1275.897005][  T329]  __schedule+0x768/0x1ba0
[ 1275.948174][  T329]  ? __sched_text_start+0x8/0x8
[ 1276.004539][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1276.072349][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1276.129752][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1276.184042][  T329]  schedule+0xc1/0x2b0
[ 1276.231052][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1276.284299][  T329]  io_schedule+0x17/0x60
[ 1276.333386][  T329]  rq_qos_wait+0x1ce/0x330
[ 1276.384555][  T329]  ? __wbt_done+0x30/0x30
[ 1276.434680][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1276.494168][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1276.551578][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1276.612103][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1276.666390][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1276.730042][  T329]  wbt_wait+0x144/0x290
[ 1276.778084][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1276.833412][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1276.890827][  T329]  __rq_qos_throttle+0x47/0x90
[ 1276.946152][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1277.004604][  T329]  ? lock_downgrade+0x720/0x720
[ 1277.060968][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1277.128781][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1277.193463][  T329]  ? lock_downgrade+0x720/0x720
[ 1277.249827][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1277.311395][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1277.368807][  T329]  ? lock_downgrade+0x720/0x720
[ 1277.425169][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1277.486748][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1277.551432][  T329]  submit_bio_noacct+0x845/0xe90
[ 1277.608835][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1277.666241][  T329]  ? find_held_lock+0x33/0x1c0
[ 1277.721574][  T329]  ? mark_held_locks+0xb0/0x110
[ 1277.777939][  T329]  ? submit_bio+0xe7/0x480
[ 1277.829107][  T329]  submit_bio+0xe7/0x480
[ 1277.878198][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1277.937677][  T329]  ? lock_downgrade+0x720/0x720
[ 1277.994050][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1278.070178][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1278.140061][  T329]  __swap_writepage+0xb29/0x15d0
[ 1278.197469][  T329]  ? get_swap_bio+0x390/0x390
[ 1278.251761][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1278.319566][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1278.374894][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1278.433344][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1278.490750][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1278.556476][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1278.617009][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1278.676491][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1278.732860][  T329]  ? page_swapcount+0xeb/0x180
[ 1278.788193][  T329]  ? try_to_free_swap+0x487/0x670
[ 1278.846640][  T329]  pageout+0x44b/0x1060
[ 1278.894683][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1278.947936][  T329]  ? page_not_mapped+0x10/0x10
[ 1279.003264][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1279.062745][  T329]  ? page_mapped+0xf2/0x2e0
[ 1279.114956][  T329]  shrink_page_list+0x250f/0x3f10
[ 1279.173403][  T329]  ? pageout+0x1060/0x1060
[ 1279.224568][  T329]  ? mark_lock+0x50/0x1800
[ 1279.275741][  T329]  ? find_held_lock+0x33/0x1c0
[ 1279.331065][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1279.394712][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1279.457324][  T329]  ? mark_held_locks+0xb0/0x110
[ 1279.513688][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1279.583578][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1279.644102][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1279.702553][  T329]  shrink_inactive_list+0x362/0xa10
[ 1279.763083][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1279.826728][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1279.888294][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1279.958186][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1280.015587][  T329]  shrink_lruvec+0x841/0x19e0
[ 1280.069879][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1280.139768][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1280.202371][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1280.262901][  T329]  ? lock_downgrade+0x720/0x720
[ 1280.319269][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1280.383956][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1280.442402][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1280.505014][  T329]  shrink_node+0x42b/0x1700
[ 1280.557223][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1280.618787][  T329]  ? shrink_node+0x1700/0x1700
[ 1280.674118][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1280.738804][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1280.800373][  T329]  try_to_free_pages+0x244/0x690
[ 1280.857780][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1280.930792][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1280.986116][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1281.056002][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1281.133174][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1281.198894][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1281.256304][  T329]  ? warn_alloc+0x120/0x120
[ 1281.308514][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1281.373203][  T329]  ? lock_downgrade+0x720/0x720
[ 1281.429566][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1281.499456][  T329]  ? __isolate_free_page+0x570/0x570
[ 1281.561022][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1281.623630][  T329]  ? handle_mm_fault+0x1f3/0x2ef0
[ 1281.682081][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1281.762368][  T329]  ? mark_held_locks+0xb0/0x110
[ 1281.818738][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1281.873019][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1281.930432][  T329]  ? copy_page_range+0x580/0x580
[ 1281.987840][  T329]  do_user_addr_fault+0x2af/0x824
[ 1282.046283][  T329]  exc_page_fault+0x56/0xa0
[ 1282.098489][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1282.155903][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1282.212266][  T329] RIP: 0033:0x402cb9
[ 1282.257191][  T329] Code: Bad RIP value.
[ 1282.304204][  T329] RSP: 002b:00007fef2e4b2ec0 EFLAGS: 00010206
[ 1282.375126][  T329] RAX: 00007fee01a08000 RBX: 0000000000000000 RCX: 00007fef56c158c7
[ 1282.468941][  T329] RDX: 00007fedfc632000 RSI: 000000000ccccccc RDI: 0000000000000000
[ 1282.562746][  T329] RBP: 00007fef2e4b2ef0 R08: 00000000ffffffff R09: 0000000000000000
[ 1282.656554][  T329] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffe2b9ddc4e
[ 1282.750363][  T329] R13: 00007ffe2b9ddc4f R14: 0000000000000000 R15: 00007fef2e4b2fc0
[ 1282.844196][  T329] INFO: task random:2926 blocked for more than 159 seconds.
[ 1282.929660][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1283.001621][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1283.103751][  T329] random          D22968  2926   2020 0x00004000
[ 1283.177803][  T329] Call Trace:
[ 1283.215449][  T329]  __schedule+0x768/0x1ba0
[ 1283.266617][  T329]  ? __sched_text_start+0x8/0x8
[ 1283.322981][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1283.390791][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1283.448194][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1283.502483][  T329]  schedule+0xc1/0x2b0
[ 1283.549496][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1283.602742][  T329]  io_schedule+0x17/0x60
[ 1283.651826][  T329]  rq_qos_wait+0x1ce/0x330
[ 1283.703000][  T329]  ? __wbt_done+0x30/0x30
[ 1283.753123][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1283.812611][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1283.870022][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1283.930544][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1283.984833][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1284.048485][  T329]  wbt_wait+0x144/0x290
[ 1284.096529][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1284.151857][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1284.209269][  T329]  __rq_qos_throttle+0x47/0x90
[ 1284.264590][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1284.323040][  T329]  ? lock_downgrade+0x720/0x720
[ 1284.379411][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1284.447225][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1284.511907][  T329]  ? lock_downgrade+0x720/0x720
[ 1284.568269][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1284.629838][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1284.687251][  T329]  ? lock_downgrade+0x720/0x720
[ 1284.743613][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1284.805186][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1284.869874][  T329]  submit_bio_noacct+0x845/0xe90
[ 1284.927274][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1284.984685][  T329]  ? find_held_lock+0x33/0x1c0
[ 1285.040016][  T329]  ? mark_held_locks+0xb0/0x110
[ 1285.096379][  T329]  ? submit_bio+0xe7/0x480
[ 1285.147545][  T329]  submit_bio+0xe7/0x480
[ 1285.196641][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1285.256123][  T329]  ? lock_downgrade+0x720/0x720
[ 1285.312495][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1285.388624][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1285.458508][  T329]  __swap_writepage+0xb29/0x15d0
[ 1285.515912][  T329]  ? get_swap_bio+0x390/0x390
[ 1285.570204][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1285.638006][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1285.693334][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1285.751786][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1285.809192][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1285.874918][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1285.935451][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1285.994936][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1286.051303][  T329]  ? page_swapcount+0xeb/0x180
[ 1286.106635][  T329]  ? try_to_free_swap+0x487/0x670
[ 1286.165080][  T329]  pageout+0x44b/0x1060
[ 1286.213126][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1286.266377][  T329]  ? page_not_mapped+0x10/0x10
[ 1286.321700][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1286.381189][  T329]  ? page_mapped+0xf2/0x2e0
[ 1286.433402][  T329]  shrink_page_list+0x250f/0x3f10
[ 1286.491844][  T329]  ? pageout+0x1060/0x1060
[ 1286.543011][  T329]  ? mark_lock+0x50/0x1800
[ 1286.594184][  T329]  ? find_held_lock+0x33/0x1c0
[ 1286.649505][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1286.713156][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1286.775768][  T329]  ? mark_held_locks+0xb0/0x110
[ 1286.832129][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1286.902023][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1286.962546][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1287.020994][  T329]  shrink_inactive_list+0x362/0xa10
[ 1287.081528][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1287.145172][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1287.206738][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1287.276628][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1287.334033][  T329]  shrink_lruvec+0x841/0x19e0
[ 1287.388320][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1287.458213][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1287.520817][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1287.581350][  T329]  ? lock_downgrade+0x720/0x720
[ 1287.637711][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1287.702398][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1287.760853][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1287.823453][  T329]  shrink_node+0x42b/0x1700
[ 1287.875664][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1287.937233][  T329]  ? shrink_node+0x1700/0x1700
[ 1287.992557][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1288.057244][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1288.118817][  T329]  try_to_free_pages+0x244/0x690
[ 1288.176219][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1288.249232][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1288.304559][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1288.374443][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1288.451617][  T329]  ? get_reg+0x220/0x220
[ 1288.500699][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1288.566427][  T329]  ? warn_alloc+0x120/0x120
[ 1288.618636][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1288.683319][  T329]  ? lock_downgrade+0x720/0x720
[ 1288.739694][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1288.809581][  T329]  ? _raw_spin_unlock_irqrestore+0x39/0x40
[ 1288.877386][  T329]  ? __isolate_free_page+0x570/0x570
[ 1288.938957][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1289.001560][  T329]  ? lock_downgrade+0x720/0x720
[ 1289.057928][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1289.138222][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1289.195622][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1289.249913][  T329]  ? __pte_alloc+0x120/0x250
[ 1289.303163][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1289.360568][  T329]  ? copy_page_range+0x580/0x580
[ 1289.417975][  T329]  do_user_addr_fault+0x2af/0x824
[ 1289.476428][  T329]  exc_page_fault+0x56/0xa0
[ 1289.528633][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1289.586038][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1289.642410][  T329] RIP: 0033:0x402cb9
[ 1289.687332][  T329] Code: Bad RIP value.
[ 1289.734338][  T329] RSP: 002b:00007fef2dcb1ec0 EFLAGS: 00010206
[ 1289.805271][  T329] RAX: 00007fee0dc00000 RBX: 0000000000000000 RCX: 00007fef56c158c7
[ 1289.899075][  T329] RDX: 00007fee092ff000 RSI: 000000000ccccccc RDI: 0000000000000000
[ 1289.992887][  T329] RBP: 00007fef2dcb1ef0 R08: 00000000ffffffff R09: 0000000000000000
[ 1290.086688][  T329] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffe2b9ddc4e
[ 1290.180502][  T329] R13: 00007ffe2b9ddc4f R14: 0000000000000000 R15: 00007fef2dcb1fc0
[ 1290.274327][  T329] INFO: task random:2928 blocked for more than 166 seconds.
[ 1290.359792][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1290.431780][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1290.533888][  T329] random          D23888  2928   2020 0x00004000
[ 1290.607943][  T329] Call Trace:
[ 1290.645587][  T329]  __schedule+0x768/0x1ba0
[ 1290.696755][  T329]  ? __sched_text_start+0x8/0x8
[ 1290.753125][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1290.820977][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1290.878340][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1290.932623][  T329]  schedule+0xc1/0x2b0
[ 1290.979632][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1291.032884][  T329]  io_schedule+0x17/0x60
[ 1291.081970][  T329]  rq_qos_wait+0x1ce/0x330
[ 1291.133133][  T329]  ? __wbt_done+0x30/0x30
[ 1291.183268][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1291.242752][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1291.300157][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1291.360690][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1291.414988][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1291.478620][  T329]  wbt_wait+0x144/0x290
[ 1291.526666][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1291.581996][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1291.639402][  T329]  __rq_qos_throttle+0x47/0x90
[ 1291.694730][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1291.753176][  T329]  ? lock_downgrade+0x720/0x720
[ 1291.809545][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1291.877360][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1291.942041][  T329]  ? lock_downgrade+0x720/0x720
[ 1291.998407][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1292.059977][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1292.117384][  T329]  ? lock_downgrade+0x720/0x720
[ 1292.173753][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1292.235323][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1292.300009][  T329]  submit_bio_noacct+0x845/0xe90
[ 1292.357416][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1292.414824][  T329]  ? find_held_lock+0x33/0x1c0
[ 1292.470149][  T329]  ? mark_held_locks+0xb0/0x110
[ 1292.526518][  T329]  ? submit_bio+0xe7/0x480
[ 1292.577686][  T329]  submit_bio+0xe7/0x480
[ 1292.626774][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1292.686261][  T329]  ? lock_downgrade+0x720/0x720
[ 1292.742628][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1292.818757][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1292.888645][  T329]  __swap_writepage+0xb29/0x15d0
[ 1292.946051][  T329]  ? get_swap_bio+0x390/0x390
[ 1293.000338][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1293.068148][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1293.123475][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1293.181921][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1293.239331][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1293.305058][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1293.365587][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1293.425074][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1293.481442][  T329]  ? page_swapcount+0xeb/0x180
[ 1293.536769][  T329]  ? try_to_free_swap+0x487/0x670
[ 1293.595216][  T329]  pageout+0x44b/0x1060
[ 1293.643265][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1293.696513][  T329]  ? page_not_mapped+0x10/0x10
[ 1293.751839][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1293.811328][  T329]  ? page_mapped+0xf2/0x2e0
[ 1293.863535][  T329]  shrink_page_list+0x250f/0x3f10
[ 1293.921987][  T329]  ? pageout+0x1060/0x1060
[ 1293.973150][  T329]  ? mark_lock+0x50/0x1800
[ 1294.024320][  T329]  ? find_held_lock+0x33/0x1c0
[ 1294.079645][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1294.143293][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1294.205901][  T329]  ? mark_held_locks+0xb0/0x110
[ 1294.262267][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1294.332156][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1294.392684][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1294.451132][  T329]  shrink_inactive_list+0x362/0xa10
[ 1294.511661][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1294.575308][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1294.636874][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1294.706764][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1294.764171][  T329]  shrink_lruvec+0x841/0x19e0
[ 1294.818457][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1294.888346][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1294.950953][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1295.011482][  T329]  ? lock_downgrade+0x720/0x720
[ 1295.067848][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1295.132536][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1295.190985][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1295.253594][  T329]  shrink_node+0x42b/0x1700
[ 1295.305801][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1295.367366][  T329]  ? shrink_node+0x1700/0x1700
[ 1295.422694][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1295.487381][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1295.548951][  T329]  try_to_free_pages+0x244/0x690
[ 1295.606359][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1295.679366][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1295.734694][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1295.804583][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1295.881748][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1295.947477][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1296.004884][  T329]  ? warn_alloc+0x120/0x120
[ 1296.057092][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1296.121779][  T329]  ? lock_downgrade+0x720/0x720
[ 1296.178148][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1296.248035][  T329]  ? __isolate_free_page+0x570/0x570
[ 1296.309605][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1296.372210][  T329]  ? handle_mm_fault+0x1f3/0x2ef0
[ 1296.430659][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1296.510946][  T329]  ? mark_held_locks+0xb0/0x110
[ 1296.567314][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1296.621602][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1296.679008][  T329]  ? copy_page_range+0x580/0x580
[ 1296.736417][  T329]  do_user_addr_fault+0x2af/0x824
[ 1296.794864][  T329]  exc_page_fault+0x56/0xa0
[ 1296.847072][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1296.904480][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1296.960848][  T329] RIP: 0033:0x402cb9
[ 1297.005775][  T329] Code: Bad RIP value.
[ 1297.052782][  T329] RSP: 002b:00007fef2ccafec0 EFLAGS: 00010206
[ 1297.123709][  T329] RAX: 00007fee27984000 RBX: 0000000000000000 RCX: 00007fef56c158c7
[ 1297.217518][  T329] RDX: 00007fee22c99000 RSI: 000000000ccccccc RDI: 0000000000000000
[ 1297.311325][  T329] RBP: 00007fef2ccafef0 R08: 00000000ffffffff R09: 0000000000000000
[ 1297.405132][  T329] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffe2b9ddc4e
[ 1297.498940][  T329] R13: 00007ffe2b9ddc4f R14: 0000000000000000 R15: 00007fef2ccaffc0
[ 1297.592777][  T329] INFO: task random:2929 blocked for more than 173 seconds.
[ 1297.678266][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1297.750203][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1297.852336][  T329] random          D23560  2929   2020 0x00004000
[ 1297.926381][  T329] Call Trace:
[ 1297.964031][  T329]  __schedule+0x768/0x1ba0
[ 1298.015201][  T329]  ? __sched_text_start+0x8/0x8
[ 1298.071564][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1298.139374][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1298.196778][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1298.251065][  T329]  schedule+0xc1/0x2b0
[ 1298.298079][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1298.351326][  T329]  io_schedule+0x17/0x60
[ 1298.400410][  T329]  rq_qos_wait+0x1ce/0x330
[ 1298.451582][  T329]  ? __wbt_done+0x30/0x30
[ 1298.501705][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1298.561193][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1298.618602][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1298.679128][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1298.733431][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1298.797067][  T329]  wbt_wait+0x144/0x290
[ 1298.845113][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1298.900437][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1298.957851][  T329]  __rq_qos_throttle+0x47/0x90
[ 1299.013174][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1299.071626][  T329]  ? lock_downgrade+0x720/0x720
[ 1299.127995][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1299.195805][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1299.260492][  T329]  ? lock_downgrade+0x720/0x720
[ 1299.316852][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1299.378419][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1299.435833][  T329]  ? lock_downgrade+0x720/0x720
[ 1299.492196][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1299.553768][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1299.618456][  T329]  submit_bio_noacct+0x845/0xe90
[ 1299.675858][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1299.733267][  T329]  ? find_held_lock+0x33/0x1c0
[ 1299.788615][  T329]  ? mark_held_locks+0xb0/0x110
[ 1299.844964][  T329]  ? submit_bio+0xe7/0x480
[ 1299.896130][  T329]  submit_bio+0xe7/0x480
[ 1299.945222][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1300.004703][  T329]  ? lock_downgrade+0x720/0x720
[ 1300.061075][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1300.137205][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1300.207089][  T329]  __swap_writepage+0xb29/0x15d0
[ 1300.264499][  T329]  ? get_swap_bio+0x390/0x390
[ 1300.318785][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1300.386591][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1300.441921][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1300.500369][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1300.557775][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1300.623504][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1300.684030][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1300.743518][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1300.799889][  T329]  ? page_swapcount+0xeb/0x180
[ 1300.855228][  T329]  ? try_to_free_swap+0x487/0x670
[ 1300.913664][  T329]  pageout+0x44b/0x1060
[ 1300.961713][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1301.014956][  T329]  ? page_not_mapped+0x10/0x10
[ 1301.070283][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1301.129776][  T329]  ? page_mapped+0xf2/0x2e0
[ 1301.181980][  T329]  shrink_page_list+0x250f/0x3f10
[ 1301.240427][  T329]  ? pageout+0x1060/0x1060
[ 1301.291598][  T329]  ? mark_lock+0x50/0x1800
[ 1301.342767][  T329]  ? find_held_lock+0x33/0x1c0
[ 1301.398092][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1301.461740][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1301.524344][  T329]  ? mark_held_locks+0xb0/0x110
[ 1301.580712][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1301.650604][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1301.711130][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1301.769581][  T329]  shrink_inactive_list+0x362/0xa10
[ 1301.830108][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1301.893752][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1301.955336][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1302.025211][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1302.082617][  T329]  shrink_lruvec+0x841/0x19e0
[ 1302.136905][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1302.206793][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1302.269398][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1302.329931][  T329]  ? lock_downgrade+0x720/0x720
[ 1302.386292][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1302.450980][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1302.509434][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1302.572036][  T329]  shrink_node+0x42b/0x1700
[ 1302.624247][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1302.685815][  T329]  ? shrink_node+0x1700/0x1700
[ 1302.741139][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1302.805826][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1302.867401][  T329]  try_to_free_pages+0x244/0x690
[ 1302.924801][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1302.997829][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1303.053142][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1303.123030][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1303.200198][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1303.265926][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1303.323327][  T329]  ? warn_alloc+0x120/0x120
[ 1303.375540][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1303.440227][  T329]  ? lock_downgrade+0x720/0x720
[ 1303.496592][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1303.566480][  T329]  ? __isolate_free_page+0x570/0x570
[ 1303.628051][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1303.690654][  T329]  ? handle_mm_fault+0x1f3/0x2ef0
[ 1303.749107][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1303.829392][  T329]  ? mark_held_locks+0xb0/0x110
[ 1303.885761][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1303.940051][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1303.997454][  T329]  ? copy_page_range+0x580/0x580
[ 1304.054880][  T329]  do_user_addr_fault+0x2af/0x824
[ 1304.113309][  T329]  exc_page_fault+0x56/0xa0
[ 1304.165518][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1304.222928][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1304.279292][  T329] RIP: 0033:0x402cb9
[ 1304.324217][  T329] Code: Bad RIP value.
[ 1304.371230][  T329] RSP: 002b:00007fef2c4aeec0 EFLAGS: 00010206
[ 1304.442155][  T329] RAX: 00007fee34389000 RBX: 0000000000000000 RCX: 00007fef56c158c7
[ 1304.535965][  T329] RDX: 00007fee2f966000 RSI: 000000000ccccccc RDI: 0000000000000000
[ 1304.629772][  T329] RBP: 00007fef2c4aeef0 R08: 00000000ffffffff R09: 0000000000000000
[ 1304.723579][  T329] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffe2b9ddc4e
[ 1304.817383][  T329] R13: 00007ffe2b9ddc4f R14: 0000000000000000 R15: 00007fef2c4aefc0
[ 1304.911220][  T329] INFO: task random:2933 blocked for more than 181 seconds.
[ 1304.996684][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1305.068653][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1305.170778][  T329] random          D23704  2933   2020 0x00004000
[ 1305.244821][  T329] Call Trace:
[ 1305.282472][  T329]  __schedule+0x768/0x1ba0
[ 1305.333644][  T329]  ? __sched_text_start+0x8/0x8
[ 1305.390005][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1305.457815][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1305.515224][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1305.569514][  T329]  schedule+0xc1/0x2b0
[ 1305.616518][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1305.669770][  T329]  io_schedule+0x17/0x60
[ 1305.718851][  T329]  rq_qos_wait+0x1ce/0x330
[ 1305.770020][  T329]  ? __wbt_done+0x30/0x30
[ 1305.820149][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1305.879634][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1305.937045][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1305.997572][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1306.051859][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1306.115505][  T329]  wbt_wait+0x144/0x290
[ 1306.163556][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1306.218879][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1306.276290][  T329]  __rq_qos_throttle+0x47/0x90
[ 1306.331620][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1306.390063][  T329]  ? lock_downgrade+0x720/0x720
[ 1306.446431][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1306.514248][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1306.578926][  T329]  ? lock_downgrade+0x720/0x720
[ 1306.635296][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1306.696866][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1306.754273][  T329]  ? lock_downgrade+0x720/0x720
[ 1306.810639][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1306.872214][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1306.936893][  T329]  submit_bio_noacct+0x845/0xe90
[ 1306.994302][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1307.051712][  T329]  ? find_held_lock+0x33/0x1c0
[ 1307.107034][  T329]  ? mark_held_locks+0xb0/0x110
[ 1307.163405][  T329]  ? submit_bio+0xe7/0x480
[ 1307.214576][  T329]  submit_bio+0xe7/0x480
[ 1307.263661][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1307.323151][  T329]  ? lock_downgrade+0x720/0x720
[ 1307.379518][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1307.455642][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1307.525533][  T329]  __swap_writepage+0xb29/0x15d0
[ 1307.582940][  T329]  ? get_swap_bio+0x390/0x390
[ 1307.637226][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1307.705039][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1307.760360][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1307.818809][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1307.876221][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1307.941946][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1308.002476][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1308.061961][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1308.118327][  T329]  ? page_swapcount+0xeb/0x180
[ 1308.173660][  T329]  ? try_to_free_swap+0x487/0x670
[ 1308.232104][  T329]  pageout+0x44b/0x1060
[ 1308.280152][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1308.333403][  T329]  ? page_not_mapped+0x10/0x10
[ 1308.388729][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1308.448215][  T329]  ? page_mapped+0xf2/0x2e0
[ 1308.500425][  T329]  shrink_page_list+0x250f/0x3f10
[ 1308.558868][  T329]  ? pageout+0x1060/0x1060
[ 1308.610038][  T329]  ? mark_lock+0x50/0x1800
[ 1308.661208][  T329]  ? find_held_lock+0x33/0x1c0
[ 1308.716532][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1308.780183][  T329]  ? shrink_inactive_list+0x32d/0xa10
[ 1308.842794][  T329]  ? mark_held_locks+0xb0/0x110
[ 1308.899157][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1308.969050][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1309.029573][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1309.088020][  T329]  shrink_inactive_list+0x362/0xa10
[ 1309.148552][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1309.212197][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1309.273760][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1309.343656][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1309.401057][  T329]  shrink_lruvec+0x841/0x19e0
[ 1309.455346][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1309.525238][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1309.587845][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1309.648374][  T329]  ? lock_downgrade+0x720/0x720
[ 1309.704736][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1309.769424][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1309.827877][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1309.890480][  T329]  shrink_node+0x42b/0x1700
[ 1309.942688][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1310.004259][  T329]  ? shrink_node+0x1700/0x1700
[ 1310.059585][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1310.124271][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1310.185842][  T329]  try_to_free_pages+0x244/0x690
[ 1310.243244][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1310.316257][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1310.371581][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1310.441473][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1310.518639][  T329]  ? get_reg+0x220/0x220
[ 1310.567725][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1310.633457][  T329]  ? warn_alloc+0x120/0x120
[ 1310.685659][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1310.750347][  T329]  ? lock_downgrade+0x720/0x720
[ 1310.806720][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1310.876602][  T329]  ? _raw_spin_unlock_irqrestore+0x39/0x40
[ 1310.944413][  T329]  ? __isolate_free_page+0x570/0x570
[ 1311.005977][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1311.068589][  T329]  ? lock_downgrade+0x720/0x720
[ 1311.124952][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1311.205243][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1311.262647][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1311.316939][  T329]  ? __pte_alloc+0x120/0x250
[ 1311.370187][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1311.427592][  T329]  ? copy_page_range+0x580/0x580
[ 1311.485001][  T329]  do_user_addr_fault+0x2af/0x824
[ 1311.543452][  T329]  exc_page_fault+0x56/0xa0
[ 1311.595653][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1311.653063][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1311.709434][  T329] RIP: 0033:0x402cb9
[ 1311.754355][  T329] Code: Bad RIP value.
[ 1311.801366][  T329] RSP: 002b:00007fef2a4aaec0 EFLAGS: 00010206
[ 1311.872297][  T329] RAX: 00007fee91600000 RBX: 0000000000000000 RCX: 00007fef56c158c7
[ 1311.966101][  T329] RDX: 00007fee89301000 RSI: 000000000ccccccc RDI: 0000000000000000
[ 1312.059912][  T329] RBP: 00007fef2a4aaef0 R08: 00000000ffffffff R09: 0000000000000000
[ 1312.153715][  T329] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffe2b9ddc4e
[ 1312.247527][  T329] R13: 00007ffe2b9ddc4f R14: 0000000000000000 R15: 00007fef2a4aafc0
[ 1312.341354][  T329] INFO: task random:2936 blocked for more than 188 seconds.
[ 1312.426820][  T329]       Not tainted 5.8.0-rc4-next-20200713 #1
[ 1312.498801][  T329] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1312.600920][  T329] random          D23560  2936   2020 0x00004000
[ 1312.674966][  T329] Call Trace:
[ 1312.712612][  T329]  __schedule+0x768/0x1ba0
[ 1312.763782][  T329]  ? __sched_text_start+0x8/0x8
[ 1312.820150][  T329]  ? blk_insert_cloned_request+0x300/0x300
[ 1312.887955][  T329]  ? prepare_to_wait+0x2e0/0x2e0
[ 1312.945360][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1312.999653][  T329]  schedule+0xc1/0x2b0
[ 1313.046656][  T329]  ? rq_qos_wait+0x1c9/0x330
[ 1313.099904][  T329]  io_schedule+0x17/0x60
[ 1313.148996][  T329]  rq_qos_wait+0x1ce/0x330
[ 1313.200158][  T329]  ? __wbt_done+0x30/0x30
[ 1313.250288][  T329]  ? rq_depth_scale_down+0xe0/0xe0
[ 1313.309781][  T329]  ? find_held_lock+0x33/0x1c0
[ 1313.365102][  T329]  ? efi_partition.cold.9+0x1d/0x1d
[ 1313.425633][  T329]  ? wbt_cleanup_cb+0x80/0x80
[ 1313.479922][  T329]  ? lock_downgrade+0x720/0x720
[ 1313.536287][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1313.591616][  T329]  wbt_wait+0x144/0x290
[ 1313.639666][  T329]  ? rwb_arm_timer+0x1c0/0x1c0
[ 1313.694990][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1313.751359][  T329]  __rq_qos_throttle+0x47/0x90
[ 1313.806690][  T329]  blk_mq_submit_bio+0x33b/0x1e20
[ 1313.865134][  T329]  ? lock_downgrade+0x720/0x720
[ 1313.921498][  T329]  ? blk_mq_try_issue_directly+0x140/0x140
[ 1313.989317][  T329]  ? dm_submit_bio+0x158/0x440 [dm_mod]
[ 1314.053995][  T329]  ? lock_downgrade+0x720/0x720
[ 1314.110363][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1314.171934][  T329]  ? blk_queue_enter+0x83c/0x9a0
[ 1314.229339][  T329]  ? lock_downgrade+0x720/0x720
[ 1314.285705][  T329]  ? submit_bio_checks+0x1cc0/0x1cc0
[ 1314.347282][  T329]  ? dm_submit_bio+0x176/0x440 [dm_mod]
[ 1314.411965][  T329]  submit_bio_noacct+0x845/0xe90
[ 1314.469374][  T329]  ? blk_queue_enter+0x9a0/0x9a0
[ 1314.526776][  T329]  ? find_held_lock+0x33/0x1c0
[ 1314.582103][  T329]  ? mark_held_locks+0xb0/0x110
[ 1314.638476][  T329]  ? submit_bio+0xe7/0x480
[ 1314.689640][  T329]  submit_bio+0xe7/0x480
[ 1314.738729][  T329]  ? submit_bio_noacct+0xe90/0xe90
[ 1314.798220][  T329]  ? lock_downgrade+0x720/0x720
[ 1314.854582][  T329]  ? balance_dirty_pages_ratelimited+0x1540/0x1540
[ 1314.930714][  T329]  ? bio_associate_blkg_from_css+0x4bd/0xd30
[ 1315.000599][  T329]  __swap_writepage+0xb29/0x15d0
[ 1315.058007][  T329]  ? get_swap_bio+0x390/0x390
[ 1315.112299][  T329]  ? generic_swapfile_activate+0x5b0/0x5b0
[ 1315.180105][  T329]  ? rcu_read_unlock+0x50/0x50
[ 1315.235433][  T329]  ? do_raw_spin_lock+0x121/0x290
[ 1315.293881][  T329]  ? rwlock_bug.part.1+0x90/0x90
[ 1315.351284][  T329]  ? page_lock_anon_vma_read+0x11a/0x3c0
[ 1315.417013][  T329]  ? down_write_trylock+0x2f0/0x2f0
[ 1315.477545][  T329]  ? do_raw_spin_unlock+0x4f/0x250
[ 1315.537028][  T329]  ? _raw_spin_unlock+0x1a/0x30
[ 1315.593398][  T329]  ? page_swapcount+0xeb/0x180
[ 1315.648728][  T329]  ? try_to_free_swap+0x487/0x670
[ 1315.707170][  T329]  pageout+0x44b/0x1060
[ 1315.755221][  T329]  ? shrink_slab+0x4b0/0x4b0
[ 1315.808471][  T329]  ? page_not_mapped+0x10/0x10
[ 1315.863797][  T329]  ? page_get_anon_vma+0x290/0x290
[ 1315.923279][  T329]  ? page_mapped+0xf2/0x2e0
[ 1315.975493][  T329]  shrink_page_list+0x250f/0x3f10
[ 1316.033938][  T329]  ? pageout+0x1060/0x1060
[ 1316.085106][  T329]  ? mark_held_locks+0xb0/0x110
[ 1316.141476][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1316.211361][  T329]  ? asm_sysvec_call_function+0x12/0x20
[ 1316.276053][  T329]  ? trace_hardirqs_on+0x20/0x1b5
[ 1316.334496][  T329]  ? asm_sysvec_call_function+0x12/0x20
[ 1316.399188][  T329]  ? _raw_spin_unlock_irq+0x1f/0x30
[ 1316.459711][  T329]  shrink_inactive_list+0x362/0xa10
[ 1316.520243][  T329]  ? print_irqtrace_events+0x270/0x270
[ 1316.583889][  T329]  ? isolate_lru_pages+0x10a0/0x10a0
[ 1316.645455][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1316.715347][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1316.772751][  T329]  shrink_lruvec+0x841/0x19e0
[ 1316.827035][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1316.896929][  T329]  ? shrink_active_list+0x1060/0x1060
[ 1316.959534][  T329]  ? percpu_ref_put_many+0xa8/0x180
[ 1317.020065][  T329]  ? lock_downgrade+0x720/0x720
[ 1317.076427][  T329]  ? rcu_read_lock_sched_held+0xd0/0xd0
[ 1317.141115][  T329]  ? rcu_read_lock_held+0xaa/0xc0
[ 1317.199567][  T329]  ? mem_cgroup_protected+0x228/0x470
[ 1317.262171][  T329]  shrink_node+0x42b/0x1700
[ 1317.314379][  T329]  do_try_to_free_pages+0x348/0x1250
[ 1317.375950][  T329]  ? shrink_node+0x1700/0x1700
[ 1317.431276][  T329]  ? rcu_read_lock_sched_held+0xaa/0xd0
[ 1317.495959][  T329]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1317.557534][  T329]  try_to_free_pages+0x244/0x690
[ 1317.614938][  T329]  ? free_unref_page_prepare.part.42+0xc0/0x170
[ 1317.687951][  T329]  ? reclaim_pages+0x9a0/0x9a0
[ 1317.743273][  T329]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[ 1317.813166][  T329]  __alloc_pages_slowpath.constprop.73+0x7b8/0x2410
[ 1317.890329][  T329]  ? get_page_from_freelist+0x3b8/0x3930
[ 1317.956059][  T329]  ? __lock_acquire+0xc57/0x4da0
[ 1318.013462][  T329]  ? warn_alloc+0x120/0x120
[ 1318.065671][  T329]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[ 1318.130361][  T329]  ? lock_downgrade+0x720/0x720
[ 1318.186729][  T329]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[ 1318.256619][  T329]  ? __isolate_free_page+0x570/0x570
[ 1318.318185][  T329]  __alloc_pages_nodemask+0x66b/0x7d0
[ 1318.380789][  T329]  ? handle_mm_fault+0x1f3/0x2ef0
[ 1318.439237][  T329]  ? __alloc_pages_slowpath.constprop.73+0x2410/0x2410
[ 1318.519529][  T329]  ? mark_held_locks+0xb0/0x110
[ 1318.575896][  T329]  alloc_pages_vma+0xa5/0x4c0
[ 1318.630179][  T329]  handle_mm_fault+0x1bdf/0x2ef0
[ 1318.687593][  T329]  ? copy_page_range+0x580/0x580
[ 1318.744998][  T329]  do_user_addr_fault+0x2af/0x824
[ 1318.803443][  T329]  exc_page_fault+0x56/0xa0
[ 1318.855655][  T329]  ? asm_exc_page_fault+0x8/0x30
[ 1318.913059][  T329]  asm_exc_page_fault+0x1e/0x30
[ 1318.969427][  T329] RIP: 0033:0x402cb9
[ 1319.014356][  T329] Code: Bad RIP value.
[ 1319.061359][  T329] RSP: 002b:00007fef28ca7ec0 EFLAGS: 00010206
[ 1319.132293][  T329] RAX: 00007fee500e8000 RBX: 0000000000000000 RCX: 00007fef56c158c7
[ 1319.226100][  T329] RDX: 00007fee49300000 RSI: 000000000ccccccc RDI: 0000000000000000
[ 1319.319904][  T329] RBP: 00007fef28ca7ef0 R08: 00000000ffffffff R09: 0000000000000000
[ 1319.413715][  T329] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffe2b9ddc4e
[ 1319.507517][  T329] R13: 00007ffe2b9ddc4f R14: 0000000000000000 R15: 00007fef28ca7fc0
[ 1319.601387][  T329] 
[ 1319.601387][  T329] Showing all locks held in the system:
[ 1319.692146][  T329] 3 locks held by kworker/u258:4/305:
[ 1319.754730][  T329]  #0: ffff88866721a938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x7c8/0x17c0
[ 1319.879783][  T329]  #1: ffffc90004ff7e00 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x7fc/0x17c0
[ 1320.019301][  T329]  #2: ffff88866c1dc0e0 (&type->s_umount_key#27){++++}-{3:3}, at: trylock_super+0x11/0xb0
[ 1320.136000][  T329] 1 lock held by khungtaskd/329:
[ 1320.193395][  T329]  #0: ffffffff9618a0a0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire.constprop.29+0x0/0x30
[ 1320.316328][  T329] 1 lock held by khugepaged/335:
[ 1320.373730][  T329]  #0: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1320.490469][  T329] 2 locks held by gmain/1219:
[ 1320.544707][  T329]  #0: ffff8886440c6150 (&inode->i_sb->s_type->i_mutex_dir_key){++++}-{3:3}, at: walk_component+0x36d/0x5f0
[ 1320.680115][  T329]  #1: ffff8886440c5ea8 (&xfs_dir_ilock_class){++++}-{3:3}, at: xfs_ilock_data_map_shared+0x41/0xa0
[ 1320.807217][  T329] 2 locks held by crond/1500:
[ 1320.861488][  T329]  #0: ffff8886440c6150 (&inode->i_sb->s_type->i_mutex_dir_key){++++}-{3:3}, at: walk_component+0x36d/0x5f0
[ 1320.996946][  T329]  #1: ffff8886440c5ea8 (&xfs_dir_ilock_class){++++}-{3:3}, at: xfs_ilock_data_map_shared+0x41/0xa0
[ 1321.123996][  T329] 1 lock held by runtest.sh/1543:
[ 1321.182428][  T329]  #0: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1321.299145][  T329] 2 locks held by random/2918:
[ 1321.354442][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1321.472183][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1321.588864][  T329] 2 locks held by random/2925:
[ 1321.644189][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1321.761912][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1321.878611][  T329] 2 locks held by random/2926:
[ 1321.933933][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1322.051709][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1322.168353][  T329] 2 locks held by random/2928:
[ 1322.223676][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1322.341399][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1322.458098][  T329] 2 locks held by random/2929:
[ 1322.513415][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1322.631146][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1322.747838][  T329] 2 locks held by random/2933:
[ 1322.803161][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1322.920887][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1323.037583][  T329] 2 locks held by random/2936:
[ 1323.092900][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1323.210683][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1323.327323][  T329] 2 locks held by random/2940:
[ 1323.382661][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1323.500369][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1323.617061][  T329] 2 locks held by random/2945:
[ 1323.672380][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1323.790111][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1323.906806][  T329] 2 locks held by random/2947:
[ 1323.962123][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1324.079850][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1324.196547][  T329] 2 locks held by random/2948:
[ 1324.251867][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1324.369595][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1324.486289][  T329] 2 locks held by random/2949:
[ 1324.541609][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1324.659335][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1324.776034][  T329] 2 locks held by random/2950:
[ 1324.831350][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1324.949081][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1325.065772][  T329] 2 locks held by random/2951:
[ 1325.121097][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1325.238822][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1325.355518][  T329] 2 locks held by random/2952:
[ 1325.410836][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1325.528565][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1325.645261][  T329] 2 locks held by random/2953:
[ 1325.700579][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1325.818307][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1325.935003][  T329] 2 locks held by random/2954:
[ 1325.990321][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1326.108051][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1326.224745][  T329] 2 locks held by random/2956:
[ 1326.280066][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1326.397792][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1326.514488][  T329] 2 locks held by random/2957:
[ 1326.569806][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1326.687534][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1326.804230][  T329] 2 locks held by random/2959:
[ 1326.859550][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1326.977276][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1327.093974][  T329] 2 locks held by random/2960:
[ 1327.149292][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1327.267022][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1327.383716][  T329] 2 locks held by random/2961:
[ 1327.439035][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1327.556763][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1327.673458][  T329] 2 locks held by random/2963:
[ 1327.728778][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1327.846508][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1327.963199][  T329] 2 locks held by random/2964:
[ 1328.018523][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1328.136248][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1328.252942][  T329] 2 locks held by random/2965:
[ 1328.308261][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1328.425990][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1328.542684][  T329] 2 locks held by random/2966:
[ 1328.598006][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1328.715732][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1328.832428][  T329] 2 locks held by random/2968:
[ 1328.887748][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1329.005476][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1329.122172][  T329] 2 locks held by random/2969:
[ 1329.177491][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1329.295219][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1329.411911][  T329] 2 locks held by random/2971:
[ 1329.467232][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1329.584962][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1329.701653][  T329] 2 locks held by random/2973:
[ 1329.756976][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1329.874703][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1329.991398][  T329] 2 locks held by random/2976:
[ 1330.046717][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1330.164447][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1330.281140][  T329] 2 locks held by random/2978:
[ 1330.336460][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1330.454189][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1330.570882][  T329] 2 locks held by random/2979:
[ 1330.626203][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1330.743932][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1330.860627][  T329] 2 locks held by random/2980:
[ 1330.915947][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1331.033674][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1331.150371][  T329] 2 locks held by random/2981:
[ 1331.205688][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1331.323416][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1331.440109][  T329] 2 locks held by random/2983:
[ 1331.495432][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1331.613158][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1331.729852][  T329] 2 locks held by random/2985:
[ 1331.785172][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1331.902903][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1332.019594][  T329] 2 locks held by random/2986:
[ 1332.074918][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1332.192644][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1332.309338][  T329] 2 locks held by random/2987:
[ 1332.364659][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1332.482385][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1332.599081][  T329] 2 locks held by random/2991:
[ 1332.654403][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1332.772131][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1332.888828][  T329] 2 locks held by random/2992:
[ 1332.944141][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1333.061872][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1333.178566][  T329] 2 locks held by random/2998:
[ 1333.233888][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1333.351613][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1333.468309][  T329] 2 locks held by random/2999:
[ 1333.523627][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1333.641356][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1333.758053][  T329] 2 locks held by random/3000:
[ 1333.813366][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1333.931103][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1334.047794][  T329] 2 locks held by random/3001:
[ 1334.103115][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1334.220842][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1334.337537][  T329] 2 locks held by random/3002:
[ 1334.392857][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1334.510583][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1334.627280][  T329] 2 locks held by random/3004:
[ 1334.682599][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1334.800327][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1334.917021][  T329] 2 locks held by random/3006:
[ 1334.972342][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1335.090069][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1335.206766][  T329] 2 locks held by random/3008:
[ 1335.262084][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1335.379814][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1335.496507][  T329] 2 locks held by random/3009:
[ 1335.551828][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1335.669557][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1335.786250][  T329] 2 locks held by random/3010:
[ 1335.841569][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1335.959298][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1336.075991][  T329] 2 locks held by random/3011:
[ 1336.131312][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1336.249038][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1336.365734][  T329] 2 locks held by random/3012:
[ 1336.421053][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1336.538782][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1336.655480][  T329] 2 locks held by random/3014:
[ 1336.710796][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1336.828525][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1336.945221][  T329] 2 locks held by random/3015:
[ 1337.000539][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1337.118267][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1337.234960][  T329] 2 locks held by random/3016:
[ 1337.290284][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1337.408008][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1337.524704][  T329] 2 locks held by random/3017:
[ 1337.580024][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1337.697753][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1337.814448][  T329] 2 locks held by random/3019:
[ 1337.869767][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1337.987498][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1338.104189][  T329] 2 locks held by random/3020:
[ 1338.159509][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1338.277238][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1338.393931][  T329] 2 locks held by random/3021:
[ 1338.449254][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1338.566977][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1338.683677][  T329] 2 locks held by random/3022:
[ 1338.738994][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1338.856723][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1338.973418][  T329] 2 locks held by random/3023:
[ 1339.028737][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1339.146464][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1339.263162][  T329] 2 locks held by random/3025:
[ 1339.318479][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1339.436208][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1339.552902][  T329] 2 locks held by random/3027:
[ 1339.608222][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1339.725949][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1339.842646][  T329] 2 locks held by random/3028:
[ 1339.897965][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1340.015694][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1340.132389][  T329] 2 locks held by random/3029:
[ 1340.187707][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1340.305434][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1340.422130][  T329] 2 locks held by random/3030:
[ 1340.477451][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1340.595179][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1340.711872][  T329] 2 locks held by random/3031:
[ 1340.767192][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1340.884918][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1341.001615][  T329] 2 locks held by random/3032:
[ 1341.056936][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1341.174664][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1341.291359][  T329] 2 locks held by random/3033:
[ 1341.346678][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1341.464405][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1341.581100][  T329] 2 locks held by random/3034:
[ 1341.636419][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1341.754148][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1341.870843][  T329] 2 locks held by random/3035:
[ 1341.926164][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1342.043890][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1342.160585][  T329] 2 locks held by random/3036:
[ 1342.215906][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1342.333634][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1342.450326][  T329] 2 locks held by random/3037:
[ 1342.505648][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1342.623377][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1342.740070][  T329] 2 locks held by random/3038:
[ 1342.795390][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1342.913118][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1343.029812][  T329] 2 locks held by random/3039:
[ 1343.085135][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1343.202859][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1343.319554][  T329] 2 locks held by random/3040:
[ 1343.374876][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1343.492606][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1343.609300][  T329] 2 locks held by random/3041:
[ 1343.664619][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1343.782346][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1343.899041][  T329] 2 locks held by random/3042:
[ 1343.954359][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1344.072089][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1344.188783][  T329] 2 locks held by random/3043:
[ 1344.244102][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1344.361831][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1344.478525][  T329] 2 locks held by random/3044:
[ 1344.533846][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1344.651573][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1344.768267][  T329] 2 locks held by random/3045:
[ 1344.823588][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1344.941316][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1345.058020][  T329] 2 locks held by random/3046:
[ 1345.113323][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1345.231060][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1345.347752][  T329] 2 locks held by random/3047:
[ 1345.403074][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1345.520800][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1345.637496][  T329] 2 locks held by random/3048:
[ 1345.692818][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1345.810543][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1345.927241][  T329] 2 locks held by random/3049:
[ 1345.982557][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1346.100287][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1346.216981][  T329] 2 locks held by random/3050:
[ 1346.272301][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1346.390029][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1346.506723][  T329] 2 locks held by random/3051:
[ 1346.562043][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1346.679772][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1346.796466][  T329] 2 locks held by random/3052:
[ 1346.851787][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1346.969515][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1347.086208][  T329] 2 locks held by random/3053:
[ 1347.141528][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1347.259257][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1347.375951][  T329] 2 locks held by random/3054:
[ 1347.431270][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1347.549000][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1347.665694][  T329] 2 locks held by random/3055:
[ 1347.721014][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1347.838743][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1347.955435][  T329] 2 locks held by random/3056:
[ 1348.010757][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1348.128485][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1348.245177][  T329] 2 locks held by random/3057:
[ 1348.300499][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1348.418225][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1348.534921][  T329] 2 locks held by random/3058:
[ 1348.590242][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1348.707967][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1348.824666][  T329] 2 locks held by random/3059:
[ 1348.879985][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1348.997713][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1349.114407][  T329] 2 locks held by random/3060:
[ 1349.169727][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1349.287452][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1349.404149][  T329] 2 locks held by random/3061:
[ 1349.459469][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1349.577198][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1349.693890][  T329] 2 locks held by random/3062:
[ 1349.749213][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1349.866941][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1349.983636][  T329] 2 locks held by random/3063:
[ 1350.038953][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1350.156684][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1350.273375][  T329] 2 locks held by random/3064:
[ 1350.328697][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1350.446424][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1350.563118][  T329] 2 locks held by random/3065:
[ 1350.618439][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1350.736167][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1350.852862][  T329] 2 locks held by random/3066:
[ 1350.908183][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1351.025909][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1351.142607][  T329] 2 locks held by random/3067:
[ 1351.197925][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1351.315654][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1351.432345][  T329] 2 locks held by random/3068:
[ 1351.487665][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1351.605394][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1351.722090][  T329] 2 locks held by random/3069:
[ 1351.777408][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1351.895137][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1352.011834][  T329] 2 locks held by random/3070:
[ 1352.067150][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1352.184882][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1352.301573][  T329] 2 locks held by random/3071:
[ 1352.356895][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1352.474622][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1352.591317][  T329] 2 locks held by random/3072:
[ 1352.646638][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1352.764363][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1352.881061][  T329] 2 locks held by random/3073:
[ 1352.936380][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1353.054107][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1353.170802][  T329] 2 locks held by random/3074:
[ 1353.226122][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1353.343851][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1353.460544][  T329] 2 locks held by random/3075:
[ 1353.515864][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1353.633594][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1353.750287][  T329] 2 locks held by random/3076:
[ 1353.805609][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1353.923338][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1354.040031][  T329] 2 locks held by random/3077:
[ 1354.095350][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1354.213080][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1354.329772][  T329] 2 locks held by random/3078:
[ 1354.385093][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1354.502821][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1354.619516][  T329] 2 locks held by random/3079:
[ 1354.674835][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1354.792564][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1354.909255][  T329] 2 locks held by random/3080:
[ 1354.964577][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x161/0x824
[ 1355.082305][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1355.199000][  T329] 2 locks held by random/3081:
[ 1355.254322][  T329]  #0: ffff888159045f98 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x500/0x824
[ 1355.372048][  T329]  #1: ffffffff962d2b00 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire.part.64+0x0/0x30
[ 1355.488743][  T329] 2 locks held by awk/3083:
[ 1355.540945][  T329]  #0: ffff8886440c6150 (&inode->i_sb->s_type->i_mutex_dir_key){++++}-{3:3}, at: walk_component+0x36d/0x5f0
[ 1355.676350][  T329]  #1: ffff8886440c5ea8 (&xfs_dir_ilock_class){++++}-{3:3}, at: xfs_ilock_data_map_shared+0x41/0xa0
[ 1355.803446][  T329] =============================================
[ 1355.803446][  T329] 
