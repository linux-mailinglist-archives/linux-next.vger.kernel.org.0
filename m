Return-Path: <linux-next+bounces-9172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3877C7F4F8
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 09:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2A7C4E3D87
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 08:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60B120CCCA;
	Mon, 24 Nov 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQ+TGQUO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0D1E98E6;
	Mon, 24 Nov 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971244; cv=none; b=UrPhK2vZe8T8DlpJAajmNEV0tThCAOPsQdSWBeEX933dy7uaj7chmh8eqz3ebAAtk/k8fSOGiim14zRvB1uHY8010GMUj+k6szKS/RLYmwrgpEZ1DzHQZD6thHw3ap7V3XUva+LnSBYx2s8JiQcncIIsitt7V7A0Qzo+Q+sBpNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971244; c=relaxed/simple;
	bh=66NzDg7nq++tCrVWQ16veeu/pmGmXcIk0agFM1bNDk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmM5apvfFv3LkCbfc8IJWYMiSXX7iUofDD9qsM41D7AV6qGICDE3itTda8dr0ScuWp/EZ/QrwClx69TcCyhGTZ2ncDi6v4wfqKSPiYeNHejVsjYCwkgGK8+a0le4jqOrZ+ga+IJc4l5nONTIklzM3WoVwsDYL+2SMVZ30hwiJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQ+TGQUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F57C116D0;
	Mon, 24 Nov 2025 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971244;
	bh=66NzDg7nq++tCrVWQ16veeu/pmGmXcIk0agFM1bNDk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQ+TGQUO7Hw/jF+5SEtjXt6A5P85a0ZP3osEx/RblXKU+6X8yMV4u6Mv187snT1C2
	 XTONPNKFz4x04BWCYupWfO3dtvI1p5RWarLtwF0vpk7WC7aTYe6Fc9z2tC9UxfIUPd
	 J2qaNqqYYUmdVRzf2JjR3eSmvSXb8uGZsL8LNJ/7uuL2uNoKEOS7XX3TAiw6HQcXDQ
	 lNoPzT032KqN68dg7r766hw0pmKtfPNrMBunQYk/LvuV44xi5WRAyGVgYEJEoyPwLh
	 KZUMxzMzhNFrkcZ+yZGbIkXHAKGKm7tQ4oPGp2xygWOMoUec0ln46V1RMEt9amnMUd
	 Udp5I2qnEPXiA==
Date: Mon, 24 Nov 2025 10:00:38 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rdma tree
Message-ID: <20251124080038.GE16619@unreal>
References: <20251124140146.784d6305@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124140146.784d6305@canb.auug.org.au>

On Mon, Nov 24, 2025 at 02:01:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/infiniband/hw/bng_re/bng_dev.c:19:13: error: 'version' defined but not used [-Werror=unused-variable]
>    19 | static char version[] =
>       |             ^~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   e873663e5f05 ("RDMA/bng_re: Add Auxiliary interface")

Thanks, I fixed it.

> 
> I have used the rdma tree from next-20251121 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell



