Return-Path: <linux-next+bounces-3763-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C99975A6A
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 20:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04511C22D23
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 18:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82F01AC8B9;
	Wed, 11 Sep 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eEWEsaCo"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B152187543;
	Wed, 11 Sep 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726079468; cv=none; b=X8wL7aQYyWcUq4/+ZV6I6RdOohWKuo8GX1SBVgObT12XqzbLpLZERwXCKt0+kx42TTnNkdUaFSaaO1OajkgYJOuIR/vcKwgT52DR9TbuZgWBjHddKr42gEJmrG3yfnhX1CFLRcws8Y2XADf0EDXwZ1sfvmtcNXIbmAd8PFO0gDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726079468; c=relaxed/simple;
	bh=9GbEkYaK2KLMKmCPSjnFwdCcc83zPWOsh2WBi8jguNo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iDby6fma8pf/+e1dkr5OhK5bybqlRY88ORiiYX4osjPJpDMNHFnL4Oes8I0lJSEdyeK7TsTyhFDecGGopwh/Cuy3Giz+qCLgBUCKvCvxHeRxjcfYMMdr8hnMYJGHOL8rNoFXHrCtn3YFBy6RJA0PU9InLP/I8CV5Hv2DF9+sgfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eEWEsaCo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE916C4CECC;
	Wed, 11 Sep 2024 18:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1726079468;
	bh=9GbEkYaK2KLMKmCPSjnFwdCcc83zPWOsh2WBi8jguNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eEWEsaCoLDGp07eCS8AzhgGcIS9zzyBVIr+7YlUrpVsSOcLu4oZDLh6YClobfWqWz
	 T6TjSsIh7DNd7hWenv4B39dMBd6O5YNISXZWNK93DeTNmA8swzjGo58FABLvYMYRWG
	 163frHHJnZ1jSbF8wyCeJnjQn0rZ9w1PfAITiG+o=
Date: Wed, 11 Sep 2024 11:30:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the cgroup tree
Message-Id: <20240911113051.edc63e55b012b9833553b6b7@linux-foundation.org>
In-Reply-To: <20240911174023.0d0d9a15@canb.auug.org.au>
References: <20240911174023.0d0d9a15@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Sep 2024 17:40:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the mm tree as different commits
> (but the same patches):
> 
>   af000ce85293 ("cgroup: Do not report unavailable v1 controllers in /proc/cgroups")
>   3c41382e920f ("cgroup: Disallow mounting v1 hierarchies without controller implementation")
>   659f90f863a6 ("cgroup/cpuset: Expose cpuset filesystem with cpuset v1 only")
> 
> These are commits
> 
>   a378d53133d3 ("cgroup: do not report unavailable v1 controllers in /proc/cgroups")
>   36bf4ad72e18 ("cgroup: disallow mounting v1 hierarchies without controller implementation")
>   3055c9be424d ("cgroup/cpuset: expose cpuset filesystem with cpuset v1 only")
> 
> in the mm-unstable branch of the mm tree.
> 

OK, thanks, I'll drop those from mm-unstable.


