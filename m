Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE16A288742
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 12:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387921AbgJIKrQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 06:47:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387848AbgJIKrB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 06:47:01 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA82D22277;
        Fri,  9 Oct 2020 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602240420;
        bh=Gf2W8jYt3DtnBYYucCqJsDpl5G5pvyAUr06Pl+n+E3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YChSfeUOmVMAK6nZghBlMUuFS73LrlG9zAQcAvvWJmXSPMQkp3rgLqTWhZHjgM+hB
         C+zDovAXy4KE5fNZPFQf2HhJKr0f02+HQWwbbYyLjRx6E2laNW0/15j3Kv76rzvv/3
         MTNsIoysrxX2WCgosDIRzeSR9R0POe01dSw9f2Zs=
Date:   Fri, 9 Oct 2020 11:46:55 +0100
From:   Will Deacon <will@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Qian Cai <cai@redhat.com>, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] arm64: initialize per-cpu offsets earlier
Message-ID: <20201009104654.GA29783@willie-the-truck>
References: <20201005164303.21389-1-mark.rutland@arm.com>
 <711bc57a314d8d646b41307008db2845b7537b3d.camel@redhat.com>
 <20201009085115.GC29594@willie-the-truck>
 <20201009094318.GA87530@C02TD0UTHF1T.local>
 <20201009102438.GB87530@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009102438.GB87530@C02TD0UTHF1T.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 11:24:38AM +0100, Mark Rutland wrote:
> On Fri, Oct 09, 2020 at 10:43:18AM +0100, Mark Rutland wrote:
> > Hi Qian,
> > 
> > On Fri, Oct 09, 2020 at 09:51:15AM +0100, Will Deacon wrote:
> > > On Thu, Oct 08, 2020 at 09:18:24PM -0400, Qian Cai wrote:
> > > > On Mon, 2020-10-05 at 17:43 +0100, Mark Rutland wrote:
> > > > > The current initialization of the per-cpu offset register is difficult
> > > > > to follow and this initialization is not always early enough for
> > > > > upcoming instrumentation with KCSAN, where the instrumentation callbacks
> > > > > use the per-cpu offset.
> > > > > 
> > > > > To make it possible to support KCSAN, and to simplify reasoning about
> > > > > early bringup code, let's initialize the per-cpu offset earlier, before
> > > > > we run any C code that may consume it. To do so, this patch adds a new
> > > > > init_this_cpu_offset() helper that's called before the usual
> > > > > primary/secondary start functions. For consistency, this is also used to
> > > > > re-initialize the per-cpu offset after the runtime per-cpu areas have
> > > > > been allocated (which can change CPU0's offset).
> > > > > 
> > > > > So that init_this_cpu_offset() isn't subject to any instrumentation that
> > > > > might consume the per-cpu offset, it is marked with noinstr, preventing
> > > > > instrumentation.
> > > > > 
> > > > > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > Cc: James Morse <james.morse@arm.com>
> > > > > Cc: Will Deacon <will@kernel.org>
> > > > 
> > > > Reverting this commit on the top of today's linux-next fixed an issue that
> > > > Thunder X2 is unable to boot:
> > > > 
> > > > .config: https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config
> > 
> > Sorry about this. :/
> > 
> > Will, to save you reading all the below, I think the right thing to do
> > for now is to revert this.
> 
> 
> > Looking at the assembly, task_cpu() gets instrumented (which puts this
> > patch on dodgy ground generally and I think warrants the revert), but as
> > it's instrumented with KASAN_INLINE that doesn't immediately explain the
> > issue since the shadow should be up and so we shouldn't call the report
> > function. I'll dig into this some more.
> 
> Ok; that's my fault due to trying to do this before kasan_early_init.
> 
> I see what's going on now. If you're happy to take a fixup instead of a
> revert, patch below. Otherwise I'll a complete patch atop of the revert
> after rc1.

For now, I've reverted the patch on for-next/core and redone the tag.

Will
