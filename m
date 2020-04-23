Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102481B646C
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 21:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgDWTYK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 15:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDWTYJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 15:24:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D9CC09B043
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:24:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 7so3932811pjo.0
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WPYdNIZiW2wlSf4+Ub9IiFcK437hBCn7oo/oGCWqW7o=;
        b=LUADqTn/aOcQPDNN0HhsE5ocsphRiy6BwPeu3kxHtPYTYxfvDuYZnBojhzbIG9qF//
         BOmJvGSbFQOxI8hRHea4757zL4VfC2iuw+C6z6z9Bedj+/x81+AmsQdmMSOx+aTGbvNj
         jja1BHlZCgC5SSRTTjN2alDx28LrjPsRMEb38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WPYdNIZiW2wlSf4+Ub9IiFcK437hBCn7oo/oGCWqW7o=;
        b=ITVzqzPuZnlDHuD/nqQm7j9s4KnBkO9bAcsm3lAXOaWApbEk8gxuXvBr7rFnkHOM2S
         55YU/emC77wgiOx6T9jhIEh0CAS87Zq9MqaDlt2LlupB8D0FUl4JrKHUGEA9cOpdgXRi
         RfJsEHMaP6ONBVOan1dbRz5NjEqrVCu3/UUXjvq7OvGm+8kc0hLmFY0QqXmXAkYGxBMh
         6gDaVtZ35gTEUC4LCEQsc+xx8CmwYzV9YjLHPLdfwtO1GYG4GbxOFGis7FCC1WlvyK6O
         R098QienqzcegaDub2u6X4HiIFMYsHwBIXDO9dU6dJQUEi/cZ+CWDqiJVZJz4P5Oy9s4
         3/+Q==
X-Gm-Message-State: AGi0PuZNT18igJw0YY/mN0jI27k32ZENO8L1Dyi8GpE3FJXDv8zjcHTo
        ox3kgOeJBr8Q8wCy0H3ZI8uWgfiRdLU=
X-Google-Smtp-Source: APiQypJZk74uGhsPcYlIl8PSuhy3pu0nJKqpy4TPmEplMdcaHBNjpzGbOaUTi+GMACEUOqsV5xLUXg==
X-Received: by 2002:a17:902:788e:: with SMTP id q14mr5233333pll.72.1587669847180;
        Thu, 23 Apr 2020 12:24:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c4sm2958661pgg.17.2020.04.23.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 12:24:06 -0700 (PDT)
Date:   Thu, 23 Apr 2020 12:24:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 23 (objtool warnings)
Message-ID: <202004231222.8A28DE1@keescook>
References: <20200423174104.239dffab@canb.auug.org.au>
 <1239aab1-84b4-02c3-a819-2c35dfa67a1c@infradead.org>
 <20200423152921.shhjokjka7pwuyqr@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423152921.shhjokjka7pwuyqr@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 23, 2020 at 10:29:21AM -0500, Josh Poimboeuf wrote:
> On Thu, Apr 23, 2020 at 07:59:31AM -0700, Randy Dunlap wrote:
> > On 4/23/20 12:41 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20200422:
> > > 
> > 
> > on x86_64:
> 
> More truncation of functions by CONFIG_USBAN_TRAP.  Kees?

Looks like another randconfig with CONFIG_UBSAN_ALIGNMENT=y

I will test this and see if my proposed Kconfig change solves it.

-Kees

> 
> > drivers/target/target_core_xcopy.o: warning: objtool: target_xcopy_do_work()+0x6dd: unreachable instruction
> 
> 0000000000000170 <target_xcopy_read_source>:
>      170:	55                   	push   %rbp
>      171:	48 89 e5             	mov    %rsp,%rbp
>      174:	48 81 ec 40 03 00 00 	sub    $0x340,%rsp
>      17b:	65 48 8b 0c 25 28 00 	mov    %gs:0x28,%rcx
>      182:	00 00 
>      184:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
>      188:	31 c9                	xor    %ecx,%ecx
>      18a:	83 e2 07             	and    $0x7,%edx
>      18d:	75 34                	jne    1c3 <target_xcopy_read_source+0x53>
>      18f:	48 89 f0             	mov    %rsi,%rax
>      192:	83 e0 07             	and    $0x7,%eax
>      195:	75 2c                	jne    1c3 <target_xcopy_read_source+0x53>
>      197:	48 8d 95 d0 fc ff ff 	lea    -0x330(%rbp),%rdx
>      19e:	b9 65 00 00 00       	mov    $0x65,%ecx
>      1a3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
> 			1a6: R_X86_64_32S	.rodata.str1.1
>      1aa:	48 89 d7             	mov    %rdx,%rdi
>      1ad:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
> 			1b0: R_X86_64_32S	.bss+0x560
>      1b4:	f3 48 ab             	rep stos %rax,%es:(%rdi)
>      1b7:	48 8d bd 48 ff ff ff 	lea    -0xb8(%rbp),%rdi
>      1be:	e8 00 00 00 00       	callq  1c3 <target_xcopy_read_source+0x53>
> 			1bf: R_X86_64_PLT32	__init_swait_queue_head-0x4
>      1c3:	0f 0b                	ud2    
>      1c5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
>      1cc:	00 00 00 00 
> 
> > net/mac80211/rx.o: warning: objtool: __ieee80211_check_fast_rx_iface()+0x79: unreachable instruction
> 
> 0000000000007be0 <ieee80211_check_fast_rx>:
>     7be0:	40 f6 c7 07          	test   $0x7,%dil
>     7be4:	75 44                	jne    7c2a <ieee80211_check_fast_rx+0x4a>
>     7be6:	48 8b 57 50          	mov    0x50(%rdi),%rdx
>     7bea:	48 89 d0             	mov    %rdx,%rax
>     7bed:	83 e0 07             	and    $0x7,%eax
>     7bf0:	75 3c                	jne    7c2e <ieee80211_check_fast_rx+0x4e>
>     7bf2:	55                   	push   %rbp
>     7bf3:	b9 06 00 00 00       	mov    $0x6,%ecx
>     7bf8:	48 89 e5             	mov    %rsp,%rbp
>     7bfb:	48 83 ec 38          	sub    $0x38,%rsp
>     7bff:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
>     7c03:	48 89 f7             	mov    %rsi,%rdi
>     7c06:	f3 48 ab             	rep stos %rax,%es:(%rdi)
>     7c09:	48 8b 82 d8 03 00 00 	mov    0x3d8(%rdx),%rax
>     7c10:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
>     7c14:	8b 82 68 0f 00 00    	mov    0xf68(%rdx),%eax
>     7c1a:	89 45 d8             	mov    %eax,-0x28(%rbp)
>     7c1d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
> 			7c20: R_X86_64_32S	rfc1042_header
>     7c24:	a8 03                	test   $0x3,%al
>     7c26:	75 04                	jne    7c2c <ieee80211_check_fast_rx+0x4c>
>     7c28:	0f 0b                	ud2    
>     7c2a:	0f 0b                	ud2    
>     7c2c:	0f 0b                	ud2    
>     7c2e:	0f 0b                	ud2    
> 
> -- 
> Josh
> 

-- 
Kees Cook
