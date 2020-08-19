Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977572493B3
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 06:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgHSEFD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 00:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgHSEFC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 00:05:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFBDC061342
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2020 21:05:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d19so10737015pgl.10
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2020 21:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QnP/PIbYcZm4i5Mlg33P3UfHHAtDZo30bSp6CmmH1Xs=;
        b=wrsOPLUAFymYBN0XA6ZtVXtInVpaafhTB/G70K5PSwTjNGW54/RaGLFMD4vpmrBmkG
         CCnPcGx25rKO8U8TUenX38s/1TenR2Ze+EQkLe/lZiQTj92XjpOiZkGLpve93aodJfd8
         wiO2RJnxxwBHD9JPN+MCSeHU+LSq91cPAicaU2Rg5CfVHoh3U3pwlE2HMCfiBYs0PngB
         jLvA6SYq2lJ70k1EylcS8x8dBqw0N3xTba7WWt5HPKufx5FKUCdH+QgU+wd/GQL/ZqOe
         g+l7hgOS5ymJxDAF1NFgFl2CNcA7RootzoAX16gM131fDkU1Icp32B93h9vmK5Qwy6Sg
         +25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QnP/PIbYcZm4i5Mlg33P3UfHHAtDZo30bSp6CmmH1Xs=;
        b=rDRDvpZPRdI8msIDEmTZf7ZOKXuJmQijorCNXHKRtCwXb00QTeDRjRcjO2QgKyR8Tn
         gEgSd4cuHGYmYU+lsMSKN5GWFtN2MARj9x/QeP0HKTira8+YLMjd/M45WP0UU1Rd/We8
         JuQQmBKL2KzFYjgR1W50nxAPsCjoHcBMES2Sts7aKdmLoUg2W3JTImZiIiz4Pvjxf9dI
         2XvvZxMMqT39z89qY3V1w9+xCASbqyR26iMtEq42HA5kyCQSMzOJ329PORvAr+MHbhr9
         lf1a3c4yMWGhKNoEr1j+Tgu5RWfWvjPQP5wAVAn8aXxRCjMUPNkTMgALA453MXoGJqXn
         GMjQ==
X-Gm-Message-State: AOAM531I1EpkbLwR/kUVHEeWGxPpAHL9rE6RXELd4trJUOOYH/zSoWB4
        +kjZkDIlkz05Qi5PqkM/eFIMKD6g5Fmg
X-Google-Smtp-Source: ABdhPJzNBqjzf+gATVmiinQl75gQtH55iyZyrwKx5hnJ3ujsUAnx8vozhwgsCxvG3RiqkTTxfNa4KA==
X-Received: by 2002:a62:7acb:: with SMTP id v194mr17475451pfc.302.1597809901835;
        Tue, 18 Aug 2020 21:05:01 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6192:e4f3:50fd:bc9f:c08c:d60e])
        by smtp.gmail.com with ESMTPSA id gw20sm181592pjb.11.2020.08.18.21.04.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 21:05:00 -0700 (PDT)
Date:   Wed, 19 Aug 2020 09:34:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20200819040455.GA7693@Mani-XPS-13-9360>
References: <20200819134800.165b78a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819134800.165b78a0@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Aug 19, 2020 at 01:48:00PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> 
> I am not sure which commit(s) caused this.
> 

Probably the below commit which built fine with gcc but failing with clang:

92ce39feb722 bus: mhi: core: Introduce debugfs entries for MHI

I've dropped this and also one dependent commit from mhi-next branch.

Bhaumik: Please fix the issue and resubmit debugfs and sysfs patches.

Thanks,
Mani

> I have used the mhi tree from next-20200818 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


