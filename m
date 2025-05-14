Return-Path: <linux-next+bounces-6763-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860AAB6272
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 07:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F125617838D
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 05:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCF11F09B4;
	Wed, 14 May 2025 05:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbfTChLH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96B29408;
	Wed, 14 May 2025 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201112; cv=none; b=Yr9dpiUuJMu+8pd5dw11dGus/G5Yyy6qUCoes/LsvMf9hhaHscKKbLt2U5ndA0ql+ZKoSDBu/rACw4J+1sti+vegU4hK0bSLSI1UXy2pa4O1ABakfimg06NMEpl++C4959MgCKD1IyvxrXvNRLQ43m02X0uWXp+GmcBFeV416AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201112; c=relaxed/simple;
	bh=bBe6UezzA95sthwImcSOOnvJzBecVTiVFBKl66TxpGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3kpVvWtn+4plbg7Ss8ZC28Kx413mrkSacfz7iZnIzKkDcjH/mjRy3dBcZXGfvxcclvAoxqe34LiszuE9GZcFT5TO+zg5zlDeYS92VCRSupFi3g8bt0QMfTNkguesyaoUaJAVfUElB5U9NWKDM6tNAn/49c5JSggtBkrGNprIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbfTChLH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58106C4CEEB;
	Wed, 14 May 2025 05:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747201110;
	bh=bBe6UezzA95sthwImcSOOnvJzBecVTiVFBKl66TxpGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbfTChLHFelg1VUZG/kIwUdptM/R5dmkfKNy7t9ghZlEGwsArD6ZZPem3dCMC/3BQ
	 NrBTV9wctZpFaBO5sl81py635w8ErlNz30MG4qmLJvIX9QVopigEy/9MLPF4Irjn83
	 oK4XMLelmwszNs+92ZFOHS/wVt9nPs4oYFAE3b6QfQ6AQGzWevSwiYTV6/VZ/L5+a2
	 EgUxNLlZ1ODk9t/7o6QuLTibr15HmtnVk2PIdMCYwZ7148o7iLaEfl74CGgjjL91ws
	 1Vbd/P55aycnhTMefNifq7Il27+OEiXQrZgniTOnzUsmiqNK7h1QrVSc8zu5ZmfBkE
	 eS03hBhEPRTNw==
Date: Wed, 14 May 2025 07:38:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <aCQsUWpHQCYdM3BR@gmail.com>
References: <20250514152318.52714b39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514152318.52714b39@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from drivers/net/ethernet/amd/xgbe/xgbe-dev.c:18:
> drivers/net/ethernet/amd/xgbe/xgbe-smn.h:15:10: fatal error: asm/amd_nb.h: No such file or directory
>    15 | #include <asm/amd_nb.h>
>       |          ^~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   bcbb65559532 ("x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/amd/nb.h>")
> 
> interacting with commit
> 
>   e49479f30ef9 ("amd-xgbe: add support for new XPCS routines")
> 
> from the net-next tree.
> 
> I have applied the following merge resolution for today.

The conflict resolution looks good to me.

Note that this is not a 'build failure in the -tip tree' per se, but a 
two-tree symmetric semantic merge conflict between the networking tree 
and the x86 tree that must be resolved at the two-tree merge level 
(-next in this case). Had you merged net-next after -tip, it would have 
triggered the build failure.

This two-tree semantic conflict should be mentioned in the pull request 
to Linus by whoever sends their tree second. (Which will likely be the 
networking tree in this particular case.)

I usually mark semantic conflicts the following way in the merge 
resolution:

    Merge branch 'x86/msr' into x86/core, to resolve conflicts
    
     Conflicts:
            arch/x86/boot/startup/sme.c
            arch/x86/coco/sev/core.c
            arch/x86/kernel/fpu/core.c
            arch/x86/kernel/fpu/xstate.c
    
     Semantic conflict:
            arch/x86/include/asm/sev-internal.h
		
Thanks,

	Ingo

