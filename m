Return-Path: <linux-next+bounces-6084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B761A7546D
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 07:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D714017270C
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 06:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37DE7E765;
	Sat, 29 Mar 2025 06:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="Vms5GMt4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9EEEBA
	for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743228135; cv=none; b=o7God4NreGDz1mfen9yWMetJcIQ4J+mShEUy7mNqJ64Sl26vviQcgGR3uK3sMBQZ7kyx53/jzyIBUajM4VnLmYgnk/MBrjbaDplw9t+FIFWTJELy2FISnkITDVbpeLa1J4TrBFrsFKQjIEh9a4HYKFaPpV/nJ6cLo3NdRxuIjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743228135; c=relaxed/simple;
	bh=wNxhe+rWQoGRC6duS7Ckowlo1wnA1Bcwre/uCDy9EKM=;
	h=From:To:cc:Subject:In-reply-to:References:Mime-Version:
	 Content-Type:Date:Message-ID; b=oHN60qSDCMtG41BslwoyaGvHbxO4gn55/9FTRlaljyLLfljjavpd+mIsgjWp1hCeBliH4MVcgBH9gG8Ymtb2UG4rdGmDZsncR5d7RaJlX09QIc5jrJSswoLeUAPIzHxbxmsxLQXR9FdyM25fVhocgG0AZTObJkNideMLXW1bu/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=Vms5GMt4; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5675dec99so348213385a.0
        for <linux-next@vger.kernel.org>; Fri, 28 Mar 2025 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1743228132; x=1743832932; darn=vger.kernel.org;
        h=message-id:date:mime-version:references:in-reply-to:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yd9YLVPtD8axfm0LhvKZP7RniIiBIW1ndqouPPCDs3M=;
        b=Vms5GMt4+ykdKRVA6jAZ14RN6VGf8oNtnFvCvUrBjxLyDfm/SxZAFUYsYGHS/6qN7c
         QtVnn32o/0tLw+m1JESv4DqPQP+ozuQvZz4AebxLwyY600Ya6KAVuD7jJtC6a8PHjXfU
         6sGPm3NLH9OZcmJrIBnvcee08ySSdFz1A/SFq2RBw4yYphH1lMrJOdq8wydlOEdGUrmE
         lnGEb9p7jt3cXFJ8o5d7QQqYZ3+ExwVOE2u5+SYjbhpDbNloBL8iHEQMjxW37XTwmKnz
         uq6yhox+hky3S7cNnkTO9vT36oD2zg6MA0Q92oPuYszPAFFsfWPDeM/qN8tN/HR2b14S
         4TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743228132; x=1743832932;
        h=message-id:date:mime-version:references:in-reply-to:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yd9YLVPtD8axfm0LhvKZP7RniIiBIW1ndqouPPCDs3M=;
        b=CfE1W07d+Tjvk8xuSTERczi1CvWiRTM2gCvsck5poyur6Fzh9ZfR4PKu1CLNNGMTj3
         Zbek1nKvsuP6BNBPz/m0rK9JLvTeYI9ngXogeV0K7CuMJ3JVE+3ogpC5/pQYIuSe4JLy
         w5sybn8bfhnesOP4IfWIxysxg8ymIkeRDQkhzsrxCT/NnZbI3G+HNKdM7VCHJaWet4nN
         75FcMqtIcD+7Zbyh7jfvomALOs7aeF1MeDmT+kj1dHnSbyI/2AqSNqoQmdXlynP3N4/m
         lUkz/dTQY/8cGl/MK4i4DOOwaLoQwA3fTxmF+2mzB9wa+9w2/cbZpTJZ/qFdvck7Ahzd
         AGWg==
X-Forwarded-Encrypted: i=1; AJvYcCV5cF31vaWnvwCJ4QRad2DzeB0iaXx2ui+RillSbpcUxFQQT6TFOHcTk9A50OcOuUO8UZrc5DkDytuZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXi4nZSl94MXhpBQN+DKVXmazgqezO1O0VXad6fakEC0Tlv7tF
	5Mu7k03qaxBVDTnVbZwzJSl7q6ySAu0tp7Z2iYIxMSOka/L5kgDV9t+BaybABtA=
X-Gm-Gg: ASbGnct0dv/52qYDpOjzSrON9N7kNb4g9ggyHL8jcaIgp6fXJvI8z9pcDI9a0Ntbkbn
	HJlS/Hct7My5Ko1/ft3XveQs4uS7jAOY6WX4CISFu/4INmUyVpW1w2L1O5I0AKgtqqjd1W1vYz5
	0svWMw9YvEGDsOUqJjhhBbHgX0ap5wmyWnbiqJmyWNViFfFWCACaMdNW5QoBxzwEkBPs1huCsS3
	hh+D3pzmz/GV6EHTLGhdOvI7i6uMCvCVNsD3LXE56toKWppLENyukTBHWmhau2HAzlV/V4Gc+S4
	rysSu9ktvyYbD0LZ8h8KqY8dbLc8gNkyUt0CzDTT
X-Google-Smtp-Source: AGHT+IG2DCY7Ldp9rOmylZCs5R++q3u4fta77kE4MAFYfU7PoL+jxbKFr5Jewn89iztu0BLDtdphoQ==
X-Received: by 2002:a05:620a:4607:b0:7c5:ae20:e832 with SMTP id af79cd13be357-7c6862e740amr204567285a.11.1743228132172;
        Fri, 28 Mar 2025 23:02:12 -0700 (PDT)
Received: from turing-police ([2601:5cf:407f:b7f2::c36])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f765ada7sm214508085a.9.2025.03.28.23.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 23:02:11 -0700 (PDT)
Sender: Valdis Kletnieks <valdis@vt.edu>
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.10.0-pre 07/05/2021 with nmh-1.8+dev
To: Ming Lei <ming.lei@redhat.com>
cc: Stephen Rothwell <sfr@canb.auug.org.au>,
    Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: next-20250327 - lockdep whine and USB issues at boot
In-reply-to: <Z-dVr6cIyrOID0J0@fedora>
References: <8775.1743185453@turing-police>
 <Z-dVr6cIyrOID0J0@fedora>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 29 Mar 2025 02:02:10 -0400
Message-ID: <7755.1743228130@turing-police>

On Sat, 29 Mar 2025 10:06:39 +0800, Ming Lei said:
> On Fri, Mar 28, 2025 at 02:10:53PM -0400, Valdis Klētnieks wrote:
> > Saw this during boot on a Dell Inspiron 5559 laptop.  
> > 
> > In addition, the external USB ports all gave up, rendering a USB mouse and a
> > USB external drive totally dead in the water.  May or may not be related, I didn't
> > dig too far into it.
>
> It shouldn't be related to the warning.

> For this lockdep warning, feel free to try patch in the following link:
>
> https://lore.kernel.org/linux-block/Z-dUCLvf06SfTOHy@fedora/

After applying that patch, USB *didn't* die during boot.  So apparently
*something* changed.  

Also, the patch merely caused a *different* lockdep warning.
Rather than  &q->q_usage_counter(io) and &q->elevator_lock, the
new one is &q->elevator_lock versus pcpu_alloc_mutex...

Looks like it's a bit more convoluted than first looked?

[   52.140990] [    T954] io scheduler bfq registered

[   52.355286] [    T848] ======================================================
[   52.436367] [    T848] WARNING: possible circular locking dependency detected
[   52.517414] [    T848] 6.14.0-next-20250327-dirty #111 Tainted: G          I     T  
[   52.598492] [    T848] ------------------------------------------------------
[   52.679571] [    T848] (udev-worker)/848 is trying to acquire lock:
[   52.760647] [    T848] ffffffff99bb4470 (pcpu_alloc_mutex){+.+.}-{4:4}, at: pcpu_alloc_noprof+0x524/0x840
[   53.162776] [    T848] 
                          but task is already holding lock:
[   53.244616] [    T848] ffff8c22c3392428 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe1/0x260
[   53.646741] [    T848] 
                          which lock already depends on the new lock.

[   53.729459] [    T848] 
                          the existing dependency chain (in reverse order) is:
[   53.811348] [    T848] 
                          -> #3 (&q->elevator_lock){+.+.}-{4:4}:
[   54.214266] [    T848]        lock_acquire.part.0+0xbe/0x240
[   54.295342] [    T848]        __mutex_lock+0xcb/0xfc0
[   54.376409] [    T848]        elv_iosched_store+0xe1/0x260
[   54.457476] [    T848]        kernfs_fop_write_iter+0x160/0x240
[   54.538548] [    T848]        vfs_write+0x2ec/0x5c0
[   54.619619] [    T848]        ksys_write+0x7a/0xf0
[   54.700687] [    T848]        do_syscall_64+0x68/0x140
[   54.781751] [    T848]        entry_SYSCALL_64_after_hwframe+0x71/0x79
[   54.862814] [    T848] 
                          -> #2 (&q->q_usage_counter(io)#10){++++}-{0:0}:
[   55.345959] [    T848]        lock_acquire.part.0+0xbe/0x240
[   55.427018] [    T848]        blk_alloc_queue+0x30b/0x350
[   55.508082] [    T848]        blk_mq_alloc_queue+0x62/0xd0
[   55.589134] [    T848]        scsi_alloc_sdev+0x29c/0x3d0
[   55.670185] [    T848]        scsi_probe_and_add_lun+0x1d8/0x2b0
[   55.751232] [    T848]        __scsi_add_device+0x114/0x130
[   55.832276] [    T848]        ata_scsi_scan_host+0x7a/0x190
[   55.913321] [    T848]        async_run_entry_fn+0x24/0xc0
[   55.994358] [    T848]        process_one_work+0x21e/0x5a0
[   56.075404] [    T848]        worker_thread+0x1d5/0x3c0
[   56.156444] [    T848]        kthread+0x114/0x230
[   56.237474] [    T848]        ret_from_fork+0x2c/0x50
[   56.318492] [    T848]        ret_from_fork_asm+0x1a/0x30
[   56.399515] [    T848] 
                          -> #1 (fs_reclaim){+.+.}-{0:0}:
[   56.802275] [    T848]        lock_acquire.part.0+0xbe/0x240
[   56.883298] [    T848]        fs_reclaim_acquire+0xa8/0xe0
[   56.964317] [    T848]        __alloc_frozen_pages_noprof+0xd2/0x340
[   57.045338] [    T848]        __alloc_pages_noprof+0x9/0x20
[   57.126360] [    T848]        pcpu_alloc_pages.isra.0+0x97/0x180
[   57.207375] [    T848]        pcpu_populate_chunk+0x34/0x70
[   57.288388] [    T848]        pcpu_alloc_noprof+0x2d1/0x840
[   57.369366] [    T848]        iommu_dma_init_fq+0x91/0x260
[   57.450373] [    T848]        iommu_dma_init_domain+0x1de/0x210
[   57.531381] [    T848]        iommu_setup_dma_ops+0x47/0x80
[   57.612355] [    T848]        iommu_device_register+0x172/0x250
[   57.693348] [    T848]        intel_iommu_init+0x5ef/0xbb0
[   57.774344] [    T848]        pci_iommu_init+0x29/0x90
[   57.855333] [    T848]        do_one_initcall+0x83/0x3c0
[   57.936316] [    T848]        do_initcalls+0x130/0x1b0
[   58.017300] [    T848]        kernel_init_freeable+0x292/0x300
[   58.098281] [    T848]        kernel_init+0x15/0x130
[   58.179254] [    T848]        ret_from_fork+0x2c/0x50
[   58.260224] [    T848]        ret_from_fork_asm+0x1a/0x30
[   58.341195] [    T848] 
                          -> #0 (pcpu_alloc_mutex){+.+.}-{4:4}:
[   58.743832] [    T848]        check_prev_add+0xe1/0xcf0
[   58.824752] [    T848]        __lock_acquire+0x1031/0x13b0
[   58.905697] [    T848]        lock_acquire.part.0+0xbe/0x240
[   58.986633] [    T848]        __mutex_lock+0xcb/0xfc0
[   59.067565] [    T848]        pcpu_alloc_noprof+0x524/0x840
[   59.148463] [    T848]        sbitmap_init_node+0xf0/0x230
[   59.229392] [    T848]        sbitmap_queue_init_node+0x29/0x140
[   59.310317] [    T848]        blk_mq_init_tags+0x95/0x110
[   59.391240] [    T848]        blk_mq_alloc_map_and_rqs+0x3c/0x110
[   59.472131] [    T848]        blk_mq_init_sched+0x100/0x260
[   59.553017] [    T848]        elevator_switch+0xb1/0x190
[   59.633926] [    T848]        elv_iosched_store+0x1db/0x260
[   59.714841] [    T848]        kernfs_fop_write_iter+0x160/0x240
[   59.795728] [    T848]        vfs_write+0x2ec/0x5c0
[   59.876599] [    T848]        ksys_write+0x7a/0xf0
[   59.957500] [    T848]        do_syscall_64+0x68/0x140
[   60.038396] [    T848]        entry_SYSCALL_64_after_hwframe+0x71/0x79
[   60.119269] [    T848] 
                          other info that might help us debug this:

[   60.201395] [    T848] Chain exists of:
                            pcpu_alloc_mutex --> &q->q_usage_counter(io)#10 --> &q->elevator_lock

[   60.845339] [    T848]  Possible unsafe locking scenario:

[   60.926872] [    T848]        CPU0                    CPU1
[   61.007776] [    T848]        ----                    ----
[   61.088676] [    T848]   lock(&q->elevator_lock);
[   61.330053] [    T848]                                lock(&q->q_usage_counter(io)#10);
[   61.651731] [    T848]                                lock(&q->elevator_lock);
[   61.893151] [    T848]   lock(pcpu_alloc_mutex);
[   62.134602] [    T848] 
                           *** DEADLOCK ***

[   62.216729] [    T848] 6 locks held by (udev-worker)/848:
[   62.297630] [    T848]  #0: ffff8c22c8575440 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0x7a/0xf0
[   62.860055] [    T848]  #1: ffff8c22c9fb4090 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x119/0x240
[   63.422482] [    T848]  #2: ffff8c22c821fad0 (kn->active#89){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x122/0x240
[   63.984915] [    T848]  #3: ffff8c22c3391e98 (&q->q_usage_counter(io)#10){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20
[   64.547390] [    T848]  #4: ffff8c22c3391ed8 (&q->q_usage_counter(queue)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20
[   65.029578] [    T848]  #5: ffff8c22c3392428 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe1/0x260
[   65.511794] [    T848] 
                          stack backtrace:
[   65.593348] [    T848] CPU: 1 UID: 0 PID: 848 Comm: (udev-worker) Tainted: G          I     T   6.14.0-next-20250327-dirty #111 PREEMPT(full)  7b54f670bb22238ec039f82f30e0fd3bcc8dbc83
[   65.673611] [    T848] Tainte                                                  
[   65.753868] [    T848] Hardware name: Dell Inc. Unidentified System/052K07, BIOS 1.9.0 09/07/2020
[   65.834126] [    T848] Call Trace:
[   65.914385] [    T848]  <TASK>
[   65.994655] [    T848]  dump_stack_lvl+0x65/0x90
[   66.074916] [    T848]  print_circular_bug.cold+0x38/0x46
[   66.155178] [    T848]  check_noncircular+0x169/0x190
[   66.235441] [    T848]  check_prev_add+0xe1/0xcf0
[   66.315699] [    T848]  ? add_chain_cache+0x115/0x4c0
[   66.395961] [    T848]  __lock_acquire+0x1031/0x13b0
[   66.476225] [    T848]  lock_acquire.part.0+0xbe/0x240
[   66.556484] [    T848]  ? pcpu_alloc_noprof+0x524/0x840
[   66.636745] [    T848]  ? lock_acquire+0xf8/0x140
[   66.717006] [    T848]  __mutex_lock+0xcb/0xfc0
[   66.797266] [    T848]  ? pcpu_alloc_noprof+0x524/0x840
[   66.877526] [    T848]  ? lockdep_hardirqs_on+0x84/0x130
[   66.957786] [    T848]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   67.038044] [    T848]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   67.118303] [    T848]  ? pcpu_alloc_noprof+0x524/0x840
[   67.198566] [    T848]  ? pcpu_alloc_noprof+0x524/0x840
[   67.278825] [    T848]  ? find_held_lock+0x2b/0x80
[   67.359084] [    T848]  pcpu_alloc_noprof+0x524/0x840
[   67.439344] [    T848]  ? local_clock_noinstr+0xf/0x100
[   67.519608] [    T848]  sbitmap_init_node+0xf0/0x230
[   67.599870] [    T848]  sbitmap_queue_init_node+0x29/0x140
[   67.680131] [    T848]  blk_mq_init_tags+0x95/0x110
[   67.760392] [    T848]  blk_mq_alloc_map_and_rqs+0x3c/0x110
[   67.840654] [    T848]  blk_mq_init_sched+0x100/0x260
[   67.920916] [    T848]  elevator_switch+0xb1/0x190
[   68.001176] [    T848]  ? elv_iosched_store+0x1d0/0x260
[   68.081437] [    T848]  elv_iosched_store+0x1db/0x260
[   68.161700] [    T848]  kernfs_fop_write_iter+0x160/0x240
[   68.241960] [    T848]  vfs_write+0x2ec/0x5c0
[   68.322224] [    T848]  ksys_write+0x7a/0xf0
[   68.402485] [    T848]  do_syscall_64+0x68/0x140
[   68.482745] [    T848]  entry_SYSCALL_64_after_hwframe+0x71/0x79
[   68.563004] [    T848] RIP: 0033:0x7f2a1747ca06
[   68.643263] [    T848] Code: 5d e8 41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 75 19 83 e2 39 83 fa 08 75 11 e8 26 ff ff ff 66 0f 1f 44 00 00 48 8b 45 10 0f 05 <48> 8b 5d f8 c9 c3 0f 1f 40 00 f3 0f 1e fa 55 48 89 e5 48 83 ec 08
[   68.723521] [    T848] RSP: 002b:00007ffe48933eb0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[   68.884037] [    T848] RAX: ffffffffffffffda RBX: 000056119a4eaff0 RCX: 00007f2a1747ca06
[   68.964295] [    T848] RDX: 0000000000000003 RSI: 00007ffe48934200 RDI: 0000000000000027
[   69.044553] [    T848] RBP: 00007ffe48933ed0 R08: 0000000000000000 R09: 0000000000000000
[   69.124811] [    T848] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000003
[   69.205068] [    T848] R13: 0000000000000003 R14: 00007ffe48934200 R15: 00007ffe48934200
[   69.285332] [    T848]  </TASK>


