Return-Path: <linux-next+bounces-6820-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE805AB9C88
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 14:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF33C16D8F0
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 12:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2C423E336;
	Fri, 16 May 2025 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuPRmAst"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A6235063;
	Fri, 16 May 2025 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399529; cv=none; b=ICjgqjDQUiKO+To/S/ZrXgZOgQuY2yYgJT0w7AUcuL8n1alOLPVXkzKk4fh1PYPdSfNyeM7A33vqQG70BhMpnvsYnPJj3Rr7yEC5utGspqI9+2DUSwPhNzrsW5SOYT4RJJYeJnwrKPsRw+dzjtLlhizX87gnCV1NAoj15dNq6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399529; c=relaxed/simple;
	bh=HN/cEFYSAkwYOh3KG420fFqyI8rF0kMcULOE6KLhcdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWKKGHneYZFxui2nPNs4sgqcAxR+3aezbtWsl0KfVUAigeeNVmlUoU4EcSOmwpab6A0pyISOsxCZQS2D4wtbhIZWbEdZYF49gpRrKq6fPy5gZrB5lsyKlENsL+vvaoNEAZiBOnORJENUZP3mPFtj59WfgKaPIjBpr0oKfc9Z17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuPRmAst; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8198EC4CEE4;
	Fri, 16 May 2025 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747399528;
	bh=HN/cEFYSAkwYOh3KG420fFqyI8rF0kMcULOE6KLhcdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuPRmAstxD0Rub9/WaCDOIHCdajRGj6CPPaIRkt5DvfGDVSFutxEH8RjkbnqnEJm8
	 0N0rPUk5jK0pZNsEA3vidfUQFY+3TQZSvcybub7R1hJW88ipKNjvu5aebIRqr9+zOy
	 XloQ733qM7MAYAc81yQcUX+VFFmPX+dstOgpSiCK8G4RW2fEhnsjXX1GK4qRn91TX3
	 63FeIoa4AGqg2W+8NisUtR4O6g0r04q/Z/vMyFvS/wybLoWtEvT5WYJrk7WOaE+cTg
	 P90OyVWkggwcKgoxY+w9p3nmqjqJ3XOJJmqkPD1GjdlKmoDxY1rHGrN6fDPpXZomCp
	 JHLfSRDidozRw==
Date: Fri, 16 May 2025 14:45:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aCczY_fGsIjl0wlu@gmail.com>
References: <20250516161541.0cff29b8@canb.auug.org.au>
 <aCbvO5Q0B3yYxji4@gmail.com>
 <20250516195446.1331ac06@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516195446.1331ac06@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Fri, 16 May 2025 09:54:35 +0200 Ingo Molnar <mingo@kernel.org> wrote:
> >
> > So I don't think the <asm/cpuid.h> change is needed - the header still 
> > fully exists:
> > 
> >   starship:~/tip> ls -lh arch/x86/include/asm/cpuid/api.h arch/x86/include/asm/cpuid.h  
> >   -rw-rw-r-- 1 mingo mingo 6.1K May 16 09:34 arch/x86/include/asm/cpuid/api.h
> >   -rw-rw-r-- 1 mingo mingo  149 May 16 09:34 arch/x86/include/asm/cpuid.h
> 
> That change is in the tip tree and involved in the conflict, so I 
> just used it as it was in the tip tree.  This is normal conflict 
> resolution.

Yeah, indeed. I was somehow under the impression that there was a build 
failure - but there wasn't.

It all looks good, sorry about the noise!

Thanks,

	Ingo

