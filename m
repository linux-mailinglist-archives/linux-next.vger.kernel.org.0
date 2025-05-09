Return-Path: <linux-next+bounces-6631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3EAAB0AB0
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 438E49E7AB0
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 06:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E192B238D3A;
	Fri,  9 May 2025 06:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihBMTySM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913A28F4;
	Fri,  9 May 2025 06:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772703; cv=none; b=i57xaurZowQ7yISXcVF7upLvozhsb2aFpPCUkdDfqmoAqN/z4qvvWS2yt7ztfOK0YyES1OgDtwF7tXyOuZxlpgCmQ8vMkxZ2fq6DDLg6Cdr+ISpyFd+/C/ZqIU22XGU/rI4X4LSTCKysxBhjxA960iamcJQ7o6VdKCOKO7sVb8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772703; c=relaxed/simple;
	bh=DijmGR4CReVDiWNuWA3tbBM8VuHHMl+HFeLCqD0jOkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmaePxg5kWLJDFxonlwTIwxNkvPuuoYg35mogzIla72pY7VVASp8C3772QRxwxe9UJKbWGmm/e2ap/X5VI2jCOIr6pWbBJVw8meLjtL4Y2zYnwMHDZu8k8U65hOsMf80ZhSzgmiQwvKx/YdCizM3g7a+KAcao4zwXw87viEXIwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihBMTySM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C24C4CEE4;
	Fri,  9 May 2025 06:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746772703;
	bh=DijmGR4CReVDiWNuWA3tbBM8VuHHMl+HFeLCqD0jOkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihBMTySMNi0Q0hIgKK1LyO0M9lKYu3oaShiHal1xYZ9dkRF2ZaqKOtxsNaX1LNdDe
	 GjjlJrK14Jwaeovr18Bo17oyM4K+8Dk61NTigpn9+kAEwUdjIOjZzagvlkobf6OHGx
	 WPiYD/qSkqzYuGZ9nAMx0mXQumZiPJupB6sHdxmKyhVe+UOZXtad7/id4CG11ufHXb
	 /NRNr01YZ2WaiHBYXtJoOaGMokubxhQXbcQEgMto0C+GLxVGXB3xG8fpigQ2O/rL2F
	 KkAi3My9wBpLidClSN0PF++VT0kdYO70Px4xpdBPGbk06P0jKlt4rsNV6Y8BCw7dyf
	 8T7RGPFCa0YOg==
Date: Fri, 9 May 2025 08:38:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the tip
 tree
Message-ID: <aB2i2oVeGwhaauIU@gmail.com>
References: <20250509162901.79e269a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509162901.79e269a5@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> 
>   drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> 
> between commit:
> 
>   6fa17efe4544 ("x86/msr: Rename 'wrmsrl_safe()' to 'wrmsrq_safe()'")
> 
> from the tip tree and commit:
> 
>   c935ddfe65da ("platform/x86: ISST: Do Not Restore SST MSRs on CPU Online Operation")
> 
> from the drivers-x86 tree.
> 
> I fixed it up (the latter removed the code that the former updated) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

LGTM, thanks!

	Ingo

