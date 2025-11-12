Return-Path: <linux-next+bounces-8940-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A4C51E89
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 12:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC0F83A9287
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DD926F467;
	Wed, 12 Nov 2025 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGaqKeRd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81728A701;
	Wed, 12 Nov 2025 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946052; cv=none; b=naK92zp7fFCGpmQt+e1zAClVgHuL5HM+1Tgb3OBfA4g6Hs+lbyM/mWIWF4pweHTgscmMvGg69fcCXOxK0H+ev1WgDWOy5OowP04rpEKSRjB/nf1I8qo5+xU3hP+XAocfcxyW7ZtOm87F+/ErwNAKcNpnmY6t+I2XnOF/DwJTX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946052; c=relaxed/simple;
	bh=/rFm4H0OK7cJ+QUyXrsnB6rz/zY0jTlBYJD1rF72Boo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr5dGRfRb9j7HCMJ6Je6jGykPaFXZVPtx/hXAzbm/xYY+GfO/L0EcMVVv5UXuhXwI3BuiXZ3Kew0/WveR/ujEZlsa8ohfoLfhWn80YCCdMBEvDrjgzSmyunnmrUMhDxDc9XE9GkaSvN6e2Ikc8YKwO2UoPz1lp380w/8YTQjnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGaqKeRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0C7C2BC86;
	Wed, 12 Nov 2025 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762946052;
	bh=/rFm4H0OK7cJ+QUyXrsnB6rz/zY0jTlBYJD1rF72Boo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGaqKeRdL17XIL/VxDhdpf7so5/NQRC3UdQ2+JG1bFJM9ZSSOOsqHauYTWFkLFmed
	 KkElNliL4RtD7YejpRP+pzx3YEr15nIl8bvwf0ICvuNUkzMPDuBM1O5hdaoEK4McCu
	 Wbblwl51IJr4zGdTaf7vj1kp1Z7VRaYjL0G87krdRx9Bq3q2WOtKLnAzluXXZ1nZy9
	 7GKvBRN7yHCmQ6ZuMILYwLZShHOBip1aZ9fty+fNfMfcaVFXs1xpqElaOSKgn72B6x
	 o/01hoJxhAa/UydnqA6xJX7pOjOscd7dZisQepF1ReyTSPRCfLJ9s+2oSVX/J/7ZFb
	 IxpH3L62h+7bA==
Date: Wed, 12 Nov 2025 12:14:04 +0100
From: Ingo Molnar <mingo@kernel.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] perf/x86/intel: Fix and clean up
 intel_pmu_drain_arch_pebs() type use
Message-ID: <aRRr_O9Enzkb5B5d@gmail.com>
References: <20251112154200.4d3671f9@canb.auug.org.au>
 <cb49c1be-99a5-4aba-b3da-f902058a4996@linux.intel.com>
 <aRRcyoOobRyam5yD@gmail.com>
 <d3d49960-b7b6-4270-961e-9895cfdff1be@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d49960-b7b6-4270-961e-9895cfdff1be@linux.intel.com>


* Mi, Dapeng <dapeng1.mi@linux.intel.com> wrote:

> BTW, the offensive commit should be the below one instead of '2721e8da2de7
> ("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR") '.
> 
> d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record fragments")

Indeed, this is the one that introduced it - I fixed 
the changelog and updated the tags.

Thanks,

	Ingo

