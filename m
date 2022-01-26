Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFFA49C1F8
	for <lists+linux-next@lfdr.de>; Wed, 26 Jan 2022 04:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236960AbiAZDRf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 22:17:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiAZDRe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 22:17:34 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77268C06161C
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 19:17:34 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id r59so4168745pjg.4
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 19:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YQgBsY1o7VwdSddDX8vhLNlKqs5Ri3GdNvKIl4FyJaw=;
        b=nfbWGzPnFzWkrKMJfEXt3Q+5NsNv9X0y88iep76Qzo2kqyzXzeTDvswJI0gqN0MKsH
         rJ1KoOfLkK0v1G/qPyBJG2YxBXyE3KoTC2u/wlNvA8jqDIwvLbCW/R5bl9N6zhFa1S+o
         lg18M2NeCjVw4EwPhPbiImVceGqBbcY7Jusao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YQgBsY1o7VwdSddDX8vhLNlKqs5Ri3GdNvKIl4FyJaw=;
        b=UnWHwWZHol2/55GO433n8kXPrZs22/X9y8Jim2uQ+xVkzHADS25upLjh6HbvkKSEPV
         KW9GQdh/4pp7i///sxoZqQ5IwRa3fQj/6gWhrX05ixlf3HhueJfBpjZu9bTTNbhyaSmz
         23ZcINhFn6djpQkz4ZBg3fNBEyDmBTN7asdvbnG5/Nuj7pyHb15kXnlidUrDc5a3E6W3
         ETRTfpG9YWHer1iuG3AmT/GS+fNlcDeEB68V3Bwnpr0ZJ2ucR3hI8l+FJf2hoHtV+goG
         5RZ3rC50sqZjKsXkbWi3nCMd6PBzn9BhhqcwU24f9sgFowb+WTuIteFASamXse8+PnaY
         qKcQ==
X-Gm-Message-State: AOAM530jFVGIe0+YniYlB97dBzwwhKFtt+5bfTBMyTAOFiLwEr8BnlVO
        GzGRNr9Vw9mE8t3Hs3AvEfiiAw==
X-Google-Smtp-Source: ABdhPJzI/Pd7Bs8gll9wyDNxq7JxvB/aUnVfP47c4GhWSocc5/OzudBwnKSgwkp0PLKQCY1rG2oA2g==
X-Received: by 2002:a17:902:c401:b0:14b:89ce:3832 with SMTP id k1-20020a170902c40100b0014b89ce3832mr2151064plk.78.1643167053982;
        Tue, 25 Jan 2022 19:17:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d20sm383781pfv.74.2022.01.25.19.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 19:17:33 -0800 (PST)
Date:   Tue, 25 Jan 2022 19:17:32 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Beau Belgrave <beaub@linux.microsoft.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201251914.9377C63D16@keescook>
References: <20220125145006.677e3709@canb.auug.org.au>
 <202201242230.C54A6BCDFE@keescook>
 <20220125222732.98ce2e445726e773f40e122e@kernel.org>
 <20220125233154.dac280ed36944c0c2fe6f3ac@kernel.org>
 <202201251256.CCCBE9851E@keescook>
 <20220125162326.3d1ca960@gandalf.local.home>
 <20220125162859.2b3cc8a0@gandalf.local.home>
 <202201251402.0FB08DB@keescook>
 <20220125172114.6807ed8f@gandalf.local.home>
 <20220126093538.893fb44a7cb0a7cd840c7fdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126093538.893fb44a7cb0a7cd840c7fdb@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 26, 2022 at 09:35:38AM +0900, Masami Hiramatsu wrote:
> Hi Steve,
> (Ccing Beau)
> 
> On Tue, 25 Jan 2022 17:21:14 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Tue, 25 Jan 2022 14:07:14 -0800
> > Kees Cook <keescook@chromium.org> wrote:
> > 
> > > > The tstruct is the TP_STRUCT__entry() and for each __rel_dynamic_array() or
> > > > __dynamic_array(), the __data_size gets updated and saved into the
> > > > __data_offsets that holds where each item is.
> > > > 
> > > > The rel versions sets the offset from its location to the data, where as
> > > > the non rel versions sets the offset from the beginning of the event to the
> > > > data.  
> > > 
> > > Could this just be
> > > 
> > > #define __get_rel_dynamic_array(field) \
> > > 	((void *)(&__entry->data[__entry->__rel_loc_##field & 0xffff])
> > > 
> > > ?
> > 
> > This is currently user space defined. But since the only user of the rel_*
> > version hasn't been upstreamed yet, we could change it. But it also
> > requires changing libtraceevent as it depends on this code too.
> 
> I think Kees' idea seems better. If you and Beau are good, I will update
> the macros for __rel_loc. (This requires to change some user-space
> application which Beau is making too.)
> 
> > 
> > I'm surprised that it doesn't break with the __get_dynamic_array()
> > versions, or is that because it's based off of __entry?
> 
> I think so. Gcc seems to check the size of the data structure where the
> original base address points.

Right, and it's pretty good these days at navigating through casts and
inlines, etc, which is appreciated in all the cases where it has found
real bugs. :)

The "offset from __entry" solution works as well as "offset from
__entry->data", so I don't care which is used. If "offset from data"
makes more sense for this API, yeah, I guess change it now while it's
possible. :)

Thanks for helping track this down!

-- 
Kees Cook
