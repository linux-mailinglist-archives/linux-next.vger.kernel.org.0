Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628833F7B1C
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 19:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhHYRFI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Aug 2021 13:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhHYRFI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2021 13:05:08 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269D7C0613C1
        for <linux-next@vger.kernel.org>; Wed, 25 Aug 2021 10:04:22 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q3so2880452plx.4
        for <linux-next@vger.kernel.org>; Wed, 25 Aug 2021 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CJyMQg5ndRzFOES+K+qXkMNkTr+rsuPxxfp+PKJSpco=;
        b=etPg497bJ3dcDu1zyVq5ipt7ipND/1pOJRmhW/t6VBG6IRwk7i+doVvSsQmOeGoTCg
         Z2bTC8Hizx4FrtM8fY9BHmJ9rsPDkjYfnTsDYnsrnpVTBGHtE/qIDlm0xqGPZRGLZiPd
         cS1Z9l4686og+RKlbQtzpBRQgDrwI8JqBaqbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CJyMQg5ndRzFOES+K+qXkMNkTr+rsuPxxfp+PKJSpco=;
        b=BWamH+/WzHz9K0pp8yBDLWgPLX3BfSqnL8pFdUPyjucCUOh2/e6/hOHAPGAgPZLT7h
         a+yWxZ71SFXiJjM8NIF5EtaFnhqj/xkxfUGjbDR2bhXt00ohcky4Q8H8a9H8YVJAUFsY
         ty3SMUvXGwIpOK5HZuz+R44D7uFI5RUBoPRbVpKPqwYA37OKRuvbFmRSnq8EPMb7cRKm
         md2ezLNmky9Qkr/tEcJH6gm2J77robDEL/6x+yJxGfMES4Lb1LOFVFujHRD1K2pqZiLS
         fYS071WAYNqg58uI612pz3Ktp9x2azhaJUi1A3hi0s82Z4Xe0cJPM3TXTbNMDdCSKSLi
         NsNQ==
X-Gm-Message-State: AOAM531/m2J2KMBU15fnANTZMlYLGCEHAH3hDNhoDgbfVuELHT8eQNFm
        /6yznsCV4HsD8KTRseRUCCHjBXvXUiGuRQ==
X-Google-Smtp-Source: ABdhPJw5j49rbT+AmccpkLkNnwNpqEDj9QKLv/T4Rj/GPAy5gAqe7xZq1SYAJ5e65BTBSTVXo+fG4A==
X-Received: by 2002:a17:902:6bc1:b0:137:10b6:972f with SMTP id m1-20020a1709026bc100b0013710b6972fmr5976350plt.69.1629911061562;
        Wed, 25 Aug 2021 10:04:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n3sm330487pfo.101.2021.08.25.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:04:20 -0700 (PDT)
Date:   Wed, 25 Aug 2021 10:04:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
Message-ID: <202108250959.CD734CED@keescook>
References: <20210820192615.23e2e617@canb.auug.org.au>
 <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
 <202108202248.921E8C66@keescook>
 <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
 <20210823203742.5169ad54@canb.auug.org.au>
 <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
 <20210824115859.187f272f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824115859.187f272f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 24, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
> On Mon, 23 Aug 2021 18:24:44 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > This is just weird. What I am seeing is that for every source file
> > where gcc emits a warning: it then follows that up with this
> > >> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'  
> 
> I see the same, as well as:
> 
> <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
> 
> But only on my gcc 7.3.1 builds (the rest are gcc 10).
> 
> > Smells like a gcc bug to me.
> 
> Yes
> 
> Also noted here: https://github.com/DynamoRIO/drmemory/issues/2099 (second comment)

Okay, I think this work-around should work. I've been able to reproduce
the weird conditions, and this seems to behave correctly. Andrew, can
you fixup the fixup with this?


diff --git a/Makefile b/Makefile
index 26640899e7ca..c1842014a5de 100644
--- a/Makefile
+++ b/Makefile
@@ -1094,8 +1094,13 @@ endif
 
 ifdef CONFIG_CC_IS_GCC
 # The allocators already balk at large sizes, so silence the compiler
-# warnings for bounds checks involving those possible values.
-KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
+# warnings for bounds checks involving those possible values. While
+# -Wno-alloc-size-larger-than would normally be used here, some versions
+# of gcc (<9.1) weirdly don't handle the option correctly when _other_
+# warnings are produced (?!), so instead use SIZE_MAX to effectively
+# disable it.
+# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
+KBUILD_CFLAGS += $(call cc-option, -Walloc-size-larger-than=SIZE_MAX)
 endif
 
 # disable invalid "can't wrap" optimizations for signed / pointers


-- 
Kees Cook
