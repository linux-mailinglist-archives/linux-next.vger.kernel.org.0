Return-Path: <linux-next+bounces-6073-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC90A7502C
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 19:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BD917A07A
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 18:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55224C2FA;
	Fri, 28 Mar 2025 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="EwqE10Q5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2714F11E
	for <linux-next@vger.kernel.org>; Fri, 28 Mar 2025 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185458; cv=none; b=aEDjkAKUfY5o06FKBYTsLF9aeBdK7eLsCbXzZsi8ekrI0D1HZJp06cNT//njoNuOjyyX73yW7KAs7AJcQzTsc2EPhbT5ZsdPd7IlO9rtC7mB41PBUx+20n/jqJgyVr+Y+FNXrRBuekyVzCvz5u9eCcq5cmQb40567vKIcx/P75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185458; c=relaxed/simple;
	bh=7uE198nxQPQeZQbI40SXLQuESNlijUU0/fnlP9Jjdb8=;
	h=From:To:cc:Subject:Mime-Version:Content-Type:Date:Message-ID; b=Gb8v5K1c4HM1BdtrBAE1b/n5NL9omRTZgOysH/p0q/s3QMBTtAjCVd7iAQfIvaJx3I3nmM08kxpBNtcxcxsc8pEeKRiBD/5VMzbAmOaMjSjpIHwmaGlB/D+SFRBFkgEcoO1uEpo5WEXHaGvI8UCkuz2mu4oc21z+G7qJP+jeTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=EwqE10Q5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-477282401b3so25614401cf.1
        for <linux-next@vger.kernel.org>; Fri, 28 Mar 2025 11:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1743185455; x=1743790255; darn=vger.kernel.org;
        h=message-id:date:mime-version:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjLx3l+tOJXFbzNhSnv+r6LQC1OzeLVW4VRJBrpQUfM=;
        b=EwqE10Q5R+P0MUeopGTVviJsPrDP/SBaa5fr15oNvfsvjuXgTDp85tfdd2SfskpmJL
         p0Wyyz5UzXxKv8Hb5nN1+aACHlAzTenhPXJkeVSHndDdlnQL0jR2bEjAqSAUwon1P85A
         6dXGQYF34nlxJE6RheSui0bKacSC9WY4HW40F+jmZVKUHV3OCMrpIR972e6fx7OAFFnh
         IdnanmNk2gJl0bvKvo1hbfKyzfRB5HIvGoNeiCDcUdPeTCj2BfajAUDRB8UtVGZcW8nB
         XV8K0amjzwWqlJRkGGHpFXpJLKJmCiaNHZbFVjWzIQSdE5KWi43qSeFKa0t8Wj3yY5NI
         RLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743185455; x=1743790255;
        h=message-id:date:mime-version:subject:cc:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjLx3l+tOJXFbzNhSnv+r6LQC1OzeLVW4VRJBrpQUfM=;
        b=hZRiXQKtem9oAJxD37W6eipJzIv04Br6nllQtuv6w2ElzVljUgQ29arfdRcIwq0WmO
         o8vBkehzr2+IRbh/94w1NsfZqzFHUhQ5CM4Ss50Z8S81xz9ApSzyiY4XsCfQrgF3xkKq
         5PdKS7bFhDxLM3Aq9Ua84Nro3TT9Z5/H9yMOrTzLsIKMWZMdOsi1JbJlVpWJn4ptAZOy
         AoVw8ZCtaQfKwYH5l+3kAcwKtwbLdaq0UXSQLRQ8YQ6STVg8WlYcPS0SLG8iu10/75HX
         yuR4Y7BwiT5SgTwxImsSxjwXZNv/LUmAeTldGIeECwQDbNKBb8ET9BSr+ejxqbkpFHwz
         m3Bg==
X-Gm-Message-State: AOJu0YwV57/kTCBNaA6GXhSSUMOk9oeOEJFeFAlkTRmFj424UIuFKb9u
	EnT1LEUFTaCpi1HWz6iE4Y8bU/VnAmjHgwNEe2OlQffbX2mfcvPUiJATUI5gLxcJXkhLmeNpZ2A
	2
X-Gm-Gg: ASbGnctzB3A2K5tegkcvibd4Erb6yP5kazJP3MUjxsZS4u4NfecZp6gjd+BvWOO3Fk4
	H+Z1kTV+Kx/mk18nyHi5iFjRuvFSkArGbaBjNxn1cZB8+8blCnqlNB6HFWopO1dnrhE2aQ0CyQQ
	Gocqt1cqVbRaJdcztS8ZX0dcCIyj8YyT/DbqVWRyLebkO8dXC7QcqRIjbrbd7M7BZy+NJxHFD15
	rdds+DMVuMFlkBKlgzylzfLV9w0DSOYhgazNv7fi74/5A/24BTLjN/KtZrXK0+Nw3fh6/ARtwHN
	AeAtZfomrNICZkW5x+A+P3bItml7ZyRXXY7GWky0yPIrRtDQhIc=
X-Google-Smtp-Source: AGHT+IG7tdGl5ld6bt1rx1NDyAssf8vuS1wScAI2CfJEssZqLI3ZsILPkQIdu4S5ivnHXSF1G8CkiQ==
X-Received: by 2002:a05:622a:18a6:b0:476:6a3d:de3d with SMTP id d75a77b69052e-477ed8057aemr1738771cf.24.1743185454665;
        Fri, 28 Mar 2025 11:10:54 -0700 (PDT)
Received: from turing-police ([2601:5cf:407f:b7f2::c36])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a4446sm13708561cf.80.2025.03.28.11.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:10:54 -0700 (PDT)
Sender: Valdis Kletnieks <valdis@vt.edu>
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.10.0-pre 07/05/2021 with nmh-1.8+dev
To: Stephen Rothwell <sfr@canb.auug.org.au>,
    Jens Axboe <axboe@kernel.dk>
cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
    linux-block@vger.kernel.org
Subject: next-20250327 - lockdep whine and USB issues at boot
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 28 Mar 2025 14:10:53 -0400
Message-ID: <8775.1743185453@turing-police>

Saw this during boot on a Dell Inspiron 5559 laptop.  

In addition, the external USB ports all gave up, rendering a USB mouse and a
USB external drive totally dead in the water.  May or may not be related, I didn't
dig too far into it.

[   40.842033] [    T953] io scheduler bfq registered

[   41.022391] [    T817] ======================================================
[   41.103507] [    T817] WARNING: possible circular locking dependency detected
[   41.184587] [    T817] 6.14.0-next-20250327 #110 Tainted: G          I     T  
[   41.265700] [    T817] ------------------------------------------------------
[   41.346832] [    T817] (udev-worker)/817 is trying to acquire lock:
[   41.427952] [    T817] ffff93a2c80ae9f0 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe1/0x260
[   41.830112] [    T817] 
                          but task is already holding lock:
[   41.912022] [    T817] ffff93a2c80ae460 (&q->q_usage_counter(io)#10){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20
[   42.394431] [    T817] 
                          which lock already depends on the new lock.

[   42.477193] [    T817] 
                          the existing dependency chain (in reverse order) is:
[   42.559132] [    T817] 
                          -> #2 (&q->q_usage_counter(io)#10){++++}-{0:0}:
[   43.042361] [    T817]        lock_acquire.part.0+0xbe/0x240
[   43.123452] [    T817]        blk_alloc_queue+0x30b/0x350
[   43.204547] [    T817]        blk_mq_alloc_queue+0x62/0xd0
[   43.285646] [    T817]        scsi_alloc_sdev+0x29c/0x3d0
[   43.366744] [    T817]        scsi_probe_and_add_lun+0x1d8/0x2b0
[   43.447847] [    T817]        __scsi_add_device+0x114/0x130
[   43.528950] [    T817]        ata_scsi_scan_host+0x7a/0x190
[   43.610047] [    T817]        async_run_entry_fn+0x24/0xc0
[   43.691137] [    T817]        process_one_work+0x21e/0x5a0
[   43.772226] [    T817]        worker_thread+0x1d5/0x3c0
[   43.853316] [    T817]        kthread+0x114/0x230
[   43.934369] [    T817]        ret_from_fork+0x2c/0x50
[   44.015453] [    T817]        ret_from_fork_asm+0x1a/0x30
[   44.096532] [    T817] 
                          -> #1 (fs_reclaim){+.+.}-{0:0}:
[   44.499438] [    T817]        lock_acquire.part.0+0xbe/0x240
[   44.580476] [    T817]        fs_reclaim_acquire+0xa8/0xe0
[   44.661541] [    T817]        blk_mq_alloc_and_init_hctx+0x16a/0x240
[   44.742613] [    T817]        blk_mq_realloc_hw_ctxs+0x2fb/0x390
[   44.823681] [    T817]        blk_mq_init_allocated_queue+0x13b/0x460
[   44.904744] [    T817]        blk_mq_alloc_queue+0x7b/0xd0
[   44.985800] [    T817]        __blk_mq_alloc_disk+0x13/0x60
[   45.066848] [    T817]        loop_add+0x1fd/0x3e0
[   45.147899] [    T817]        loop_init+0x17b/0x1d0
[   45.228942] [    T817]        do_one_initcall+0x83/0x3c0
[   45.309991] [    T817]        do_initcalls+0x130/0x1b0
[   45.391040] [    T817]        kernel_init_freeable+0x292/0x300
[   45.472088] [    T817]        kernel_init+0x15/0x130
[   45.553131] [    T817]        ret_from_fork+0x2c/0x50
[   45.634147] [    T817]        ret_from_fork_asm+0x1a/0x30
[   45.715192] [    T817] 
                          -> #0 (&q->elevator_lock){+.+.}-{4:4}:
[   46.117972] [    T817]        check_prev_add+0xe1/0xcf0
[   46.198974] [    T817]        __lock_acquire+0x1031/0x13b0
[   46.280004] [    T817]        lock_acquire.part.0+0xbe/0x240
[   46.361026] [    T817]        __mutex_lock+0xcb/0xfc0
[   46.442014] [    T817]        elv_iosched_store+0xe1/0x260
[   46.523029] [    T817]        kernfs_fop_write_iter+0x160/0x240
[   46.604038] [    T817]        vfs_write+0x2ec/0x5c0
[   46.685016] [    T817]        ksys_write+0x7a/0xf0
[   46.766019] [    T817]        do_syscall_64+0x68/0x140
[   46.847024] [    T817]        entry_SYSCALL_64_after_hwframe+0x71/0x79
[   46.927997] [    T817] 
                          other info that might help us debug this:

[   47.010420] [    T817] Chain exists of:
                            &q->elevator_lock --> fs_reclaim --> &q->q_usage_counter(io)#10

[   47.654630] [    T817]  Possible unsafe locking scenario:

[   47.736287] [    T817]        CPU0                    CPU1
[   47.817245] [    T817]        ----                    ----
[   47.898175] [    T817]   lock(&q->q_usage_counter(io)#10);
[   48.219898] [    T817]                                lock(fs_reclaim);
[   48.461357] [    T817]                                lock(&q->q_usage_counter(io)#10);
[   48.783086] [    T817]   lock(&q->elevator_lock);
[   49.024555] [    T817] 
                           *** DEADLOCK ***

[   49.106827] [    T817] 5 locks held by (udev-worker)/817:
[   49.187752] [    T817]  #0: ffff93a2e079a440 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0x7a/0xf0
[   49.750206] [    T817]  #1: ffff93a2c62c6690 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x119/0x240
[   50.312697] [    T817]  #2: ffff93a2c2312ad0 (kn->active#89){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x122/0x240
[   50.875194] [    T817]  #3: ffff93a2c80ae460 (&q->q_usage_counter(io)#10){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20
[   51.437693] [    T817]  #4: ffff93a2c80ae4a0 (&q->q_usage_counter(queue)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20
[   51.919935] [    T817] 
                          stack backtrace:
[   52.001533] [    T817] CPU: 0 UID: 0 PID: 817 Comm: (udev-worker) Tainted: G          I     T   6.14.0-next-20250327 #110 PREEMPT(full)  238541a35a93f433dad83bf02a8fb62af6fea5a1
[   52.081794] [    T817] Tainted: [I]=FIRMWARE_WORKAROUND, [T]=RANDSTRUCT
[   52.162052] [    T817] Hardware name: Dell Inc. Unidentified System/052K07, BIOS 1.9.0 09/07/2020
[   52.242309] [    T817] Call Trace:
[   52.322568] [    T817]  <TASK>
[   52.402828] [    T817]  dump_stack_lvl+0x65/0x90
[   52.483089] [    T817]  print_circular_bug.cold+0x38/0x46
[   52.563351] [    T817]  check_noncircular+0x169/0x190
[   52.643613] [    T817]  check_prev_add+0xe1/0xcf0
[   52.723871] [    T817]  ? add_chain_cache+0x115/0x4c0
[   52.804133] [    T817]  __lock_acquire+0x1031/0x13b0
[   52.884394] [    T817]  ? mark_usage+0x65/0x180
[   52.964654] [    T817]  lock_acquire.part.0+0xbe/0x240
[   53.044913] [    T817]  ? elv_iosched_store+0xe1/0x260
[   53.125175] [    T817]  ? lock_acquire+0xf8/0x140
[   53.205435] [    T817]  __mutex_lock+0xcb/0xfc0
[   53.285695] [    T817]  ? elv_iosched_store+0xe1/0x260
[   53.365955] [    T817]  ? mark_held_locks+0x40/0x70
[   53.446214] [    T817]  ? elv_iosched_store+0xe1/0x260
[   53.526473] [    T817]  ? lockdep_hardirqs_on_prepare.part.0+0x8e/0x170
[   53.606736] [    T817]  ? elv_iosched_store+0xe1/0x260
[   53.686996] [    T817]  elv_iosched_store+0xe1/0x260
[   53.767260] [    T817]  kernfs_fop_write_iter+0x160/0x240
[   53.847520] [    T817]  vfs_write+0x2ec/0x5c0
[   53.927784] [    T817]  ksys_write+0x7a/0xf0
[   54.008044] [    T817]  do_syscall_64+0x68/0x140
[   54.088307] [    T817]  entry_SYSCALL_64_after_hwframe+0x71/0x79
[   54.168565] [    T817] RIP: 0033:0x7fd9f9a7ca06
[   54.248825] [    T817] Code: 5d e8 41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 75 19 83 e2 39 83 fa 08 75 11 e8 26 ff ff ff 66 0f 1f 44 00 00 48 8b 45 10 0f 05 <48> 8b 5d f8 c9 c3 0f 1f 40 00 f3 0f 1e fa 55 48 89 e5 48 83 ec 08
[   54.329083] [    T817] RSP: 002b:00007ffe23386d50 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[   54.489599] [    T817] RAX: ffffffffffffffda RBX: 0000564ed601dff0 RCX: 00007fd9f9a7ca06
[   54.569857] [    T817] RDX: 0000000000000003 RSI: 00007ffe233870a0 RDI: 000000000000001c
[   54.650115] [    T817] RBP: 00007ffe23386d70 R08: 0000000000000000 R09: 0000000000000000
[   54.730373] [    T817] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000003
[   54.810                                                                                         
[   54.890894] [    T817]  </TASK>
[   54.971553] [     T25] xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint command
[   55.051817] [     T25] xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
[   55.132085] [     T25] xhci_hcd 0000:00:14.0: HC died; cleaning up
[   55.212411] [     T59] xhci_hcd 0000:00:14.0: Timeout while waiting for stop endpoint command
[   55.253106] [     T47] kauditd_printk_skb: 81 callbacks suppressed
[   55.354880] [    T984] usb 1-2: USB disconnect, device number 2
[   55.375007] [    T986] usb 2-3: USB disconnect, device number 2
[   55.568668] [    T984] usb 1-3: USB disconnect, device number 3
[   55.784923] [    T984] usb 1-6: USB disconnect, device number 4
[   55.874703] [    T984] usb 1-7: USB disconnect, device number 5


