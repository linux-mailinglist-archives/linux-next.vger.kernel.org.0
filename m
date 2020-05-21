Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BF01DD0CC
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 17:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbgEUPJL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 11:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbgEUPJK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 11:09:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAFDC061A0E
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 08:09:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s8so6966160wrt.9
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vwv9YjY9guLjv65YlrZItemJRbw+X/+RvIECQVKRC5I=;
        b=LPscTpCp2Rda7uIQnN2/xW5SngvxOgSeMI2dHNHzpb86O0isdpj1bGAiEFAj/0a4Di
         u6euyum93hM9ZN2iGxzaJ56fbo8am92vqPCsUJR5fax/87OeRiA73l247Om6l1IZJrwS
         ow4tCqDUm2/+hxQElKMw55dk2SYUvHSM++EMn10qjtnEP7HOQzIKOwXzrKtXmb8tMbbw
         Wf/xeXg5cdl8zTWGmQrnUlvHxC5h44py6Tf4d6l7s4y4lV4fIEAcrrMKtPh0WriEOLv0
         mhW1OuWMlXxq+svHtaPIOKyx+LpaUcYAZlWkEJ7/s9pJosdzG6KujRA++BvDrwms/Efz
         46nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vwv9YjY9guLjv65YlrZItemJRbw+X/+RvIECQVKRC5I=;
        b=jET9Ero98f+Z+WIKs6vs260ixRXHFmos6hYJSmd6ggXw4kYrU2WRyByUmNisNPEj7C
         ZrRSVVcrQ4tXY8mWUhdB9tUu1FqqKIYzEXWFtO4ImZeJIE6qErk5zJ0niEkqt1AM6BTE
         i8sStlDRai9NLtSQQICvuXayPiZdESRGosTSmf9sJct94qYdNFy3YDH6EHuf1H4AwVgP
         74FvNm4xtsChVAB22xjWa8lHjqa2Am/vzDtmisJ6XuKsnRcrgsJGOgVpR3vOD77+4Era
         ey6FzywkK2dYxW6klUO+vjeowjLvH3pCoxldtmsLR1KGD9f2DSxyQHaYs/g00tBmH7fU
         knUQ==
X-Gm-Message-State: AOAM530lJPuMwbr67Pn53DXNW/VlVy3uUBn11YrKFY5dr/muRLzFdAZM
        gcU+je32Z0/jm1GvuVx8fyAX2Q==
X-Google-Smtp-Source: ABdhPJzXRn5kvssS7EyvqkEiE2aDDSrDc7EPJsA/kEJ5Mk1y+PyoY2cjR62eT8qVoizMUjT4dQWdjQ==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr5777961wra.238.1590073749170;
        Thu, 21 May 2020 08:09:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x22sm6601980wmi.32.2020.05.21.08.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:09:08 -0700 (PDT)
Date:   Thu, 21 May 2020 16:09:06 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: Tree for May 21
Message-ID: <20200521150906.u2obtw5qcybkjjxz@holly.lan>
References: <20200522001209.07c19400@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522001209.07c19400@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 12:12:09AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200519:
> 
> My fixes tree contains:
> 
>   cd2b06ec45d6 ("device_cgroup: Fix RCU list debugging warning")
> 
> The f2fs tree gained a conflict against the fscrypt tree.
> 
> The drm-msm tree still had its build failure so I applied a patch.
> 
> The kvm tree gained a semantic conflict against the tip tree.
> 
> The usb-gadget tree gained a conflict against the usb tree.
> 
> The userns tree gained a build failure so I used ther version from
> next-20200519.
> 
> The kgdb tree still had its build failure so I used the version from
> next-20200518.

Doh... I have updated my pre-push tests, merged the fix and tested.
Unfortunately I then pushed the results to the wrong git server :-(.

Thanks, and should be all set for tomorrow.


Daniel.
