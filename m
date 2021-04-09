Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70D2359121
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 03:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhDIBG2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 21:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47672 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232918AbhDIBG1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 21:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617930375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3p6tRLUoxhYea5OgxPQQ7mdUA/VUMk+BELmCoQmMAQE=;
        b=bf2cAAs38aHgrjHnaIb0UuOVjNUzCQQWF78yXamYf5uPBVBwmkn6HCt5vMak7wLdLR0lRF
        XrkhxnOXOR8/lBntFUr9zPZYvWQ5Rm9Ox6L8mA6cSA1BlfPQ9ZS0vzLNdz1WcqMKlzLH5G
        1iw314sgL18XXmWH/rf76GkOh8nLX7c=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-OHJHFQJDPJSCWKRaEIreew-1; Thu, 08 Apr 2021 21:06:14 -0400
X-MC-Unique: OHJHFQJDPJSCWKRaEIreew-1
Received: by mail-pf1-f200.google.com with SMTP id a6so2098149pfv.9
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 18:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3p6tRLUoxhYea5OgxPQQ7mdUA/VUMk+BELmCoQmMAQE=;
        b=VB82PZS16gITzdEHpzbB7OoBxcbjxU1ldGF0Nxgxmjr7e9szE1Os+dhy4bn9o195kl
         Z7SNq8BWkJXK/yh9kbmhQ2L8Hc+uz/8EB859JLw6BblVWBAdD0D2SlDVmAtlywyMWOeq
         ro3mI3pW1VvMdit6i8nfJifVh70jVYXELbLegXQjPdQibaxissf216blNQLFnJ82tKIq
         m/snjYUhl7GmtIfUXwWg3I6Poeyd2rz+0gq2l24cjUrt9fm7kxOEvAcTXC/TFS2GmUAq
         9UAM9qBNbLJ1oWugm58+KLZn8mF2qFq78e3H4xkEu3hettEe2UWuwmaegMLReA7w1dnz
         rQ1Q==
X-Gm-Message-State: AOAM530uBxxeVx7O1kR4W2tYGeoov6AmB3gSXpDpJmcAWIwefO2OsWWk
        lnyyB/z1S+BvmNvN/UUk6LeV+s908B/HyZEQiHPKD0BQxCfRke/Hxh+LGb7zqKngZKViZY8mdXk
        gziqDSH2tOo9+VYmd1BUhAw==
X-Received: by 2002:a17:90a:3904:: with SMTP id y4mr10951590pjb.125.1617930372893;
        Thu, 08 Apr 2021 18:06:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHqjvlL1ydwmIaYocdAJeAuh44gB73afwKuX3dhfdFID0+nSmuF/PQNsf9cQLZWqZfsSJcdA==
X-Received: by 2002:a17:90a:3904:: with SMTP id y4mr10951575pjb.125.1617930372672;
        Thu, 08 Apr 2021 18:06:12 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id d4sm485430pjz.46.2021.04.08.18.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 18:06:12 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:06:02 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Chao Yu <yuchao0@huawei.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: erofs_get_pcpubuf(): Program hangs
Message-ID: <20210409010602.GB689534@xiangao.remote.csb>
References: <202104081709.48778B3@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202104081709.48778B3@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Thu, Apr 08, 2021 at 05:09:53PM -0700, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20210408 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Wed Apr 7 12:41:22 2021 +0800
>     91a196935395 ("erofs: introduce multipage per-CPU buffers")
> 
> Coverity reported the following:
> 
> *** CID 1503700:  Program hangs  (LOCK)
> /fs/erofs/pcpubuf.c: 31 in erofs_get_pcpubuf()
> 25     	raw_spin_lock(&pcb->lock);
> 26     	if (requiredpages > pcb->nrpages) {
> 27     		raw_spin_unlock(&pcb->lock);
> 28     		put_cpu_var(erofs_pcb);
> 29     		return NULL;
> 30     	}
> vvv     CID 1503700:  Program hangs  (LOCK)
> vvv     Returning without unlocking "pcb->lock".
> 31     	return pcb->ptr;
> 32     }
> 33
> 34     void erofs_put_pcpubuf(void *ptr)
> 35     {
> 36     	struct erofs_pcpubuf *pcb = &per_cpu(erofs_pcb, smp_processor_id());
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

I think this is a false positive here, since erofs_get_pcpubuf() should match
with erofs_put_pcpubuf(), which is used to unlock pcb->lock.

Thanks,
Gao Xiang

> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1503700 ("Program hangs")
> Fixes: 91a196935395 ("erofs: introduce multipage per-CPU buffers")
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot
> 

