Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4E53F8155
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 05:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbhHZDzW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Aug 2021 23:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhHZDzV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2021 23:55:21 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF14C061757
        for <linux-next@vger.kernel.org>; Wed, 25 Aug 2021 20:54:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n12so957085plk.10
        for <linux-next@vger.kernel.org>; Wed, 25 Aug 2021 20:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1sPzPYc/EKv0I2wYFDfjlJvR2hTdySSO3VkQ5DpfwQs=;
        b=cE+FiLlP+4iCYjhQgAkHwz0kaR6rlqPG2oJAS1XJmXv/xTGOBoSIrHKsJnZUz4pZiC
         oDhmTDiGEc3t305uYyOjiRGQsUxe8YAAm4Lr6xWfMK8jZ/N1N9JST8/czqEp8ptqhZkp
         7ZTqyPL169r7Qa/Twzjw0s1sgZQOjv3KW5z9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1sPzPYc/EKv0I2wYFDfjlJvR2hTdySSO3VkQ5DpfwQs=;
        b=llh/pINhRhzdwWyzZtJH81YFEjRynxMRrRlM9SSQ0OCy7gIUySyP8zxqHZM1a/Ypiz
         leWhNafCsHJxGL9PEbxIhvlARfkOsdA4npL+ue11etuoAgBMaL7X4ZazO5JoxXdfs+jU
         58q7esvsU4+kmOCrVsIrkGUydBMW/8KMzRmoCIk6lZEoB7Qliv7Y4Mp/fbxrMMsKIHdo
         rbYDvDbSlfCqG3SYXliQTnAL1RjJVmviObgnoel9tLpGhIKyVhRMy7mXM+JFHkOkKO7C
         F7KXX3IxqA7k9zyTaFjTcRtSWzvDY1YmnAKYd1B99UIVxRJsKr6VRdpBozAC0zn76Kla
         23Yw==
X-Gm-Message-State: AOAM531rzUyAdrRDBKdXd9mjc4mRo6WOWpiGaqcDn1u0gfh0N5WOw8i2
        /bp5pRvAj4Byk1TO2PjaWMeZ6GWyvIplXQ==
X-Google-Smtp-Source: ABdhPJxzRpKUNWXysHu4C+p0lD3QBdZHfusdZCygGhFD/Ho1EJUqcMoYDGKrLWbNIizCBITmGQT4nA==
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr14397456pjb.32.1629950074801;
        Wed, 25 Aug 2021 20:54:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b12sm1105596pff.63.2021.08.25.20.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 20:54:34 -0700 (PDT)
Date:   Wed, 25 Aug 2021 20:54:33 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
Message-ID: <202108251958.4BA654453@keescook>
References: <20210820192615.23e2e617@canb.auug.org.au>
 <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
 <202108202248.921E8C66@keescook>
 <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
 <20210823203742.5169ad54@canb.auug.org.au>
 <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
 <20210824115859.187f272f@canb.auug.org.au>
 <202108250959.CD734CED@keescook>
 <1d7780f0-424b-71d4-732b-c28a796d1166@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d7780f0-424b-71d4-732b-c28a796d1166@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 25, 2021 at 10:49:19AM -0700, Randy Dunlap wrote:
> On 8/25/21 10:04 AM, Kees Cook wrote:
> > On Tue, Aug 24, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
> > > On Mon, 23 Aug 2021 18:24:44 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> > > > 
> > > > This is just weird. What I am seeing is that for every source file
> > > > where gcc emits a warning: it then follows that up with this
> > > > > > cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
> > > 
> > > I see the same, as well as:
> > > 
> > > <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> > > cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
> > > 
> > > But only on my gcc 7.3.1 builds (the rest are gcc 10).
> > > 
> > > > Smells like a gcc bug to me.
> > > 
> > > Yes
> > > 
> > > Also noted here: https://github.com/DynamoRIO/drmemory/issues/2099 (second comment)
> > 
> > Okay, I think this work-around should work. I've been able to reproduce
> > the weird conditions, and this seems to behave correctly. Andrew, can
> > you fixup the fixup with this?
> > 
> > 
> > diff --git a/Makefile b/Makefile
> > index 26640899e7ca..c1842014a5de 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1094,8 +1094,13 @@ endif
> >   ifdef CONFIG_CC_IS_GCC
> >   # The allocators already balk at large sizes, so silence the compiler
> > -# warnings for bounds checks involving those possible values.
> > -KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
> > +# warnings for bounds checks involving those possible values. While
> > +# -Wno-alloc-size-larger-than would normally be used here, some versions
> > +# of gcc (<9.1) weirdly don't handle the option correctly when _other_
> > +# warnings are produced (?!), so instead use SIZE_MAX to effectively
> > +# disable it.
> > +# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
> > +KBUILD_CFLAGS += $(call cc-option, -Walloc-size-larger-than=SIZE_MAX)
> >   endif
> >   # disable invalid "can't wrap" optimizations for signed / pointers
> > 
> 
> Hi Kees,
> 
> I get a lot of these:
> 
> ../include/linux/slab.h: In function ‘keyctl_instantiate_key_common’:
> cc1: warning: invalid argument ‘SIZE_MAX’ to ‘-Walloc-size-larger-than=’

O_o

I love how the documentation on this option is consistently wrong. :)

I haven't been able to exactly reproduce this error on godbolt.org, but
I got close with trunk GCC:
gcc: error: argument to '-Walloc-size-larger-than=' should be a non-negative integer optionally followed by a size unit

Even though stdint.h is included. :(

Okay. How about _this_ fix?

diff --git a/Makefile b/Makefile
index efa9bd36b158..141a851930e6 100644
--- a/Makefile
+++ b/Makefile
@@ -1096,8 +1096,17 @@ endif
 
 ifdef CONFIG_CC_IS_GCC
 # The allocators already balk at large sizes, so silence the compiler
-# warnings for bounds checks involving those possible values.
-KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
+# warnings for bounds checks involving those possible values. While
+# -Wno-alloc-size-larger-than would normally be used here, earlier versions
+# of gcc (<9.1) weirdly don't handle the option correctly when _other_
+# warnings are produced (?!). Using -Walloc-size-larger-than=SIZE_MAX
+# doesn't work (as it is documented to), silently resolving to "0" prior to
+# version 9.1 (and producing an error more recently). Numeric values larger
+# than PTRDIFF_MAX also don't work prior to version 9.1, which are silently
+# ignored, continuing to default to PTRDIFF_MAX. So, left with no other
+# choice, we must perform a versioned check to disable this warning.
+# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
+KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
 endif
 
 # disable invalid "can't wrap" optimizations for signed / pointers


-- 
Kees Cook
