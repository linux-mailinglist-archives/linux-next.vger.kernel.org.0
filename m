Return-Path: <linux-next+bounces-6065-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92316A74653
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D7F1B60E3F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9C4213255;
	Fri, 28 Mar 2025 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="M89brH9e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JlS2jm1o"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CEF12C7FD;
	Fri, 28 Mar 2025 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153999; cv=none; b=oqRTpZTb6fm2i5KuO9JbwFhS+ixuTF+47fcXrXrdKa+k/Xw7FplXRs/VXP5pN9G718+Rm0mayzEkKZTtFRjwoCiXnSFWMKIRpAS8G7ET7FxgNI8pBvHyuADEr5N6RNmK1MT8Tlt4vBeLA/WrURbHT9UrGHmPOTRPbAf5KsJ7X28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153999; c=relaxed/simple;
	bh=5u3ml2HokjkpBSrVhmMhT/UIM/NCeqaUOaZDcxtw1h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7rfB3WBFX2tVl5NtKjeJmD+rxECLRKq08b/cZXgXvn8oqZUviUauYbhmQovUyo8EYCJFjeFq+gEqDcmiPs9jlSRn+sMqw3FNd6bhfHJDW8FXTOkHOoth5CMNUGLpPOw8qbSQHCMOyLdXBWHFpejBjtsiuYOfq/VY/2Qx62dNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=M89brH9e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JlS2jm1o; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6B4B825401C7;
	Fri, 28 Mar 2025 05:26:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 28 Mar 2025 05:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1743153996; x=
	1743240396; bh=0BoQIsG8DFsOqOY9VFH0ybGSQtxoGyEOXQ6yFqi2JGQ=; b=M
	89brH9eZqf/FqcGsr5lai1BTGsq34R3XOCArLIo9X5BJJRNUNcyrIyulB3AWW1xz
	QiD9sRr4nQ4TfkrqVwLXWlJaLpzZZKgbUy2r7osg/CdBEG6YiCAUKjeXbdXdFVzF
	yAXFj3OosVEt9fOpY479dJAtc4Ms4je5dAXC96rMispE3j03KgcVNtGrfxa1zOJn
	KlUztzHzpJu0nyl/pKD+VrecNWmJLvktXnd+U6AMucjcvjwVFti2+YWUaE8VQ/Wc
	mSjzOwk+3GjNUusNHAbohbbmKh+O9MxAW74ga09XTh0XPGI+nBkOVDadFz+OY7fR
	qazxjcTxr4Re2Ll+RQe6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743153996; x=1743240396; bh=0BoQIsG8DFsOqOY9VFH0ybGSQtxoGyEOXQ6
	yFqi2JGQ=; b=JlS2jm1olS7TMfHTMUccL8b95vxoCmNGL4wbQ2o9Ter/V7c66QT
	ln2QT0yqKfdjLK5Q4t1Wx1YHXE4nt3fGs5v47/3KPpdkxWQn9JjmRz3By0GBnQUX
	84V8+GIJZpJXVK+ZfMf5AsAXH+WOl19jqlKjk5E3toOYOQAJYi7IMDHH3HlteFJO
	WK1xFosHLBvdIeOoBuh+Jm6HLFqrldJqWkhupGV1gF5qHQCuo1g4V07MqZsTQMKf
	enqRDCuxyPMfxuyPLe0Oje798YEqdMYtIUqEN6kPzCLr8uBCoAT1RyTr5XOKbewk
	MZOSGBz/dIL+NIT82cMo9fzEkCZ3iDa2w7Q==
X-ME-Sender: <xms:S2vmZwW3cT66Sm41nA2unmsYUeUN3BnuXyFKUIsPBxC2nsSWaHEzQw>
    <xme:S2vmZ0mHaxcUACSf-axbnYUnoeTq_MsngwcRgtSWnOgh2qvRMBTsc87He5xOy9PbA
    Ve1ggsVVd7JsEwhS58>
X-ME-Received: <xmr:S2vmZ0aIAJENU6-qM5VPzlmYvd5aVXrnMPAw9WjhWoMDvgBRM54JHNH0svq_sNu8Qeganw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoshhtvggu
    thesghhoohgumhhishdrohhrghdprhgtphhtthhopehkihhrihhllhdrshhhuhhtvghmoh
    hvsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhlvghn
    uggrtghkhiesrghmugdrtghomhdprhgtphhtthhopehsrhgrihhthhgrlhesrghmugdrtg
    homhdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohep
    phgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhpohhimhgsoh
    gvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:S2vmZ_VVFNFO8XhKjfytcNaV1ARYvdH8RmVKqMEt_VtxL61a3KQPvg>
    <xmx:S2vmZ6l7AjurdePQaxIeW0zt4Olmg1Qce80SBfsIDKh7Bbv6cgCeWg>
    <xmx:S2vmZ0cZ22lhVC3uy74OSI6X-x9Wjl1WkT05ME6kO0AlGznZmVypKQ>
    <xmx:S2vmZ8EeET3tom414C1cKKW6uP8A2Obm58CDISdOOrtR-BN8j_YaAQ>
    <xmx:TGvmZ8cLlumjDPESCPqhSLjAQVjaM1SptJ4uNlMUC7vJSxplfKioneEJ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 05:26:31 -0400 (EDT)
Date: Fri, 28 Mar 2025 11:26:28 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Aithal, Srikanth" <sraithal@amd.com>, Jason Baron <jbaron@akamai.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <wl7m7xtqg6ftqmkyaabtzsk7lkhxnpkinyehwy6eokvwkfklzi@m6chqm3rht2u>
References: <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
 <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
 <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com>

On Fri, Mar 28, 2025 at 10:17:16AM +0100, Ard Biesheuvel wrote:
> On Fri, 28 Mar 2025 at 10:09, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > On Fri, Mar 28, 2025 at 10:28:19AM +0200, Kirill A. Shutemov wrote:
> > > On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
> > > > On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> > > > > On Thu, 27 Mar 2025 16:43:43 +0200
> > > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> > > > >
> > > > > > > > The only option I see so far is to drop static branch from this path.
> > > > > > > >
> > > > > > > > But I am not sure if it the only case were we use static branch from CPU
> > > > > > > > hotplug callbacks.
> > > > > > > >
> > > > > > > > Any other ideas?
> > > > > > >
> > > > > > >
> > > > > > > Hmmm, didn't take too close a look here, but there is the
> > > > > > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > > > > > the caller may or may not have the cpu_hotplug lock?
> > > > > >
> > > > > > Yes. This is generic page alloc path and it can be called with and without
> > > > > > the lock.
> > > > >
> > > > > Note, it's not the static_branch that is an issue, it's enabling/disabling
> > > > > the static branch that is. Changing a static branch takes a bit of work as
> > > > > it does modify the kernel text.
> > > > >
> > > > > Is it possible to delay the update via a workqueue?
> > > >
> > > > Ah. Good point. Should work. I'll give it try.
> > >
> > > The patch below fixes problem for me.
> >
> > Ah. No, it won't work. We can get there before workqueues are initialized:
> > mm_core_init() is called before workqueue_init_early().
> >
> > We cannot queue a work. :/
> >
> > Steven, any other ideas?
> >
> 
> Why is the use of a static key required here?

It is not required, but nice to have. We don't want extra conditional in
page alloc path.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

