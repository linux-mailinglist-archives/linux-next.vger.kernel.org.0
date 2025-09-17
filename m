Return-Path: <linux-next+bounces-8357-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261DB7DB4B
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8011618AB
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 12:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC217082D;
	Wed, 17 Sep 2025 12:30:59 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06736288DA;
	Wed, 17 Sep 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758112259; cv=none; b=SCPBCQnlildcYMHQWnmItyJqgXqwOriQZx6/v1AF4QHRXddK6gK27V9e4trSvlK9gDdBiVHYu1tOXGaC1v1EeE6wj404QgIxyPZ7NtKb+c3PiizTM/ll4ho904fGYHsuwf7zg1Bxi78z9Cs+NBhvnKYRDvqtyWSIhkv0JqkRfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758112259; c=relaxed/simple;
	bh=Cl8E2kLQ7/p5S5S9om1u8eRejpquMbqieTheoYS7NVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDSkwmSVFbrP4/m55GJckk5g8J804Z84svgfQuocO8BTZW9N4ffiHzk2PZEdM1PuTFhArnJh3K4jBMcvM0pZgIBuupTxqz3isowW4RqaQarRANIx7rxKyV00t4lTSWHJYAOIssCkTskoJIlzWd1zZzVsXpzXA0WrzWarxTNivGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 527CD340F2E;
	Wed, 17 Sep 2025 12:30:56 +0000 (UTC)
Date: Wed, 17 Sep 2025 20:30:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the spacemit
 tree
Message-ID: <20250917123045-GYA1265885@gentoo.org>
References: <aMqby4Cz8hn6lZgv@sirena.org.uk>
 <597466da-643d-4a75-b2e8-00cf7cf3fcd0@iscas.ac.cn>
 <76970eed-cb88-4a42-864a-8c2290624b72@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76970eed-cb88-4a42-864a-8c2290624b72@sirena.org.uk>

Hi Mark,

On 13:03 Wed 17 Sep     , Mark Brown wrote:
> On Wed, Sep 17, 2025 at 07:48:34PM +0800, Vivian Wang wrote:
> 
> > Just FYI, Yixun has proposed for net-next to back out of the DTS changes
> > and taking them up through the spacemit tree instead [1], resolving the
> > conflicts in the spacemit tree. This would certainly mean less headaches
> > while managing pull requests, as well as allowing Yixun to take care of
> > code style concerns like node order. However, I do not know what the
> > norms here are.
> 
> Thanks.  They're pretty trivial conflicts so I'm not sure it's critical,
> though like you say node order might easily end up the wrong way round
> depending on how the conflict resolution gets done.

Thanks for the help and fixing this, but ..

If it's possible to revert the DT patch 3-5, then I'd be happy to take,
but if this is too much job, e.g. the net-next's main branch is imuutable
and reverting it will cause too much trouble, then I'm fine with current
solution - carry the fix via net-next tree..

But please use commit: 0f084b221e2c5ba16eca85b3d2497f9486bd0329 of
https://github.com/spacemit-com/linux/tree/k1/dt-for-next as the merge
parent, which I'm about to send to Arnd (the SoC tree)

BTW, The 'for-next' branch is a merged branch contains clock and DT patches
for SpacemiT SoC tree's which isn't immutable..

Let me know what I should proceed, thank you

-- 
Yixun Lan (dlan)

