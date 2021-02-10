Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647263165C7
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 12:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhBJL44 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 06:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhBJLys (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 06:54:48 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57ECFC06174A;
        Wed, 10 Feb 2021 03:54:07 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p21so2336592lfu.11;
        Wed, 10 Feb 2021 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6veChv4X2YgMkhqCjE3a4k98qt78vadEJiIFGLbQqGA=;
        b=dq4h2Z1bp4yyUD4/iweE7BDC/dgwKbB1ELrS7y/SGpIN+bKRZ/fy0hMbCOiw6zh9IS
         uX62+GAxVOSsKyCi1iON64P00AomIHKRe50+iLD1NypY7+xkChQgzYjfHNaJP4QsY3qX
         VN7eLq+3OXargRIChaj0r401CUyONM8xUBCS6ul5rwMqgf+Mp7832LRdS0yeT0Pe0/8Y
         P8Z/hGt2IrG5FuuUGa2fiX7QtC/elurswsN8W3JfUignGttd4oF3Yy7PTQmRpEU7CQA2
         xOaxsQcQpXD4FnmPg2e5F+ORG52ObGs4kAphkQPv9na6xu2l1DjPeY0LPaHEEEfgQc1T
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6veChv4X2YgMkhqCjE3a4k98qt78vadEJiIFGLbQqGA=;
        b=IVRGqsXlmzH0K7vZsbyXf3FCS2hC5Nc5LPZIKiM3YPi0+nlowFxKEaETyn5viW5oxP
         2CBiUqppuSYPRA/7XBsXenpXAZkKbMgSWTXHRuEeiDzTkE9hqPnWMnDOpWUxhVVq3w/H
         CTxbjJzLw64QL0ZLpofU28MWpPdhSsNf2fVP1deaQyAgMCAecbsitbw9ro5D1uySWsH/
         MiR1NIE2OchtSiaISDJrVsjRppTrXBz7j6ijEviEWbM4QsSXF/MhhRG6x5Ls+r/ot4Zp
         D3TLEuAt1K/I9uTxl+m5ppouoEPFpjHpMOQSTYOB2N9MB+DVZF2UDGY0ltcYO/I8xakk
         5rFw==
X-Gm-Message-State: AOAM532txh4+PaCVT02IIMg1/X/tjIfi72fwZSwSFfW5cZN//wFTnsvs
        kwqZszTnhBkC9/uHD+ED0rc=
X-Google-Smtp-Source: ABdhPJwkWJ5YNQgnHyQiLmMseJ7t4hfkEOodwCLrc2yr1oyu5Z+yylfPCOG2gpxWjOTYJaiS/VZb2g==
X-Received: by 2002:a19:4092:: with SMTP id n140mr1488415lfa.150.1612958045766;
        Wed, 10 Feb 2021 03:54:05 -0800 (PST)
Received: from [192.168.31.34] (109-252-130-105.dynamic.spd-mgts.ru. [109.252.130.105])
        by smtp.gmail.com with ESMTPSA id u26sm290316lfk.148.2021.02.10.03.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 03:54:05 -0800 (PST)
Subject: Re: [PATCH] ubsan: remove overflow checks
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>
References: <YCJCaDIzIaUZG27F@hirez.programming.kicks-ass.net>
 <20210209232348.20510-1-ryabinin.a.a@gmail.com>
 <202102091617.8FD77890@keescook>
From:   Andrey Rybainin <ryabinin.a.a@gmail.com>
Message-ID: <460f8e86-f602-d3ae-1287-0042c510a165@gmail.com>
Date:   Wed, 10 Feb 2021 14:55:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <202102091617.8FD77890@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2/10/21 3:19 AM, Kees Cook wrote:
> On Wed, Feb 10, 2021 at 02:23:48AM +0300, Andrey Ryabinin wrote:
>> Since GCC 8.0 -fsanitize=signed-integer-overflow doesn't work with -fwrapv.
>> -fwrapv makes signed overflows defines and GCC essentially disables
>> ubsan checks. On GCC < 8.0 -fwrapv doesn't have influence on
>> -fsanitize=signed-integer-overflow setting, so it kinda works
>> but generates false-positves and violates uaccess rules:
>>
>> lib/iov_iter.o: warning: objtool: iovec_from_user()+0x22d: call to __ubsan_handle_add_overflow() with UACCESS enabled
>>
>> Disable signed overflow checks to avoid these problems.
>> Remove unsigned overflow checks as well.
>> Unsigned overflow appeared as side effect of the commit
>>  cdf8a76fda4a ("ubsan: move cc-option tests into Kconfig"),
>> but it never worked (kernel doesn't boot). And unsigned overflows
>> are allowed by C standard, so it just pointless.
>>
>> Signed-off-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> 
> NAK, please don't remove the entire thing. I want this to work again
> with -fwrapv, and it's not entirely broken under Clang. But the feature
> shouldn't be removed from the kernel.
> 

This is dead code. How exactly it's useful to keep it? You can always resurrect it later when you'll need it.
Clang has the same behavior as GCC > 8, signed-integer-overflow does nothing when compiled -fwrapv or -fno-strict-overflow

