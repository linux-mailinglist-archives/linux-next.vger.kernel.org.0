Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39A14B14F1
	for <lists+linux-next@lfdr.de>; Thu, 10 Feb 2022 19:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbiBJSHn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Feb 2022 13:07:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239219AbiBJSHm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2022 13:07:42 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141F7102
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 10:07:43 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v12so11095536wrv.2
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ps8wA06wMzyyRvvvYldgSzafMHSS0Jkhd3nDdg/VUI0=;
        b=qgtKX7cI90XzSh8yGU5pb8U4nuXSb86A7/A0/UB0O4pNWHwHVATC2Mm7zfqdwoeeYI
         C6HtYCOrkKzOeVhcp8YgeLBt3WY0UPrMENnm9Wbezh8/1y0Dsey3jB3X5UT80idzVXeN
         RLH+r1RNMMCTD+vBCWl2wGEc9d5OID0MFuxl05nRDqwxz5zlW3m55CnfQqO0zkQIYRf6
         ht7mOmPOTdIK97WB0q5n1fCw7nL5un+5ORIa4cNZcGtjg9C5F9z7OYJILQWLqGruY70Z
         dTqW6UpDAmOEeizWQyoeT3Qgy3AVlb6VnPzY2xKSCj876T83pRBQnU1qyQzg/OgVA0es
         DfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ps8wA06wMzyyRvvvYldgSzafMHSS0Jkhd3nDdg/VUI0=;
        b=K1hg7dBY6WYuORFkY5GYe/hFoLJnRP+f825I1RIrLee+XgcCDkicVuS5kRTJPuM2hw
         YpSlnFl9z8gCsc8gcALbgfGaEYSdT0nVwqgIqNkzOvGOCmU6G/d6xFizgJdMqnQZSUX7
         Edv3XYvijWEfDcpAbuC/J1QcKWfWQbnxMqNtJAtDnwYUREU9SMybREPKBamJpNJgPt0C
         dPbYiQfME2sSGmSc3zrRt2tgGoY5LduM8dfi6hxiaYB5X2xjlMyTAidfTIq23nlLcpcb
         ft1A6GHkK8CaaMafBxutp3bnN/z0F65X5zr0bmYKjv+nto5FzMAhinVNX+k1pGXgDbB7
         ZSNA==
X-Gm-Message-State: AOAM5326YJEv4D9kIX0OC+4FAuzvPc3ubdBHKFypLMtSd6vR6vBc1de9
        Dqj17KYPgRBzNT8sHCVfHRtKCA==
X-Google-Smtp-Source: ABdhPJwAfpD7TU9l8JeA/KWJM3azo7IDFeFTtPD5oWUCVfmfGMmxJBMr3krcFdE5kA+TwEgkDi0xYA==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr7241408wrc.718.1644516461647;
        Thu, 10 Feb 2022 10:07:41 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id p3sm2213001wmq.40.2022.02.10.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 10:07:41 -0800 (PST)
Date:   Thu, 10 Feb 2022 18:07:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alistair Francis <alistair@alistair23.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <YgVUawb2IFoiuqU/@google.com>
References: <20220210185123.4d39766c@canb.auug.org.au>
 <YgTRu7iLgJMymeT5@google.com>
 <af550a8a-9fd8-9292-4179-4d7b74fdacfc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af550a8a-9fd8-9292-4179-4d7b74fdacfc@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 10 Feb 2022, Guenter Roeck wrote:

> Hi Lee,
> 
> On 2/10/22 00:50, Lee Jones wrote:
> > On Thu, 10 Feb 2022, Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > After merging the hwmon-staging tree, today's linux-next build (htmldocs)
> > > produced this warning:
> > > 
> > > Documentation/hwmon/sy7636a-hwmon.rst:4: WARNING: Title underline too short.
> > > 
> > > Kernel driver sy7636a-hwmon
> > > =========================
> > > 
> > > Introduced by commit
> > > 
> > >    de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
> > 
> > Oh wow, that's new (to me), and a little petty, no?
> > 
> > Would you like me to apply this patch to my branch Guenter?
> > 
> 
> It would be great if you can do that since you already wrote it.
> 
> > I can either send out a new PR, or let it wallow.
> > 
> Wallow is fine with me; that can go in through your branch.
> 
> Actually, I wonder if I should just drop your immutable branch from
> my tree and let it go in through your tree. The hwmon patch has my Acked-by:
> already, and there are no further dependencies, so it isn't really necessary
> for both of us to carry it. What do you think ?

That's your call to make. :)

The patch is going in, either way.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
