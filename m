Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D7D2322D0
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 18:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgG2Qle (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 12:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgG2Qle (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 12:41:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EAFC061794;
        Wed, 29 Jul 2020 09:41:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j20so13209774pfe.5;
        Wed, 29 Jul 2020 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UROC5uvy/pRDRtev5ApXcVyx7axSfteZjS9YrXtJFCg=;
        b=u5Z5VUktcQuY0CDhUoFUoSXx/m4DD9i3tHcHdnIkRD4xze00CyYJ5G/9/gB5FbQrds
         XGctPDakbYVJurJ4T66K+N61cmcG3TzhfWcIWdZHa/vKDGxinTyQWUTpoXorbm3mVdV+
         JaD1uYEyL+Qa7aQ5ctBT9G8wEhNf70yi63VMNW4pq2csWti/PabyDrYcnt1eRtTA1Kgw
         qkNzEtGjbKmAYyD7eK05R7IGZPAKgHwAhSZMb/1AJsmugsz8eVqulcRPFDSUE+P9QMse
         NsNGS4pnmcakZygz/wt1kU6EpEh3vT9WddFMsDuhlS1pn1JXPmvKx/EkH+tDNs5/kwL+
         /wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UROC5uvy/pRDRtev5ApXcVyx7axSfteZjS9YrXtJFCg=;
        b=GoiE54M6kf3E8Z3YxRqOB4Gp9ADJn1moZyPf4Pd0+g3SXIhoTaSIy6oy2Eo7+s3td7
         91idmJ11sMPFH+DpFfhDgE3KYGfihvT2QdSBCMkHA/bt2W7kN6ZZXMg0Dm1r86VdBa2Q
         /BKLzP+DFzR1bDQvbe9zuJJ17JP/+I7GS5Dca4BfiRjJ79J2/FK3/RCAjngGUv2utWQj
         Jwdy0cNoIIsdEGCCU91pseRF1jy7idl9PiuNmb+9CWFQWbs9PT5f8IT3fwhAWbn61yXu
         0+8KEvxIZFmc5bKW1E4UiOH9AXlm55PsOt5ZspeJPgkty1YbVF+6yUvkxV6jEgEVGHYk
         vVSw==
X-Gm-Message-State: AOAM53116utPDJKhvsxDylDqUXuXtAXPihEdQISjZ76UugRyMpK7N1Jd
        aEoFZMr2Md7Fj94in3pPoZw=
X-Google-Smtp-Source: ABdhPJzKU1GA7XKMyqBcfL+Hd9QULAao97HjUtYVZZhtNrs5EC2f+nk7ErBbaSR8IStpOHzgjBj5YQ==
X-Received: by 2002:aa7:9e8d:: with SMTP id p13mr2384617pfq.32.1596040893272;
        Wed, 29 Jul 2020 09:41:33 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id m6sm3222051pfk.36.2020.07.29.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 09:41:32 -0700 (PDT)
Date:   Thu, 30 Jul 2020 01:41:30 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     peterz@infradead.org
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200729164130.GD1160@jagdpanzerIV.localdomain>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <20200729124744.GC2638@hirez.programming.kicks-ass.net>
 <20200729125144.GA7184@gondor.apana.org.au>
 <20200729130000.GA2655@hirez.programming.kicks-ass.net>
 <20200729132849.GA1160@jagdpanzerIV.localdomain>
 <20200729142813.GD2638@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729142813.GD2638@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/07/29 16:28), peterz@infradead.org wrote:
> On Wed, Jul 29, 2020 at 10:28:49PM +0900, Sergey Senozhatsky wrote:
> > On (20/07/29 15:00), peterz@infradead.org wrote:
> > > On Wed, Jul 29, 2020 at 10:51:44PM +1000, Herbert Xu wrote:
> > > > On Wed, Jul 29, 2020 at 02:47:44PM +0200, peterz@infradead.org wrote:
> > > > >
> > [..]
> > > > > Anyway, the patches look sane enough, I'll go stick them in
> > > > > tip/locking/core or somesuch.
> > > > 
> > > > Perhaps add them on top of the other two patches in locking/header?
> > > 
> > > Can do,
> > 
> > locking/header would be better
> 
> Done.

Thanks a lot!
I'll run some cross-compilation tests.

	-ss
