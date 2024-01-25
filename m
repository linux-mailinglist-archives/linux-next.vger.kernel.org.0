Return-Path: <linux-next+bounces-864-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091D83CD6A
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 21:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 203C71F21846
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 20:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D30137C2B;
	Thu, 25 Jan 2024 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIGZQP+i"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3A137C20
	for <linux-next@vger.kernel.org>; Thu, 25 Jan 2024 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706214495; cv=none; b=gIt0KHpdjwJaWCfOB2DATFFte39JTdfuta+yomVPqmMx3alDFe6ppwxhkaqlHAtPG6SjMucZMRZ6V2bYszfZosJnY/lzwx4kxYbkAfSwEjaQaPmCyHcj3WTsug/mxwilaztb/9yVveWbLz2NCoWnHSdpvTrclSBU2oKC7BH8NrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706214495; c=relaxed/simple;
	bh=VCG+iDb+024mkml8Ygr5HcqslC9O52rWCSkA2Bj5RUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0FrkglYxFveN1+sJmO3ce8/Ac5bKHtfdMrmBmqNujzy63EzgIxVWQElxQf1VVsXC/MbTwGkHrsEJtjx2ZJG4zRyazW8SXWzjhHb9d4H1kHZl1btDqEGyOklBAvGgiIMaWYV+qP5pXXCYYnKAaQXy9fihcrDtrILCsfRyCPiso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIGZQP+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EAFC433F1;
	Thu, 25 Jan 2024 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706214495;
	bh=VCG+iDb+024mkml8Ygr5HcqslC9O52rWCSkA2Bj5RUs=;
	h=Date:From:To:Cc:Subject:From;
	b=NIGZQP+iSBEem5QAbpncCod7hHoPrlg1k7KaV7qGTT90C1mSz1bW+4N+JoSIJ21C2
	 /xNyq96WHZX5qJc+ra03RcsP2JhQ5S9nwGXdAVYUZZYxontC3MEbrwhcuREmC727MJ
	 9SiWrWcg4GEc4CHU8gQwsqBXHYyQmF3lTv1F+XEXcOZ6Vj8In88oyVjZi+DirIlRGa
	 z5SfeuEiISDTMYMwOWDZK/rsEDd94uwQrDq9xONST+x9tnxm82s7NfItC07UlApkRi
	 kmzcBDcGqpVazw/lar4wYQ0zFTq/n+hT4Ge6iz3WQgUvBpgoIrdSVlO8bGeXW7Os5H
	 pAqqb0GbmPE2w==
Date: Thu, 25 Jan 2024 21:28:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@kernel.org>, linux-next <linux-next@vger.kernel.org>
Subject: Request for i2c re-inclusion in linux-next
Message-ID: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

could you please include in the linux-next i2c related branches
from my repository:

https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git

the following branches:

for next:       i2c/for-next
fixes:          i2c/for-current

I have requested this branch to be the main repository for
collecting i2c host patches[*].

Thank you,
Andi

[*] https://lore.kernel.org/all/20240124225031.3152667-1-andi.shyti@kernel.org/

