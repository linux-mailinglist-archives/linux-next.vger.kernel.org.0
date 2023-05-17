Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737D7706C3B
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 17:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjEQPJJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 11:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjEQPJH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 11:09:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0998A4C
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 08:08:38 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30636edb493so97126f8f.1
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684336099; x=1686928099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+JjSYdtG2EYbhgl3W9Z4sL1bQQEtMVmhKqEqC/AduCo=;
        b=e56FF/cP746ZZHhOr8xJup1GjD+pmXzaBRsfVX5AX1w7yI3WCnRq4e0mMlBVve1jx5
         1c1EVvCcZnvbxA1qFXULADgUWz7C2mU9+QRMagTimu8qcDlkqLCbR9MrMQMsChocvDNA
         +dqyfMV7GI6SkC9ZFFaknX4/WT6C37GGp5mbr2jNbSroUBuQsjpsHNwfTnsPo8CiRRYr
         KUlXiQTOeVOjfxQrJRcdIvVG9nQDox+ggF3IE3ZsJJI28HVdLn8E+fKz8KhSJ3BeBziV
         tYSk2Vy6fupt2hRI4m/EvNj84uZ4/DjuajdUuKeqvGTHiwu7CPsPOWkL7hV2i4rbl8lS
         CUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684336099; x=1686928099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JjSYdtG2EYbhgl3W9Z4sL1bQQEtMVmhKqEqC/AduCo=;
        b=gf6w7/XQjhK1AQzFQ0bfn3VUMoTZ3LAmsech0nYf3eMMk59vFbNMZjwweykdK9pPhh
         HD6e0GHnnqmT+tpQZcqz0Rtr51L8SujS+Rjcy1L9XjGNtPn/JlEnnmq6r45gRKaAgr5H
         dNdnlsk2GHwzRUO6H2Rx9obw95vu7v9di1xZ3WIWEyjQXW6VqGMYtEAYhvAPFW6FbJhv
         wEsdch/56hqAsVU2HTZWYDLNdGSk7vZd2kAQojLPPn7htk9UQ5cjddpTxSVwIxYAAKOw
         PzjzMJDamewDUj8RL39N96S5KXz5byaDlnfy/t/b5781NNnZWQYoywHcDQUIQ9E/0A3s
         ktWQ==
X-Gm-Message-State: AC+VfDxwEo60I8ZxCjWRlGCQ1dfavg1mqJjxoUb6qn2jcBSNOnrzvFv/
        lOZDZTSIP4Y9E20wiYDk3l9C0A==
X-Google-Smtp-Source: ACHHUZ5NEOYsUCmUojYedI/sjZ+jmm3UJJ7uGK1T1t2wN1itwkO0Gv7qCC2f0mNk75s/OIg9c810Mw==
X-Received: by 2002:adf:ffc7:0:b0:307:d04a:60d8 with SMTP id x7-20020adfffc7000000b00307d04a60d8mr1231689wrs.0.1684336099525;
        Wed, 17 May 2023 08:08:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e17-20020adfe7d1000000b00300aee6c9cesm3142028wrn.20.2023.05.17.08.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 08:08:17 -0700 (PDT)
Date:   Wed, 17 May 2023 18:08:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Chuck Lever <chuck.lever@oracle.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        lkft-triage@lists.linaro.org, Al Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>, frederic@kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: qemu-arm64: kernel BUG at fs/inode.c:1763!
Message-ID: <20680bb5-71c0-4945-a058-05f43bbd03f4@kili.mountain>
References: <CA+G9fYszs5wPp+TWJeVZsdRjnBTXTa8i3YY3qV9SHbB1+R2+4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYszs5wPp+TWJeVZsdRjnBTXTa8i3YY3qV9SHbB1+R2+4Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The fs/inode.c:1763 bug is more stuff from net/handshake testing, so
lets add Chuck to the CC list.

regards,
dan carpenter

On Wed, May 17, 2023 at 06:39:57PM +0530, Naresh Kamboju wrote:
> Following kernel crash noticed while booting qemu-arm64 kunit builds on
> Linux next version 6.4.0-rc2-next-20230517.
> 
> WARNING: CPU: 1 PID: 1436 at mm/page_alloc.c:4781 __alloc_pages
> kernel BUG at fs/inode.c:1763!
> WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:128
> ct_kernel_exit.constprop.0+0xe0/0xe8
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Detailed Crash log:
> =========
> <4>[  800.148388] ------------[ cut here ]------------
> <4>[  800.150072] WARNING: CPU: 1 PID: 1436 at mm/page_alloc.c:4781
> __alloc_pages+0x998/0x13e8
> <4>[  800.151978] Modules linked in:
> <4>[  800.153337] CPU: 1 PID: 1436 Comm: kunit_try_catch Tainted: G
> B            N 6.4.0-rc2-next-20230517 #1
> <4>[  800.154662] Hardware name: linux,dummy-virt (DT)
> <4>[  800.155921] pstate: 22400005 (nzCv daif +PAN -UAO +TCO -DIT
> -SSBS BTYPE=--)
> <4>[  800.157079] pc : __alloc_pages+0x998/0x13e8
> <4>[  800.158148] lr : __kmalloc_large_node+0xc0/0x1b8
> <4>[  800.159238] sp : ffff80000b5e7aa0
> <4>[  800.160154] x29: ffff80000b5e7aa0 x28: 0000000000000000 x27:
> 0000000000000000
> <4>[  800.161762] x26: ffff0000c4509f00 x25: ffff800008087a98 x24:
> ffffd0168ffa8460
> <4>[  800.163283] x23: 1ffff000016bcf74 x22: 0000000000040dc0 x21:
> 0000000000000000
> <4>[  800.164813] x20: 0000000000000015 x19: 0000000000000000 x18:
> 000000000000000b
> <4>[  800.166307] x17: 00000000bd2c963e x16: 00000000a2b18575 x15:
> 0000000033b8949b
> <4>[  800.167831] x14: 000000006d0ad0a4 x13: 00000000e32f85f5 x12:
> ffff7000016bcfa1
> <4>[  800.169363] x11: 1ffff000016bcfa0 x10: ffff7000016bcfa0 x9 :
> 000000000000f204
> <4>[  800.170928] x8 : 00000000f2000000 x7 : 00000000f2f2f2f2 x6 :
> 00000000f3f3f3f3
> <4>[  800.172467] x5 : 0000000000040dc0 x4 : ffff0000c614e900 x3 :
> 0000000000000000
> <4>[  800.173976] x2 : 0000000000000000 x1 : 0000000000000001 x0 :
> ffffd01696633000
> <4>[  800.175603] Call trace:
> <4>[  800.176314]  __alloc_pages+0x998/0x13e8
> <4>[  800.177355]  __kmalloc_large_node+0xc0/0x1b8
> <4>[  800.178401]  __kmalloc+0x158/0x1c0
> <4>[  800.179350]  handshake_req_alloc+0x70/0xb8
> <4>[  800.180510]  handshake_req_alloc_case+0xa4/0x188
> <4>[  800.181598]  kunit_try_run_case+0x88/0x120
> <4>[  800.182614]  kunit_generic_run_threadfn_adapter+0x38/0x60
> <4>[  800.183809]  kthread+0x194/0x1b0
> <4>[  800.184813]  ret_from_fork+0x10/0x20
> <4>[  800.185873] ---[ end trace 0000000000000000 ]---
> <6>[  800.202972]         ok 6 handshake_req_alloc excessive privsize
> <6>[  800.217425]         ok 7 handshake_req_alloc all good
> <6>[  800.219182]     # req_alloc API fuzzing: pass:7 fail:0 skip:0 total:7
> <6>[  800.222082]     ok 1 req_alloc API fuzzing
> <6>[  800.243148]     ok 2 req_submit NULL req arg
> <6>[  800.260195]     ok 3 req_submit NULL sock arg
> <6>[  800.274397]     ok 4 req_submit NULL sock->file
> <6>[  800.294631]     ok 5 req_lookup works
> <6>[  800.310289]     ok 6 req_submit max pending
> <6>[  800.326669]     ok 7 req_submit multiple
> <6>[  800.342645]     ok 8 req_cancel before accept
> <4>[  800.359161] ------------[ cut here ]------------
> <2>[  800.360659] kernel BUG at fs/inode.c:1763!
> <0>[  800.362464] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> <4>[  800.364079] Modules linked in:
> <4>[  800.364978] CPU: 0 PID: 9 Comm: kworker/0:1 Tainted: G    B   W
>       N 6.4.0-rc2-next-20230517 #1
> <4>[  800.366607] Hardware name: linux,dummy-virt (DT)
> <4>[  800.368282] Workqueue: events delayed_fput
> <4>[  800.369511] pstate: 62400005 (nZCv daif +PAN -UAO +TCO -DIT
> -SSBS BTYPE=--)
> <4>[  800.370861] pc : iput+0x2c4/0x328
> <4>[  800.371839] lr : iput+0x3c/0x328
> <4>[  800.372882] sp : ffff800008107b50
> <6>[  800.375744]     ok 9 req_cancel after accept
> <4>[  800.376704] x29: ffff800008107b50 x28: ffffd016924f7400 x27:
> ffff0000c08d4da0
> <4>[  800.379288] x26: ffff0000c042f918 x25: ffff0000cc273918 x24:
> ffff0000cc273900
> <4>[  800.381160] x23: 0000000000000000 x22: ffff0000c042f9b8 x21:
> ffffd016924f7b40
> <4>[  800.383408] x20: ffff0000c042f880 x19: ffff0000c042f880 x18:
> 000000000000000b
> <4>[  800.385535] x17: ffffd0168fb6f094 x16: ffffd0168fb6ee10 x15:
> ffffd0168fb6ebd4
> <4>[  800.387985] x14: ffffd0168f7d5de8 x13: ffffd0168f617f98 x12:
> ffff700001020f53
> <4>[  800.389672] x11: 1ffff00001020f52 x10: ffff700001020f52 x9 :
> ffffd0168fb67384
> <4>[  800.392442] x8 : ffff800008107a98 x7 : 0000000000000000 x6 :
> 0000000000000008
> <4>[  800.395053] x5 : ffff800008107a58 x4 : 0000000000000001 x3 :
> dfff800000000000
> <4>[  800.397652] x2 : 0000000000000007 x1 : ffff0000c042f918 x0 :
> 0000000000000060
> <4>[  800.400110] Call trace:
> <4>[  800.401352]  iput+0x2c4/0x328
> <4>[  800.402741]  dentry_unlink_inode+0x12c/0x240
> <4>[  800.404519]  __dentry_kill+0x16c/0x2b0
> <4>[  800.406047]  dput+0x24c/0x438
> <4>[  800.407331]  __fput+0x140/0x3b0
> <4>[  800.409152]  delayed_fput+0x64/0x80
> <4>[  800.410708]  process_one_work+0x3cc/0x7d0
> <4>[  800.413032]  worker_thread+0xa4/0x6a0
> <4>[  800.415041]  kthread+0x194/0x1b0
> <6>[  800.416283]     ok 10 req_cancel after done
> <4>[  800.416205]  ret_from_fork+0x10/0x20
> <0>[  800.419090] Code: 17ffffc4 97fffb54 17ffffd4 d65f03c0 (d4210000)
> <4>[  800.421577] ---[ end trace 0000000000000000 ]---
> <6>[  800.424335] note: kworker/0:1[9] exited with irqs disabled
> <6>[  800.428252] note: kworker/0:1[9] exited with preempt_count 1
> <4>[  800.435635] ------------[ cut here ]------------
> <4>[  800.436529] WARNING: CPU: 0 PID: 0 at
> kernel/context_tracking.c:128 ct_kernel_exit.constprop.0+0xe0/0xe8
> <4>[  800.439070] Modules linked in:
> <4>[  800.440326] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G    B D W
>     N 6.4.0-rc2-next-20230517 #1
> <4>[  800.442196] Hardware name: linux,dummy-virt (DT)
> <4>[  800.443408] pstate: 224003c5 (nzCv DAIF +PAN -UAO +TCO -DIT
> -SSBS BTYPE=--)
> <4>[  800.445031] pc : ct_kernel_exit.constprop.0+0xe0/0xe8
> <4>[  800.446629] lr : ct_kernel_exit.constprop.0+0x20/0xe8
> <4>[  800.448263] sp : ffffd01694ed7cd0
> <4>[  800.449375] x29: ffffd01694ed7cd0 x28: 00000000437e90ac x27:
> 0000000000000000
> <4>[  800.451354] x26: ffffd01694ef1e40 x25: 0000000000000000 x24:
> 0000000000000000
> <4>[  800.453397] x23: ffffd01694ee2ba0 x22: 1ffffa02d29dafb4 x21:
> 0000000000000000
> <4>[  800.455573] x20: ffffd01692f29c20 x19: ffff0000da667c20 x18:
> 000000000000000b
> <4>[  800.457649] x17: 000000000055a8d0 x16: 000000006cbc159c x15:
> ffffd0168fb6865c
> <4>[  800.459662] x14: ffffd0168fb680ec x13: ffffd0168fb3b03c x12:
> ffff7a02d29daf81
> <4>[  800.461787] x11: 1ffffa02d29daf80 x10: ffff7a02d29daf80 x9 :
> dfff800000000000
> <4>[  800.463827] x8 : ffffd01694ed7c08 x7 : 0000000000000000 x6 :
> 0000000000000008
> <4>[  800.465864] x5 : ffffd01694ed7bc8 x4 : 0000000000000001 x3 :
> dfff800000000000
> <4>[  800.467860] x2 : 4000000000000002 x1 : 4000000000000000 x0 :
> ffff2fea4773e000
> <4>[  800.469981] Call trace:
> <4>[  800.470946]  ct_kernel_exit.constprop.0+0xe0/0xe8
> <4>[  800.472535]  ct_idle_enter+0x10/0x20
> <4>[  800.473923]  default_idle_call+0x58/0x90
> <4>[  800.475213]  do_idle+0x304/0x388
> <4>[  800.476492]  cpu_startup_entry+0x2c/0x40
> <4>[  800.477885]  rest_init+0x120/0x128
> <4>[  800.478830]  arch_call_rest_init+0x1c/0x28
> <4>[  800.479961]  start_kernel+0x2f8/0x3c0
> <4>[  800.482015]  __primary_switched+0xc0/0xd0
> <4>[  800.483086] ---[ end trace 0000000000000000 ]---
> <6>[  800.487780]     ok 11 req_destroy works
> <6>[  800.488283] # Handshake API tests: pass:11 fail:0 skip:0 total:11
> <6>[  800.491161] # Totals: pass:17 fail:0 skip:0 total:17
> <6>[  800.495059] ok 75 Handshake API tests
> <6>[  800.514129] uart-pl011 9000000.pl011: no DMA platform data
> 
> links,
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17029810/suite/boot/test/gcc-12-lkftconfig-kunit/log
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17029810/suite/boot/test/gcc-12-lkftconfig-kunit/history/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17029810/suite/boot/tests/
> 
> Steps to reproduce:
> =================
> # To install tuxrun on your system globally:
> # sudo pip3 install -U tuxrun==0.42.0
> #
> # See https://tuxrun.org/ for complete documentation.
> 
> tuxrun   \
>  --runtime podman   \
>  --device qemu-arm64   \
>  --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2PtylM1zfMZo4vZUtwFtBJhJRvx/Image.gz
>   \
>  --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2PtylM1zfMZo4vZUtwFtBJhJRvx/modules.tar.xz
>   \
>  --rootfs https://storage.tuxsuite.com/public/linaro/lkft/oebuilds/2PeQhlPkvTmtoQVO1F0CQ7lAsm5/images/juno/lkft-tux-image-juno-20230511150149.rootfs.ext4.gz
>   \
>  --parameters SKIPFILE=skipfile-lkft.yaml   \
>  --image docker.io/lavasoftware/lava-dispatcher:2023.01.0020.gc1598238f   \
>  --tests kunit   \
>  --timeouts boot=30
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
