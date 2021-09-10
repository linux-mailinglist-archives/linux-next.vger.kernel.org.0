Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91592407346
	for <lists+linux-next@lfdr.de>; Sat, 11 Sep 2021 00:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbhIJWSi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Sep 2021 18:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhIJWSi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Sep 2021 18:18:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E02AC061574
        for <linux-next@vger.kernel.org>; Fri, 10 Sep 2021 15:17:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so6947737lfu.5
        for <linux-next@vger.kernel.org>; Fri, 10 Sep 2021 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78HtN4Bg6+M/A+Xl9RxmXePZHI29+kDh762QuvxkQeM=;
        b=ltSKyQNhXu8PH4rVbbhKTfPeiI2BiBMV1IfccHMRsgmAbP97+f2fQjibd1Bl8nEF/L
         dO7feGIMFWEbxOlIq5bXfLrsqsqQtpkIOJrg0OOHpTZrWYFpZIxTWv4V/TxkfGbnwqqY
         RrAoba+P9ZCoT0Zhz4//ZQxMwDcaPCrWNcwP+/OOrWBGm8XoF7l5fVOVqQ3Cn8wbXSoB
         n7QhHs+A7/QyX6iCkqdVKyjN+lP99a2Rh2cLbX8d7qHUrhb5taMyQiaPUXr/gjJKidU/
         zyEquitS6yKsW2YSOQXPZwzp59a66NPnOczDLF5x1Y5SU7G/wN588Q0lAW2pDeVDErcK
         cY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78HtN4Bg6+M/A+Xl9RxmXePZHI29+kDh762QuvxkQeM=;
        b=oxq2gFQ3zt+XAqAbC1uFnIYw44P9Qn6s5pIDy0wzD7VZlAbW2KEHdkuANG7V8vjbdl
         J54z6+4snkKc86qMC9fTAgmzwmMnGSbyYX5SWmAs4vvN/7e3ABwPoD5NWnigfiPK5qQC
         ttivcx5/hAqNA08AQdITbSSjy5NtGxoc97wIDBjXk/dxPyBpTJ3RrsjLIMIQw2Keh0ur
         TvqyibM7pwBSJq3nm7NbCVaSIktYg9vhXrfwbU3qvEADCZDIR98oJeY9hKNCywiv26LF
         +8Vf9W48G0xvLb2V2q3T76qT8AYmQjeRv7Y8By79ALrXEfh6YKjyIFs6BOLxVKkoDSCi
         gRmg==
X-Gm-Message-State: AOAM5330dobleNrtjKt+9jn8YJFZ9pbHgRmbTHVFrLiAGNnK4Rxq14ah
        PWO/1+AocC9FCT38eSG9gM7xpw88fSCEmHX0eS/bhw==
X-Google-Smtp-Source: ABdhPJx5geBCxXtv2YXJ0quJJHlv4Xhz7ykivklE6R9sKU/Zr+BzcDIzOaSay0SiR7ISXrWs5Hx9wcdo4QhVT37Av38=
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr5763574lfe.444.1631312244588;
 Fri, 10 Sep 2021 15:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210909182525.372ee687@canb.auug.org.au> <20210909225035.3990728-1-ndesaulniers@google.com>
 <CAKwvOd=hoPv2GMZws6UsnMHop6+662wer=Hfo2Tw2=1XXCY2JA@mail.gmail.com>
In-Reply-To: <CAKwvOd=hoPv2GMZws6UsnMHop6+662wer=Hfo2Tw2=1XXCY2JA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Sep 2021 15:17:13 -0700
Message-ID: <CAKwvOdmXVLjd9ukYpORDgPeqFcM4nRiOYE_1Mtr_bGa=FPo4Cg@mail.gmail.com>
Subject: Re: linux-next: build failure while building Linus' tree
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     axboe@kernel.dk, josef@toxicpanda.com, libaokun1@huawei.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 10, 2021 at 3:02 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Sep 9, 2021 at 3:50 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > + Rasmus
> >
> > This was introduced in
> > commit f0907827a8a91 ("compiler.h: enable builtin overflow checkers and add
> > fallback code")
> > which added division using the `/` operator, which is problematic when checking
> > for overflows of 64b operands on 32b targets.
> >
> > We'll probably need helpers from linux/math64.h and some combination of
> > __builtin_choose_expr/__builtin_types_compatible_p.
> >
> > That will help us fix another compiler bug for older clang releases, too.
> > https://github.com/ClangBuiltLinux/linux/issues/1438.
>
> Ok, I have something hacked up that I think will work:
> https://gist.github.com/nickdesaulniers/2479818f4983bbf2d688cebbab435863

hmm...playing around with adding some static asserts to the above, I
don't think it's quite right, specifically:
#define div_64(dividend, divisor) ({            \
  typeof(dividend) z;

might declare z with the expected sign, but not necessarily the
correct width when the dividend is 32b but the divisor is 64b.  Feels
a bit like trying to encode the C type promotion rules in a macro...

> This incomplete diff is a little hacked up to reproduce the issue with
> a known-bad revision of clang that demonstrates a similar issue to GCC
> 4.9.  You can ignore the movement of check_mul_overflow and friends in
> include/linux/overflow.h.
>
> I think I'm going to break that up into 2 or 3 patches:
> 1. move is_signed_type from include/linux/overflow.h to perhaps
> include/linux/typecheck.h.
> 2. add div64_x64, div_x64, and div_64 to include/linux/math64.h, use
> them in include/linux/overflow.h to fix GCC 4.9
> 3. move multiply fallbacks out of
> COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW for clang < 14.
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
