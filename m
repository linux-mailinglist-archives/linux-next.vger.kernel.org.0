Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CA93B58A6
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 07:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhF1Foj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 01:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhF1Foi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2021 01:44:38 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55FEC061574;
        Sun, 27 Jun 2021 22:42:13 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id v20so9236617eji.10;
        Sun, 27 Jun 2021 22:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lTOuPkr+o/4LX9mpdVP4Ri3MVTbuew6cPELb11XRwlA=;
        b=R1yGWQRJWOd94HKNnXCRKAaj8x2BwR/wIdiwPZXW7y+4QqgLbphE3o5ENG9gqMN+2B
         nY1QNUdf04vgr53a3EOO8pNhV614Q+ohl+wn32bQ51Kk1qgi3nBVvlxPV9j+3MG1E+i6
         8P/7Y0tUQJEQfrQnlZyx0Czi4x1Wb79+M4LwKYDdHCwg7m6PBb29SkBgTe254XERfdzc
         vF/bTXe3J4akNbWDBlU6aheDGEG0V8OC09XpzmJjNvlFq8vbNh432F8zrRYHUTJr2EPb
         OZ1qEbkxAFW61+Jd3+ZMIxdKrTAUbZbvBLGvLywTb1oMvFtfjAHZj0ZIXtsRASk2wNQC
         CMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lTOuPkr+o/4LX9mpdVP4Ri3MVTbuew6cPELb11XRwlA=;
        b=dSc+0b8UIr1o2iWbpNg9D2CcioWixFyaXw+gK7mTbtvmvWMk5eM1/uRc6DxEWhcp1V
         Akphy+JMqsZ1ypgt0USrdpprq2hSYRs7YNDvnPHurHAJn/MbB3LYChlKPLOpAmPj0UDP
         8BuKKNtd2Ldg/g/HPZx0YuyQpi0tTcutbq8NtgT6aw2llSkn28JyKCo3n49sH7Qne6qe
         DlJnHCNc2hWL6HiGVvsaLlWtCsjGWoOluUHQYg0UGRbeMgwZdcthQPRfmV+qiosUJ+dY
         zxtIeVIuM/i5ynd+NkLlFbwRDG6BgkmzDxzxjlZkxJsAO78qemxFdah91rWE2b0ca+Ya
         vbMQ==
X-Gm-Message-State: AOAM531Mc/pvY4u31YGMbiIqiSoKWqJm+FfE487jAhTM5PW/67NpJPd0
        0R0fDm1zPGcfaM0yEZ+0gbQ=
X-Google-Smtp-Source: ABdhPJwk/jemkOULfg1NYruKOnP9Lwo0hTUsh8ozTtlUrnzHaUOy1naqUADnd5uDKmI9jRLCn/PX3A==
X-Received: by 2002:a17:907:8319:: with SMTP id mq25mr22700783ejc.279.1624858932331;
        Sun, 27 Jun 2021 22:42:12 -0700 (PDT)
Received: from gmail.com (94-21-131-96.pool.digikabel.hu. [94.21.131.96])
        by smtp.gmail.com with ESMTPSA id ia20sm6321314ejc.96.2021.06.27.22.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:42:11 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Mon, 28 Jun 2021 07:42:10 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YNlhMttVJx/mBUKu@gmail.com>
References: <20210628133602.1ca94b56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628133602.1ca94b56@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from include/linux/module.h:21,
>                  from include/kunit/test.h:15,
>                  from kernel/time/time_test.c:3:
> kernel/time/time_test.c:99:16: error: expected ',' or ';' before 'GPL'
>    99 | MODULE_LICENSE(GPL);
>       |                ^~~
> include/linux/moduleparam.h:26:47: note: in definition of macro '__MODULE_INFO'
>    26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>       |                                               ^~~~
> include/linux/module.h:229:46: note: in expansion of macro 'MODULE_INFO'
>   229 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
>       |                                              ^~~~~~~~~~~
> kernel/time/time_test.c:99:1: note: in expansion of macro 'MODULE_LICENSE'
>    99 | MODULE_LICENSE(GPL);
>       | ^~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   34c7342ac1b4 ("time/kunit: Add missing MODULE_LICENSE()")

Yeah, that should be "GPL". I amended the commit, so this bug should be 
gone by tomorrow.

Thanks,

	Ingo
