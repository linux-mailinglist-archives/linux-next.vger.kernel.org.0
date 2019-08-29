Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D613FA1AAA
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 15:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfH2NFA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 09:05:00 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58280 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2NE7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 09:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AErEWstWk9AqOWm/GPKA3AadpNtUjz4m9BVSetCYmeU=; b=IY0+mtQkGxyw/kjhqsb4hVAjI
        JflNvdzMQBcyyvehFneIEhId0CPFnnqLuQOaBP1BsWnEHR1hH190fTN7T7otVOjtjLTiCy0iWaBa8
        Xzwt1m5fX11ndKtEqI+tH6nhuGaBHHetbvVi3gvPlwkLf+bwiLLmbO2ylU00ddMhcE74yYHjwbmPY
        CrMOnNusfu0V3Do0XLgogo6NblYyZ7DzdeRj4DcR5+/NoKZgZ4vgK06vBg1MxAQnjULrjYY7JbuKB
        W+20GqOZ93ysPtKj2mZdl5Va1gu/v31Q8grDG0ATwxjmvmVCEhXTnShkU8kQai+1GiwxONcVURGdI
        5MmDbmgDA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i3K6Z-0002iw-IF; Thu, 29 Aug 2019 13:04:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F33B6301176;
        Thu, 29 Aug 2019 15:04:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B586A20CB9FE3; Thu, 29 Aug 2019 15:04:45 +0200 (CEST)
Date:   Thu, 29 Aug 2019 15:04:45 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mac Chiang <mac.chiang@intel.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20190829130445.GT2369@hirez.programming.kicks-ass.net>
References: <20190829162012.36ac9d7c@canb.auug.org.au>
 <20190829074644.GL2369@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.21.1908291422520.1938@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1908291422520.1938@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 29, 2019 at 02:24:24PM +0200, Thomas Gleixner wrote:
> On Thu, 29 Aug 2019, Peter Zijlstra wrote:
> > On Thu, Aug 29, 2019 at 04:20:12PM +1000, Stephen Rothwell wrote:
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Thu, 29 Aug 2019 16:08:49 +1000
> > > Subject: [PATCH] ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_MOBILE -> INTEL_FAM6_KABYLAKE_L change
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  sound/soc/intel/common/soc-intel-quirks.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
> > > index e6357d306cb8..863a477d3405 100644
> > > --- a/sound/soc/intel/common/soc-intel-quirks.h
> > > +++ b/sound/soc/intel/common/soc-intel-quirks.h
> > > @@ -36,7 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
> > >  SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
> > >  SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
> > >  SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
> > > -SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
> > > +SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_L);
> > 
> > ARGHH... rebase again?
> 
> No. This is a conflict with the sound tree which added the MOBILE
> thingy. So what you could do for now is

Yes, SFR clarified that. This is a case of me doing email before waking
up.
