Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28FA5E17A1
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 12:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390952AbfJWKQJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 06:16:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38929 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390935AbfJWKQJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2019 06:16:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id r141so9476926wme.4;
        Wed, 23 Oct 2019 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9iPPqusJPjy3fAoziYeQ1zwfhPnXfEyQ34hAjHCQafo=;
        b=VYLE/i7wvrdstNdqoYBu4hHMmgi2Xnp6mJUGJmCBGfkD/0g0gaS2KtG/wmobKZdIUC
         ow+h77+mHBjo1CVD8W0IDu5KX7/Qs4Q7B6gqWRjx5LnWu2iQB99vVvzdvwwo1yfpasfL
         D0EOvOmY1UfEj7U5aIPMesDQ+Y3ao9sIF1a5JKQZUey9bODP2TAYH/2MMF6HTnCDwZs5
         cbfcmRhSAA9uzqDMFqFA3KNlgij+qz2MWSd7omoOrklclFnJwXp0fGChmSa5AH4vVSsK
         e2DtfhLxvqvCjQVYrnaHE/zn3fQ3DAja0d33FlyIMeaYHuILDZEHFC8Fmsk8C9oifSxk
         3ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9iPPqusJPjy3fAoziYeQ1zwfhPnXfEyQ34hAjHCQafo=;
        b=XyW9+kSJdUnvqfqFuYQkB78ehdJ80vWqJEofUTieKXoG8XgN3GjfjqnAxANNjl6lDm
         KoBPWhltMiIiS7P8qC9XZPbdPL5HUTQB4zlzmSdsKKosCXV1gdaEhHoovDRl7cTG4Kn+
         vX2gCDIPvpSqsK/UUnQhexj+Qj/HHkrjalOvyabOSVjlFtLHx2PcyhpT5/dOfvyVqXJ+
         a2Rgl12mnARCxG73vUGL9Ixc6DKFXKTSfx/ezCpCw8DeS2wA082XYvfe8U+gaGiGcnQN
         +S3wJiwOrxaIn2XV3zbXGgAhHWwKgMgFqAy4A20C64+OGJo0yoPxTkXTVGif4WqyIref
         OMDg==
X-Gm-Message-State: APjAAAUt9Er/IInxW1SjNmhYZ+dYvchTJkPnvc1UVgGJOlnGh2OdTMlg
        esTiO8t9SnskMa0GWcF8iwM=
X-Google-Smtp-Source: APXvYqwxuHSMMTKBbHUKw6TukoIvtmzINUAeMlsHvgxZimi044g64RvzMK+5ejsMdipBS0mtnKfohQ==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr7292922wmg.105.1571825766994;
        Wed, 23 Oct 2019 03:16:06 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id c189sm1979877wme.24.2019.10.23.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 03:16:06 -0700 (PDT)
Date:   Wed, 23 Oct 2019 12:16:03 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Thomas Hellstrom <thellstrom@vmware.com>
Cc:     Ingo Molnar <mingo@elte.hu>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20191023101603.GA120912@gmail.com>
References: <20191023071655.10a9cff5@canb.auug.org.au>
 <MN2PR05MB6141177C37F2D1566E4FB341A1680@MN2PR05MB6141.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR05MB6141177C37F2D1566E4FB341A1680@MN2PR05MB6141.namprd05.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Thomas Hellstrom <thellstrom@vmware.com> wrote:

> On 10/22/19 10:17 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > n commit
> >
> >   6fee2a0be0ec ("x86/cpu/vmware: Fix platform detection VMWARE_PORT macro")
> >
> > Fixes tag
> >
> >   Fixes: b4dd4f6e3648 ("Add a header file for hypercall definitions")
> 
> The cited subject is missing a leading "x86/vmware:". Ingo, please let
> me know if you want me to respin those.

Those who are picking it up for a backport will go by the sha1, while 
humans reading it are fine without the prefix, I think this is OK as-is.

Thanks,

	Ingo
