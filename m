Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74888C08CC
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2019 17:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0PnD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Sep 2019 11:43:03 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33731 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfI0PnD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Sep 2019 11:43:03 -0400
Received: by mail-qt1-f196.google.com with SMTP id r5so7873238qtd.0;
        Fri, 27 Sep 2019 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wj8jU1iK4RSmx+X1oOclo1EaNDpdKAJxwobsrBcy5cI=;
        b=D1nfq5N4SbJ7splLGR5xJ+5grwYQ7AM/tHiZvR1WI3Qd7JJ7hAONrI9lrtRXkkA2CN
         yvWA8dEiKDFDybPcS9zYBFVHhZ6O4CF3XVWQOiRtNftZ+DhqBM6ayetfhQSPgbhnUaFl
         OWllVG33BTCl8IVAhgDWS6qKE5m33yCJDauTXVM+709ES1mxIrNSsGbtwBoBEBaHNjSs
         +nDD7eSKdVrNcT0SPSUcreQIbmrCl/W9dmrwTmvxl2Yi3sCt3BvRCmcO9Mg1KkvQXQn6
         RWmgPNunoO0UOdwSBOKDUGk1069B3Py9c6uS/B2rjnEzRmXNIhs9vnSCRbUtH8OZ+oLt
         FYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wj8jU1iK4RSmx+X1oOclo1EaNDpdKAJxwobsrBcy5cI=;
        b=NkyNHIu3sEJ0INxyfLYvm2vYAl56HFIfpArO+gBBMsfKkRG1MdN9wvEvdnP8nWKuWA
         dumSPV70qHciu+lMWe84/D1QsDK+wiKXvKKTY6dPg3aCLej2lOoZ0Z6KibyOY++bVpSk
         9BdUUWvjXWLwb9o+hdNwfoMR3ZAUQUQ2MCi2IE6gzbFAfNBmGg0jsdafD/E47AKSJvv9
         APlqZ2soeijV5yE3124qNIdrIuA4F6Tnouq3VqDiBLPMdLgktMP4dYmCcfdPe0/R2k9T
         Ff7XlTXR0K3bYC2ZrZJmoIVuX4B9dUHn+MsEkJdSg5CHrfcnmov3FDVfU0SaVx/EvxoF
         3Zsg==
X-Gm-Message-State: APjAAAULewu36CKhrpYuiqAcmS9cWoK7J+C79MTVgwykAfpkb1qgx75c
        5N41rloTBpOV0tPnSVJM+VY=
X-Google-Smtp-Source: APXvYqzMC0T6yfrqLjpGJqf8tTd90CuiY4ZBjX3WZ57r9sl5NDmnrbU7P1y+3b90GNS5/6D0kUagqA==
X-Received: by 2002:ad4:544a:: with SMTP id h10mr8399008qvt.239.1569598982382;
        Fri, 27 Sep 2019 08:43:02 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([179.97.35.50])
        by smtp.gmail.com with ESMTPSA id b16sm3644080qtk.65.2019.09.27.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 08:43:01 -0700 (PDT)
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 48AE840396; Fri, 27 Sep 2019 12:42:59 -0300 (-03)
Date:   Fri, 27 Sep 2019 12:42:59 -0300
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: perf build failed on linux -next on i386 build
Message-ID: <20190927154259.GC20644@kernel.org>
References: <CA+G9fYu0hkS+NdwX38DNTygV1A7eebvjZvWvFUTfL=f3_4m=Dw@mail.gmail.com>
 <20190926173648.GA31477@kernel.org>
 <CA+G9fYt4fzmiFCsZXP+OC1joB=w5nkgn_MR++Yu61yWDWrh1yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt4fzmiFCsZXP+OC1joB=w5nkgn_MR++Yu61yWDWrh1yg@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Fri, Sep 27, 2019 at 02:05:32AM +0530, Naresh Kamboju escreveu:
> On Thu, 26 Sep 2019 at 23:06, Arnaldo Carvalho de Melo
> <arnaldo.melo@gmail.com> wrote:
> >
> > Em Thu, Sep 26, 2019 at 10:59:41PM +0530, Naresh Kamboju escreveu:
> > > perf build failed on linux -next on i386 build
> > >
> > > build error:
> > > perf-in.o: In function `libunwind__x86_reg_id':
> > > tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
> > > undefined reference to `pr_err'
> > > tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
> > > undefined reference to `pr_err'
> >
> > Can you try with the following patch?
> 
> Thanks for the patch.
> After applying this below patch build completes.

Thanks for the report and for testing it, appreciated,

- Arnaldo
 
> 
> >
> >
> > diff --git a/tools/perf/arch/x86/util/unwind-libunwind.c b/tools/perf/arch/x86/util/unwind-libunwind.c
> > index 05920e3edf7a..47357973b55b 100644
> > --- a/tools/perf/arch/x86/util/unwind-libunwind.c
> > +++ b/tools/perf/arch/x86/util/unwind-libunwind.c
> > @@ -1,11 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> >  #include <errno.h>
> > +#include "../../util/debug.h"
> >  #ifndef REMOTE_UNWIND_LIBUNWIND
> >  #include <libunwind.h>
> >  #include "perf_regs.h"
> >  #include "../../util/unwind.h"
> > -#include "../../util/debug.h"
> >  #endif
> >
> >  #ifdef HAVE_ARCH_X86_64_SUPPORT
> 
> - Naresh

-- 

- Arnaldo
