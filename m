Return-Path: <linux-next+bounces-8093-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AAB34A0D
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 20:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA791885BD6
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 18:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D65271475;
	Mon, 25 Aug 2025 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjnQg/kg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5780AD21;
	Mon, 25 Aug 2025 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145918; cv=none; b=B/ql6HQ2WvIideH4+p4XfWFAwkEgG6DNT1QpAxWGrucuH1z2iQHKjk5DXFVi5MMYcb3G+Cv03qdNzF651pq9CMGhIvWfjLMta4y5cOASK5Mg/RVYtsnNm4eJck+PjsqCEEYggvg+KdVQsz78z/6EzW0Xg3hfCCqGq7f8guumPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145918; c=relaxed/simple;
	bh=H/AB2J8jsp2o1hiHXtAFSZhsDK5gJs/ZzlMXLwFsPrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnnYOHwZAfMvkrfyuUXbgwyoqIxOMMGR8zr8ZYunFu5bHm6JgWEPPFQzW1lqh0u/XC9aE4AFE5/tmTELVwJYKuu+G5otC5xR2J5c3Aw3DOcQbdQVd9MWB0x5+7f40GIAsRIkOjzOAHcKDN9WgCX5N8KMdNWGyLJoo4EjOvZoiuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjnQg/kg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AD0C4CEED;
	Mon, 25 Aug 2025 18:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756145917;
	bh=H/AB2J8jsp2o1hiHXtAFSZhsDK5gJs/ZzlMXLwFsPrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjnQg/kg/0qcLMkZA2WiIN5WKfOMvnUWn7Ym4LcxOJNt/p5GrY0Ddsy/HV+8FjeuA
	 VH68/aCSxQbLn1L7+fz5lDtbqJBNJ9MGjQL+WbgrxVEEHDaVqeYnZqdiYtvD1tDWQG
	 cTEFdNLnHDJI7rV4kfpiZmVStNsyLbPIh2+ZN7Fkab0bZBeW1VkjbmA1JjAW+yjDoH
	 dj6peDEQgu+JzrJ05/YvDLQvNdEVeGq9BYqLPcgTuSYINZSC3wtG2EnxW87k59s3lG
	 EVxrhLxodKK3vzbPNj5oqLrKR/WfXD1wWs+3Dnk03Q0Q6KwoWw1H1UDWoccA6cUMJv
	 YN3gdavKLzOog==
Date: Mon, 25 Aug 2025 08:18:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tiffany Yang <ynaffit@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Message-ID: <aKyo_PkoNqJIfpF6@slm.duckdns.org>
References: <20250825150326.696d7496@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825150326.696d7496@canb.auug.org.au>

On Mon, Aug 25, 2025 at 03:03:26PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cgroup tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arm-linux-gnueabi-ld: kernel/cgroup/cgroup.o: in function `cgroup_core_local_stat_show':
> kernel/cgroup/cgroup.c:3804:(.text+0x1374): undefined reference to `__aeabi_uldivmod'
> 
> Caused by commit
> 
>   afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> 
> I have used the cgroup tree from next-20250822 for today.

Should be fixed now. Thanks.

-- 
tejun

