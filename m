Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F0BF9CDD
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 23:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKLWS7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 17:18:59 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35760 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfKLWS7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 17:18:59 -0500
Received: by mail-pg1-f196.google.com with SMTP id q22so12811178pgk.2
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 14:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/a0svZ2uwty3hgfdO1xDgpuq9omBE5a6856xVKDrW54=;
        b=bdD52eW4Hi9/pgJr9sXsFClyYZxaRghubd85S5FtmNAlrqCKq3rdKs2xuMc9Haeklx
         hqBOFEoq30sSaBuLqIVkLJmDNMkcJWV/ObvVkNDrtzPCs/IIxBkDiop8I/qbvLQC05XR
         iAensfdCSEezYMZGmbZ5cgsE80zs3AUTY/cCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/a0svZ2uwty3hgfdO1xDgpuq9omBE5a6856xVKDrW54=;
        b=lPSkwv55QTHGVQIKkNq27rdYqptse7wvKUOVB3ypYvT3w2g3OnWJxhXiVLCfwvXv1v
         vohAh57rPH02OUW2eE8forNKlUPDP5b2Y4cpIRtgaMBwzIladeQ1vit8tEFjuPDs/qFA
         Ohabx8RMe3gGaMBEHNvBuSoUsvFG//K6bsQt7O/Q7JDxMMNRUwV/yvPr6D0siMRyChPo
         Lg2ge80HvBATH6N3nYQRr3U+LZAmqip9zUmXovYjGHIi+tOOL28ruNxnmN3zi4ckzEaq
         R9gUwZJwKTD5fnQUDtqvszN6u2p0FDU0hgVBgEVf/RcBAq+rsl4sF+8GewC30wMisgPY
         eWug==
X-Gm-Message-State: APjAAAXffi8PF4OvtnBHD+meq+rzlBw3Nc7Ece93c5OjilJGYrei/Ebt
        V97XyrejUi3WREHWbxVBru0pTtsoYQQ=
X-Google-Smtp-Source: APXvYqwnNSpk58XTtCnEkVhFPR0p+TxWL25LUSsipaSmCiHfD1P7Z142SN7xb2+1QiJn5pPbVfXuDw==
X-Received: by 2002:a63:1065:: with SMTP id 37mr37424991pgq.31.1573597138648;
        Tue, 12 Nov 2019 14:18:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c3sm7323pgi.19.2019.11.12.14.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:18:57 -0800 (PST)
Date:   Tue, 12 Nov 2019 14:18:56 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: shrink_node_memcgs(): Null pointer dereferences
Message-ID: <201911121418.5C39BD9294@keescook>
References: <201911111735.8DBFBDF0@keescook>
 <20191112152123.GB168812@cmpxchg.org>
 <201911121301.885CE00@keescook>
 <20191112215652.GA181339@cmpxchg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112215652.GA181339@cmpxchg.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 04:56:52PM -0500, Johannes Weiner wrote:
> On Tue, Nov 12, 2019 at 01:04:03PM -0800, Kees Cook wrote:
> > On Tue, Nov 12, 2019 at 10:21:23AM -0500, Johannes Weiner wrote:
> > > On Mon, Nov 11, 2019 at 05:35:37PM -0800, coverity-bot wrote:
> > > > Hello!
> > > > 
> > > > This is an experimental automated report about issues detected by Coverity
> > > > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > > 
> > > > You're getting this email because you were associated with the identified
> > > > lines of code (noted below) that were touched by recent commits:
> > > > 
> > > > c34aa3085f94 ("mm-vmscan-split-shrink_node-into-node-part-and-memcgs-part-fix")
> > > > 
> > > > Coverity reported the following:
> > > > 
> > > > *** CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> > > > /mm/vmscan.c: 2695 in shrink_node_memcgs()
> > > > 2689     	memcg = mem_cgroup_iter(target_memcg, NULL, NULL);
> > > > 2690     	do {
> > > > 2691     		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
> > > > 2692     		unsigned long reclaimed;
> > > > 2693     		unsigned long scanned;
> > > > 2694
> > > > vvv     CID 1487844:  Null pointer dereferences  (NULL_RETURNS)
> > > > vvv     Dereferencing a pointer that might be "NULL" "memcg" when calling "mem_cgroup_protected".
> > > > 2695     		switch (mem_cgroup_protected(target_memcg, memcg)) {
> > > 
> > > This appears to be a false alarm.
> > 
> > Okay, thanks!
> > 
> > > All the "culprit" patch did was rename the local variable
> > > "target_memcg".
> > > 
> > > And while it's correct that memcg can be NULL (befor and after this
> > > patch), it's the case only when mem_cgroup_disabled(), and
> > > mem_cgroup_protected() checks for this case.
> > 
> > Right, that's certainly the design. I wonder if in the interests of
> > defensively asserting requirements, it would be worth adding something
> > like this to mem_cgroup_protected():
> > 
> > if (WARN_ON_ONCE(!memcg))
> >     return MEMCG_PROT_NONE;
> 
> I'm having trouble enumerating the number of places where we would
> crash in reclaim if memcg were zero while the mem controller is on.
> 
> And even if we annotated all of them and dreamed up more or less
> sensical exit values for all of these places, we'd quickly panic due
> to failing page reclaim.
> 
> There is no graceful exit strategy here. We may as well take the crash
> right away, without having to clutter up the code.

Okay, cool. I was just thinking mem_cgroup_protected() would be central
enough since it's already tested in tons of places.

Thanks for looking at it!

-- 
Kees Cook
