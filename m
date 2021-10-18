Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047EC4310C9
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 08:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhJRGr3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 02:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhJRGr3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 02:47:29 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883E8C061745
        for <linux-next@vger.kernel.org>; Sun, 17 Oct 2021 23:45:18 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id np13so11510297pjb.4
        for <linux-next@vger.kernel.org>; Sun, 17 Oct 2021 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=DMgduQp/zctdpl9lhlJhxC+AafmDlkmeR4lQyrVCvzo=;
        b=x6Y7c7k3AJYf36wkRA5SCf7htdnB2MWJ9QSVU//V2tRmYIUGDbjUNDPzFHs9/NG2oM
         zZ8xVHXauaMicyUFZdKu9PswlyuLU9QXCwqptXo3KLTidDqalgbnjhkepyjRi78k80wj
         vNK4QxxhHLv7hZL1LPFsdtSH+jEfRj9NpYtFk5E1KJ5O9cPdSgFKezbgUH7MZ0J3TvwA
         vuuc/sXGt6lmK7KCDQ+5oDjEsX0nUAoZpTPPA07lg48+y/OtbzV+VJeIvX98+9xZa/ys
         xqJVwsstLX93bnMkVXT8rUTdMmNjQUB+ZaVyTqbt4uFO/vF/uF3ItpVNuiXqNvyKox4j
         tlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=DMgduQp/zctdpl9lhlJhxC+AafmDlkmeR4lQyrVCvzo=;
        b=Uy9gps9lMCTVuYfITTIbNYYR47HoD6vZLQdFk2IqKQwDEB3AFkmeLsD7SXbepXqr/m
         KDhG+sXuqrQ+t16qfaaJi0+wZ3jGc7z+HjjFvrR6ZhTxfLY2kudA3QTIbv2f7OgEbrvB
         JhC+m0iHB+NUHlHw+Q6QrKjVE0508u/Uy/K4UU17e7TRp7uOgvdRUbtT57hoMr22hSAP
         zuV0SYVosXslFvH7GTKcZHUY1FuLAidilNrM0b41cJw0CslW5u8WlGGo9F0Um7I9QzW7
         6y+fXZtCPONAh2v35f7V10SWuFtvXNhrGjFw3+aTpAt/yZBrJ1NFXj6AfHKNDj9WawFy
         C/Sg==
X-Gm-Message-State: AOAM531VC6p+QQpQcdtWhi1zDI4I40DGf6FBljfqZOKPXLQ5zfWkaET8
        zmdac142X60CNcWqjy70q0qwAwYOwTO2Zw==
X-Google-Smtp-Source: ABdhPJxzRqRGRAo5ZS+zVyWfl14FoNKeNRQcRdvzrhyL28TL3zUalpTt6j9ZLaDRJ6uNhicwzmaNzg==
X-Received: by 2002:a17:90a:a24:: with SMTP id o33mr3756210pjo.229.1634539517708;
        Sun, 17 Oct 2021 23:45:17 -0700 (PDT)
Received: from [10.254.242.85] ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id t38sm7903771pfg.102.2021.10.17.23.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 23:45:17 -0700 (PDT)
Subject: linux-next: build failure after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211018172330.379b2061@canb.auug.org.au>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <60e736e7-cc37-9fea-a0fb-6628f87e741c@bytedance.com>
Date:   Mon, 18 Oct 2021 14:45:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018172330.379b2061@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 10/18/21 2:23 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> arch/x86/kernel/process.c: In function '__get_wchan':
> arch/x86/kernel/process.c:950:2: error: implicit declaration of function 'stack_trace_save_tsk' [-Werror=implicit-function-declaration]
>    950 |  stack_trace_save_tsk(p, &entry, 1, 0);
>        |  ^~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> Caused by commit
> 
>    bc9bbb81730e ("x86: Fix get_wchan() to support the ORC unwinder")
> 
> stack_trace_save_tsk() requires CONFIG_STACKTRACE which is not set for
> this build.

Maybe get_wchan() can be updated to:

unsigned long get_wchan(struct task_struct *p)
{
#ifdef CONFIG_STACKTRACE
	unsigned long entry = 0;

	stack_trace_save_tsk(p, &entry, 1, 0);
	return entry;
#else /* CONFIG_STACKTRACE */
	return 0;
#endif
}

Thanks,
Qi

> 
> I have reverted that commit, and commit
> 
>    42a20f86dc19 ("sched: Add wrapper for get_wchan() to keep task blocked")
> 
> which follows it, for today.
> 
