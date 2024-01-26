Return-Path: <linux-next+bounces-872-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2F83DA9D
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 14:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89E68B2616A
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC9F1B7FC;
	Fri, 26 Jan 2024 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwR7JD5C"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7251B7F3
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275089; cv=none; b=FF7wAVcFbm4rpXwPaSuBIpyeyEu0lnzDyZg/0u1rFr1sAUFzZPNpZliT+n8aIH25cyAbvstyJPm2FwksxPQZOsWkdaKU1BEYL3lVmBclIlDKCr/kx21RraC18HcBwfGrMxg34tCyR9no0WqZ6NyxTKf30n0lAgHw7aIPtyVMnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275089; c=relaxed/simple;
	bh=ea7ZuXTham4xYcCLZKanIVJbZZJK533yNrOL7xk4a8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8OHocYlZwiRSSnAMSi5nmOMZUGEEeRGvp8jjK6dBReXhf2cv3eblHCSX5mtNQRH4NwmRDqMfc7nID76X+7Ib3hGY+oAmojXMfh50rRWqtnEB5ae+UVKeEHJDTQEvoXO/KSXBFkQ3GUUxr8y+0i/VUasEg2LEImzIPSz3MCiI1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwR7JD5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC91C43390;
	Fri, 26 Jan 2024 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706275088;
	bh=ea7ZuXTham4xYcCLZKanIVJbZZJK533yNrOL7xk4a8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwR7JD5Chj60sm5Q67TLNwo2BbR7zGW5ezE3ew+EeeGqU/Rid9WIbUzn0QMHqAuoY
	 zphp1uPRb4JnFlb1NfmrUdZ0NPeUJPcCdjt4W2MdVVaIElxxsgJ0zNiHnI4tu8JydZ
	 jyhwuXF9RI4nQYQZTkILjS7oEGXcgZwpTsGrl540V7gniaY7do6LlrxdN/OPF/cjoB
	 9jUM0Et8xJQnHKgy3CwG9R2ueJZVVsyXvY9QAIT6bmynEW8B/n6Ynx3NuWu8MkAuqB
	 gUwrleS35GEUaylEJNOBodBAcAUg8AU5fBp7zWb+wjzEjxQTo6+U/ElW0KNEOJBC6O
	 RMOc40Qdw1/7g==
Date: Fri, 26 Jan 2024 14:18:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wolfram Sang <wsa@kernel.org>, 
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <kxr42pnnv7sfaymjfi3y4kbzdpa5fjkohfcuxp7jlilkrzeq6g@njbjxionq4m2>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
 <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
 <a4cb4d06-f936-4fbf-92e3-b7465d7ad061@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4cb4d06-f936-4fbf-92e3-b7465d7ad061@kernel.org>

Hi,

> >>> could you please include in the linux-next i2c related branches
> >>> from my repository:
> >>>
> >>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git
> >>>
> >>> the following branches:
> >>>
> >>> for next:       i2c/for-next
> >>> fixes:          i2c/for-current
> >>>
> >>> I have requested this branch to be the main repository for
> >>> collecting i2c host patches[*].
> >>>
> >>> Thank you,
> >>> Andi
> >>>
> >>> [*] https://lore.kernel.org/all/20240124225031.3152667-1-andi.shyti@kernel.org/
> >>
> >> OK, I currently have an i2c tree from Wolfram who is listed as the
> >> maintainer, so I need to hear from him (and do you meant to replace his
> >> tree, or add another one?). 
> > 
> > Yes, I'm going to replace Wolfram's tree. We've been agreeing
> > together on this change.
> 
> I don't think Wolfram's tree should be dropped. He is your upstream
> maintainer:
> https://lore.kernel.org/all/ZbNzTKCFxBx9Bz6Y@ninjato/

yes, Wolfram has replied already, so, yes, this will collect
patches only for the hosts (busses/ and algos/).

Thanks,
Andi

