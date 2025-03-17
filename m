Return-Path: <linux-next+bounces-5832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0916A65541
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 16:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D073B5E86
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 15:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F3A248897;
	Mon, 17 Mar 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaxInOTB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C89B24888D;
	Mon, 17 Mar 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742224392; cv=none; b=UhoRs+i+s/G1MfGM3YI4JbNK6Q21R1fKRtNldaMuWoc1CHyYeybQVTWbN3ituv8kjcgHGN8tVdHkFSqLQEeH9nNL5p5aIkp90eYtGdMnt71ImXea8Jma2oAyFzncP9EJ6O2QW3/Eh50d5IovLaDtDy5WyCCsFWna8IWXgKFrUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742224392; c=relaxed/simple;
	bh=2IW9jaX+pT0fiRyAX4Z0+1/ELuTxsTYcGkoXf5wtYH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1WjTNy9to+VZfpWTTgbaQOIOzk9A/vreuvPJ0JYSga5FaaBLMWK8Gi+CbTF8hz6Q9wZr2Fa+AxvwaAjEb0dSAxj0bi6zslpc7saN1Jpxa1E2krlpkri8nxdlHeUJI4N3d/G6VtsMF9sSIWV8QW1keQyEPW67J98iDGRZvBKfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaxInOTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEB3C4CEE3;
	Mon, 17 Mar 2025 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742224392;
	bh=2IW9jaX+pT0fiRyAX4Z0+1/ELuTxsTYcGkoXf5wtYH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaxInOTBhqG3vExgdjAcGCI21M1yqgaMu+uX33RIJhVwIple43WU8pNAaTGV+KqJ2
	 b9Xh6sbQhRQYT5H2d3gzkaiW3dgDcUgQ8yc6rcRdabvqs7aEAv3awMmAor5pYc/M8v
	 0+jtGjYEtXhbFV5n0USBPyki33+Jm2cTToUoSo8+zZHb/tIkG85vDd6J+Vt4SFzUL2
	 wDJr96c1N5/7/o0PQevKuWzVqxzLvypko1dPC07Neue/SuampYIctU3LQqSm/0h7Ao
	 FLwEkbcuKPlJJcoZmHb72DxNdQSbkMjZJKoSi+LwG4eT6yj8vXzmD98RBGj48rMeqF
	 ia/No5pL//Aew==
Date: Mon, 17 Mar 2025 15:13:07 +0000
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm-perf tree
Message-ID: <20250317151306.GA12227@willie-the-truck>
References: <20250317112146.762e2a26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317112146.762e2a26@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Mar 17, 2025 at 11:21:46AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm-perf tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/perf/arm_cspmu/nvidia_cspmu.c: In function 'nv_cspmu_set_ev_filter':
> drivers/perf/arm_cspmu/nvidia_cspmu.c:192:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
>   192 |         writel(filter, cspmu->base0 + offset);
>       |         ^~~~~~
> 
> Caused by commit
> 
>   6de0298a3925 ("perf/arm_cspmu: Generalise event filtering")
> 
> I have used the arm-perf tree from next-20250314 for today.

Thanks, Stephen. Robin's fixed this now, so you should be able to use
the latest arm-perf tree again.

Will

