Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0849BF9CA5
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 22:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfKLV45 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 16:56:57 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]:41038 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLV44 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 16:56:56 -0500
Received: by mail-qk1-f174.google.com with SMTP id m125so15918324qkd.8
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 13:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X/1JLdnJXV799dniJY7BJ551qbIgSBAyWOsb/u5tTT0=;
        b=F4dVUpNoODNn8nx45/LvDdqO8UMFpniZAyv4BvJDxGeaTsrGHaneKeJLW1u18gaAJd
         OVSXFa5W8RAKeFOeNKJ3BzIp5Dkn6OqXuXyiMiC9lejiyuYZ6A4xNxIhNDO0LGkKb5C9
         LKSsWc4Lm8sbtzR1ULY/sU1+/zswN/AAgmVf7X3F4C1NxIEXUgHeKs8PSPIfLXzR+RWp
         YfoVJGZi6y++EAzUtl4VLua+VphDcRpjrWdTnPCBKboXK4If0N/WyhQPhZxqzaXOG7+p
         TYlnfPmAZ3h7F87wT69CV2QGWWRKaHPyVDAOU/WnqFASs3HH92A/yB6UoJZr48Vsis/a
         Tfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X/1JLdnJXV799dniJY7BJ551qbIgSBAyWOsb/u5tTT0=;
        b=qU7PQhMbfnbM928VltO+nSb9kzu0NH/VLS0Dnwb4VTaSGBkNsX02VnzC1DmEFaqtu2
         gnAc4yg1by+WI7q9toTFDxmTmU5BizHoASQcYCLnMi9oM/jcyWHo5jbHiuC+fm6d/XB6
         bqjk+v7R4NBTdZzdTgYCk7dFPItdWux9OHUOnZcMSk7scAC0NSRHr8CcRm82gdfYqVNE
         Qs10jLyCfW1fhfd2xnGSXK+JKQD84up+RAWUAS3/i45LdRDFayFCNSac83i1TLeJdIMs
         Lb/SP0Q9mzTOsGz1xfvfBjH7oeui/Phuf2yK9DsREbXIhq+/YyJbPOnRtKeMHzfvqnxY
         iQLA==
X-Gm-Message-State: APjAAAW+xAglmQhBDJhXeXHpzqi5S/tSbueCLIKy+kyp0t0hUlBYYJx8
        qcDAiSv+XdDBVxoGu/VIvjA5rIvnBX9gMw==
X-Google-Smtp-Source: APXvYqzyheKz3sGQ3uIB2ViGJ6ahqmYHR41ev7xw/527ILCf0ReR0/bQj+aAmUwbSNSaJYciVnQPCA==
X-Received: by 2002:a05:620a:149b:: with SMTP id w27mr2908799qkj.387.1573595813985;
        Tue, 12 Nov 2019 13:56:53 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::aa8c])
        by smtp.gmail.com with ESMTPSA id q16sm7608039qkm.27.2019.11.12.13.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 13:56:53 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:56:52 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: shrink_node_memcgs(): Null pointer dereferences
Message-ID: <20191112215652.GA181339@cmpxchg.org>
References: <201911111735.8DBFBDF0@keescook>
 <20191112152123.GB168812@cmpxchg.org>
 <201911121301.885CE00@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911121301.885CE00@keescook>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 01:04:03PM -0800, Kees Cook wrote:
> On Tue, Nov 12, 2019 at 10:21:23AM -0500, Johannes Weiner wrote:
> > On Mon, Nov 11, 2019 at 05:35:37PM -0800, coverity-bot wrote:
> > > Hello!
> > > 
> > > This is an experimental automated report about issues detected by Coverity
> > > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > 
> > > You're getting this email because you were associated with the identified
> > > lines of code (noted below) that were touched by recent commits:
> > > 
> > > c34aa3085f94 ("mm-vmscan-split-shrink_node-into-node-part-and-memcgs-part-fix")
> > > 
> > > Coverity reported the following:
> > > 
> > > *** CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> > > /mm/vmscan.c: 2695 in shrink_node_memcgs()
> > > 2689     	memcg = mem_cgroup_iter(target_memcg, NULL, NULL);
> > > 2690     	do {
> > > 2691     		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
> > > 2692     		unsigned long reclaimed;
> > > 2693     		unsigned long scanned;
> > > 2694
> > > vvv     CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> > > vvv     Dereferencing a pointer that might be "NULL" "memcg" when calling "mem_cgroup_protected".
> > > 2695     		switch (mem_cgroup_protected(target_memcg, memcg)) {
> > 
> > This appears to be a false alarm.
> 
> Okay, thanks!
> 
> > All the "culprit" patch did was rename the local variable
> > "target_memcg".
> > 
> > And while it's correct that memcg can be NULL (befor and after this
> > patch), it's the case only when mem_cgroup_disabled(), and
> > mem_cgroup_protected() checks for this case.
> 
> Right, that's certainly the design. I wonder if in the interests of
> defensively asserting requirements, it would be worth adding something
> like this to mem_cgroup_protected():
> 
> if (WARN_ON_ONCE(!memcg))
>     return MEMCG_PROT_NONE;

I'm having trouble enumerating the number of places where we would
crash in reclaim if memcg were zero while the mem controller is on.

And even if we annotated all of them and dreamed up more or less
sensical exit values for all of these places, we'd quickly panic due
to failing page reclaim.

There is no graceful exit strategy here. We may as well take the crash
right away, without having to clutter up the code.
