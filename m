Return-Path: <linux-next+bounces-6050-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05309A73C9E
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 18:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33BBC1894E94
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 17:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0400518CC15;
	Thu, 27 Mar 2025 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mj6XjsGU"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D1EEA9;
	Thu, 27 Mar 2025 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743097167; cv=none; b=h2Z1ltT03LffI84x/AZJBLU/X2N7nZMIjJ2qH7knsMZ6JeJqG9CsiPkj5Pi8lYyhS/TILNr2GI5TWLJpTDOnvW24X1uOPoYl2OMC/Weeq3cHvcZBHwDAMNk6Vd6+iyk+bR4dfroUJfQffXIxJ3gzeJZ7g2TJ1nwp1ZZcWB2mFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743097167; c=relaxed/simple;
	bh=evmMiw5Rj6LlD7Hh9x0JPX57yUywP7qwjJizMGzMUmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZoepGi4EAnCLikstNc0ZyDz2h8xDPmJpUqZcmPeTUXRwVo1JuZzHM5br7y8krRRVPYyVlzui6Uc6qBH0r8kOB8PYse+PxwPeBWWrUFpHARkUKX2gMD54Jjt4rIlDfVNYY1MoIO9iDSIa9XnB8rxQBJrFr0ozAPJrIO9wPfyMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mj6XjsGU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743097167; x=1774633167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=evmMiw5Rj6LlD7Hh9x0JPX57yUywP7qwjJizMGzMUmk=;
  b=mj6XjsGU9VCU2RHmLtsTSyhb1H+EU52Di7jsV5yf7CJn/s3ELNJ9QcKP
   QMuXgoV29D5K+F5NKm3fEWmdfWNqV5yI0uGUbB6UdbprH3li0CQZa0T3K
   vF4BUejJoTiy2eRoaVCVpnYhuLIg0jcheLxPhrxa9NxUfmHLIgT9M4udj
   +Y9WhPrC+taIJErLqaOOVYhkSsl3ofl40OefCJ6L9t1eScpVnBxWPzjY+
   eYogeaYh+K6QfMzlckReE0Zre6lKRSMOQ5JriDuotP3tcja5A1YYZLXJ/
   dJo3O55P92xjELYJ3uTUWYYbUquZFrRV9JAd7y0Pn/MhROLgarQf2eSBc
   w==;
X-CSE-ConnectionGUID: fBVG52l7TyKod4H4ZefYkw==
X-CSE-MsgGUID: LUzF4aaMRL6XdD7H91ii8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61842382"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="61842382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 10:39:26 -0700
X-CSE-ConnectionGUID: WfgDtGHeQdeeRiO5cAgMYQ==
X-CSE-MsgGUID: dXXeMGE2TbCnzP3PwYJlMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="124958332"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2025 10:39:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id CD4FD1AE; Thu, 27 Mar 2025 19:39:21 +0200 (EET)
Date: Thu, 27 Mar 2025 19:39:21 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jason Baron <jbaron@akamai.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Aithal, Srikanth" <sraithal@amd.com>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327110224.68c69c78@gandalf.local.home>

On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> On Thu, 27 Mar 2025 16:43:43 +0200
> "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> 
> > > > The only option I see so far is to drop static branch from this path.
> > > > 
> > > > But I am not sure if it the only case were we use static branch from CPU
> > > > hotplug callbacks.
> > > > 
> > > > Any other ideas?  
> > > 
> > > 
> > > Hmmm, didn't take too close a look here, but there is the
> > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > the caller may or may not have the cpu_hotplug lock?  
> > 
> > Yes. This is generic page alloc path and it can be called with and without
> > the lock.
> 
> Note, it's not the static_branch that is an issue, it's enabling/disabling
> the static branch that is. Changing a static branch takes a bit of work as
> it does modify the kernel text.
> 
> Is it possible to delay the update via a workqueue?

Ah. Good point. Should work. I'll give it try.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

