Return-Path: <linux-next+bounces-5778-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22165A5E245
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 18:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B82E3B6A9E
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 17:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539761D9688;
	Wed, 12 Mar 2025 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sQWGO+sN"
X-Original-To: linux-next@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF926AE4
	for <linux-next@vger.kernel.org>; Wed, 12 Mar 2025 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741799307; cv=none; b=lx0bPZQXFVOf4Nu0ANKj7/i1TBHWxaWCdlu55yICx9gLZF/BHxcW8vrxQxE3fL2efC8webx8B1L1Niej3jtAQPyW2mlUIACHe5gUTzTKGl/+YCEzcYC5Tbh7mC93RczzDREeXcrbx5PovPgyigysHEneWniWthV0D9yQ+UEA3UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741799307; c=relaxed/simple;
	bh=bPsKMZUNYSyEYPTyDCLCiUGg8XwxLlR+pt/vu1V9yVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2swZthJW3JR075iEg1MF3q/SElTePZKbmCCWJBZRLFfna53PXqxYoPFLfT03kAD7UI1xdYcXhTjZ1fn2RZxGKqpWlF96W3UGD9P/aFyAMuzVBevYRvGEv/FedR/ydYNwj+QhpFMDLtNV3A2G8FhE6Dg3vb8mfH5amvHcPL92DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sQWGO+sN; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 12 Mar 2025 10:07:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741799292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aflXbUBMG7+wwgxQnz4SMxZVe2Y4wHlg9MqggF7eQ18=;
	b=sQWGO+sN7wlgrZ+J/1jbeQmLml931+fGqdcVUO+N4s2hJ7V2/Qm6a65j2ZgyJTrkjUn5ze
	OZ/CH+HWG4XJkpndkQSKKw0Zj1Z/VPOND+b38l9K7zmY9uMDGb5T9k8mizjGtt3+EKz1MD
	pEcL5dLYQPNSB/liX6nQdycb8ZZ/eeY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Will Deacon <will@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoffer Dall <cdall@cs.columbia.edu>,
	Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm-perf
 tree
Message-ID: <Z9G_aKHzs4GFe4O5@linux.dev>
References: <20250312201853.0d75d9fe@canb.auug.org.au>
 <20250312124501.GA6181@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312124501.GA6181@willie-the-truck>
X-Migadu-Flow: FLOW_OUT

On Wed, Mar 12, 2025 at 12:45:02PM +0000, Will Deacon wrote:
> On Wed, Mar 12, 2025 at 08:18:53PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the kvm-arm tree got a conflict in:
> > 
> >   drivers/perf/apple_m1_cpu_pmu.c
> > 
> > between commit:
> > 
> >   c2e793da59fc ("perf: apple_m1: Don't disable counter in m1_pmu_enable_event()")
> > 
> > from the arm-perf tree and commit:
> > 
> >   75ecffc361bb ("drivers/perf: apple_m1: Refactor event select/filter configuration")
> > 
> > from the kvm-arm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/perf/apple_m1_cpu_pmu.c
> > index 39349ecec3c1,6be703619a97..000000000000
> > --- a/drivers/perf/apple_m1_cpu_pmu.c
> > +++ b/drivers/perf/apple_m1_cpu_pmu.c
> > @@@ -396,7 -428,11 +428,7 @@@ static void m1_pmu_enable_event(struct 
> >   	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
> >   	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
> >   
> > - 	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
> >  -	m1_pmu_disable_counter_interrupt(event->hw.idx);
> >  -	m1_pmu_disable_counter(event->hw.idx);
> >  -	isb();
> >  -
> > + 	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
> >   	m1_pmu_enable_counter(event->hw.idx);
> >   	m1_pmu_enable_counter_interrupt(event->hw.idx);
> >   	isb();
> 
> Looks fine to me but I'd also be happy to stick the first two patches
> on a shared branch to avoid this. Oliver?

Agreed!

  git://git.kernel.org/pub/scm/linux/kernel/git/oupton/linux.git perf/m1-guest-events

Thanks,
Oliver

