Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A2D1DF540
	for <lists+linux-next@lfdr.de>; Sat, 23 May 2020 08:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387622AbgEWGqq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 May 2020 02:46:46 -0400
Received: from mail.skyhub.de ([5.9.137.197]:48950 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387612AbgEWGqp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 23 May 2020 02:46:45 -0400
Received: from zn.tnic (p200300ec2f1b960084fca2944bfbd32f.dip0.t-ipconnect.de [IPv6:2003:ec:2f1b:9600:84fc:a294:4bfb:d32f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7B6771EC0322;
        Sat, 23 May 2020 08:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1590216404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=mjUjsegmvcQg4u0dywhJ/yTV9Lh8VueAxwVooMoA3RU=;
        b=HH7ZSBGa13XLAHMq09BzwawT3y36ZWabw46h9nhXz+VMcuVWFs61TRXrydjjvcpqHF9l39
        VX5jPF3zWudPY8+xAa6exbgsRLFUSRvTvuG8ocGSxw30/rpUPUC/fBDCBB1HBFn8YPudsg
        vjcVCxjMwxj4mkp1B82gukUtSgKLpjc=
Date:   Sat, 23 May 2020 08:46:43 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        elver@google.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200523064643.GA27431@zn.tnic>
References: <20200522033119.1bbd99c5@canb.auug.org.au>
 <20200521173520.GL6608@willie-the-truck>
 <20200522171708.5f392fde@canb.auug.org.au>
 <20200522174944.1a1732fa@canb.auug.org.au>
 <20200523001223.GA23921@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200523001223.GA23921@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 05:12:23PM -0700, Paul E. McKenney wrote:
> Marco, Thomas, is there any better setup I can provide Stephen?  Or
> is the next-20200519 -rcu tree the best we have right now?

I've queued the fixes yesterday into tip:locking/kcsan and tglx said
something about you having to rebase anyway. I guess you can find him on
IRC at some point later. :)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
