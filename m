Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B9B3B19BA
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 14:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhFWMVM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 08:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhFWMVM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 08:21:12 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E261BC061574
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 05:18:53 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id o6so4589950qkh.4
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uged.al; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDRcpkPWRJWGf8beIyUh3pmIbeYu5uw6hjZK+7uqw64=;
        b=GO2ZF8gTrGoor6bAQv7Ga4LzmxcMS7s+6dwFOmRjn/lShgRRvcbsAb/8HdF2OTFWks
         vSQMts7V+F0+PkWVCCtoVVfpLv1T2aWaVANdxAm99/ORShdDXAxAfMAhcoKh0OACg3Sk
         XGXxmDvVFUrEZPw/lgdemHfwQXAYkqJ40zVMommj2xVJS9JfTbOeH0P84Ah5NxHb8hyt
         nnZLHI+jZddq/Ku3RYGOxWEGmN0gpPRyXxg9YzQv7aIi56cyABy+ya9YriashxkasD9z
         P649CBR7Pa2OKv1fY755DsuUBOzWvqb2/+tmxgM1hyBqNi62ekva7wpkapxNzszjYtnI
         1hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDRcpkPWRJWGf8beIyUh3pmIbeYu5uw6hjZK+7uqw64=;
        b=tJi03ucWsM7UzWHBfd0B5zXpyrxpURoCHo2mxPYjyhTSl+9HuGP7oXHQ6to1DkZiC4
         uO5mnAcOCphRHmKw1HMI2Iesjjg6cntsfkyt/Hc1pzvOKTi6XvZGR5U78GAHgOOlXMBH
         wbkUP/yDVi/2SYEPtd96fOxkk8u2rkbvlT5a5CkC6+vU6i+gmHO5os1xIoy+i2GJiVLH
         xA8IfhDtoDY7tZOOZPjTxtbXybQjjSJBI+ltDc1jFU/q8qxiR6MJScyN58/Fh3qMQWbQ
         kj8rcvplr8Hb3djSfGI8WIkATMeMkgbk/l5w4oIOyKjjibrHNXfgx+6dtZvdM3m+zNKv
         dyuQ==
X-Gm-Message-State: AOAM532IHVfFZjoMwtuzHXuWiHKGlE9o4hmkWWZchwhq+sHO7wSlfGAl
        Wo2mit51WWUb2Y1brvAfiKI6eI0nDQeJmN6gPKi5Bvl2JaSPEuteBtk=
X-Google-Smtp-Source: ABdhPJxev0KnShuL3Rs3lB+8v7NabmTZw1GN9AeY4AQxWHCqkTXXbcc7ylQC6fHYGg/5sAmykunyyjZeP5g1gb2dZSM=
X-Received: by 2002:a37:b3c5:: with SMTP id c188mr10078431qkf.242.1624450732991;
 Wed, 23 Jun 2021 05:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book> <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book> <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com> <20210623120835.GB29143@vingu-book>
In-Reply-To: <20210623120835.GB29143@vingu-book>
From:   Odin Ugedal <odin@uged.al>
Date:   Wed, 23 Jun 2021 14:18:16 +0200
Message-ID: <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Odin Ugedal <odin@uged.al>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Wouldn't the attached diff below also help when load is removed,
Vincent? Isn't there a theoretical chance that x_sum ends up at zero
while x_load ends up as a positive value (without this patch)? Can
post as a separate patch if it works for Sachin.


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bfaa6e1f6067..def48bc2e90b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3688,15 +3688,15 @@ update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq)

                r = removed_load;
                sub_positive(&sa->load_avg, r);
-               sub_positive(&sa->load_sum, r * divider);
+               sa->load_sum = sa->load_avg * divider;

                r = removed_util;
                sub_positive(&sa->util_avg, r);
-               sub_positive(&sa->util_sum, r * divider);
+               sa->util_sum = sa->util_avg * divider;

                r = removed_runnable;
                sub_positive(&sa->runnable_avg, r);
-               sub_positive(&sa->runnable_sum, r * divider);
+               sa->runnable_sum = sa->runnable_avg * divider;

                /*
                 * removed_runnable is the unweighted version of
removed_load so we
