Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704C825B967
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 05:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgICDvN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 23:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgICDvN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 23:51:13 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B078C061244;
        Wed,  2 Sep 2020 20:51:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nw23so1750478ejb.4;
        Wed, 02 Sep 2020 20:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7sqFas94AUuM/xkz1q3rV1FkcNmy4bzm158KDgU2swo=;
        b=oAC9GSH+JYBdvHePsapdvPC9SibHSeLyqEVhACwWyaiKLjWlqz/U8Pk3xTdi2H3cqK
         SLfAfmZV3ZfhXfzI5OS8pwQj7koWNF4F4Z3GcCzED0Lq6G0RoMGqWd9j2ltjHCH0XTHC
         xM4QBytW4yz/4lek4urySrObpOQDG0pAj4gZF2W1YgJdOLOedbkltpdPvAkDolkKhoM7
         WqEgwQhQGxqSp8VKl3s8JLnbTUvVjp6ZZxRk9wB22NOwcbvOKBD8hmiPCp8w9TjoDSPV
         719ryjLzBraB6Zc5Rnd/Ps3zAQD4OOuRS6G7SO0H/RDeMHF23uvUyOJ861gRY7/b9bUA
         drOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7sqFas94AUuM/xkz1q3rV1FkcNmy4bzm158KDgU2swo=;
        b=OmtwLvLs0vnJk1U88eJQLyNEBQe9cs0NlqpIVefI6Tata7UmMyXJfCf4bkzxSdQZmv
         v3fDik0yNoEPXzfU0TN1XWyMr0oJnazi/xnRQGF6o/AWWsFZFn2rk9D8mpYlx8/3Mzad
         9zy+AH1VK3MaYvWhwN9R3vxXq9m2qqq02GVdsHAACXHnST7iaI2pIpAH+XN6xwKi9mTq
         DE5QOocCfWTubRjVRm3/oTmwbKpXKEjh/KEaXTVIO/yj8cidbX+j7Y2GlPXkSDAt7pcm
         PADKPBD1KpOwAEcj73GFNWfWaab0HwoWfGpP1lUp3GyRNwSMlIYshLfRsVfRK15IUtew
         MxYA==
X-Gm-Message-State: AOAM533Czv97OyIUAWXRY/0aieMZi+4vtl8klGZJihvzXWGqno+M0xmc
        489qRzdk3v5InLVmN4TC938=
X-Google-Smtp-Source: ABdhPJwkOHEoNIXQqNSrRaqlu0WWDp+BmAcCI+YIEEX089J/JIWGxDeqgxoJxgrtCjDfPzQ+HHlbfQ==
X-Received: by 2002:a17:906:54d3:: with SMTP id c19mr155465ejp.408.1599105071349;
        Wed, 02 Sep 2020 20:51:11 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id k25sm1830561ejk.3.2020.09.02.20.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 20:51:10 -0700 (PDT)
Date:   Thu, 3 Sep 2020 05:51:08 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200903035108.GA3616759@gmail.com>
References: <20200903123552.0c5d1277@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903123552.0c5d1277@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> 
> Caused by commit
> 
>   f670269a42bf ("x86: Fix early boot crash on gcc-10, next try")
> 
> interacting with commit
> 
>   a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
> 
> from Linus' tree (v5.7-rc6) - the automatic merge did not go well.
> 
> I have added this patch for today (it removes the older version).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 3 Sep 2020 12:31:13 +1000
> Subject: [PATCH] merge fix for compiler.h

I've merged the old commit by mistake - it's removed now.

Thanks,

	Ingo
