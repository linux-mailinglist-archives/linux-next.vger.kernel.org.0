Return-Path: <linux-next+bounces-5368-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C03A2860A
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 09:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551EB7A622F
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 08:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B480B219A6E;
	Wed,  5 Feb 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cO9tXdYV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB8C131E2D;
	Wed,  5 Feb 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745962; cv=none; b=ZO7NzQveSDt0ijpCgQUFKd4Df3aMRtNWwj6D79dL9+Gtt4xcD/HVCxth2iXn2fBByHuvQVDfBRByPzj9tJa99wnI3oB4UEFYLyl35t/Njp1Qn7aml/sMyM3lUR84bSjRlz9uMKwsHxSveLYJFiovRtcfy/HUgNJYrIGeFTmlAXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745962; c=relaxed/simple;
	bh=TZFRc6FYXHvwnfyDD0qzPkae1qeV3chgsD6Gs3FuGHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkMIOn86/BxoopqKUGVpuHzRx9ba8z+70ijpljRSx7uUV8sD+52p/KBC2RjenB01CCK1kNumM8XaBXd6IUac1ZIZK+7yUFD6BKEBWOrtEaMlqCYIkPnupRg9IJv3ZK4EXy86uNi8VoEL4rFv4IYejTI1+zZt78l0sgXXpbNzOSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cO9tXdYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C97C4CED1;
	Wed,  5 Feb 2025 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745962;
	bh=TZFRc6FYXHvwnfyDD0qzPkae1qeV3chgsD6Gs3FuGHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cO9tXdYVFbN3eDp5YAZltzm/MY5C6pCYg/yJ+Nw3DkfYiprk70NPPaNFi6BUYhcIA
	 JtyeivNMZgTaYaUUO+aRH8OD6y9jJcD1Y4+wHslvMf2KEj9+taQh0ylJ2mTX/GbX0q
	 Dv70zlCMhV3+qhzlG7xsGp6rteY+v7JzJpC5H+jlzEj65+ANhbPl+sP1HxsW05vcxL
	 s2MbW2fw7sUjwWzSUB9Gqz/PCN7ODBShwlGPw4lI/dQQsxpOlZOMoJJwoHdqRJVRiD
	 LFs+f/MB/ob+jG+/N5VReibBMIaAoWZIPCDc2XKEerpfazk16iY8ioWi+gGYdC9t4s
	 D7bp/AXe0tLwQ==
Date: Wed, 5 Feb 2025 09:59:17 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Joanne Koong <joannelkoong@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: linux-next: manual merge of the fuse tree with Linus' tree
Message-ID: <jr2ud7od7ryb7j3gz5pz4kwz4gm72fj25t2xrq6m3agobcye6y@fa4vd3sxfbti>
References: <20250130093252.78a892bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130093252.78a892bd@canb.auug.org.au>

On Thu, Jan 30, 2025 at 09:32:52AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the fuse tree got a conflict in:
> 
>   fs/fuse/sysctl.c
> 
> between commit:
> 
>   1751f872cc97 ("treewide: const qualify ctl_tables where applicable")
> 
> from Linus' tree and commit:
> 
>   9afd7336f3ac ("fuse: add default_request_timeout and max_request_timeout sysctls")
> 
> from the fuse tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/fuse/sysctl.c
> index 63fb1e5bee30,3d542ef9d889..000000000000
> --- a/fs/fuse/sysctl.c
> +++ b/fs/fuse/sysctl.c
> @@@ -13,7 -13,13 +13,13 @@@ static struct ctl_table_header *fuse_ta
>   /* Bound by fuse_init_out max_pages, which is a u16 */
>   static unsigned int sysctl_fuse_max_pages_limit = 65535;
>   
> + /*
> +  * fuse_init_out request timeouts are u16.
> +  * This goes up to ~18 hours, which is plenty for a timeout.
> +  */
> + static unsigned int sysctl_fuse_req_timeout_limit = 65535;
> + 
>  -static struct ctl_table fuse_sysctl_table[] = {
>  +static const struct ctl_table fuse_sysctl_table[] = {
This LGTM. As long as that array is const, I'm happy :)

Not sure if this makes sense in this context but:
Reviewed-by: Joel Granados <joel.granados@kernel.org>
>   	{
>   		.procname	= "max_pages_limit",
>   		.data		= &fuse_max_pages_limit,



-- 

Joel Granados

