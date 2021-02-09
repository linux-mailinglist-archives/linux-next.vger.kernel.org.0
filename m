Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C63231472E
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 04:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBIDq3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 22:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhBIDmi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 22:42:38 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95010C06178C;
        Mon,  8 Feb 2021 19:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=MeDzDkJLjScKS80C0Rq2IFniB3UPYjZEfetms5EKJPQ=; b=ZdNWFqhv2Jl0t2u9HDkD8IScGg
        7uQk74Zyg6DLEXfhJmtBusdyt98l+nC5l1nzR1Lk46U93MQEl0yIBN93jEicDGnhGOuSQRPoivIDV
        Rknbq6O/hVwciU4gWJdjaNmydtkkt9Ens6CZ7+LQVsTG0zsdn4JfoIE3VAAtZNoZ0jnpM1G4YxU4a
        ju3+/wQ8s8L/dLWZiIGcKJQJhjYWVaQ+10B8fZCiuNHJ/bq3torcxS6X5Zktics89UKr8rhjoMTZa
        CliYg2mlcR5RxcaUkE6Cn7RfmAJMTBavIsvkGZfgxFWxMNZqZPiNy6qxGrWTBkxaLxwE26bazR6aV
        IOrhIAxg==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9JmC-0001JB-AQ; Tue, 09 Feb 2021 03:33:20 +0000
Subject: Re: linux-next: Tree for Feb 8 (Warning at arch/x86/kernel/irq.c:390)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
References: <20210208235246.01cb4daf@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <62fecf7b-e660-8bf6-c9d7-634c599494dd@infradead.org>
Date:   Mon, 8 Feb 2021 19:33:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208235246.01cb4daf@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/8/21 4:52 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210205:
> 

on x86_64:

Re: commit 1dba8a9538f5164eb8874eed4c7d6799a3c64963
Author: Borislav Petkov <bp@suse.de>
Date:   Thu Jan 7 13:29:05 2021 +0100
    thermal: Move therm_throt there from x86/mce

I am seeing this for CPU = 1,2,3:

[    0.002092] WARNING: CPU: 1 PID: 0 at ../arch/x86/kernel/irq.c:390 thermal_set_handler+0x16/0x35
[    0.002092] Modules linked in:
[    0.002092] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.11.0-rc6-next-20210208 #1
[    0.002092] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
[    0.002092] RIP: 0010:thermal_set_handler+0x16/0x35
[    0.002092] Code: 00 00 00 0f 85 e0 fe ff ff 5b 41 5c 41 5d 41 5e 41 5f 5d c3 48 85 ff 74 1c 48 81 3d f7 65 61 01 20 b4 41 b2 74 1b 55 48 89 e5 <0f> 0b 48 89 3d e8 65 61 01 5d c3 48 c7 05 db 65 61 01 20 b4 41 b2
[    0.002092] RSP: 0000:ffff9c5a00097e08 EFLAGS: 00010002
[    0.002092] RAX: 0000000000000007 RBX: 0000000000000007 RCX: 00000000000001b2
[    0.002092] RDX: 0000000000000000 RSI: 0000000000000007 RDI: ffffffffb2a6c9d3
[    0.002092] RBP: ffff9c5a00097e08 R08: ffff94c88ba51460 R09: 000000000003007f
[    0.002092] R10: ffff94c88ba51480 R11: 0000000000000000 R12: 0000000000000000
[    0.002092] R13: ffff94c88ba51480 R14: 0000000000000000 R15: 0000000000000000
[    0.002092] FS:  0000000000000000(0000) GS:ffff94c88ba40000(0000) knlGS:0000000000000000
[    0.002092] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.002092] CR2: 0000000000000000 CR3: 0000000093c0a001 CR4: 00000000000606a0
[    0.002092] Call Trace:
[    0.002092]  intel_init_thermal+0x25a/0x2e9
[    0.002092]  init_intel+0x562/0x585
[    0.002092]  identify_cpu+0x298/0x4b0
[    0.002092]  identify_secondary_cpu+0x1a/0x99
[    0.002092]  smp_store_cpu_info+0x5d/0x6b
[    0.002092]  start_secondary+0x5f/0x16c
[    0.002092]  secondary_startup_64_no_verify+0xc2/0xcb
[    0.002092] ---[ end trace 9f8e2ebc792bd614 ]---


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
