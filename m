Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE554242A37
	for <lists+linux-next@lfdr.de>; Wed, 12 Aug 2020 15:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgHLNWI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Aug 2020 09:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgHLNWG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2020 09:22:06 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D7EC061787
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2020 06:22:06 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id g14so2553603iom.0
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2020 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=LqyDHTGklklfaDmwpguz/tusuYDRoAks+1hcszFn1HY=;
        b=K8oKxBl+BWXQaDynneB6u8gUp94iZ62ttkbLOTUSEQ3fVIrUDUpqml1C71vir15wv6
         d1tSUUou4apOwCAtU/WyzRIR5mEFUDSJb5K4qoU37r9pSbU4ToLI4a+ZqJ518A864Et1
         LpHTZNczIbXES1HPwPv2LPnshBGgIAr1/Ee+Q7jzGKvx9yHBWaKMc6UJ7ofvGXMIkHuv
         v+8IHU4dHdNNU5l/pVe42DdmgQ9RqrX3wPeVcxq0ULVDfxXTXgfmalZ3aBC30Tg6qQe8
         FForRPaXQgU9OXDZclXVYu1cY3CO2yiSh4bieeW/8oY5xBenI/espD9KnTXQk9pHiPnv
         bXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=LqyDHTGklklfaDmwpguz/tusuYDRoAks+1hcszFn1HY=;
        b=c7c5VXNJvq/w8K6MPN/SbMeA2wYlR54/idT4G7RLDvR3h0tAq1HXLQJAhHNLNVSocP
         wPNW/qcSQ3aaBDn8bhfp67/TMwgm3hUZvx+I39lbab65ux4QOJ6S7w/ZvRdmQumNQKi0
         B3qoy1SNovtsV87UVih9XHVi/kznxel86W7noDX2+EdRZELG4hm+GBDHKajJVL8QLeyC
         ChVR1bFBZud7NiuyJYaZSCW5fCj6xu/mGsgvFugmwYA62+Mv8XcbdXp3XP8vuInPKEha
         PBhDKY3QGyydECszIjZvccmaabfFjp9TvjmWqpsUu+Rdr04xonqZTibIVGLYzD3Nm3/h
         sa0w==
X-Gm-Message-State: AOAM533vtmeZSeMII/Fvcxs5DrMv+agri2WnwWUcGcsbx/05RB+NTLJ4
        uGwQh7fHkoeBUsvfl+lwtCoXygHqxFnPS7BL1TXEmMNY82sYXA==
X-Google-Smtp-Source: ABdhPJxMI8PBL/gzOuJ3w4Fk/3jDcdg99s5Cj/ZlFKIwt7gwA3a6WpJGb3wD4Se/P66zWaPqiUEYX3hEzdsvoyG3SwE=
X-Received: by 2002:a05:6602:2c08:: with SMTP id w8mr28417120iov.129.1597238525008;
 Wed, 12 Aug 2020 06:22:05 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 12 Aug 2020 18:51:53 +0530
Message-ID: <CA+G9fYsiNgoh09h0paf1+UTKhPnn490QCoLB2dRFhMT+Cjh9RA@mail.gmail.com>
Subject: BUG: unable to handle page fault for address: fe80c000 - EIP: memcpy+0xf/0x20
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, X86 ML <x86@kernel.org>
Cc:     lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>, ardb@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Brian Gerst <brgerst@gmail.com>,
        Andy Lutomirski <luto@kernel.org>,
        Michel Lespinasse <walken@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        daniel.m.jordan@oracle.com, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While testng LTP CVE cve-2017-17053 test case the kernel BUG triggered
on qemu_i386.
Not easily reproducible BUG.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 4c9b89d8981be3b9032f94d0c4dc7eb9c7967a32
  git describe: next-20200811
  make_kernelversion: 5.8.0
  kernel-config:
https://builds.tuxbuild.com/Y9BHRF7J_qXysFPxUoVmBA/kernel.config


[ 1083.853006] BUG: unable to handle page fault for address: fe80c000
[ 1083.853850] #PF: supervisor write access in kernel mode
[ 1083.854577] #PF: error_code(0x0002) - not-present page
[ 1083.855074] *pde = 33183067 *pte = a8648163
[ 1083.855074] Oops: 0002 [#1] SMP
[ 1083.855951] CPU: 1 PID: 13514 Comm: cve-2017-17053 Tainted: G
 W         5.8.0-next-20200811 #1
[ 1083.857088] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[ 1083.857771] EIP: memcpy+0xf/0x20
[ 1083.857771] Code: 68 d0 7d ee d6 e8 11 1c c7 ff 0f 31 31 c3 59 58
eb 80 cc cc cc cc cc cc cc cc cc 55 89 e5 57 89 c7 56 89 d6 53 89 cb
c1 e9 02 <f3> a5 89 d9 83 e1 03 74 02 f3 a4 5b 5e 5f 5d c3 90 55 89 e5
57 89
[ 1083.860096] EAX: fe80c000 EBX: 00010000 ECX: 00004000 EDX: fbfbd000
[ 1083.860096] ESI: fbfbd000 EDI: fe80c000 EBP: f11f1e2c ESP: f11f1e20
[ 1083.860096] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010216
[ 1083.860096] CR0: 80050033 CR2: fe80c000 CR3: 314c0000 CR4: 003506d0
[ 1083.860096] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[ 1083.860096] DR6: ffff4ff0 DR7: 00000400
[ 1083.860096] Call Trace:
[ 1083.860096]  ldt_dup_context+0x66/0x80
[ 1083.860096]  dup_mm+0x2b3/0x480
[ 1083.866900]  copy_process+0x133b/0x15c0
[ 1083.866900]  _do_fork+0x94/0x3e0
[ 1083.866900]  __ia32_sys_clone+0x67/0x80
[ 1083.866900]  __do_fast_syscall_32+0x3f/0x70
[ 1083.866900]  do_fast_syscall_32+0x29/0x60
[ 1083.866900]  do_SYSENTER_32+0x15/0x20
[ 1083.866900]  entry_SYSENTER_32+0x9f/0xf2
[ 1083.866900] EIP: 0xb7eef549
[ 1083.866900] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01
10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f
34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90
8d 76
[ 1083.866900] EAX: ffffffda EBX: 01200011 ECX: 00000000 EDX: 00000000
[ 1083.866900] ESI: 00000000 EDI: b7cf1ba8 EBP: b7cf1348 ESP: b7cf12f0
[ 1083.866900] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000246
[ 1083.866900] Modules linked in: algif_hash
[ 1083.866900] CR2: 00000000fe80c000
[ 1083.866900] ---[ end trace b07b25e6d94bccb1 ]---
[ 1083.866900] EIP: memcpy+0xf/0x20
[ 1083.866900] Code: 68 d0 7d ee d6 e8 11 1c c7 ff 0f 31 31 c3 59 58
eb 80 cc cc cc cc cc cc cc cc cc 55 89 e5 57 89 c7 56 89 d6 53 89 cb
c1 e9 02 <f3> a5 89 d9 83 e1 03 74 02 f3 a4 5b 5e 5f 5d c3 90 55 89 e5
57 89
[ 1083.866900] EAX: fe80c000 EBX: 00010000 ECX: 00004000 EDX: fbfbd000
[ 1083.866900] ESI: fbfbd000 EDI: fe80c000 EBP: f11f1e2c ESP: f11f1e20
[ 1083.866900] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010216
[ 1083.866900] CR0: 80050033 CR2: fe80c000 CR3: 314c0000 CR4: 003506d0
[ 1083.866900] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[ 1083.866900] DR6: ffff4ff0 DR7: 00000400


Full test log link,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200811/testrun/3052660/suite/linux-log-parser/test/check-kernel-bug-1659337/log

-- 
Linaro LKFT
https://lkft.linaro.org
