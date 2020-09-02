Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B1125AB76
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 14:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgIBMws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 08:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgIBMwb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 08:52:31 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8E8C061245
        for <linux-next@vger.kernel.org>; Wed,  2 Sep 2020 05:52:31 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id n18so3420294qtw.0
        for <linux-next@vger.kernel.org>; Wed, 02 Sep 2020 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Pvl3SWJ9e5sce/rNKaSduyhhxTz1BgiMnI37NgwAhUY=;
        b=pIMqb6bVqWYzxtZFWJSmWNZTz/EKtlBYMVpJ1K3XEhvzHRG+pUoB71bDqhI9uFBunZ
         0ELFd1MpKzQV7R7HqrjpoygMTptfUS3x9DM9irg13KRTLIwpsXzY08GHwgEhIHcK+JG3
         5dF9VrfpoF6k+pqSgyuqE7WXB8lmuNVHJfO1SyLKglUoE1+u1A2KVu8DI+woV91/Rq5l
         VvS69IgnUJmomuB85Tj2Tovhgf+DLbtjQ6aPDI1VO+d6Igxe+o1Z6Yx9cNfB6EtRMf3w
         hvPdpp04eEOxT9aVpqI4jjroa4TIBvpK7unQsS+nvWg3hdKGrgCHZndy7EMCrad54QkP
         OtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Pvl3SWJ9e5sce/rNKaSduyhhxTz1BgiMnI37NgwAhUY=;
        b=cNOU6cTuk5F1ymBNO4bdaCqTe6OSKZO365Df95dhUN5MeeLNCLyVH5AQ6j+vIY0Yv7
         nx9Iqrkd3aVf2bh+GyCSG3q912HfYi/08FtkqZ7ARQVM6nnFsGHDn3x9SxaCVi7KSxmP
         Dq2HygyI9NS20zXdbEqFdZdO72NjTKTsNwLgXeRvJJAZDnHdRBgWEYU9MsE9WLgb2rzW
         t27RYBf+Ws+FcqbLo0gT8SUuD0n6lqVNkxd5vIfCLj66sfoAPHF6PqqtQH147FCAP5fD
         6d8BrPXLJamcPqy07iXKeJh2RaEPo3mzKpFJCQXD1L3BrDPUqF50pPvOMzwC7PJSedD7
         iciQ==
X-Gm-Message-State: AOAM530GMToc1ZMlhunwhZ/M523PMxFpoVYxye06ZGKC78Tg4bFlc7dZ
        3qSHJhcaO0rST5iZPnyI1Gbh0A==
X-Google-Smtp-Source: ABdhPJzbj9HoMDTrZSIHvhNE2C9Cwm3ZM61DpTVhFH/mNvlJbuBbLY7DbYz1/PBcCkRU6zj6OTP/9Q==
X-Received: by 2002:aed:27dd:: with SMTP id m29mr6853784qtg.165.1599051150238;
        Wed, 02 Sep 2020 05:52:30 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id 184sm4731438qkl.104.2020.09.02.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 05:52:29 -0700 (PDT)
Date:   Wed, 2 Sep 2020 08:52:24 -0400
From:   Qian Cai <cai@lca.pw>
To:     Uriel Guajardo <urielguajardojr@gmail.com>
Cc:     brendanhiggins@google.com, urielguajardo@google.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org
Subject: Re: [PATCH 2/2] kunit: ubsan integration
Message-ID: <20200902125223.GA5676@lca.pw>
References: <20200806174326.3577537-1-urielguajardojr@gmail.com>
 <20200806174326.3577537-2-urielguajardojr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200806174326.3577537-2-urielguajardojr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 06, 2020 at 05:43:26PM +0000, Uriel Guajardo wrote:
> Integrates UBSAN into the KUnit testing framework. It fails KUnit tests
> whenever it reports undefined behavior.
> 
> Signed-off-by: Uriel Guajardo <urielguajardo@google.com>

It looks like this patch had been merged into linux-next but the "[PATCH 1/2]
kunit: support failure from dynamic analysis tools" did not. Hence, it caused a
compiling failure.

lib/ubsan.c: In function ‘ubsan_prologue’:
lib/ubsan.c:141:2: error: implicit declaration of function ‘kunit_fail_current_test’; did you mean ‘kunit_init_test’? [-Werror=implicit-function-declaration]
  kunit_fail_current_test();
  ^~~~~~~~~~~~~~~~~~~~~~~
  kunit_init_test
cc1: some warnings being treated as errors

> ---
>  lib/ubsan.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/ubsan.c b/lib/ubsan.c
> index cb9af3f6b77e..1460e2c828c8 100644
> --- a/lib/ubsan.c
> +++ b/lib/ubsan.c
> @@ -14,6 +14,7 @@
>  #include <linux/types.h>
>  #include <linux/sched.h>
>  #include <linux/uaccess.h>
> +#include <kunit/test.h>
>  
>  #include "ubsan.h"
>  
> @@ -137,6 +138,7 @@ static void ubsan_prologue(struct source_location *loc, const char *reason)
>  {
>  	current->in_ubsan++;
>  
> +	kunit_fail_current_test();
>  	pr_err("========================================"
>  		"========================================\n");
>  	pr_err("UBSAN: %s in %s:%d:%d\n", reason, loc->file_name,
> -- 
> 2.28.0.163.g6104cc2f0b6-goog
> 
