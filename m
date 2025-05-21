Return-Path: <linux-next+bounces-6878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E6ABED13
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 09:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C204E1F3E
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 07:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E642356C0;
	Wed, 21 May 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1662TOC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC123507F;
	Wed, 21 May 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812630; cv=none; b=IH4CBZm0rZlOqbZ4TecL7dIxV0ImhRXVVBrOEGdoWK7GJrlVXp1cstWXvpyyzkADHs2eEcYXVx8LjQBGNDBjCBUBRUZ5kQoDyMH72p87rA2r9jwRvEqZwhNMfW6pCbl/k+F92UNKY1wLcGF9H81jzBVGwEXVCCChZsZ2CA0diYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812630; c=relaxed/simple;
	bh=pi89e961IptILl8yg1vOTDMZsRpZ32Iwcr13PBivbzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuUlmxEAEaijR8EObWL7lUBSU46NwFdzpcHG/ILtTQmetKwtbdsMXFilrHvay3bmgD+akM6McwvDi0sfP57NA5UmHRTNbTruW2wWQx+Ie4dmJrhOiXyMHBeR/z1I813YsSdXFYSd3pDJbIf4A9UTgwLSZeqdgHQ1LU2qB/wzJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1662TOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E2BC4CEE4;
	Wed, 21 May 2025 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747812630;
	bh=pi89e961IptILl8yg1vOTDMZsRpZ32Iwcr13PBivbzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1662TOCtdKRCu7FEpSvECZWr2yHMTuXAsAYhPb6fpb4Wex7tW6Zljo/t3bKp1f52
	 uX2NZOrJGMue7LqzbAfPNlg1RRBWXjp2N9fX6MSlPRD9TGmvJUAv/5g0WRHlgY6Twl
	 XSjrdhdRmwpiE2L3de4P3mu5w/Uj1BNTJd7kuZlfgeqca6YkDxeEnt+X2v0XJy6Ugf
	 4Vk/CwruT5XhrGUjb50QHR3sfm9pez1OI72AHWAdl2wg4kGiM/5GrRGcReDYhJ4HXs
	 Q5TIf8+pZigCmJj+zhUgEH0KJ2qnD5GAaPijKdHjgHuoDR0IUWQxaNtirJdAOkQbia
	 c0eVsTLHvWZPA==
Date: Wed, 21 May 2025 09:30:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Xin Li (Intel)" <xin@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <aC2BERLkcx1LbED8@gmail.com>
References: <20250520224906.61135dd4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520224906.61135dd4@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   54c2c688cd93 ("x86/xen/msr: Fix uninitialized variable 'err'")
> 
> Fixes tag
> 
>   Fixes: d815da84fdd0 ("x86/msr: Change the function type of native_read_msr_safe()"
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 502ad6e5a619 ("x86/msr: Change the function type of native_read_msr_safe()")

Thanks, I've fixed this up for tomorrow's -next.

	Ingo

