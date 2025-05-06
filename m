Return-Path: <linux-next+bounces-6552-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15507AACC6E
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 19:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0349D1C07052
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 17:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A8E2853EE;
	Tue,  6 May 2025 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTm3H1Tn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED94284688;
	Tue,  6 May 2025 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553400; cv=none; b=juFnX39VLwGCN1vlBSN+1TV8l/fGy1W+/wz07WWTZjiVCi8vI/lnttult7q7cnmPWVsKKtQDvXhZWaFlqUqOpqmID/b2U42IV+z0ZIJl4cgwSezi8uQzMlb4+kVxHJEvKg1WaeyOYlppu/WEY3bsRlv+F/ztmVPKveGaVs11z2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553400; c=relaxed/simple;
	bh=CRthFCPhXNLTuBI+2jWNK26SYqt8KMUsO9ao51g0fhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuJuleIy8xrVEoKXCNv1Q5eCFnO8bPL3MfGygANb+VS6E8H0WA4ffz/AyJYU6apn80/KOgw1cH5eBmUWFewiuySBNiZyvssggJMhQAdaWqXzdzgoewqa+zqj3rzIheTMbejeKh4qdExYQe3T5w8pHEZDpK+tZeB0pUYZBtjDsLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTm3H1Tn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C3AC4CEE4;
	Tue,  6 May 2025 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746553400;
	bh=CRthFCPhXNLTuBI+2jWNK26SYqt8KMUsO9ao51g0fhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTm3H1TnBz6POPh+UjIekX4fvLjPp1pHU5Bj8rzdbNw0P8FAanGvaHu7scGfGqbdU
	 v1HwrDhmoVAVThiof+tyRBf6+yCqAk335BOlC6+QVm5I4sSOdNSzaW/4t1eLw0L4Lr
	 YgZdu6Emf4q8OwxQPwq6kybnOXa087rhzn959U695gO1Er+bi+rah6GkqDSJzxIDAb
	 +WhRmaahNVFHzicsfHvSNalqGsiCH8tPQsuRwtILuPdvgqGRIHKSpgaAVJbkY7A2p2
	 I3Rvfsvr+iHNyzMu1zQTS4AshDpRs2WTRwiik8Uz5q/ahPDohtty0F+34+nwFQPtu6
	 jHt5XgJLsjLRA==
Date: Tue, 6 May 2025 19:43:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aBpKM62SYYW_B6Nx@gmail.com>
References: <20250501135827.214fac1f@canb.auug.org.au>
 <68b54a90-b87c-4b74-a24d-0faaf0f76e2d@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b54a90-b87c-4b74-a24d-0faaf0f76e2d@intel.com>


* Wysocki, Rafael J <rafael.j.wysocki@intel.com> wrote:

> >    ac4e04d9e378 ("cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode")
> 
> This one has been merged into 6.15-rc5.
> 
> 
> > from the pm tree and commit:
> > 
> >    c435e608cf59 ("x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'")
> 
> So this one will clash with the mainline now.

Yeah - and I resolved it in tip:x86/msr:

  commit 570d58b12fbf7bae0ba72d929ccf914a4df5ca7c (HEAD -> x86/msr)
  Merge: 502ad6e5a619 92a09c47464d
  Author: Ingo Molnar <mingo@kernel.org>
  Date:   Tue May 6 19:42:00 2025 +0200

    Merge tag 'v6.15-rc5' into x86/msr, to pick up fixes and to resolve conflicts
    
     Conflicts:
            drivers/cpufreq/intel_pstate.c
    
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

So all should be good at this stage.

Thanks,

	Ingo

