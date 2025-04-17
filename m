Return-Path: <linux-next+bounces-6292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08605A91AA4
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 13:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA33D7A4100
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 11:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A24123BF90;
	Thu, 17 Apr 2025 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2x1LwMi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237622A7EE;
	Thu, 17 Apr 2025 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888982; cv=none; b=CP+aaq3cd10hgM/Gn3bWAD7FGuJv+rDzTAn7H7kgwepVwmeAekbPbDs4PN/XXpA4Sc9+3k4KAA2A9R1KOua8dCIv2QIZ0Wzd2b7209PMp6JFvOK0T41EqZeUo9ynm4UVsuTEYY3MXJlE7aO6F8MBexG5h8cAftU9l1ZYDVz3Vag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888982; c=relaxed/simple;
	bh=PbvjqwbJ5R0uIQDWP74GCjaHKoHjnobCuzoeS/nLKG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct6g/IyF9KBhZalyHMI02b6LVlM9C5ZgZyp0YDUtJjpnLLci+E2pYWdoSE2lROHf95LvW8eAsmAbnzZKJcSbAXvhmrRXfwW6tjiTuTQs5zK2nwcxy4bHoYfRcAqCVSZFZcnzKFEWUXMORUSmWtQvBydskWT9H8hcRcojmW2lpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2x1LwMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35863C4CEE4;
	Thu, 17 Apr 2025 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744888982;
	bh=PbvjqwbJ5R0uIQDWP74GCjaHKoHjnobCuzoeS/nLKG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2x1LwMij+JNodAIW8ehPjciHNEjSb2rzCehZ9YMuPyGmVEpU5a5+yEWxh0tziEvI
	 at5rULM+cUN6GZ1qlfx7fFkuImCzm3k+zfJcnOkWsMMPwm7BTCIvlGxxaJSE6fp9vK
	 7eXtVvHIKTLVT5SyK+4vB5L9GCRjQdhi8EsMqSZVnLnxzVuZ8Kxa/n3GHX9+dnGCDo
	 Xhj3IK0IxmDATSTIJYTIgW4djhnJzI7Il8b6dUf/DWqJkg2Lj6YixAVKqKT/GFHE7V
	 7x1S9MynS8urKGMEDjBhO3+GNaSNMtrIxTQkWoyzCFQUAFN/WjLhk+ioOwkNmMBpSu
	 exxxGQ0DScGcA==
Date: Thu, 17 Apr 2025 13:22:57 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aADkkQMPfVkTWmxE@gmail.com>
References: <20250417134312.6892d237@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417134312.6892d237@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/cpufreq/acpi-cpufreq.c
> 
> between commit:
> 
>   395b8b5c8f67 ("cpufreq: ACPI: Don't enable boost on policy exit")
> 
> from the pm tree and commit:
> 
>   78255eb23973 ("x86/msr: Rename 'wrmsrl()' to 'wrmsrq()'")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

LGTM, thank you Stephen!

	Ingo

