Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6102C5A89
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 18:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404339AbgKZR2I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 12:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404141AbgKZR2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2020 12:28:08 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52A5C0613D4;
        Thu, 26 Nov 2020 09:28:07 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id f24so3108022ljk.13;
        Thu, 26 Nov 2020 09:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KcdkD8QL4sesJW+yGRtpMlEj7vGDgbrPwJenWaNyjrI=;
        b=BSgj10mCvkRWEY5UpLAf5BvNfw0t5a+6IofURYi8hpQPm4CC7UkqSkF12+fWrZyME7
         NhhLHMU+DRHnuaDDMsN+uJgrcvuFyy7i1GIHA3hv+aIv//Gyr4ZHGtA6wjd7SPFXGPTi
         OYSSrUrux8cVjSLLtPC+S8va/iP1p5UwOXm1rVZkrqBOsUH7jNKp6OHlxnDCYTZKctpL
         33kiD8+LBBPG/QwMxSF820ckocYIcyMd8/4JrsQW9ZtH9vtTf3uQCu0SrUMrE1GDLhPG
         MTfA2/Z7LQuvoGve3G8239K4oeo947FZmnXT4pLgkg4IAx/94+18rN22/Nu35m2BVXOa
         Snaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KcdkD8QL4sesJW+yGRtpMlEj7vGDgbrPwJenWaNyjrI=;
        b=f1ZuL9wZjQv+QZRSTsB+xoT+gMSNR0eawgSPcpwQmwmLlNv9Ql3M3GdtLO2cI5b7SW
         qNx5CIwBg1ej0lUDE+3PXqm8biirXLR+5iGS2I0mVqhVpk32M0yI6CmLfaSnI+ta8P9y
         w22x2wjpkR/1pGfMEspZi+OC15gFsVkjBx1fwP8Fal8Iw4ua1TjwbKFA9q6bpueu7gmK
         b0ScAJc2tHDI0nKFMerIv3B9arlXvATxUIN1PmaCTg6Rj2etmo2oOiOHq58mcw61mrmz
         xXQoNg0q1MEHPzZKibHyRA/TbSYKoj5bXTeLzSqosh5PLK3N8DOVFKpjQNyy2XUeeU5b
         x5Nw==
X-Gm-Message-State: AOAM5304NQgGN2tqVpFAg9lpKLuzuXwQhvU0JaIW1ljPON77Id2E0mS1
        QYJaVuqO+iE6P3zs1bvM2mY=
X-Google-Smtp-Source: ABdhPJyZYJDks+bxuGIJc4w4k7GXtdBRFrvXxZAsOxEoMP5NhKXT3onABzYm/XvAFdsM/v+QZCnquQ==
X-Received: by 2002:a05:651c:206:: with SMTP id y6mr1837162ljn.447.1606411686273;
        Thu, 26 Nov 2020 09:28:06 -0800 (PST)
Received: from pc636 (h5ef52e3d.seluork.dyn.perspektivbredband.net. [94.245.46.61])
        by smtp.gmail.com with ESMTPSA id v2sm384359lfn.163.2020.11.26.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:28:05 -0800 (PST)
From:   Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date:   Thu, 26 Nov 2020 18:28:03 +0100
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the rcu tree
Message-ID: <20201126172803.GA16234@pc636>
References: <20201126174428.675f3cfd@canb.auug.org.au>
 <20201126151240.GP1437@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126151240.GP1437@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> On Thu, Nov 26, 2020 at 05:44:28PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the rcu tree, today's linux-next build (htmldocs) produced
> > these warnings:
> > 
> > include/linux/rcupdate.h:872: warning: Excess function parameter 'ptr' description in 'kfree_rcu'
> > include/linux/rcupdate.h:872: warning: Excess function parameter 'rhf' description in 'kfree_rcu'
> > 
> > Introduced by commit
> > 
> >   beba8bdf2f16 ("rcu: Introduce kfree_rcu() single-argument macro")
> 
> Heh!  The documentation isn't dealing at all well with this situation.
> 
> Would one of the docbook experts have some advice, keeping in mind
> that kfree_rcu might have either one or two arguments?
> 
Indeed. The question is if the docbook is capable of describing such
macro usage, 1 or 2 args.

--
Vlad Rezki
