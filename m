Return-Path: <linux-next+bounces-6808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89649AB96F0
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68E7E1896546
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 07:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BAA22A4EF;
	Fri, 16 May 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCGEQZ3R"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8D621ADC6;
	Fri, 16 May 2025 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382081; cv=none; b=rlyIIXUjVWBlWoHCYmRMIQiuipbCZNinhDDwrTD9cEwsxJ2i3IwcckU7Mc75HgxjYLcM9eEdKFg27/JaCdojAs6l6+VE+jjRCRe7Mv8XlWXWYHSWU3pE7KwrsfSTFyGwtxMM+WJBFPqZ4T+YHhnaeu8GUWCCWl4V2U+JggTOsJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382081; c=relaxed/simple;
	bh=YSfKbVIwu+plTobu2WYKYnvMg3HxLlYHFzSqEGbrl5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLz/RVmAOtjQzxV6ANjzVJRVvg5/ggz2c1DLuSPQhuHYevccPz9ajeMxuXa9ANry1zbI5JZZ3OgN4nD9ko+rgWTzmbx/aDqLPCf1kWOBrSDcxDoRQmKIXlmRhy/bhXbJ3RpooPRgR059Fd0AsitBnKOdNTtnV/CBjkRNJO6RPFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCGEQZ3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2907AC4CEE4;
	Fri, 16 May 2025 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747382080;
	bh=YSfKbVIwu+plTobu2WYKYnvMg3HxLlYHFzSqEGbrl5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCGEQZ3R4xBnG/qpktNbb559KyutB+p2jB0QbMZCILVVHQlEwItbEwy/6xXdebMfH
	 r/eZJ/QFNrUs3YjEXbZBmnOv8mi7vfs7RsPbIcOdCpakJWxztEE2TBM/UMxpI+ejBm
	 JPh2KY7HXIiXZPOE69bcj8VN2oS5i61m27OL+EOXHoaUxAXSQ9WDtKapebOiIBv29T
	 bdVo12fLIPXme7Tc9iy+UEdE0Zb5+CcznELOq23v6tdTUsZZ9sbsRi6o1/+PMb1EFl
	 iIw+OwkydtpPtlMobipbcwUBmXjuumIafJ/hqxDV6Huzf2B4i02hs8GyMiwX/6IokS
	 neW62ogPVTjyQ==
Date: Fri, 16 May 2025 09:54:35 +0200
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
Message-ID: <aCbvO5Q0B3yYxji4@gmail.com>
References: <20250516161541.0cff29b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516161541.0cff29b8@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/idle/intel_idle.c
> 
> between commit:
> 
>   6138f3451516 ("intel_idle: Add C1 demotion on/off sysfs knob")
> 
> from the pm tree and commit:
> 
>   968e30006807 ("x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
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
> diff --cc drivers/idle/intel_idle.c
> index 3292bf74e3c2,433d858b7be1..000000000000
> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@@ -52,8 -51,7 +52,8 @@@
>   #include <linux/notifier.h>
>   #include <linux/cpu.h>
>   #include <linux/moduleparam.h>
>  +#include <linux/sysfs.h>
> - #include <asm/cpuid.h>
> + #include <asm/cpuid/api.h>
>   #include <asm/cpu_device_id.h>
>   #include <asm/intel-family.h>
>   #include <asm/mwait.h>

So I don't think the <asm/cpuid.h> change is needed - the header still 
fully exists:

  starship:~/tip> ls -lh arch/x86/include/asm/cpuid/api.h arch/x86/include/asm/cpuid.h
  -rw-rw-r-- 1 mingo mingo 6.1K May 16 09:34 arch/x86/include/asm/cpuid/api.h
  -rw-rw-r-- 1 mingo mingo  149 May 16 09:34 arch/x86/include/asm/cpuid.h

And the <linux/sysfs.h> addition is probably a build fix for the PM 
tree? The <asm/cpuid.h> header's indirect header dependencies did not 
change. Should probably not be carried in -next, as this masks a build 
failure that will then trigger in Linus's tree?

(Unless I'm missing something that is.)

Thanks,

	Ingo

