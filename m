Return-Path: <linux-next+bounces-4176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AE99619F
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 09:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D66E1F235F0
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 07:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7669F1885BE;
	Wed,  9 Oct 2024 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF+HMa8K"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD518785D;
	Wed,  9 Oct 2024 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460712; cv=none; b=tt9ZU2dfx3LC5liqsWisAo4wu0tYLLGD/EiO+aOpCgUWTVnHtZa7ag1atv/ck2Qlz4mYXI9113VqE99ERq3n3crJw1zIEwVgmrPk5XQGWpljrXmNgZ6kItaEABMM9RA7xRlvbzWctKg3wnWRPKHRqsBpsKf2tmPnRvPv9I/f39Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460712; c=relaxed/simple;
	bh=OiSvJoFqE3RDKS8VC4qSGaitatIaICqKep4cPYpdMFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3/CTTKiej2wQ6wmHT5mfM1aFHYbUpdXEYnN7sP98KbaHJCV63zKx3qq1mBfJ65yIphLuYSqmBtfvbY8mjfYQCzD8iGW3xdS2spyKL0pa7hCZkBDCedMF0xjnbZPWqva0lddXt9QffyftkU+f/FZkZxDUBpWtMmJTyFWk1FnqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF+HMa8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67B7C4CECF;
	Wed,  9 Oct 2024 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728460711;
	bh=OiSvJoFqE3RDKS8VC4qSGaitatIaICqKep4cPYpdMFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dF+HMa8KRv169gxNzf47E6L9GVHL79VUlZmBeZr9PhvqvCBB9aLodrxkg3Yszzkxm
	 Hd/eHDnYoZFdFZtTP5njmsQo9IdXKytmyM752j0llhnKZxbytqVpv9/qqbdRH+1O7L
	 3KxL+8pZIEa7SLp6ZgV0pgTkM271WCz2bCKqlc8Tgnll/+Crbxc3yYAFMtVe97Ug1j
	 ERkL/gAjNl2LHGbf5IspOV9kYtfVFGsUBuVFeZpzzZKe+7jUl67VAXothnrm3YMyd5
	 u3JZ3HJDVM5QLaJc1hqkEtRq7v71iqojw5R9LI0Rf1Lyesy0MH5HeQ8Cz23d4EjC9l
	 i+8w/SfJb0srg==
Date: Wed, 9 Oct 2024 09:58:27 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, Carlos@web.codeaurora.org, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: adding Carlos and Darrick as contacts for the xfs
 tree
Message-ID: <csesgvzll3sgddkhf6j2jo75h6wwwwe23dln64vccszm3s2g4n@y5cf3siupab6>
References: <20241009070735.166eb5e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009070735.166eb5e9@canb.auug.org.au>

On Wed, Oct 09, 2024 at 07:07:35AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> I have added Carlos and Darrick as contacts for linux-next problems with
> the xfs tree.  I hope that makes sense.

Thanks Stephen.

	Carlos
> 
> -- 
> Cheers,
> Stephen Rothwell



