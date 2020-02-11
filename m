Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF682159AEF
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 22:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbgBKVHe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 16:07:34 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35204 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgBKVHd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2020 16:07:33 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so1799044pjc.0;
        Tue, 11 Feb 2020 13:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KpRqerCMQ04uyIy1W6ZXPeXHMY8KzTG2gyT5gFoRSVc=;
        b=DsC1UsmRMmRXY8sU9+BTseC3/NFr2rLiH1mSi1tgFe0XBprAHzKLHjYMiXJaySCpe4
         S9lHiKM2bj0x/UEAJuIx7Xup22fdWYJsZlGGWBq2KjtfaKQiGdZEAD0qyNmj51SEQD8q
         MSw4qn+LtBhVmPzmyARmGef5mpvjGJTP6sbiUcBGhebXbDiH00FQMfzY29nDRqYbkHY8
         zIi/C9fP0OQXrU6povPH++wuR+E/cRbA7PIHWXhofvuYuCa8JAjTmEqPgIjEQ5mRsFId
         9Un3fJOm1KDqxml3H9y8nGDXmV03jIkyz0Cu3UCO486omPjkt8l3atAzog5y2BhY70pD
         DLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpRqerCMQ04uyIy1W6ZXPeXHMY8KzTG2gyT5gFoRSVc=;
        b=eTCU56lMBhhCwqI6p/lfJyqUJq9tTKjt2jyCnyGOr/+SFbyX24b091sqT8wWh+m5aK
         7duPlRMbexUkBA/HAa8gOuzlOMECVQ3Uj4wkAzeCPZRqzWaoQez5RTftot/Qse2b71iq
         nTF5yKwXPUhDqgNGCFPHacAW5YEwgMIFYWawt1tBBmgErARLie/umt/peZsefsCvxSw0
         siRmw8NhUuj42+Z+WEfmvCEBhY7gE7ZZw7/5XlNTXr6+kDCk22jh91dHJWrkLWYOP/vR
         TUoegVoNmpjg1/o3tZC79FABkYm6bSIMS74+6xuCubOvcvpjB9OG4Z7rWTQdD8z4aZfW
         dM1g==
X-Gm-Message-State: APjAAAWra1tb58rT0cJdzYEusaFK+ekp8NPRf5NI0TUWH+Ibgha/BWnn
        8XI9BzmQQzizFgX+PTyGnVPu8E8NeFDdCr+qLZI=
X-Google-Smtp-Source: APXvYqxmevX/lfQ/fN2gDs/u6hX13MluFuzD8BjfKrZJrTNFcQ+u+SNTLTxm61XjsRC5p6r9CReQxe8j7L+8IzyGG5A=
X-Received: by 2002:a17:902:758e:: with SMTP id j14mr20279886pll.18.1581455252938;
 Tue, 11 Feb 2020 13:07:32 -0800 (PST)
MIME-Version: 1.0
References: <20200211103530.41d1e6ed@canb.auug.org.au>
In-Reply-To: <20200211103530.41d1e6ed@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Feb 2020 23:07:21 +0200
Message-ID: <CAHp75Vf6p4Sf3hcNV-q_pfDYvgDVodPykgn98mumcj13BGN+Vg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gayatri Kammela <gayatri.kammela@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 11, 2020 at 1:35 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/platform/x86/intel_pmc_core.c: In function 'pmc_core_resume':
> drivers/platform/x86/intel_pmc_core.c:1329:43: warning: passing argument 4 of 'pmc_core_lpm_display' makes integer from pointer without a cast [-Wint-conversion]
>  1329 |   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
>       |                                           ^~~~~~~~
>       |                                           |
>       |                                           char *
> drivers/platform/x86/intel_pmc_core.c:978:30: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'char *'
>   978 |      struct seq_file *s, u32 offset,
>       |                          ~~~~^~~~~~
> drivers/platform/x86/intel_pmc_core.c:1329:53: warning: passing argument 5 of 'pmc_core_lpm_display' makes pointer from integer without a cast [-Wint-conversion]
>  1329 |   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
>       |                                                     ^~~~~~
>       |                                                     |
>       |                                                     int
> drivers/platform/x86/intel_pmc_core.c:979:18: note: expected 'const char *' but argument is of type 'int'
>   979 |      const char *str,
>       |      ~~~~~~~~~~~~^~~
>
> Introduced by commit
>
>   2cf128fbf321 ("platform/x86: intel_pmc_core: Dump low power status registers on an S0ix.y failure")

Thank you, Stephen,
Fix had been incorporated.


-- 
With Best Regards,
Andy Shevchenko
