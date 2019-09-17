Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A389B4890
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 09:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404543AbfIQHwr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 03:52:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35578 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404523AbfIQHwr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 03:52:47 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so2030282wrt.2;
        Tue, 17 Sep 2019 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cdNFOd7zQsAnR9pP9FzvoRQoGQj1w1WjpRlr+NKG8I4=;
        b=EuOgRWTJsovgapyFUlWA/qL2ETB+kVNHua2oqHt+kwovPDpqoZPLoSGi1kLlGUaCE2
         ZqQ/g5P3xAI5NX10qznFTxcpx6WcDtjhvIUMJsTRqs26bYzHns+oqOfBs0yC9lTn8shc
         //xX51tqbtgbTs5rKQxcbiwLhkZBK3pJ/Ub4rgbrgqqiKKN7Ciea9yPajjZI/joJyMdG
         itGgOAvRSiWodyuOhGXwA6YMVXcarSdTQ2jPB+v02eIfY3NmmNvBJ5UjAMdtgpG4i1cb
         gCBC3GhBIdkwpDyYkkJ+5NFEKW3B1vO3VAm4/WjX0OVogPmHP2sSFah7+L268qUqS/zW
         Q2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=cdNFOd7zQsAnR9pP9FzvoRQoGQj1w1WjpRlr+NKG8I4=;
        b=lLB4TFplVfXtU2K/eYuGIKzkhaDPQpIEXn2dNB+MbJmxK10hOO4Rn1C4MHQHxfw5tV
         76Qo0ilhRE+MBFtEem+71+XWUC46at5Rw04J1h3rreIDS9qQcsddHdL77R2vqu945AGm
         ijulK1a/PS+QwpzxlrZIBfNDoy6ZnA/8BGhpzgdM52QV8mhoP/1F7q/mPpe0ReEXtgeE
         RKfeyEX01lLIBYw1JyaS0bEZRA1CxW7fwQazqR9rwMNU8U2zcPwKG92QFThqxW0j9Xd7
         Ya8hGDyQk5XY+9GnGnqd9CEQmEz0p2NTqspdInd6oK341Avx/1Lz3a7gXcrzMgo3PN0s
         FHyg==
X-Gm-Message-State: APjAAAVyuj3h3V1lwvH6quzZZ6QKyEA4TG0jvtbyPk1db7kXw/gbuik2
        RF6iO/lpkYjViI/gxUU57jU=
X-Google-Smtp-Source: APXvYqzCzgbD3N2hdYM+1wfknOYmMqdKA4ov+/2gSkX376GahrsHfZuHHwZbYv/LoGUz4G9alDNbJA==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr1905223wro.93.1568706765280;
        Tue, 17 Sep 2019 00:52:45 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id n2sm1349204wmc.1.2019.09.17.00.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 00:52:44 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:52:42 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Sep 16 (kernel/sched/core.c)
Message-ID: <20190917075242.GB49590@gmail.com>
References: <20190916223850.GQ4352@sirena.co.uk>
 <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Randy Dunlap <rdunlap@infradead.org> wrote:

> On 9/16/19 3:38 PM, Mark Brown wrote:
> > Hi all,
> > 
> > Changes since 20190915:
> > 
> 
> on x86_64:
> 
> when CONFIG_CGROUPS is not set:
> 
>   CC      kernel/sched/core.o
> ../kernel/sched/core.c: In function ‘uclamp_update_active_tasks’:
> ../kernel/sched/core.c:1081:23: error: storage size of ‘it’ isn’t known
>   struct css_task_iter it;
>                        ^~
>   CC      kernel/printk/printk_safe.o
> ../kernel/sched/core.c:1084:2: error: implicit declaration of function ‘css_task_iter_start’; did you mean ‘__sg_page_iter_start’? [-Werror=implicit-function-declaration]
>   css_task_iter_start(css, 0, &it);
>   ^~~~~~~~~~~~~~~~~~~
>   __sg_page_iter_start
> ../kernel/sched/core.c:1085:14: error: implicit declaration of function ‘css_task_iter_next’; did you mean ‘__sg_page_iter_next’? [-Werror=implicit-function-declaration]
>   while ((p = css_task_iter_next(&it))) {
>               ^~~~~~~~~~~~~~~~~~
>               __sg_page_iter_next
> ../kernel/sched/core.c:1091:2: error: implicit declaration of function ‘css_task_iter_end’; did you mean ‘get_task_cred’? [-Werror=implicit-function-declaration]
>   css_task_iter_end(&it);
>   ^~~~~~~~~~~~~~~~~
>   get_task_cred
> ../kernel/sched/core.c:1081:23: warning: unused variable ‘it’ [-Wunused-variable]
>   struct css_task_iter it;
>                        ^~
> 

I cannot reproduce this build failue: I took Linus's latest which has all 
the -next scheduler commits included (ad062195731b), and an x86-64 "make 
defconfig" and a disabling of CONFIG_CGROUPS still resuls in a kernel 
that builds fine.

Thanks,

	Ingo
