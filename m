Return-Path: <linux-next+bounces-6046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F023A734E5
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 15:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7C2D880F49
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 14:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F78218599;
	Thu, 27 Mar 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BylUKYQY"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C6942AA1;
	Thu, 27 Mar 2025 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086630; cv=none; b=q7lVoQbI41CycZn+KMiaDEeSBO8jfdZLuHbIAODtS3GI4dS0gB3PW66Yna1ScEmYIJ5vKZq+Fol7A8Dpw77QNNG1XalgcUNkpFhHd7fFOPLbshz4jpnv/FXga2NVtfD/P3zkBsGSKbu8TLwotBpBdy6gkbFZj2caFs/SU80A5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086630; c=relaxed/simple;
	bh=DCAF79u1up08eiGVT2oeB4wjCZ6e1FvTPUt2vIG2bq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaBzQjfg9/Yt3dx7mCxibxb53/RPYqSzvHunOw11h76v0wF9Ci9XNeQai8dh4rws5MBKl0KzCM7MENRQFI2SNOgngWKUW4NLbGwBFkiXR2AmkB8jKs7uqinUG7fBFLD0BBwxZTKivWYprng33+Crv7jjoPbI7vOYXO5/SdrGSYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BylUKYQY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743086628; x=1774622628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DCAF79u1up08eiGVT2oeB4wjCZ6e1FvTPUt2vIG2bq4=;
  b=BylUKYQYa2KC2erEF1x4W8tyPSTdi+SW9wia2dKnoL6xaDT/eSHDDu88
   +sS5YzksTwmcviXtUS0othCj70nY7jOhiHwnvBPYjjn61QbS5VxqTNJgy
   HCUQVUe01KGW7DPnVmR77ZSpiO1BAdD8TO9k53p7svMBPNO+435RkfHos
   0uHxa1GyK8FqITpHPQtpkk31+l/JY+jQU3AS4gt4EK+mL8IimL26rwDuV
   FFeIaCCmnMlkFoqV+rvoZmBa5hhPEAcejpTqIDxemc/Q5Av3Feadk108z
   Sm9610SUIvsU5l07FK8HDJ+PJboQyNh1A4Jf6MIK0UiKPwcqi8IeZGcUL
   A==;
X-CSE-ConnectionGUID: uqwtogi0TdynGP2jjQYqOA==
X-CSE-MsgGUID: k0bVP4y+T2aRWN69QAKjVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55424807"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="55424807"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 07:43:48 -0700
X-CSE-ConnectionGUID: sgz+06rIQsKUy9BGNyeumQ==
X-CSE-MsgGUID: gxXZoamgS1OSgd9hyweUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129857313"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2025 07:43:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A3E6C1CA; Thu, 27 Mar 2025 16:43:43 +0200 (EET)
Date: Thu, 27 Mar 2025 16:43:43 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Jason Baron <jbaron@akamai.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Aithal, Srikanth" <sraithal@amd.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, "Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>

On Thu, Mar 27, 2025 at 10:35:33AM -0400, Jason Baron wrote:
> 
> 
> On 3/27/25 10:25 AM, Kirill A. Shutemov wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> > 
> > On Thu, Mar 27, 2025 at 02:58:12PM +0200, Kirill A. Shutemov wrote:
> > > On Wed, Mar 26, 2025 at 05:30:35PM -0500, Tom Lendacky wrote:
> > > > On 3/25/25 08:33, Kirill A. Shutemov wrote:
> > > > > On Tue, Mar 25, 2025 at 02:40:00PM +0530, Aithal, Srikanth wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > 
> > > > > > Starting linux-next build next-20250312, including recent build 20250324, we
> > > > > > are seeing an issue where the SNP guest boot hangs at the "boot smp config"
> > > > > > step:
> > > > > > 
> > > > > > 
> > > > > >   [ 2.294722] smp: Bringing up secondary CPUs ...
> > > > > > [    2.295211] smpboot: Parallel CPU startup disabled by the platform
> > > > > > [    2.309687] smpboot: x86: Booting SMP configuration:
> > > > > > [    2.310214] .... node  #0, CPUs:          #1   #2   #3   #4 #5   #6
> > > > > > #7   #8   #9  #10  #11  #12  #13  #14  #15  #16  #17 #18  #19  #20  #21
> > > > > > #22  #23  #24  #25  #26  #27  #28  #29  #30 #31  #32  #33  #34  #35  #36
> > > > > > #37  #38  #39  #40  #41  #42  #43 #44  #45  #46  #47  #48  #49  #50  #51
> > > > > > #52  #53  #54  #55  #56 #57  #58  #59  #60  #61  #62  #63  #64  #65  #66
> > > > > > #67  #68  #69 #70  #71  #72  #73  #74  #75  #76  #77  #78  #79  #80  #81
> > > > > > #82 #83  #84  #85  #86  #87  #88  #89  #90  #91  #92  #93  #94  #95 #96
> > > > > > #97  #98  #99 #100 #101 #102 #103 #104 #105 #106 #107 #108 #109 #110 #111
> > > > > > #112 #113 #114 #115 #116 #117 #118 #119 #120 #121 #122 #123 #124 #125 #126
> > > > > > #127 #128 #129 #130 #131 #132 #133 #134 #135 #136 #137 #138 #139 #140 #141
> > > > > > #142 #143 #144 #145 #146 #147 #148 #149 #150 #151 #152 #153 #154 #155 #156
> > > > > > #157 #158 #159 #160 #161 #162 #163 #164 #165 #166 #167 #168 #169 #170 #171
> > > > > > #172 #173 #174 #175 #176 #177 #178 #179 #180 #181 #182 #183 #184 #185 #186
> > > > > > #187 #188 #189 #190 #191 #192 #193 #194 #195 #196 #197 #198
> > > > > > --> The guest hangs forever at this point.
> > > > > > 
> > > > > > 
> > > > > > I have observed that certain vCPU and memory combinations work, while others
> > > > > > do not. The VM configuration I am using does not have any NUMA nodes.
> > > > > > 
> > > > > > vcpus             Mem        SNP guest boot
> > > > > > <=240            19456M    Boots fine
> > > > > > > =241,<255   19456M    Hangs
> > > > > > 1-255              2048M    Boots fine
> > > > > > 1-255              4096M    Boots fine
> > > > > > > 71                 8192M    Hangs
> > > > > > > 41                 6144M    Hangs
> > > > > > 
> > > > > > When I bisected this issue, it pointed to the following commit :
> > > > > > 
> > > > > > 
> > > > > > *commit 800f1059c99e2b39899bdc67a7593a7bea6375d8*
> > > > > > Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > > > Date:   Mon Mar 10 10:28:55 2025 +0200
> > > > > > 
> > > > > >      mm/page_alloc: fix memory accept before watermarks gets initialized
> > > > > 
> > > > > Hm. It is puzzling for me. I don't see how this commit can cause the hang.
> > > > > 
> > > > > Could you track down where hang happens?
> > > > 
> > > > Let me say that the guest config is key for this. Using that config, I
> > > > think you might be able to repro this on TDX. The config does turn off TDX
> > > > support, so I'm hoping that turning it on doesn't change anything.
> > > > 
> > > > I've been able to track it down slightly... It is happening during the CPU
> > > > bringup trace points and it eventually gets to line 2273 in
> > > > rb_allocate_cpu_buffer() and never comes back from an alloc_pages_node()
> > > > call. That's as far as I've gotten so far. I'm not a mm expert so not sure
> > > > if I'll be able to progress much further.
> > > 
> > > Urgh... It is deadlock on cpu_hotplug_lock :/
> > > 
> > > _cpu_up() takes the lock on write and starts CPU bring up under it.
> > > If during CPU bringup we accept the last page in the zone, __accept_page()
> > > calls static_branch_dec() which takes the lock again.
> > > 
> > > Oopsie.
> > > 
> > > So the patch itself doesn't introduce a regression, but uncovers
> > > preexisting deadlock. With the patch we accept more pages during the boot
> > > and it triggers the deadlock.
> > > 
> > > Let me think about the fix.
> > 
> > + Static branch maintainers
> > 
> > The only option I see so far is to drop static branch from this path.
> > 
> > But I am not sure if it the only case were we use static branch from CPU
> > hotplug callbacks.
> > 
> > Any other ideas?
> 
> 
> Hmmm, didn't take too close a look here, but there is the
> static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> the caller may or may not have the cpu_hotplug lock?

Yes. This is generic page alloc path and it can be called with and without
the lock.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

