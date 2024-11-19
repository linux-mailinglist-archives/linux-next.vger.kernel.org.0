Return-Path: <linux-next+bounces-4807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0559D2034
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2024 07:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC83282794
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2024 06:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A079914D70F;
	Tue, 19 Nov 2024 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPtBmu9H"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383A1482E7;
	Tue, 19 Nov 2024 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731997550; cv=none; b=GRWFn8IOvG7sr85cDzYHyC7RoX01EH7nd+Uw7usBrZYN2MWmDf8cZ5rD3PUoUxGOJ0d/H9xvjC5mjHvfrAjR/0jl+x1XHI3wsR6fQzzeO3Bt3awwePbkgZ9gSpcS4Cyg6ajxbiE/idQRw036OegIhoI2p2TmdLz3qSFFGMtMkts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731997550; c=relaxed/simple;
	bh=O65vK3FN7BThKSIpoOKjbWaMV1fuK2BNVeNLdrfVxnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaNTgu4YyE1+UeeqY1QiE09IeD8VlNR7sOrWFcgw1iXk4/7xlI/Xm74phOTZ6sY2yRUHWD+0KurpsPSoxIPpnJaz1q3UMc186gaVliCTKGD23p7/xPmcxAYhDIPR0MQzq5lmUn7diQ1oclVV0+vI4i+H8zYwq2n2V2ShBRYKu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPtBmu9H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08269C4CECF;
	Tue, 19 Nov 2024 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731997550;
	bh=O65vK3FN7BThKSIpoOKjbWaMV1fuK2BNVeNLdrfVxnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DPtBmu9Hd4qU9Y1DaNj1qxDyWSogjq6ATApH9euJJ8FbcGUw9ke8rvIc7JzrFEPeD
	 luMDh+MJ/kMl8Baj5yA6PwKCBOvqLUuAdTPi3n80m1mhjH3L+VteT9yeqYcatCgxSH
	 52pxiqGxnecpZklfputAfw+X+LX94vJOKTnbsa+sap9HbovSvJJo08qJZkjs7cwumc
	 /rKptqYgwO+owinLMd1R+N0bDEykjLDDodpUhjh3DERCkpEJ24YD00m1DZ50Jguvke
	 e1k4XZ2ndudQOwaSIFTGJ0f1jyzZK6UNuZqzb/7Y9lhmgvsP3NPXQyJoTsqiHHCaCn
	 C6ECoYzYfQ5hg==
Message-ID: <0f117213-7001-4bc1-a9af-335d10be3489@kernel.org>
Date: Tue, 19 Nov 2024 11:55:44 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the soundwire tree with the
 sound-asoc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20241115150118.3abfa3c6@canb.auug.org.au>
Content-Language: en-US
From: Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20241115150118.3abfa3c6@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/24 09:31, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the soundwire tree got a conflict in:
> 
>    include/linux/soundwire/sdw.h
> 
> between commit:
> 
>    3a513da1ae33 ("ASoC: SDCA: add initial module")
> 
> from the sound-asoc tree and commit:
> 
>    e311b04db66a ("soundwire: Update the includes on the sdw.h header")
> 
> from the soundwire tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, this looks right to me and will let Linus know when I send the 
pull request

-- 
~Vinod


