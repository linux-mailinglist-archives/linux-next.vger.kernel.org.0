Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFB83590CF
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 02:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhDIALm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 20:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIALl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 20:11:41 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F5EC061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 17:11:29 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d8so1863212plh.11
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Dhv0dxPnNN2zrGJ+r3HjFWocUrkcv3VW7q1v1279Hrc=;
        b=Min5CJZFZK14nwfY59mnds50hrvNS4qkDRICQwXG8uvZ5dIBLK30bZCjxwROX9MhS9
         cyS1oR4eFLpKr8jRm47gjw82u+EwdW1SIqePp1bSwtaT6nDO5nDZjsQYHIy+jl28ovWv
         SaRsNLCFhEzrPTbOpHlYbcE2jMkz0sLXTDqVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Dhv0dxPnNN2zrGJ+r3HjFWocUrkcv3VW7q1v1279Hrc=;
        b=UlSqBqrY+ALYqjUeIqhPdEHq6jvJWrHIl21ehwM3PkTEfcj+vMtXaCau4kpzHCVROs
         z6X6mvE72PYNTPG+IrlbaJHUg51CW6bLfKYSOLWENmKW/B1U/mpgaCLqd2APVfSzR/ln
         iUmZ5zAzk3kezucPHdDIett1Til/2sD+ywYYrJeeLw92CtkEAFg/D4IUUIkhzhCcGqaz
         X50AAsvJauQIFfOL0y+9IGp7VIwDCcYO4WOIc6FjwiJvsPzhKZNmqRyKe/K9nbLcYz5e
         uKAikWKLevSWSpZDx3+Pwcp9tNSJBjaWlKvGuryaoZVZtHVGqFZHH1s8LhK5FGGCQ4hM
         xJ9Q==
X-Gm-Message-State: AOAM530n5Gyf+E0J6Fewd7AndrM4ux2Wdyn9VnhkYsrcvH3o5vJcVZjV
        SWoFmPJkIuP2EQrLlv707GIrX9yxSBNayQ==
X-Google-Smtp-Source: ABdhPJwGPcy82QnnWHcB5+dzuuvLMQdBb+dp4ppCVEFolkIciJr89/TZCFBb/NGvVqmvtW0eTicIlg==
X-Received: by 2002:a17:902:a502:b029:e8:3a40:bc6d with SMTP id s2-20020a170902a502b02900e83a40bc6dmr10440778plq.14.1617927088880;
        Thu, 08 Apr 2021 17:11:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l191sm513527pfd.36.2021.04.08.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 17:11:28 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 8 Apr 2021 17:11:27 -0700
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: cdns3_gadget_start(): Error handling issues
Message-ID: <202104081711.46CA57BC6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210408 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Aug 29 10:57:04 2019 +0300
    7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")

Coverity reported the following:

*** CID 1503690:  Error handling issues  (CHECKED_RETURN)
/drivers/usb/cdns3/cdns3-gadget.c: 3143 in cdns3_gadget_start()
3137     			cdns3_gadget_release);
3138     	cdns->gadget_dev = priv_dev;
3139     	priv_dev->sysdev = cdns->dev;
3140     	priv_dev->dev = cdns->dev;
3141     	priv_dev->regs = cdns->dev_regs;
3142
vvv     CID 1503690:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "device_property_read_u16" without checking return value (as is done elsewhere 4 out of 5 times).
3143     	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
3144     				 &priv_dev->onchip_buffers);
3145
3146     	if (priv_dev->onchip_buffers <=  0) {
3147     		u32 reg = readl(&priv_dev->regs->usb_cap2);
3148

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503690 ("Error handling issues")
Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")

Thanks for your attention!

-- 
Coverity-bot
