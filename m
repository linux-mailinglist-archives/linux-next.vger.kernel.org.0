Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C1236B0F7
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 11:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbhDZJrs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 05:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhDZJrs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2021 05:47:48 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CE5C061574
        for <linux-next@vger.kernel.org>; Mon, 26 Apr 2021 02:47:06 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id k124so27975314vsk.3
        for <linux-next@vger.kernel.org>; Mon, 26 Apr 2021 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5BbAH+2vmiLoS4ht3ok08Ncc1gg2z3HC4E5/bi5xuK8=;
        b=dDsSZVOF6SBGANkDRuc6tSzKmlHppDIAvcurRl8qC4j+edgD25RiRy60AqVQlE0PWC
         C0zV8GDD4u+hK25ByhuGx1ZyE2TiJcvvKfoI0PzMi9GDS+XonAROiFVvUgVcis0B5GbU
         CpotZLCtzijHSmqZRflX/cBziLw4s44KFzL66qkkzr5wh4oTcmzUYHWhEkcuEKaRc/QH
         6EcKCz/mUmfUbpVioz7R2RaS2sKV32pEKZ8mhiPk4k1y0Blwq2EZTwnPhZNG0DfeBtb8
         LuN4oNAdLcNV2L/1ws/J4Gp5emWjGD+FoxMGDv/5n/zjU+Stp3NJkEmV9zVGSD+Bj5rV
         6RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5BbAH+2vmiLoS4ht3ok08Ncc1gg2z3HC4E5/bi5xuK8=;
        b=GUXuN3rZLuOgZTeBVu5XefYj8s6OYwHnCkgdzjY6MBLiy94NI9pYN/atvFFguehQse
         7CLWDclt2Yvdq7GX8jPZFoJJwFU03zLglmJUJ7D0mf/M2LIRmTd80GAyzM/sUr3u4Muz
         qQn76J3ssLKNNfG/gmKpnhRBNgm3PkVW2AgCQWDUa/ra3P+cKGLrOKU0OpJc9VlpLvpH
         A6bjZqJc002rTNvum3Hxg0xbb3O9k+OWNaugppdgwxQIxPq4klxy9BfTbiAM9f6r2ZI6
         l0DxnLo5saQ0Ci/das8e4LBVmVpS0f0LjrmSzFUIhyGAVmHG6CAK/66oZLeTGzMzcVw3
         JO8w==
X-Gm-Message-State: AOAM531oQQRFqIH02/CvbYtCpR2qxJXl4ib6QabtW6pQJMNhcvZ66Z94
        zaZkqHl2M0pjz0ucUDddg36N0ThZKKU01FPUHKVQNw==
X-Google-Smtp-Source: ABdhPJyiaXTB+nvQDIgBkqPBhHMfbHiWXVLyqNmEIcuiiWOzqO3PlkaNhcYyqXn9cy9MBitfdx7Lrf+/7Hf58MDww7M=
X-Received: by 2002:a67:af0d:: with SMTP id v13mr11286133vsl.48.1619430426131;
 Mon, 26 Apr 2021 02:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210416134827.1f35b1cd@canb.auug.org.au> <20210416134907.356dad53@canb.auug.org.au>
 <20210426113156.5e445705@canb.auug.org.au>
In-Reply-To: <20210426113156.5e445705@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 26 Apr 2021 11:46:29 +0200
Message-ID: <CAPDyKFq45+OY2auTQ_Rc3k7af+UtDOOk5gYTn+RDYjCQA7tXOQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 26 Apr 2021 at 03:32, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Fri, 16 Apr 2021 13:49:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > This is actually just a warning.
> >
> > On Fri, 16 Apr 2021 13:48:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > >
> > > In file included from drivers/memstick/host/r592.h:13,
> > >                  from drivers/memstick/host/r592.c:21:
> > > drivers/memstick/host/r592.c: In function 'r592_flush_fifo_write':
> > > include/linux/kfifo.h:588:1: warning: ignoring return value of '__kfifo_uint_must_check_helper' declared with attribute 'warn_unused_result' [-Wunused-result]
> > >   588 | __kfifo_uint_must_check_helper( \
> > >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   589 | ({ \
> > >       | ~~~~
> > >   590 |  typeof((fifo) + 1) __tmp = (fifo); \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   591 |  typeof(__tmp->ptr) __buf = (buf); \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   592 |  unsigned long __n = (n); \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   593 |  const size_t __recsize = sizeof(*__tmp->rectype); \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   594 |  struct __kfifo *__kfifo = &__tmp->kfifo; \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   595 |  (__recsize) ?\
> > >       |  ~~~~~~~~~~~~~~
> > >   596 |  __kfifo_out_r(__kfifo, __buf, __n, __recsize) : \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   597 |  __kfifo_out(__kfifo, __buf, __n); \
> > >       |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   598 | }) \
> > >       | ~~~~
> > >   599 | )
> > >       | ~
> > > drivers/memstick/host/r592.c:367:2: note: in expansion of macro 'kfifo_out'
> > >   367 |  kfifo_out(&dev->pio_fifo, buffer, 4);
> > >       |  ^~~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   4b00ed3c5072 ("memstick: r592: remove unused variable")
>
> I am still getting this warning ...

Apologize for the delay, it should be fixed now.

Kind regards
Uffe
