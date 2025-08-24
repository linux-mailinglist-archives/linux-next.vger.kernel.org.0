Return-Path: <linux-next+bounces-8084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128AB3300B
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 15:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0BE048176E
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE45212576;
	Sun, 24 Aug 2025 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLT90Ia7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCEFA41;
	Sun, 24 Aug 2025 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756041475; cv=none; b=oSE41vtwaqixpuTmuG8qtjXq2iLIWJxZlsxbjypHxnE9y0LG5xnR63gl1Q+sExOvcriWpRuCtNBXQ4h6jtKFk24UAh9NEpf0cX0CXr7e+iC5Pxe52VYZm4kcMvFlvztGPTS9R8t8C44qNvg4qUovUMBJxIsQHw3GqcYShGdmIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756041475; c=relaxed/simple;
	bh=t5I0db7OM2QTz9JZog2He9wyk0er5+OsKe6cipYUwdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXf62YAgFh6Qf9r8HYC8hm/BbYZVyKIfaMgmRd7QyGGVg5FvldQommQ4tHzw8LynAKPSyquHe6yTdCeglInHl+bpeMPyIdlwjUODFsB4OuXeHrxNfYqIYSgxpWkM+A2DJc9mIuFIkVotQaO8NBX7Y43HQe/e8Hk5viEMH5gCUYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLT90Ia7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6F6C4CEEB;
	Sun, 24 Aug 2025 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756041474;
	bh=t5I0db7OM2QTz9JZog2He9wyk0er5+OsKe6cipYUwdM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=iLT90Ia7f5mW+c/ppB2PGRrT82zrQW8VIw4bQSf4bNVMbFFRNOcKhWl12jO3Os8ug
	 517zfOtmHCLLeUbWMdT+fFeA/oKhcsM6xWCGxuR/SZrjILL3XDMZWDtd7Pdg779kL9
	 H7yftcBw4DHJWKVjxHU9Gzl6pWwT53tymdoWy8iJroEHesX9Ny1opm2mq7CNLlkEkL
	 72VpsxeoO+XdyRtU90MLV3SxrDC4dcRGa18K9U5kEai79GzuwdrMdroqnCA04MwHVJ
	 f83FmpdrZypvPGkacmkhTmX+GPOctMSj7AUeo8yRlMleXjy8MA3xnmG2lfbHovlAWu
	 I5AfZ4VeZYOiA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 02E2CCE0ADA; Sun, 24 Aug 2025 06:17:54 -0700 (PDT)
Date: Sun, 24 Aug 2025 06:17:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <1f51dd68-1d9a-4f85-b9dd-4745a756e097@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250824185045.43623e9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824185045.43623e9f@canb.auug.org.au>

On Sun, Aug 24, 2025 at 06:50:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e5ae44cfd65e ("rculist: move list_for_each_rcu() to where it belongs")
> 
> is missing a Signed-off-by from its committer.

Thank you, will fix on my next rebase.

							Thanx, Paul

