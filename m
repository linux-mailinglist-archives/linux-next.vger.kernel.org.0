Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D67202B66
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 17:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730320AbgFUPgl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 11:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730295AbgFUPgl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Jun 2020 11:36:41 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA02CC061794
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 08:36:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n2so6366048pld.13
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gRP16u1hGpLUV3yyXDqoC8CE4YUA8ZpoMcUkBaKy1z0=;
        b=PKro4SUneqYE3bvs/1xZhKR519MFxNvu2l21K3NWg9zeWKlc1VHRaKXtWuUsaJ/fjW
         QeD3veZTQyVPEOMLMz3za2xKDPa7r53bN0FnNyf/ERHXsYbyqyZn91tkHqvls7basJnH
         Qsa+8L+FOYXo8Zk8mniRb1S2uaZEFZtnVAIDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gRP16u1hGpLUV3yyXDqoC8CE4YUA8ZpoMcUkBaKy1z0=;
        b=KVKtTmT/vfeEb6ncrenJOheM5eK/BOCsXC5sO0EOdSEXVeOyJYVr4nyr7ub4Bo9Oot
         UXoS1h2KlQoZH7F422VESt1eOZh/xaiMeH/hY8zjX4Zwq9lKG6RdtqAlO1wCUuD3GV9k
         oOISA0eRvqI5Rpjax9dlub33so5WV2AFQ4fbEYOM7ybciPJftfXVQTVdOxBsoGKWX4U4
         QZS3rl1+FANpGk0OLgyZN/TQZP98/a+jfBObEMr/h+I30wlYDTVB6yjap4JpYNKj0je/
         SzL2P8iFoycUJkm5bhD+mpD0EET9aDFzcLMUZBYoTSyhAIsJ6/cT5RkRpp9lhvruxUwO
         UAHA==
X-Gm-Message-State: AOAM531b64pkWr0Lq+DEmO6CODXCjl137CIDpqrr3v8Y1isir4if5040
        ilnAGGvWRfwexHBtm22YSztU7miIB7o=
X-Google-Smtp-Source: ABdhPJwKoiOm2N5IhzFQsoZM9U+ei319pSVs6AopcRngDYPXYQIA9nW38cCMcJgv95kKauGw7wk+Jg==
X-Received: by 2002:a17:90a:e7cf:: with SMTP id kb15mr14422643pjb.86.1592753800496;
        Sun, 21 Jun 2020 08:36:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o1sm11141702pjf.17.2020.06.21.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 08:36:39 -0700 (PDT)
Date:   Sun, 21 Jun 2020 08:36:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sargun Dhillon <sargun@sargun.me>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202006210828.6AC290C4@keescook>
References: <20200621234851.64cf82c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621234851.64cf82c7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jun 21, 2020 at 11:48:51PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> x86_64-linux-gnu-ld: fs/file.o: in function `__fd_install_received':
> file.c:(.text+0x1010): undefined reference to `sock_from_file'
> x86_64-linux-gnu-ld: file.c:(.text+0x104a): undefined reference to `sock_from_file'

Oh fun. Okay, that's the first use of sock_from_file() in core kernel
code. I will fix linux/net.h to include a NULL-returning static inline
for the CONFIG_NET=n case.

And I will add "allnoconfig" to my test workflow. :)

-- 
Kees Cook
