Return-Path: <linux-next+bounces-7492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D6B01E72
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 15:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A10C1C25C25
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723512DC352;
	Fri, 11 Jul 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="br7rpUnp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DB2D77EB;
	Fri, 11 Jul 2025 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242317; cv=none; b=XRO0om8bah/2B/HV4ya3BaZKHXkegY16FnGL7GYk9YryoFihbN6gGP2VNlfnbbpIaeFP8rSB5jjgYOsOY2LnwTJC4L/0WAGrpWsmQXC4c4PMDsnhUfxPnKTYE4c6pAUZs/EmUx+/b4D21VY6oPgnzDPmwY9JeFy0XAe9sA16UcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242317; c=relaxed/simple;
	bh=TXZ7wo2dl3En6lK9YIGgEiVFhXWcdGCipkVsT3B1rmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0j7mnJOsxlRgEOUo1bhgTL6UIffeQMMRU3auRBgrxuQOKQmeKFwXL03AXr+BrJzChw6KuFMwrGedDw8wKWQcBnC+OYc2LDs7T0XMNgFbwG1QkfRM9WQbndWqzzMq0ABCUeMrOGL8qbgabU2E7MwMgl++9zN0RNGpsnQXhg7AZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=br7rpUnp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE4EC4CEED;
	Fri, 11 Jul 2025 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752242316;
	bh=TXZ7wo2dl3En6lK9YIGgEiVFhXWcdGCipkVsT3B1rmM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=br7rpUnplJchXqp6n+e9WAppxm37si6oGTrDtcoFAhnSfReq5Sk2nADyDoAL/ZA0u
	 t08FmOeVGaKXi4veVpBqoB85lgy7HWgwkRbuCjxCunBVCAP9BdUTWGUX6U0+JVE9SS
	 2fbOI4BQMo74DgaUvhA7BjlwKoOIWq5zzHv3gC+6fsSFOGyoQNWue1mEJr0s1ewqBl
	 Xfn/efkgK6VCcnz0WXKAKPrM2Zu90UDgAYs10XQ4N4nxDaefBeQSAiJGmfUe/pRfY2
	 oSKtnvHtTmmGf/4XGLr6hnD9lWwCHmN3DOe30VYcRLDn8/MmGB8YIFPz2sSA5nOOWp
	 Hy2/GOdCVYXJA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 75590CE0E5C; Fri, 11 Jul 2025 06:58:36 -0700 (PDT)
Date: Fri, 11 Jul 2025 06:58:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the paulmck tree
Message-ID: <f12f601e-2b31-4129-9768-2a33713ce348@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250711150655.6e18b0dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711150655.6e18b0dd@canb.auug.org.au>

On Fri, Jul 11, 2025 at 03:06:55PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the mm-nonmm-unstable tree as different
> commits (but the same patches):
> 
>   5c23ce0cb897 ("lib: Add stress test for ratelimit")
>   5a5c5a3de1c7 ("lib: Make the ratelimit test more reliable")
>   d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")
> 
> These are commits
> 
>   7074799065e7 ("lib: add stress test for ratelimit")
>   5ec9048eae16 ("lib: make the ratelimit test more reliable")
>   cf09bc65d491 ("lib: add trivial kunit test for ratelimit")
> 
> in the mm-nonmm-unstable tree.

Thank you both!  I will remove mine from -next.

							Thanx, Paul

