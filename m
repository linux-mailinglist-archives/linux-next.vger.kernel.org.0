Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1B12343CB
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 11:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732140AbgGaJ5k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 05:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732075AbgGaJ5k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2020 05:57:40 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDC2C061574;
        Fri, 31 Jul 2020 02:57:39 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id v22so11179851edy.0;
        Fri, 31 Jul 2020 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Me3xUsDymhPcO8yIS2fJXOcLNayPPxl0UjufSAtk0QQ=;
        b=kxvKFcF9IRX5p1OSQZuczXxcXxEMYfRyt4Pm1z90XzI2+/WzxFlriRtuJZyGXYRUxX
         BGDyeoKMtubeiDg2SqjwNkJZkJbL77lM0lbeEQu76C6J3jJSPFYf+EZIUQvgkOo8ml8z
         npjepN5IAiqt2j7MOtETuNQHBbNEpcz0sSxXlo/x9T9zbUi3M/FxF6h5A78fCFTh8HP8
         tUewH8sn4bR1aLuELsw49b8cZN/k91KPy9VWCJb3G+gAFR6YPem9pyyc0RH/QQRMfOTH
         4cvIn974A/8/Q83WIOYgLbZzmwpsNioebnkodxzFUDzY9uDtnSn3v3fhZPGfMrYzOOSK
         T2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Me3xUsDymhPcO8yIS2fJXOcLNayPPxl0UjufSAtk0QQ=;
        b=oAkMSfEBia0Rysm3gJ+IKi8sNZmC+erYleLjonG0p1AFoyr79MhBUiHA+kZ6KWmpLf
         JdFo9llT1y/NCFxz/bedL6lJd/UqC8S3Rb+VJJ9iHz06rqY/fEAzTtjXfpTp3v5dKkFs
         opcPtnykwVTjG5e1fGy+x+kZbCbW0xEZk5X1I8cMvtEwuj0YmIP39aGK6VU7njCU2/2C
         HHnzgeDfEtRsmgsO2Y7jALg0zQMuDnDsHk0iXw9k2cNMRdkJQxorPju1ebXvGqz6wUi6
         IIkiGWXy8v22RdfCtZDV8qPeGUFIUy56LVwjz97sJC7eN/53BDXeB/j5Ni66XC77/S2d
         qWMw==
X-Gm-Message-State: AOAM531eOitM3AvgGDlqmE8NsEPWYvOq28ZI70vuJ7KFopICMeyqk28q
        i5kXHR8yfWxj5thR3ABa2rs=
X-Google-Smtp-Source: ABdhPJyqGwsB+cD1JkZTq22ptAkNdzVHkba5i11cloSa6VMJPbzzy4zSRI9iaQHy8+erdxXDmnl7ag==
X-Received: by 2002:a50:e1c5:: with SMTP id m5mr3160715edl.138.1596189458374;
        Fri, 31 Jul 2020 02:57:38 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id u16sm9277119edb.97.2020.07.31.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 02:57:37 -0700 (PDT)
Date:   Fri, 31 Jul 2020 11:57:35 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200731095735.GB15126@gmail.com>
References: <20200731155304.06c67b0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731155304.06c67b0c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from include/asm-generic/getorder.h:8,
>                  from arch/arm/include/asm/page.h:166,
>                  from arch/arm/include/asm/thread_info.h:14,
>                  from arch/arm/include/asm/percpu.h:16,
>                  from include/linux/irqflags.h:17,
>                  from arch/arm/include/asm/bitops.h:28,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:20,
>                  from arch/arm/include/asm/bug.h:60,
>                  from include/linux/bug.h:5,
>                  from include/linux/page-flags.h:10,
>                  from kernel/bounds.c:10:
> include/linux/log2.h: In function '__ilog2_u32':
> include/linux/log2.h:24:9: error: implicit declaration of function 'fls' [-Werror=implicit-function-declaration]
>    24 |  return fls(n) - 1;
>       |         ^~~
> 
> And so on ...
> 
> Caused by commit
> 
>   a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-cpu variables")
> 
> interacting with commit
> 
>   00a30a5c9e6b ("arm: include asm/thread_info.h in asm/percpu.h")
> 
> (which was a fix of mine but now the equivalent is in Linus' tree as commit
> 
>   aa54ea903abb ("ARM: percpu.h: fix build error")
> )
> 
> I have reverted 00a30a5c9e6b since commit
> 
>   a6342915881a ("arm: Break cyclic percpu include")
> 
> (which precedes a21ee6055c30) acomplishes the same thing differently.
> Something will be required when this is merged with Linus' tree, though.

I've merged Linus's latest into tip:locking/core, keeping the simpler 
solution of a6342915881a and reducing the dependency hell.

Will push it all out hopefully later today (unrelated changes need 
more testing), from that point on there should be no conflict in 
-next.

My plan would be to send that resolution to Linus, under the 
assumption that a6342915881a is superior to the upstream aa54ea903abb 
solution.

Thanks,

	Ingo
