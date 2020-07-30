Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F66232A4D
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 05:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgG3DRv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 23:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgG3DRv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 23:17:51 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2FFC061794
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 20:17:50 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id s26so14225549pfm.4
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 20:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4CIpoQaQP5rMf7isN45R+AOY024dFN4X4rA8xyXrZ0w=;
        b=EsUMbF53S5viW/2q5173Kz5KDGM7yrbvBj3CRywH8XTY/c8KgzJygFZr/0n1T25vFd
         +UNA/0zFuQK2bekoUC+iHK/Yt3lUd+V59LwahnR05NdrvmbQO1YUSxuDjm6K2d6RrBnf
         9uu841Zv511kgsa4otfpUujxvqpQykuvKqo4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4CIpoQaQP5rMf7isN45R+AOY024dFN4X4rA8xyXrZ0w=;
        b=uOPBs5/IwP3dr4mSpZ2GYQyda95qED+wuhXcyOyBEwRbZxAxrhoLJzm+kZr4vn65oX
         ZdaPF0YC4P7k58JjGndXdxxkS+6QN9JZ/WemS8HHBbsS2jvNTYIEw8IunGRR20GPKZsJ
         kEtxowgXYA6F00PNmcj3T/JGQEYxFWt/AOzgpa8VF9Y7df8/UKDhxZBZDjGDqGJARTyW
         91llgEokUoA0arAWTwTpuzf7RZvjijVdWBXdWliaT/0kigfIplgP+iWxqw5CoIWv0Ydv
         ZZI6hu7g1H9gWQkaA2+LN3qd4yUdpiOf4Z8w0tqcreu5cCSY3zp7QlYrBGZxUkdzZtZL
         0aQQ==
X-Gm-Message-State: AOAM532XQxbLpsdYImOR5xLUHj6s77InSmqTXvjDLzdnxBXlmz26nTNA
        1r5M6wmKnTjwekplTB1x7c67Rg==
X-Google-Smtp-Source: ABdhPJwUiJjDYY1upE20181M/T25UeDrrMdRZr2R4D8eIow7XPYBfzmsuGRJeSckiDADngYgYfSfvw==
X-Received: by 2002:a62:17c1:: with SMTP id 184mr1160512pfx.136.1596079070298;
        Wed, 29 Jul 2020 20:17:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s8sm3945406pfc.122.2020.07.29.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 20:17:49 -0700 (PDT)
Date:   Wed, 29 Jul 2020 20:17:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <202007292007.D87DBD34B@keescook>
References: <20200730090828.2349e159@canb.auug.org.au>
 <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 04:43:04PM -0700, Linus Torvalds wrote:
> On Wed, Jul 29, 2020 at 4:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > include/linux/random.h:123:24: error: variable 'net_rand_state' with 'latent_entropy' attribute must not be local
> >   123 | DECLARE_PER_CPU(struct rnd_state, net_rand_state) __latent_entropy;
> 
> Hmm.
> 
> Ok, this shows a limitation of my allmodconfig testing (and all my
> normal builds) - no plugins. So that problem wasn't as obvious as it
> should have been.

I'll look into this more tomorrow. (But yes, __latent_entropy is
absolutely used for globals already, as you found, but this is the first
percpu it was applied to...)

> Adding the gcc plugin people. Otherwise the only option seems to be to
> just remove that __latent_entropy marker.

And just another heads-up, the patch[1] (which was never sent to a public
list) also breaks arm64 (circular header needs?):

$ make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 defconfig
...
$ make -j$(getconf _NPROCESSORS_ONLN) CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64
...
In file included from ./arch/arm64/include/asm/smp.h:33,
                 from ./include/linux/smp.h:82,
                 from ./include/linux/percpu.h:7,
                 from ./include/linux/random.h:14,
                 from arch/arm64/kernel/pointer_auth.c:5:
./arch/arm64/include/asm/pointer_auth.h: In function ‘ptrauth_keys_init_user’:
./arch/arm64/include/asm/pointer_auth.h:40:3: error: implicit declaration of function ‘get_random_bytes’; did you mean ‘get_random_once’? [-Werror=implicit-function-declaration]
   40 |   get_random_bytes(&keys->apia, sizeof(keys->apia));
      |   ^~~~~


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f227e3ec3b5cad859ad15666874405e8c1bbc1d4

-- 
Kees Cook
