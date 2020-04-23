Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C661B6444
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 21:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgDWTKO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 15:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDWTKO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 15:10:14 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFD2C09B042
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:10:14 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n24so2716083plp.13
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3esVBC6vyypWeDJzAKNVOxcqxJn/0BsoIk6+n6InkQE=;
        b=lGNbkxcXDFh7ZAeNrJ2LQRmSIbTON16TXsCPD+huAC6YnB17pI10GEj+81qlIW3azW
         gsABwMDYYD6UNsi7mOFoQ8dhadvFhoaPDZhex6xu6kxgCPSy/7MnJgHn/I3sed86jeLK
         5AdSWopJsQ0fKis6CXhvWGaCoPmVBMfG6ZSMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3esVBC6vyypWeDJzAKNVOxcqxJn/0BsoIk6+n6InkQE=;
        b=lUWmBuRQh1x55hjHdAvzNabmMOZijNtTRg3nUx7H3jaMuIP3/Y24bEz9zeLDxCHc9l
         CfMCHPDWUYdgVb6TOa1QaSru0dWG0Q5ExH5LSquBHiKSaZIWSreI4XD37+g07vIqewF9
         KI605FPShNCGMUts69xhP5+mX4uZRENcZYMQLXzuCwTX6A6wiTnksTBtYW2TXw93APjg
         J7MvKVf27IIT5K9yWT4moCmvmCFg5mIu2PhgzyX5DP8pmHC57ABVwVVyS6zrb5CGLcVo
         jwxyPOPkZLdSDJJib/j5l91RdijiMi65k+GzOC649260p/h+jXObXLRIvTm03CAGaQUZ
         7JPA==
X-Gm-Message-State: AGi0PuadnDkE48w2eC3bz5qnyydC6dAeTKJFfC1dPUgomTseaBp1Tmec
        S8o4isB1STGsVkfA/JMWF2iSOg==
X-Google-Smtp-Source: APiQypJzHJ8iZDXHb/w9tqu3gdmv5nBr6jX2B8KBzy0Jitn0S/PwDMoPz5Q6DdvNTmkFCqXoDA7GKw==
X-Received: by 2002:a17:90a:a602:: with SMTP id c2mr2170409pjq.135.1587669013659;
        Thu, 23 Apr 2020 12:10:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm3453563pfc.7.2020.04.23.12.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 12:10:12 -0700 (PDT)
Date:   Thu, 23 Apr 2020 12:10:11 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     Tim Chen <tim.c.chen@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: scan_swap_map(): Memory - corruptions
Message-ID: <202004231131.AFB0CBF7DF@keescook>
References: <202004221119.20619A68B@keescook>
 <87blni217l.fsf@yhuang-dev.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blni217l.fsf@yhuang-dev.intel.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 23, 2020 at 01:57:50PM +0800, Huang, Ying wrote:
> coverity-bot <keescook@chromium.org> writes:
> 
> > Hello!
> >
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20200422 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> >
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> >
> >   Wed Feb 22 15:45:33 2017 -0800
> >     36005bae205d ("mm/swap: allocate swap slots in batches")
> >
> > Coverity reported the following:
> >
> > *** CID 1492705:  Memory - corruptions  (OVERRUN)
> > /mm/swapfile.c: 972 in scan_swap_map()
> > 966     static unsigned long scan_swap_map(struct swap_info_struct *si,
> > 967     				   unsigned char usage)
> > 968     {
> > 969     	swp_entry_t entry;
> > 970     	int n_ret;
> > 971
> > vvv     CID 1492705:  Memory - corruptions  (OVERRUN)
> > vvv     Overrunning struct type swp_entry_t of 8 bytes by passing it to a function which accesses it at byte offset 15.
> > 972     	n_ret = scan_swap_map_slots(si, usage, 1, &entry);
> > 973
> > 974     	if (n_ret)
> > 975     		return swp_offset(entry);
> > 976     	else
> > 977     		return 0;
> >
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> >
> > Human edit:
> > I can't tell if this is a false positive. The detailed analysis points
> > at:
> >
> > 844        si->cluster_next = offset + 1;
> >    	67. index_const: Pointer slots directly indexed by n_ret++ with value 1.
> > 845        slots[n_ret++] = swp_entry(si->type, offset);
> 
> If my understanding were correct, this will not cause problem.  Because
> in the next line,
> 
>    /* got enough slots or reach max slots? */
>    if ((n_ret == nr) || (offset >= si->highest_bit))
>            goto done;
> 
> The value of n_ret will be checked and function will return if n_ret==1
> because nr==1.

Yeah, agreed. I see that's the only place n_ret is written to. Thanks
for double-checking! I've marked it a false positive.

-- 
Kees Cook
