Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D8C4B4100
	for <lists+linux-next@lfdr.de>; Mon, 14 Feb 2022 05:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240384AbiBNEvB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Feb 2022 23:51:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239172AbiBNEvA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Feb 2022 23:51:00 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D8C50E15
        for <linux-next@vger.kernel.org>; Sun, 13 Feb 2022 20:50:54 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so18059058ooi.2
        for <linux-next@vger.kernel.org>; Sun, 13 Feb 2022 20:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TaTdYWET/fokCLmaeP1dJHW40gxHNo7JCgJeplFJ/H8=;
        b=HvXn+CSm2EmiJQqGqdRgo36YxqZrA6ePy0wNVT+3vO9NkHKRZXB+akHRHGPs8HBNxT
         Mjt6l8j7U0NszCAfewmO8M7tBQS3wlRegGHS/TIKkGoan2mWPG2JA6coJsWjCik11JVR
         8XboZ2y5dzG8o4LHAd706aP+ssmIig02U/zAXjc+xDGcNrJnuiAj9vs7oly4x8P4AxLM
         XFI49VuGw0hBWYAoA4dncgjhd8ukfNRqptFL9Nujqn+XfZTAgNkW9CEftkDWP82W76mI
         iHn2B6PA0WA705CNSHdJGmfh8ivqLN5Swnw64fZilBhy9Y6Vi21G9nuJty6SZiU7S2k8
         emmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TaTdYWET/fokCLmaeP1dJHW40gxHNo7JCgJeplFJ/H8=;
        b=QDS/OuR8p4IV2rpeT1fezQdF5OZ1dPNuJMxbhwQhRG7DUokzn31XYvTn01YtFCXgj8
         EwYHdOVUqlxCQXInSEG5WY5H5hrhPuJv/7uJkOTfwO5tflpIoxEkg9CTTwo7Vc8OflIy
         1GS3kmBcetMMLiPwmNmSDNxzwXm6ZHMF9SHzWAmxNO1Cag3vwnioldUs1miTx1hzchig
         zkjgV+DEGCBTyi9+ZIxAgQ3rvsmUH1x4vhtJPPLIBPZxs76ZRwaRoYkhytG4SLZuzwTA
         swv1nz4e6hLxmo9ugGFa2X5XP5jqt5C77mS1/l0VFcr1mq5v/ip05zREqH3hVYPKiUDE
         tMnA==
X-Gm-Message-State: AOAM533XAI/BW6j95XM6K0c1SABInyo7tqFY1rSh3nnnYZShVau53lm4
        9G6377iV9SWjOv7/vwTnsM1y3g==
X-Google-Smtp-Source: ABdhPJxKqSLNn/LDvyfrBak9e//Hj2O4PRVgkgKxmLSJxXIojdrEZQSeSnMZxnz3dMgSRPjrnmGRKg==
X-Received: by 2002:a05:6871:506:: with SMTP id s6mr3286197oal.59.1644814253318;
        Sun, 13 Feb 2022 20:50:53 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id u3sm15195388oao.25.2022.02.13.20.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 20:50:52 -0800 (PST)
Date:   Sun, 13 Feb 2022 20:53:04 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <YgngMN+lKaW3fYp5@ripper>
References: <20220213213935.2c5ef8c2@canb.auug.org.au>
 <CAOX2RU5NzOK+d-QEMsOiSPX85M2_B44SeJUteZepsyZny7fgnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOX2RU5NzOK+d-QEMsOiSPX85M2_B44SeJUteZepsyZny7fgnQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun 13 Feb 03:52 PST 2022, Robert Marko wrote:

> On Sun, 13 Feb 2022 at 11:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   bf8f5182b8f5 ("clk: qcom: ipq8074: fix PCI-E clock oops")
> >
> > Fixes tag
> >
> >   Fixes: f0cfcf1a ("clk: qcom: ipq8074: Add missing clocks for pcie")
> >
> > has these problem(s):
> >
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed for the future by setting core.abbrev to 12 (or more)
> >     or (for git v2.11 or later) just making sure it is not set (or set to
> >     "auto").
> 
> Hi Stephen,
> 
> Sorry for the short hash, don't know how this happened.
> Do you want me to send a v3 with the fixed hash?
> 

No need, I could update the commit as is. But given that I would have to
rebase 20 other patches I'm hesitant to fix it.

Given that checkpatch catches this issue in commit references in the
message and other issues in Fixes I was expecting it to catch this one
as well... Will make sure to look for this going forward (or perhaps
figure out how to improve checkpatch...)

Thanks,
Bjorn
