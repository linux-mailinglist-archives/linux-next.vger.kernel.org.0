Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2D73F9E66
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 19:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238836AbhH0R7t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 13:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238532AbhH0R7t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 13:59:49 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61200C061757
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 10:59:00 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d17so4396901plr.12
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 10:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QstwqTk6Z/KvMwHVGYNLMIcWg1xRIXIkdAEDMOw+DrA=;
        b=gdBLlitnqL1Soku59FubRXrGij36KzerlxDdzl3rK+MBPMOsEmMUoEAOvAiaffPEEZ
         uov5UymcfkRmv70DbIFwCog+eABukd9Zuwtw8ZJ+RtNqiGojeeX5eCd/YXttkjriTx6Y
         +DiLQmysEZPxiuvcKiy8jYxOr3wU3cUU1I7VxglAQrWXblccsjmSyt4P40dj6Jhbfp6U
         4GqjIjWf/OTX6VIYpbIvhRb/JGgEWD3Yakx7Y88qK4J/kf9JpJ1vS0EZzYMkjbhEMg/Q
         vXEniGdA1U2LK0W6SQe9+f3xeXA+l0pJVrZW+OY3RIniKfhJFbMsrS+UvP+CBC0WBC4E
         DR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QstwqTk6Z/KvMwHVGYNLMIcWg1xRIXIkdAEDMOw+DrA=;
        b=nMDOEP1JotkmMM9su/SapCfREikL5LN8Ti6DCdnV1dixWW5K7fJdmCJWFqJiRJQpp9
         ux062jz1RRREYD93ZXYVJxCyFw0Y3CGThZ8iFX2BTuJKlCOFCfwV0dnxvJtJagog9Yag
         vZT+r5SebnIQl+tJJ0OTfxDf6N0AilDXDZNjIOVdCSYe/3LeakbL1NUpj5h9e9DQqkCB
         FDvPuAqs3u+yDZSt9n3tRHzgIlsYpw0vYSmQAoyEj5eixCxHPJlTvjTnbT6Nq1HcHc7Z
         qHKn5gu/RmPe47qjwuTYeHAhkorEmXHzBDqw06N4uoUZvdyObt2piQqlKCQssWtM0dqL
         beNQ==
X-Gm-Message-State: AOAM531x55Z4xMOx0d7cPW7wlJfnZEnEd42Vvkn3rA/8tZTBzbhurdcD
        ud+mb10Hn+/b0L8t3mJcT5JkBeq2DGR3
X-Google-Smtp-Source: ABdhPJy1uWFLyTlSQ0ztdsSrMSR8kRPWvtgetBp1JvK1pDbrIJOy3e/VgqWUr6HHq+CRudAknRYJYQ==
X-Received: by 2002:a17:902:b594:b0:132:479d:2108 with SMTP id a20-20020a170902b59400b00132479d2108mr9757320pls.10.1630087139767;
        Fri, 27 Aug 2021 10:58:59 -0700 (PDT)
Received: from thinkpad ([2409:4072:6487:8326:11b8:8647:a6e0:a859])
        by smtp.gmail.com with ESMTPSA id u6sm7358819pgr.3.2021.08.27.10.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 10:58:59 -0700 (PDT)
Date:   Fri, 27 Aug 2021 23:28:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <20210827175852.GB15018@thinkpad>
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
 <YSjkosA6yMrMmaNk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSjkosA6yMrMmaNk@kroah.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Greg,

On Fri, Aug 27, 2021 at 03:12:02PM +0200, Greg KH wrote:
> On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the char-misc tree got conflicts in:
> > 
> >   drivers/bus/mhi/core/main.c
> >   net/qrtr/mhi.c
> > 
> > between commit:
> > 
> >   9ebc2758d0bb ("Revert "net: really fix the build..."")
> > 
> > from the origin tree and commit:
> > 
> >   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
> > 
> > from the char-misc tree.
> > 
> > I fixed it up (the commit in Linus' tree is basically a revert of the
> > char-misc tree, so I effectively reverted the latter) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
> 
> Hm, what should I do in my tree here?
> 
> Kalle, what commit should I make in the char-misc tree now to handle
> this issue, and make the merge with Linus's tree "simple"?  Or any other
> ideas?
> 

For making the merge simpler, I'd suggest we revert below commit in char-misc:

0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")

Thanks,
Mani

> thanks,
> 
> greg k-h
