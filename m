Return-Path: <linux-next+bounces-2772-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B991E549
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 18:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68B451C215D2
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 16:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF3C16D9AC;
	Mon,  1 Jul 2024 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAyYvhGV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8716D4E8;
	Mon,  1 Jul 2024 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851186; cv=none; b=uU5rjXO5cXpl1G4szktbqYulF6jO2fGDscIJK8rCJSheU5PwdebFQdIA4FARabBp3004gq81t+WOzTjez+M0EGlfJyL4xDWqH7t/GaTrZdLjwgEKgguwxSggs288DoYgCkuOuvgHbQrzf/vpu7EmCrcoNhAuWYM0LToTiR71p68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851186; c=relaxed/simple;
	bh=sLCjWWilw1E5FGGNVdZk64HXw9n4c0Ovks/4/vNKFqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8NDIdKGIqp6vvdzQPHjQsIltf0YiPofhLgD2/o4j/N2c8tdCZKVMU00ZtDqij/ZiJorQmb9nvGAoFyc7NnJVfiT0yb07GUG4dJlJzoDfyUTkZd7fysi+Lp5fS3Gkc29jA+dz34LI+zc0lzrfcivfxOrvQhKlJkQA/5kB7wenOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAyYvhGV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA11C116B1;
	Mon,  1 Jul 2024 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719851185;
	bh=sLCjWWilw1E5FGGNVdZk64HXw9n4c0Ovks/4/vNKFqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAyYvhGVXQqoaGgz1sw4xHKraOYNobpkTjYzMxVs2mhzBNPO5sghAcIwBco5NG1CW
	 WvQ9H8vEwzibqYQyZcMvyYybXmxnBWkFfDaAsijdemx3oeCwjEOGYfbeUb3HhZ8J7L
	 jGPXroVW10C3gusKsXdt6rKgiV0N6C+M5Va99IRlRFfYjI/78ZgV16j0cYtxCNcQYZ
	 AISoZtPUZxIKLql5sL2xHoLa3EDnrhnGVcr4RBNk8qbhkCnARAfUNKSeJkiSLYUxMp
	 3iqspnpP1KWmWUQGH7rjLNwniQnrpmZcOk4XwqmgSDNy//3KI9e8DO0S0ajh/bJ8tB
	 Ez3pEJQZsOZGQ==
Date: Mon, 1 Jul 2024 17:26:21 +0100
From: Simon Horman <horms@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	NetFilter <netfilter-devel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the ipvs-next tree
Message-ID: <20240701162621.GB596879@kernel.org>
References: <20240701153915.317fc7a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701153915.317fc7a2@canb.auug.org.au>

On Mon, Jul 01, 2024 at 03:39:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the netfilter-next tree as a different
> commit (but the same patch):
> 
>   8871d1e4dceb ("netfilter: xt_recent: Lift restrictions on max hitcount value")
> 
> This is commit
> 
>   f4ebd03496f6 ("netfilter: xt_recent: Lift restrictions on max hitcount value")
> 
> in the netfilter-next tree.

Thanks Stephen,

I have force-pushed ipvs-next so that it should now mach netfilter-next.
I think this should resolve the problem above.


