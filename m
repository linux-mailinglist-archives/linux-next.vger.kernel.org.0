Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E166F45B562
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 08:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241075AbhKXHez (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 02:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241030AbhKXHez (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 02:34:55 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D4EC061714
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 23:31:46 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r26so3580427oiw.5
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 23:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TFx3IBl/Jop5ea0OYsSPnC+3ISSzd9CI/4cFejYkTF8=;
        b=hFYsgXsfFQLU1ueWwuL3G0aFwfSOp5XyUPofqd041MOj7wOgcvHqeyv0qTc6TVuISC
         nwKAGEn2YWLuXhNZZAFSFtDkwOIo+zgNZ3DxtSzGiyvsufWTMu++tbXpPIM7ndezHl0n
         BXs4k9vd+4iivYz4FR9AiiH3PW+UHGNfd3IZODGoGnRGGJh9XIhezt0zcShTvOoim7MQ
         7RSsLU/XhvNPVJXaQhPCwdjRlLMLzZqWBMUfJt76eJGsWXMveJ4vM4saV3EX6nUaxXY1
         H4II6mB3AaejftVHmcHNEMtiXxi79D6ELIwXQWTY+EbTUX8TMztK3OCpVaO7oiqr/lLS
         e/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TFx3IBl/Jop5ea0OYsSPnC+3ISSzd9CI/4cFejYkTF8=;
        b=lYGW0pVGQaSywUfiQm1bEUXRikk/ewEBGK1lwYxMYeP9naXpofi4+2zvkUTBqTqM/I
         DJfVK1Sq/9BGOpTcr8JCP3Op7ZcjAH/pBEOLbfNEDQ6aEHlNY9IeN8lDcwAKZYlvWYGB
         BYTNqMFR+x/F9s2l25Ueez0PMJDO7qgoZKCaYdvgSKC/pZjn6B7Z5BnMEhmzN0jKxmmJ
         GkWH5ZnHV01yfNqTjvrd+NUBYVYbqrwHDATmermHRJ1AQlcF0WLMXSfaLQIqFecNe/Mc
         ppUwoPt7K1cxfxLIEGAjcSLmi/DLeREg9oSu/Q+PJrRofObRY2xebeTo3tVQduWy8+rE
         rGdA==
X-Gm-Message-State: AOAM5305bQA5mCWUhuKKQ+jXeclTGuMVobd+qILtBVzWAF9Wc26rBg5Z
        MzRpCU8ONq9bPIawr2t/ReNztw==
X-Google-Smtp-Source: ABdhPJx+o9wkZrcwirn9tgycTBKsKGSg9imAa7huU6/t4dK5wrtPZzW/r4+oQdSaRYL2SRFlzJuNjw==
X-Received: by 2002:a05:6808:a08:: with SMTP id n8mr3824603oij.148.1637739104000;
        Tue, 23 Nov 2021 23:31:44 -0800 (PST)
Received: from [192.168.86.163] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id t12sm2413684ood.22.2021.11.23.23.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 23:31:43 -0800 (PST)
Subject: Re: spinlock.c:306:9: error: implicit declaration of function
 '__raw_write_lock_nested'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net>
Date:   Wed, 24 Nov 2021 01:31:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/23/21 5:38 AM, Naresh Kamboju wrote:
> While building Linux next 20211123 tag for sh with gcc-11
> following warnings / errors noticed.
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=sh
> CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
>   Generating include/generated/machtypes.h
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]

Here's a fix for those first two:

From: Rob Landley <rob@landley.net>

Wire up clone3 and futex_waitv syscalls for arch/sh

Signed-off-by: Rob Landley <rob@landley.net>
---

 arch/sh/kernel/syscalls/syscall.tbl |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/sh/kernel/syscalls/syscall.tbl
b/arch/sh/kernel/syscalls/syscall.tbl
index 208f131659c5..65c3a94bff48 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -437,7 +437,7 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
+435	common	clone3				sys_clone3
 436	common	close_range			sys_close_range
 437	common	openat2				sys_openat2
 438	common	pidfd_getfd			sys_pidfd_getfd
@@ -451,3 +451,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common	futex_waitv			sys_futex_waitv

Rob
