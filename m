Return-Path: <linux-next+bounces-5590-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C61A47D77
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 13:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03A453B29FF
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 12:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3B922D4C5;
	Thu, 27 Feb 2025 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GP2codip"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E0270040;
	Thu, 27 Feb 2025 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658707; cv=none; b=MCRx6zAa96KCaeh21QNGDIx3ERdfDsVSH2dYYagDc0+bVpiWFdtSiM740snGF/VA7fwlyTe5wIChNWLxHEgYICjmlY13PbPR05kg/Zt1Q/rSQn5hgs8G9NAO8E8Emmo655y3CLM6TdDSUtH2jU0KAk7gB9B+/+J0XPibtqWZkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658707; c=relaxed/simple;
	bh=Y/2H0VwlBRrkxH+JvTo6LrgmHk1fi1vhR22rgXq1cmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+3a9qpJM9neOcMeW9/yvtzTnAvQDaOmpGAphU7b0n+KK+bZIix4X2a3ohwR4xY+1YJ5TLdtBn0z2cT/vPuR5VCSYyp308wwWgR+ED/xysDQGGIHKLoZT9k9NsPVMhPhXALeYyLw3HvCcFzWmfktIsT+k/jN5cAHRptlCnlkeqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GP2codip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB38C4CEDD;
	Thu, 27 Feb 2025 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740658707;
	bh=Y/2H0VwlBRrkxH+JvTo6LrgmHk1fi1vhR22rgXq1cmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GP2codipxrHYBkhNHC1/K/xNkUFRxPiKB9xFfqguhzRiQko+9FFUxls3xjTDm/7Rr
	 blonfpL1d4l/yKhYcJdllZsvs6WFZ/worPwKbXgM6AmNG+IroyZF5ml2UfN08d/gs5
	 rT14F/fWKR1G+ouKjTjOdxQRH7lIuMqNIvc0Ov78bPy1SOl63fXKqZHM2AMdYJJp9t
	 w1CRlHQ+wbAsqzjAV+hDKU4DOorXG/Yfz3RlO5xG5NqOK/MT6l/tvVIQEuDN2MFyTU
	 n1Wx+4os1QBdE55Qnr0cOavFfnJQMYNSLS7tLlqoVEqZYrynJOatA5JgmHItU1uh0l
	 1ZwqeKdXSL0Ow==
Date: Thu, 27 Feb 2025 13:18:18 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Kaixiong Yu <yukaixiong@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the tip tree
Message-ID: <skkjdjse5q7wgwwfqzkgcfb7ewcrlsn7hbqmdf333bcwbbpgak@j4hwc7iidkqh>
References: <20250224170310.41c8611d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224170310.41c8611d@canb.auug.org.au>

On Mon, Feb 24, 2025 at 05:03:10PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sysctl tree got a conflict in:
> 
>   kernel/sysctl.c
Yep, 8aeacf257070 got picked up by the tip robot. I was expecting a bit
more review before this went in, so I did not bother rebasing it on top
of next.

> 
> between commit:
> 
>   8aeacf257070 ("perf/core: Move perf_event sysctls into kernel/events")
> 
> from the tip tree and commit:
> 
>   dccf3c99febf ("sysctl: remove unneeded include")
> 
> from the sysctl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
Thx for this.

> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/sysctl.c
> index 635f5e829fe8,eeb4cba12190..000000000000
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@@ -54,7 -47,7 +47,6 @@@
>   #include <linux/acpi.h>
>   #include <linux/reboot.h>
>   #include <linux/ftrace.h>
> - #include <linux/oom.h>
>  -#include <linux/perf_event.h>
>   #include <linux/kmod.h>
>   #include <linux/capability.h>
>   #include <linux/binfmts.h>
I see that linux/oom.h was removed from kernel/sysctl.h. This was not
part of any of the patches but it is the right thing to do. I'll make a
note of it and make sure to remove it if it comes back

Thx again.

Best

-- 

Joel Granados

