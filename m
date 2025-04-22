Return-Path: <linux-next+bounces-6320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B06A9664A
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC653188FE1E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 10:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD3F20B801;
	Tue, 22 Apr 2025 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzDM05GJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082E202960;
	Tue, 22 Apr 2025 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318808; cv=none; b=iNE61tA1IAK7k1lQgsTZXG3M5MQGTcIN1rfDpu5Y+7hLvYFfeFxhuNLMqFN5z1BDaevShkPPnuiixybiigT/Rrbn/tlg6zGvI6K8vuHzWxxEypSWUqxpc1yYv/6yGZVULtahTaGqImhUcAtiJr9sdEybzWeGbKBKdi+ppbjb4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318808; c=relaxed/simple;
	bh=6S8MBhu1kpCDnC27VHFmrsYpuAfYYwn7A3ZWLh+rQfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzkwH18pPXCTz5LngYjm5Xdv3i+ZnzX7KWfIsEGGv0P6sJ9sVjkiVYtAt18AmKgxDPLOjH7na0BlkIzhiSC9DkDLiwrRQ+N4jy7T3mcaM7VbY+o0I8AillS7Wru7rROGnNILIqHlDzhM8wzBoimLvzFewlQPAP8pEROMIAHc/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzDM05GJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85FCC4CEEA;
	Tue, 22 Apr 2025 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745318807;
	bh=6S8MBhu1kpCDnC27VHFmrsYpuAfYYwn7A3ZWLh+rQfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzDM05GJA3WHp0lRJv9wyhO/rVZ2dcobYVX7Ml+TrBKVnk4qfHKgp1RSn/TaqZY6T
	 vGaEWvkKpBEhyJcRFwVCST+krl+IN0qYxvfRRMyrkNPOKA+QP6bT4G0HBdyRbkjUBQ
	 zGJbVOzw42gL5WDwVRo+WLnWfdjWFWA3JOX16OhiGaktM+a8kqX/KZmlEC1kLd39xJ
	 i82mpmitwHGUKgutesYIlwl21lv2SBTvYQJUJ06BLDD5vWCvBXty1WN8Uwjo4AcF5F
	 CfZSYHHDrClKNcehqlejspPmZfxfHYC8n+6ZQbrqtf4qCkcaPmwc5NB7B49tyrhpON
	 w6kuizEaFpwcQ==
Date: Tue, 22 Apr 2025 12:46:42 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, 
	Hans Holmberg <Hans.Holmberg@wdc.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the xfs tree
Message-ID: <huc7jw3retrx5i2szvngci23vwh6z5ve5a4oiyjvjewg4d5ien@2h2j3qpgkk3c>
References: <95VzqAdwXL6uADPxQWGQV9LD2OtK9bUX7if_opYIYTcdIroqe7176LhnAst-sIYFTfU2tgwJknumIwzvYvxyTQ==@protonmail.internalid>
 <20250422202517.4f224463@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422202517.4f224463@canb.auug.org.au>

On Tue, Apr 22, 2025 at 08:25:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/xfs.rst:576: WARNING: duplicate label admin-guide/xfs:zoned filesystems, other instance in Documentation/admin-guide/xfs.rst [autosectionlabel.admin-guide/xfs]
> 
> Introduced by commit
> 
>   c7b67ddc3c99 ("xfs: document zoned rt specifics in admin-guide")
> 

Thanks, I'll take a look into it


> -- 
> Cheers,
> Stephen Rothwell



