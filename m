Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3133CF99B
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 14:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236193AbhGTLtm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 07:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237862AbhGTLsT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 07:48:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED7AC0613DC
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 05:28:48 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so1945746wmc.2
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HA5pgOt3LuB7s8wJqihPNWq2/H5z2E0M6pXYeU8VDyA=;
        b=bscvEdhIF7xDlYdr0m57loM89UGFczXij2tSGVhKyHrZMNESgX9PGh54fg9UWCChec
         bAAq+qyVyhvnkjaA8qCY6sgFOdfy91XgtKzzNtH5XG3w07hLbXgGULjzm+76kygiQ6G3
         GEk8IMmKr2DimSath9SwgTbd+v/duPcMPMb8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HA5pgOt3LuB7s8wJqihPNWq2/H5z2E0M6pXYeU8VDyA=;
        b=oI7tjmJEIJs6HeRQw2Gy8Ar5dRPos91sRt0uPfjVoPhMA6dK+jBXBMNkeuZN7nNSmS
         U/28pzm29gg6YZtT8kZiP8HOm3m4xJgh8HCZwLGLvmVit9LifgPCvsn2jw5+DIzZCi3q
         5zG9SXxJ/hVGjwZL+0FZIzPv9y9RTq3TRWqSX6aK54Y5E1K2WsK52+G2Zex2TNoQaxOq
         iSLHX+j8yAsyTTtra3QAZ/lZRJ36x+zBvPiNrSV1FwLE4lYYKlZF7ijUnQiW6y5Ptyr1
         7vJU6eIi6/oG5JO3ujD6Crzfi7ejQB2Pa+WjaTmX6YLtrp/bvZqZXMLTNrcRDUmggXs0
         YFYg==
X-Gm-Message-State: AOAM5309jpJX/HnrbM6Slc5sDvVWnWLOZUHD0hP4DRTS1lNYWFs69qYX
        vXIO9x0kzrePS5p7CXLQwHr70w==
X-Google-Smtp-Source: ABdhPJx99dLkVaK1o2AY7YxAZkKj20vHt6UA1LoL8K4PzW3OMhlMZXpAl7+fRffonLvUmQSAIdLiLg==
X-Received: by 2002:a1c:628a:: with SMTP id w132mr4727263wmb.90.1626784126822;
        Tue, 20 Jul 2021 05:28:46 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:d571])
        by smtp.gmail.com with ESMTPSA id 140sm19863114wmb.43.2021.07.20.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 05:28:46 -0700 (PDT)
Date:   Tue, 20 Jul 2021 13:28:45 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <YPbBfdz9srIpI+bb@chrisdown.name>
References: <20210720174300.018cc765@canb.auug.org.au>
 <CA+G9fYs2ApGkrJHL5HOO1jEJZ714itVp+Tdj7fWzkG+JWc=pOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+G9fYs2ApGkrJHL5HOO1jEJZ714itVp+Tdj7fWzkG+JWc=pOA@mail.gmail.com>
User-Agent: Mutt/2.1 (4b100969) (2021-06-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey folks,

Naresh Kamboju writes:
>On Tue, 20 Jul 2021 at 13:13, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> After merging the printk tree, today's linux-next build (mips allnoconfig)
>> failed like this:
>>
>> arch/mips/kernel/genex.o: In function `handle_mcheck_int':
>> (.text+0x190c): undefined reference to `printk'
>> arch/mips/kernel/genex.o: In function `handle_reserved_int':
>> (.text+0x1c8c): undefined reference to `printk'
>>
>> Caused by commit
>>
>>   337015573718 ("printk: Userspace format indexing support")
>
>Following MIPS builds failed at our end due the reported problem.

Thanks: missed this as I made sure to change all .S files to use _printk, but 
this is in a .h file included in a .S file.

Here's what's needed. :-)

diff --git arch/mips/include/asm/asm.h arch/mips/include/asm/asm.h
index ea4b62ece336..2f8ce94ebaaf 100644
--- arch/mips/include/asm/asm.h
+++ arch/mips/include/asm/asm.h
@@ -114,7 +114,7 @@ symbol		=	value
  		.set	push;				\
  		.set	reorder;			\
  		PTR_LA	a0, 8f;				\
-		jal	printk;				\
+		jal	_printk;			\
  		.set	pop;				\
  		TEXT(string)
  #else
