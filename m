Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28222C62AA
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 11:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgK0KME (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 05:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgK0KMD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 05:12:03 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA8DC0613D1;
        Fri, 27 Nov 2020 02:12:03 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id d17so4909133ejy.9;
        Fri, 27 Nov 2020 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IIGXSYqaUNN5PIFewNakfvr1KCpKZHLYcsZesEFK79U=;
        b=vXmNaalfI9LbSkWJKwfXLsdSKVeAI9GwaMeeyf28Y5zCZZ+zAdPIBEzsfmRDbLwexb
         9Xl5gAnhKrbp0Q3TkPAaD2ffsk/f4E356HmwldPZbJqCPMa51WSFFx3binK6MruysTfQ
         rBeLPXfZ5DTJInXOcuWRmi6blkUr7EiR7128v+BHpb3xMpvs4iUzKglNceS5Tt7KZZFq
         3E6KrgZbz026pmk+VovrNEBhnhDVcT5vhNb7j7DjgYqYJrQKwWNqsN/Fltkw9FP2qFvp
         Rc7leg/+BQ1kL2dsCRGTwJFM9T2Z10kO3CvBTofhioJjafRzzW9VGh/TAYYcV/7z2BIQ
         GV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=IIGXSYqaUNN5PIFewNakfvr1KCpKZHLYcsZesEFK79U=;
        b=moF7ZG2QOuv1cZ2QZMrPeDYrTcHurdKBGoFJZemWhgOvAa+o8QIgqFl3D6E+npeX5W
         W23tu/kKxa76eUM6C1ml2m1Da3jWya0u+KkEeaDvwS63TXBNEFLoWrKeP3DGqhsA3hif
         MepLDtk4HIYElFKYUEn148v/4R4m6q8B2T4T70wdrpCMqgiugGfas9AIQrmgEi6FXNtK
         QY+/jU8H3H1HQxS7dnqc+/jeGOpA9C1lsv6JBSbAdnYe8Cm4HvU7zSb3tjMudYPYvhph
         hgs/JXoev31Bc5x54izZ98oLpDXVsmDb+cV4ndrbvwXanMyidYuDwGLUV22nNl/Iorex
         SSzQ==
X-Gm-Message-State: AOAM532T/Pbq2Ex0mm4pSLw9loXFc5jOh6TJ4eWzJ6rlXbLdMFYVn85n
        NbvyVUgrQmM8ussKFMPUsPwWSA4WXR0=
X-Google-Smtp-Source: ABdhPJx42HiaEpPbDgnSiGgGooAUj9vPM77mBe9nI2Ad6ypJtb949RwUJboVLDrHtMOGsKwSpOyBag==
X-Received: by 2002:a17:906:6947:: with SMTP id c7mr6851536ejs.533.1606471921956;
        Fri, 27 Nov 2020 02:12:01 -0800 (PST)
Received: from gmail.com (563B8913.dsl.pool.telekom.hu. [86.59.137.19])
        by smtp.gmail.com with ESMTPSA id u1sm4556394edf.65.2020.11.27.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 02:12:01 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Fri, 27 Nov 2020 11:11:59 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20201127101159.GA1074530@gmail.com>
References: <20201127151037.420aee20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127151037.420aee20@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> kernel/smp.c: In function 'csd_lock_wait_getcpu':
> kernel/smp.c:133:13: error: 'call_single_data_t' {aka 'struct __call_single_data'} has no member named 'dst'
>   133 |   return csd->dst; /* Other CSD_TYPE_ values might not have ->dst. */
>       |             ^~
> 
> Caused by commit
> 
>   545b8c8df41f ("smp: Cleanup smp_call_function*()")

Inded, I just (belatedly) noticed this semantic merge conflict with 
upstream too, I resolved it in tip:sched/core and it should be all sorted 
out by tomorrow's -next integration. Sorry about this!

Thanks,

	Ingo
