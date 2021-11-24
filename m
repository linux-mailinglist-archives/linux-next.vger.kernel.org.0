Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639C145C765
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 15:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355483AbhKXOeo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 09:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355440AbhKXOem (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 09:34:42 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41C3C09B199;
        Wed, 24 Nov 2021 05:16:04 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id BCBDA1F459B3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637759762; bh=w5NCl88uIb7DXyRTvcGFerOK5HHq7D6Czyq4czemG7I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=g5ex+td+/1EaqpvGy26pVFRXUqSPBFspuYS9FJ0LfcdO1Kgv4fuz/AbrbGM6ISEBL
         YC7KKFAbJNuN35fOti/SpTPj0SG/lLP71koRTX3m5XS4IaHUO6+lprXaUK94iDpmCy
         WzArE+65mEsXtyUX+UDqIGwADkyhTMy1xOzNDh4EeRBubvybpuNTjLuk1xifbGiJIf
         wl5T9fh5Rr4YEqnk1skSx3JPVMX+QM8Cc2gRBk4XwZc8vVzMEWu3CRFyNCAeIniAAG
         6IwPzGQpe5d2s3wy4+UCuIdURQF5ao/WhGMW5cSIBqaLolNp26c4MAN4y1ctrPt2PB
         BjMZ26LbvnlOQ==
Message-ID: <4dd8a108-013f-8d68-b5d5-138d3cf3bff0@collabora.com>
Date:   Wed, 24 Nov 2021 10:15:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: spinlock.c:306:9: error: implicit declaration of function
 '__raw_write_lock_nested'
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net>
 <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arnd,

Às 04:49 de 24/11/21, Arnd Bergmann escreveu:
> On Wed, Nov 24, 2021 at 8:31 AM Rob Landley <rob@landley.net> wrote:
>> On 11/23/21 5:38 AM, Naresh Kamboju wrote:
>> @@ -451,3 +451,4 @@
>>  446    common  landlock_restrict_self          sys_landlock_restrict_self
>>  # 447 reserved for memfd_secret
>>  448    common  process_mrelease                sys_process_mrelease
>> +449    common  futex_waitv                     sys_futex_waitv
> 
> I don't know what's going on with this one, I don't actually see
> a reason why it isn't already wired up on all architectures. If we add
> this, it should probably be done for all architectures at once as a
> bugfix, but it's possible that this is intentionally only used on
> x86 and arm.
> 
> André, can you comment on this?
> 
>       Arnd
> 

I've added entries for the archs that I've actually tested, but there
should not be any arch-specific problems in futex_waitv. I'll submit a
patch to wire it up for the remaining architectures.
