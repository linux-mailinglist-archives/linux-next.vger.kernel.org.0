Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076102073B2
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 14:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389347AbgFXMtg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 08:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388942AbgFXMtg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 08:49:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B2EC061573;
        Wed, 24 Jun 2020 05:49:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b5so1120723pfp.9;
        Wed, 24 Jun 2020 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2eaegY/6/Ptz7zmctEL30CCAJrbR8XfRyH8Kj31+vU=;
        b=eAZ2O4pnJPx8HX5FlvoTiZ7+G03lMPKFrFitk0dnEuzV/OMGV3Ns0s2eNlInftNVUc
         iQH8JPdskaFD9r0KhlyptJ0fJwfrgiopEyL8TGWE9D6061POGc5zd+PK3RgCHJr2xQAM
         YhTVTbOzIXBd/Dt0UTVM+VkoJxBd51vrofOIEgMSQ1JxZkb+E9diQVcK8BE3q9/QPBew
         mgOJuIxXiyb+QIF9ju/E5/F6IrI2DLA9BAt4RFyMhgmXEygG1k9WnC3qsj84VSk3e2IW
         9IYbaj/sj58whp/gKWYrJfKAS0EraK5u182WpZkiVOxoEqBaYmurdkgxW7I0HU/skKRH
         wFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2eaegY/6/Ptz7zmctEL30CCAJrbR8XfRyH8Kj31+vU=;
        b=aDu++JhLQmSaGZsOT01+5trq90+/chIuqgmxeGFI80CcReQdmipE6t571rN/PesoS9
         LU1cl45ZW6vrw3MUAJVDXfHbba0Tgi8YkTVjQ5TjWTWbrD+823FcfXCZWCUfa9SQWmHa
         +F652sylGiZ16NzP2CoMRNz+jpDQkLIx4mck0WA5bNpNaNOY5c8I/8Cn5AeOD3U+hiCd
         3O0Q+FU7jtrW/2vivSXXSpjBb83/J9Q/Mr8xreE3HE433+qpDeEOyCqshFT6LHdnAVMR
         f5OHliooC7RstFVVXERB9U/psdHA1njRIwAkjIufktll5NeEmv4b/6frb3nQvI2YL/zU
         0WRg==
X-Gm-Message-State: AOAM53165Wm80+AADSpjjxmBHizQVsnbtzW6GdYw4X9ERfY+XqA1B/JQ
        3p2499xErQlsJwLmyq2Y5+hakqEb/4Q8aBSEz3E=
X-Google-Smtp-Source: ABdhPJxO0YxxfPnBRRjvwxoQDCfwirMMZJ8fsuuIkcfDFnBdYi8unG5vOSVDj+538jA0wdLqL+XWis+aySViZI+sitY=
X-Received: by 2002:a63:f042:: with SMTP id s2mr21155504pgj.4.1593002975780;
 Wed, 24 Jun 2020 05:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200621131554.5a662afe@canb.auug.org.au> <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley> <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley> <20200624124212.GA17350@gondor.apana.org.au>
In-Reply-To: <20200624124212.GA17350@gondor.apana.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 15:49:23 +0300
Message-ID: <CAHp75Vez0fvWWATcX6ofFqREGa64NbAh0ftb=G4WtyvPUvG8VQ@mail.gmail.com>
Subject: Re: [PATCH] lockdep: Move list.h inclusion into lockdep.h
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 24, 2020 at 3:43 PM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Tue, Jun 23, 2020 at 04:28:58PM +0200, Petr Mladek wrote:

...

> > -#include <linux/kernel.h>
> > +#include <linux/compiler.h>
>
> Unfortunately this doesn't work because list.h actually does need
> kernel.h for container_of.
>
> However, we can easily fix the loop another way by removing list.h
> from lockdep.h as it doesn't actually use any list macros/functions
> but only the list type which is now in linux/types.h.
>
> We could either fold this into the lockdep_types patch, or fold it
> into the printk patch, or just leave it as a standalone patch.
> What do you guys think?

Does lockdep_types include types? Then we are fine and it is the way to go.

-- 
With Best Regards,
Andy Shevchenko
