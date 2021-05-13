Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1737F5F0
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 12:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhEMKxB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 06:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhEMKxB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2021 06:53:01 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81651C061574;
        Thu, 13 May 2021 03:51:50 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b17so30492059ede.0;
        Thu, 13 May 2021 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vSaWdpUe1Ty1mw9fU8RRwXWDrECbF/5dVz1Lbk9LJn4=;
        b=SXuTO/M/wBSW7Fi521W6qZ5yk/wLIzGyC4ZNRU5IhnUQhpLQIGqQeCto3WwrzpZXU3
         xZSMNHwlZEyq32AMzSStDhNIj0O/wllvVflI2IdBAs8U7Wu18/oonJiNCQoJTlTQGLdw
         1WQJiI7qt48MNfCX7vw77XZt8ZLNwEXRlVRCSN7EcQeVtKH8BuY0oVsyOTjdPtTE0eZo
         6DDU7L0HclWtubeZ0zp5bIt48UpWLYQtxNw0UMAO05uw6Q8AvYMuzz4ZCvNxHcI0PAjP
         FtAUaWTVO4wdrS9HsTWsPuS74ODPa1ov4xsmO8dlWAjlzGhMC4Wi+gUBISEZP11vsIRm
         vgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=vSaWdpUe1Ty1mw9fU8RRwXWDrECbF/5dVz1Lbk9LJn4=;
        b=cHEMPkE3vprHg+Fb1wPy+4gsLY7/uhlDiRYLm5rLoQunJlQykUO11pZJGKUAe1xspb
         YFJhITF4cQE9Y3iYM45MtViZgL1pl9zK8AOCqS+r0MC/+6Ka5vjJdB1/xbXkMJKVSj+t
         G13HBM2LyTm1KH2vCC4TDtOqwylKDM73zRSBuCuORat1+zT9fUh/U3kCM6Qj6nefsF0y
         X1DVPK0ccsmds5x/QbC8qA43leECPHuu3xR+LIW2W7pnISZ4DNwO0c181ypg+p4kgN/D
         UI7uiKMCIpWHpH9F2LJoS7OLezP4jcUKrVW9OWMj9Qlw00WlZWKC5WGaqTyWpEmysYFi
         Ssxg==
X-Gm-Message-State: AOAM532s3lzhjp7NVKcatKcQ0LT4PEtkH6etmZfCDMEQAr2AUw1N01Ia
        k9HyyZzv8AW0u0qEXQNpjQU=
X-Google-Smtp-Source: ABdhPJwaHL6C6ggtqq76KDiPHH73BSiv5T6KC00VzI7VbtTeGly5R9tSi5NGFzY5N97Z/f/caMGyaQ==
X-Received: by 2002:aa7:cc11:: with SMTP id q17mr17071756edt.240.1620903109320;
        Thu, 13 May 2021 03:51:49 -0700 (PDT)
Received: from gmail.com (0526E777.dsl.pool.telekom.hu. [5.38.231.119])
        by smtp.gmail.com with ESMTPSA id h8sm1569148ejb.104.2021.05.13.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 03:51:48 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Thu, 13 May 2021 12:51:47 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YJ0Ew9gjprpCByxF@gmail.com>
References: <20210513120515.7060879c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513120515.7060879c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from tools/arch/x86/include/asm/nops.h:5,
>                  from arch/x86/decode.c:15:
> tools/arch/x86/include/asm/asm.h:185:24: error: invalid register name for 'current_stack_pointer'
>   185 | register unsigned long current_stack_pointer asm(_ASM_SP);
>       |                        ^~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   eef23e72b78b ("x86/asm: Use _ASM_BYTES() in <asm/nops.h>")
> 
> I have used the tip tree from next-20210512 for today.

Hm, this must be some cross-build artifact or toolchain version dependency 
- as plain native build of x86-64 allmodconfig builds just fine:

    CC       arch/x86/decode.o
    LD       arch/x86/objtool-in.o

I tried with gcc-8, but that didn't trigger it.

I suppose the workaround below would make it build - but that's not a real 
solution.

hpa, any ideas?

Thanks,

	Ingo

diff --git a/tools/arch/x86/include/asm/asm.h b/tools/arch/x86/include/asm/asm.h
index 507a37a46027..ada5482c024a 100644
--- a/tools/arch/x86/include/asm/asm.h
+++ b/tools/arch/x86/include/asm/asm.h
@@ -176,14 +176,6 @@
 
 /* For C file, we already have NOKPROBE_SYMBOL macro */
 
-/*
- * This output constraint should be used for any inline asm which has a "call"
- * instruction.  Otherwise the asm may be inserted before the frame pointer
- * gets set up by the containing function.  If you forget to do this, objtool
- * may print a "call without frame pointer save/setup" warning.
- */
-register unsigned long current_stack_pointer asm(_ASM_SP);
-#define ASM_CALL_CONSTRAINT "+r" (current_stack_pointer)
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_ASM_H */
