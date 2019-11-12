Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 123F4F9B70
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 22:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfKLVEG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 16:04:06 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43520 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLVEG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 16:04:06 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so12639532pgh.10
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 13:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MOlDpdH/Pg9WevSDU8icH81SRQw0v3HMIviMNaByetc=;
        b=BO/KRDntxicD6HYAqt9wCy3jOUjRGsHxhxlqSAbqvleHC2k2Z5+hMj6EwHVenDjhE5
         mHDhGXgblHgd0siA5XA3ihuhTHJFCAZc4JEWOEnZB1Hm/t2CFpCfgapmpckCm089wZ0j
         d4Rj0+uqhAZxINts6LuG9rPj+xATmQ7kzfAPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MOlDpdH/Pg9WevSDU8icH81SRQw0v3HMIviMNaByetc=;
        b=T1ZToqQtf/DJPsJv4PP+wSJ8XD0orKwS+Tz2DWfay6UH9bRuNkUoJX39qQZbTEJxU8
         VtGR7gKIbx2A2K2oQF/pZSFh/NPzi3ojbiqOL9xAQn32VV/ysJrR5nrKTU8NJ9aidAIS
         rUpRBIim+hnb9XGoP/ZWoJOVGcKGYc3nzMul4hlLMeUW7Gw+nbegczBuiVLq0BFfKpIk
         tXO+dMSX5VyWLVYmDgv6ox76HNyklhKMY/mffGf3oLBqNr+xHgRWYsYgwSyyaa0vBPW0
         vm9LI+vIx49q9KrFXcpRgbAOO79HgruTtZeumxrGTqmOYlCIfVEDMTEkKRWexfDBLUEa
         9VeA==
X-Gm-Message-State: APjAAAWcYm7WNPDbU09OEg9auj7D6yobVhaAn5E9db7NvqDjJFRu9z/5
        kwRf3+ExxsdQ5bVKmQHP351b7S/Wzhk=
X-Google-Smtp-Source: APXvYqwA84Bvn54cRclHfOZqz37ZUCIbsHdfpkNwpkkU86Jt5kVLRc1BJr3jokb8RIORk8Le9wSwlw==
X-Received: by 2002:a63:5c4a:: with SMTP id n10mr38532982pgm.120.1573592645334;
        Tue, 12 Nov 2019 13:04:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e8sm20292961pga.17.2019.11.12.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 13:04:04 -0800 (PST)
Date:   Tue, 12 Nov 2019 13:04:03 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: shrink_node_memcgs(): Null pointer dereferences
Message-ID: <201911121301.885CE00@keescook>
References: <201911111735.8DBFBDF0@keescook>
 <20191112152123.GB168812@cmpxchg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112152123.GB168812@cmpxchg.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 10:21:23AM -0500, Johannes Weiner wrote:
> On Mon, Nov 11, 2019 at 05:35:37PM -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > c34aa3085f94 ("mm-vmscan-split-shrink_node-into-node-part-and-memcgs-part-fix")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> > /mm/vmscan.c: 2695 in shrink_node_memcgs()
> > 2689     	memcg = mem_cgroup_iter(target_memcg, NULL, NULL);
> > 2690     	do {
> > 2691     		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
> > 2692     		unsigned long reclaimed;
> > 2693     		unsigned long scanned;
> > 2694
> > vvv     CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> > vvv     Dereferencing a pointer that might be "NULL" "memcg" when calling "mem_cgroup_protected".
> > 2695     		switch (mem_cgroup_protected(target_memcg, memcg)) {
> 
> This appears to be a false alarm.

Okay, thanks!

> All the "culprit" patch did was rename the local variable
> "target_memcg".
> 
> And while it's correct that memcg can be NULL (befor and after this
> patch), it's the case only when mem_cgroup_disabled(), and
> mem_cgroup_protected() checks for this case.

Right, that's certainly the design. I wonder if in the interests of
defensively asserting requirements, it would be worth adding something
like this to mem_cgroup_protected():

if (WARN_ON_ONCE(!memcg))
    return MEMCG_PROT_NONE;

?

-- 
Kees Cook
