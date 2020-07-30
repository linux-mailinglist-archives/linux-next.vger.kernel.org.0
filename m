Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB58232891
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 02:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgG3AKS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 20:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgG3AKR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 20:10:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E55C061794
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 17:10:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so26974498ljm.1
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 17:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5uaGB2xOYWa+jACqPIzmH4++Yk2MzFSBiFLA11OUW2E=;
        b=hEZFWlE7wFcKYKOakFk0ARR5rq45yVm7myS+H/aFfLygPk2/HtvTay9IOs8X986Au0
         ysId+nihcBhqm06rqs/so9xUnDDA9GxF8oz88kgI3tVsdQf2m5jR8R6WiMH0ND1+jRFf
         q0p1S8kKPPF01m/AsRNu6iCyH2Apvz8S+SYjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5uaGB2xOYWa+jACqPIzmH4++Yk2MzFSBiFLA11OUW2E=;
        b=qLZ/UnP0Py+Odo1z6DeIpLj5Opy/c1fJyjiMgEHyOWAudkB2BbmjVj5lnZzYEUY3Oz
         wXG6yFj2UuNfBirN50V4an9EfxV1GYNa1M7UYtPd/M2by1C2dzXYatN3dy1GSKo107ZN
         JVSdvSVFPZKvGLIdUF93iPCy4UARsFmezQ9G5qFQ+o+9SD9lz1NErkoZ0zd3aPwklG0f
         Kg69hC0PnvhX+1AZApFlJIi/74pephx2mr/nsBZWW9n/lI3vg7pX6Vv6AM/JJNyfjCEk
         VJGoHnW94fS0yUI/ho35UozLA+EHToOpy7mQ5e4SByrzS2o7aJ85I50GiQk85+7QWFpQ
         VbIQ==
X-Gm-Message-State: AOAM533YCJTYEfXzbOUXK1YHoFAhLWG0JkV1U3NwHEOINQn8o8pqCfWE
        aRaEXT+FcBNA3RzHAgan0VY6gRgf1Ew=
X-Google-Smtp-Source: ABdhPJy5TH8dNZKyxFy4YEYEeAHpHwT3VW1++LFFqyoCpWC6/Ok3oQWqj26aMiH1q9bah4NjkEV55Q==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr156386ljg.201.1596067815595;
        Wed, 29 Jul 2020 17:10:15 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id g18sm820194ljk.27.2020.07.29.17.10.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 17:10:14 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 140so14003828lfi.5
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 17:10:14 -0700 (PDT)
X-Received: by 2002:a05:6512:3b7:: with SMTP id v23mr238005lfp.10.1596067814139;
 Wed, 29 Jul 2020 17:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200730090828.2349e159@canb.auug.org.au> <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
In-Reply-To: <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Jul 2020 17:09:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=whA7d4ug8-=TQWq_uR04+MqbfZemz+meFhfu_bCyGzvpw@mail.gmail.com>
Message-ID: <CAHk-=whA7d4ug8-=TQWq_uR04+MqbfZemz+meFhfu_bCyGzvpw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 4:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ok, this shows a limitation of my allmodconfig testing (and all my
> normal builds) - no plugins. So that problem wasn't as obvious as it
> should have been.

Ok, that was easy to install and get the coverage, and now I see the error.

Except I still don't know the gcc plugins well enough to fix it at the
plugin level. And the gcc docs only talk about TREE_STATIC() for
functions, not for variables. Apparently variables should use
DECL_THIS_EXTERN or DECL_THIS_STATIC according to the docs I find, but
..

Removing the __latent_entropy marker obviously fixes things.

               Linus
