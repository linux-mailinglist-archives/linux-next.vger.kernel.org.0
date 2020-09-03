Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2EC25C128
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 14:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgICMkF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 08:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbgICMid (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Sep 2020 08:38:33 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53772C061244
        for <linux-next@vger.kernel.org>; Thu,  3 Sep 2020 05:38:32 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id b3so1682206qtg.13
        for <linux-next@vger.kernel.org>; Thu, 03 Sep 2020 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=C2d6QG1IblDeyroVtS3hMSNO/LsvLyKHGpkVymmB4pg=;
        b=l+VpGWunXGi10wTShVSflV5Z/zSRT8cCTRxA819xi63BVbtXqlDpnECjBDN7GsHK7z
         or/7Sqa1wMEMzBpsWVzrxXsFMyFqiWbufjImu+VlfgkFRZCjpHcxErVTGWkswDasZfQr
         6yWHvRV1b8AQlYNlt89QWL9z+Q4EZpOls6QyvVy3ESS8+f+aqBaB8vcShXcMkuM19NnG
         p7mGV8w5kiUuRNUWzqMRO4W8fA5nR9arzaRRoe75UAP/QmfNfZLu/zF1Zi5HnyFyFN/I
         XfCL0idn3B2DF1Z7l3CRyneOXAHtA0bZYF7e2xSkOuCf2ax+VpT3DVFrFYwQFzAhADRE
         X7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=C2d6QG1IblDeyroVtS3hMSNO/LsvLyKHGpkVymmB4pg=;
        b=aYNwGsFKJfxp5iC1rCWYoAerTxVRAleQmQTXk9HadIJNf9Q2Wkz7ebJ0cwrWs2Wxvu
         DeWK3rdN9TsyUjkAV6o9x9nq2qQXk9ybedAtQMrCkJLQCpGEZzAwX9sUiIlX/jqalAGN
         f7lWNzBz3SZ8zeCajllKC4cZ0ieZ6q1JB3/31CigNjRgAwxSquoyznYkxyS7oFWgVsSy
         0rJpyTG9Cm1mFTDydHtEEqxNt5lvvmOnHe4LowGb/t2kuX50R6EIu5ZZtPpHnUJ+WHeH
         TJk+m5UB+rKbof2MiHIckpuLnBoftG0t3XqDv2lStj5MuR33JkJwWEWpeHI4nhtNvZNt
         HdFw==
X-Gm-Message-State: AOAM533137kA0V7mxlLSvkbohXcIt0PlWsX5L5FdsQg0orG9i0rbEmFr
        yrYUfTc7z7ONVuMm2l8CdUi+cQ==
X-Google-Smtp-Source: ABdhPJzk9Vn1uJfPyBefi7iCXkdsWcTrDpZZF56VRUWX7CwcPp80tVcpXoqV9sLgSyT7IGuTrTs0uA==
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr3289809qtd.184.1599136711564;
        Thu, 03 Sep 2020 05:38:31 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id r6sm2088194qkc.43.2020.09.03.05.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 05:38:30 -0700 (PDT)
Date:   Thu, 3 Sep 2020 08:38:25 -0400
From:   Qian Cai <cai@lca.pw>
To:     skhan@linuxfoundation.org, sfr@canb.auug.org.au
Cc:     brendanhiggins@google.com, urielguajardo@google.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-next@vger.kernel.org
Subject: Re: [PATCH 2/2] kunit: ubsan integration
Message-ID: <20200903123824.GA4225@lca.pw>
References: <20200806174326.3577537-1-urielguajardojr@gmail.com>
 <20200806174326.3577537-2-urielguajardojr@gmail.com>
 <20200902125223.GA5676@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902125223.GA5676@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 02, 2020 at 08:52:24AM -0400, Qian Cai wrote:
> On Thu, Aug 06, 2020 at 05:43:26PM +0000, Uriel Guajardo wrote:
> > Integrates UBSAN into the KUnit testing framework. It fails KUnit tests
> > whenever it reports undefined behavior.
> > 
> > Signed-off-by: Uriel Guajardo <urielguajardo@google.com>
> 
> It looks like this patch had been merged into linux-next but the "[PATCH 1/2]
> kunit: support failure from dynamic analysis tools" did not. Hence, it caused a
> compiling failure.
> 
> lib/ubsan.c: In function ‘ubsan_prologue’:
> lib/ubsan.c:141:2: error: implicit declaration of function ‘kunit_fail_current_test’; did you mean ‘kunit_init_test’? [-Werror=implicit-function-declaration]
>   kunit_fail_current_test();
>   ^~~~~~~~~~~~~~~~~~~~~~~
>   kunit_init_test
> cc1: some warnings being treated as errors

Stephen, Shuah, can you revert this commit or pick up its dependency as well?

https://lore.kernel.org/linux-kselftest/20200813205722.1384108-1-urielguajardojr@gmail.com/

Still seeing this on today's linux-next build.

> 
> > ---
> >  lib/ubsan.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/lib/ubsan.c b/lib/ubsan.c
> > index cb9af3f6b77e..1460e2c828c8 100644
> > --- a/lib/ubsan.c
> > +++ b/lib/ubsan.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/types.h>
> >  #include <linux/sched.h>
> >  #include <linux/uaccess.h>
> > +#include <kunit/test.h>
> >  
> >  #include "ubsan.h"
> >  
> > @@ -137,6 +138,7 @@ static void ubsan_prologue(struct source_location *loc, const char *reason)
> >  {
> >  	current->in_ubsan++;
> >  
> > +	kunit_fail_current_test();
> >  	pr_err("========================================"
> >  		"========================================\n");
> >  	pr_err("UBSAN: %s in %s:%d:%d\n", reason, loc->file_name,
> > -- 
> > 2.28.0.163.g6104cc2f0b6-goog
> > 
