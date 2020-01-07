Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35733132048
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 08:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgAGHQK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 02:16:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40591 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgAGHQK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jan 2020 02:16:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id c14so52650758wrn.7;
        Mon, 06 Jan 2020 23:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6ehtVX/vXqi84j8vJ7LanhuhMrxC14cj9yNj7bY3Ql8=;
        b=T3TiTw5MYjUs0SHo4Rd0SUdv3Hr1RepdaMJ4ybQ/0ahBu76DLPUs2QQgoSJDB04y65
         WEl8S9VinF/99VKgnT3z9cJ1b3gxqkjaamUDT7TIoGPcuozRFKgMBHdD8HnqsjBbxw5J
         fhZGLehw/I0V5aQH2+y3Y7n2nE5Zjc9NKWWNPWllY6FxEk7jQ5gzcRsWswGU+vEF4sPu
         b1cMYKaWrYITq1+ayUVh0gDQODtuKl+Mwo/o1VcsVKoc8kxkUrcNUBKqTj9bCFl5afeY
         BQOexyZvTmyZSHcUsQ4XfAV4TpPLU6Fr4ly8y2IcHokvDcoyXPBG/K+kmJUkqz9/Fl4K
         UC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6ehtVX/vXqi84j8vJ7LanhuhMrxC14cj9yNj7bY3Ql8=;
        b=ah/Wt2o2xVaIFiIkUDiKOHbOb+94V1rcRuSH/ePs3VkQdv+6P+HmGm3DXPT+mRFev1
         vLgLj5xAZxA/wDL8pfvVP9lKHARVzWSsG/1325TqebRPFQ3sC+F1JfjLJud1YqT0PBPv
         KmuYMyuKM4z1V+J5ijM7cNWIy7BI/wiXKRpiaKy26IFMZEo2nvx34zo9DZ4aJ/rWbznC
         +yoGLwWt27HPfIPdoI21enDidTxfAVjGi0Q8aOW/1RmDidY8uQFzdZgLWMAve7aQsJgm
         x7YgesKo84ea5kh+I8lFfbjkni3seuKE09HXnQInRx7VkcZjhoG6TVfCrwROyuXKyWvM
         104g==
X-Gm-Message-State: APjAAAVtQ1VPzuG6+nk+3mbZsoDfILpcbwgG8yZ2IUTzN+BHCNtR1v0X
        +Fdrdpkz/rkg2763XMeDeafZZbxL
X-Google-Smtp-Source: APXvYqzcgIAXK2K6x4/Ui124/rmGA12+f8m5PdXik7SAGkgTxFG9ErHaQfDNv0MHly0hHTaRkVZh0A==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr111939854wrp.355.1578381367619;
        Mon, 06 Jan 2020 23:16:07 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id g21sm81025126wrb.48.2020.01.06.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 23:16:06 -0800 (PST)
Date:   Tue, 7 Jan 2020 08:16:04 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20200107071604.GA45744@gmail.com>
References: <20200107164317.51190747@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107164317.51190747@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> [This has been happening for a while, I just missed it :-( ]
> 
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> produced this warning:
> 
> arch/x86/kernel/unwind_orc.c:210:12: warning: 'orc_sort_cmp' defined but not used [-Wunused-function]
>   210 | static int orc_sort_cmp(const void *_a, const void *_b)
>       |            ^~~~~~~~~~~~
> arch/x86/kernel/unwind_orc.c:190:13: warning: 'orc_sort_swap' defined but not used [-Wunused-function]
>   190 | static void orc_sort_swap(void *_a, void *_b, int size)
>       |             ^~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   f14bf6a350df ("x86/unwind/orc: Remove boot-time ORC unwind tables sorting")

Now fixed via:

  22a7fa8848c5: ("x86/unwind/orc: Fix !CONFIG_MODULES build warning")

Will push it out after some testing, should go out with the next 
tip:auto-latest version.

Thanks,

	Ingo
