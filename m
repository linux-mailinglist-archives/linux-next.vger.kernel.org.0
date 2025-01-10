Return-Path: <linux-next+bounces-5126-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35388A08434
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 01:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A35A188C108
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EA62942A;
	Fri, 10 Jan 2025 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lL/P25CJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6BEEEB5;
	Fri, 10 Jan 2025 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736470560; cv=none; b=s/nZ8Cik6p2HmTnvLhj9GP5ZDoDa2+s2h1AAuCU6zUKOqPBR6GIFpBeBtByrAtU3ojoGdqFcq+5e8bxKagNvF1ADYtmb+cMlFcI/DPOVwfy4ghSPRW8ChwuPWckJ4EaCxfjoO+BCoF9l7AChp1hmDhdXYGkQh801vbimUU+0jhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736470560; c=relaxed/simple;
	bh=suiA+R+Algb4qojgp84PiW+sNaiUau6QDZitA2pIeb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpnQc6Rt7EaMIr+w6Fy6PY/u3L4NHxOLbFdsdqbgD+Kb3+h4WyvdX5zXKa/l1EFnJtTVk4xl4ZGweEBjcyRHyGRUvcIFXprl3ihe97PEFNTY5qgnWRT9qKpd25Q1hzo5GFD3uNe9IdeehndY2bi8BPfXf1/Qzq8SeFyGFDVKJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lL/P25CJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF12BC4CED2;
	Fri, 10 Jan 2025 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736470560;
	bh=suiA+R+Algb4qojgp84PiW+sNaiUau6QDZitA2pIeb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lL/P25CJZTmGo1p/KP8m0/a36tYP1ROrigue9eynUk5iJ+uWLnorv27UedfgT8r8Z
	 pp6/MoGQnpsf8aPPnXMRy1gZEWgNVN1MxaQU0+rB65KulG7GsxyqEoLK/0b/GtClvV
	 hbrJQuIzt7BuNFb4jB9TEj6FSxGzx3gfMkp+ZSmPiQZuTcUQ/oP0EGWRJNqF+fgmEx
	 zCB8dSrk52et8ZNdY43SJb/8GEPmSHF+U9OE3XH6tps7h3HWX4eU7YpLHOOBN/EZgC
	 sItdvOM+D/V4yCH5KjasAunDjjB6kgr4VJ8J8zYZsN2CObEpR8jUj+aqtTSGbch+ti
	 1NTdkmoqqu69w==
Date: Fri, 10 Jan 2025 00:55:58 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wei Liu <wei.liu@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the hyperv tree
Message-ID: <Z4BwHlXSMQqz24-H@liuwe-devbox-debian-v2>
References: <20250110094557.11bb1f11@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110094557.11bb1f11@canb.auug.org.au>

On Fri, Jan 10, 2025 at 09:45:57AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e2228efbfd70 ("xxx")
> 
> is missing a Signed-off-by from its author and committer.
> 
> Honestly, it really doesn't look like it belongs in linux-next at all ...

Oh yes. That should've been squashed into its predecessor patch. Now
fixed. Thanks.

> 
> -- 
> Cheers,
> Stephen Rothwell



