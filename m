Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA8A377120
	for <lists+linux-next@lfdr.de>; Sat,  8 May 2021 12:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhEHKDN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Sat, 8 May 2021 06:03:13 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4404 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhEHKDK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 8 May 2021 06:03:10 -0400
Received: from dggeml761-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FcjTY6DWxz5xky;
        Sat,  8 May 2021 17:59:29 +0800 (CST)
Received: from dggemi759-chm.china.huawei.com (10.1.198.145) by
 dggeml761-chm.china.huawei.com (10.1.199.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 8 May 2021 18:02:06 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi759-chm.china.huawei.com (10.1.198.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 8 May 2021 18:02:06 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2176.012;
 Sat, 8 May 2021 18:02:06 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the tip tree
Thread-Topic: linux-next: Fixes tag needs some work in the tip tree
Thread-Index: AQHXQ7BxQePZFmOZPUic4XE17XZHzarZWMOg
Date:   Sat, 8 May 2021 10:02:06 +0000
Message-ID: <7096a2e0c6a8491f9c02964d9c673180@hisilicon.com>
References: <20210508121819.1a451d54@canb.auug.org.au>
In-Reply-To: <20210508121819.1a451d54@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.120]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Saturday, May 8, 2021 2:18 PM
> To: Thomas Gleixner <tglx@linutronix.de>; Ingo Molnar <mingo@elte.hu>; H. Peter
> Anvin <hpa@zytor.com>; Peter Zijlstra <peterz@infradead.org>
> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; Linux Kernel Mailing
> List <linux-kernel@vger.kernel.org>; Linux Next Mailing List
> <linux-next@vger.kernel.org>
> Subject: linux-next: Fixes tag needs some work in the tip tree
> 
> Hi all,
> 
> In commit
> 
>   19987fdad506 ("sched,doc: sched_debug_verbose cmdline should be
> sched_verbose")
> 
> Fixes tag
> 
>   Fixes: 9406415f46 ("sched/debug: Rename the sched_debug parameter to
> sched_verbose")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
> 

Sorry, my bad. Will keep it in mind.

> --
> Cheers,
> Stephen Rothwell

Thanks
Barry

