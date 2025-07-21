Return-Path: <linux-next+bounces-7663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B1B0CA24
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 19:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD50B7A8E44
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 17:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A042F38FA6;
	Mon, 21 Jul 2025 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="rIxLisbL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bmTEqRF9"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A242B9A8;
	Mon, 21 Jul 2025 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753120211; cv=none; b=odDMq/vwH5lTXR7g/FWpaGe9X32LLpen/8e7GX33zQE6hB9opGfIr8SNLcdAePfmtdjxKkbmco3cVjXIqrq+nxpcvOxIHA+K9skUG2zYz8L1IARQxHq74iyWvsH3YSrBskACQ5lTpt72Ku1dywLMDPkErsCRXEkfrDa3crqnGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753120211; c=relaxed/simple;
	bh=toXsqUkTmteicEKvpexaaVyksVweh68agbAYBeLj+bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFWZAq+BqP3xGzMvdPI+v1eu6skvEayjtXvtZEb9S6wgYtHMhmsYkhWA6exOv7j/pzQw6zz/zwVMIhjcoIXQOW6bB4wlUC/5sI3w6GQcHkppEhsro1CeKBmj2WM/U+7FjSGLtGSd58Or+Vu+MFyreru5juzj5HQLz+qv6Qm4Xs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=rIxLisbL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bmTEqRF9; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 220DFEC0297;
	Mon, 21 Jul 2025 13:50:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Jul 2025 13:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1753120207; x=1753206607; bh=hhfn5zrrmGTmLRR6l+UKwXZ9nQZfTtkt
	5WevPFZSJ3c=; b=rIxLisbLWRhiIr0SlfpyoAeMxRIVxPpE8T7sSoJiX2+spTPb
	JQmGYVKd2h8r0YYpMrp/vsgbTwDBe5zIfkfRh1UhSU8MaakrwQmUdAKKQKvmWDem
	2lGr1S/qFZMu6GBXwJtdxXp8tpD2iefb6EL/Sq5yp1V/k3s6tmLX/50sujZWZ95a
	jaceyr6TkYOYU4o/KYLGhnfxpE3veCaugFMybvqsWitDHgkwvpNESGhgxX6ndL29
	1oPk24GZhacY01z9Ts622mMT4zVAYMI+it5ktyP2RTA5ntNbXxReXVMk1mQm46vT
	1sVb9QSh1PVFbqEXQ2g83b4n73hbzn8jw4WC4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753120207; x=
	1753206607; bh=hhfn5zrrmGTmLRR6l+UKwXZ9nQZfTtkt5WevPFZSJ3c=; b=b
	mTEqRF9rqDXGmXzybvoRHsOSQiV22ItKE3TeECuwJpFPxLj6iXlrJQF9PI3MsIQD
	77IGZ822Q36Tl/VDHf/lzE2dCmxt2Z5qT5EbMPFrkjIRViw24cjrtV56+aSrxPc5
	sBJ9P3f4fV+Gvp2ZUsT/4ksAdhY+iycZ9ET2Kj6wygHcPaCExRc9joydUekz07Xd
	sOvoOsU7klwDsqqiGWkgJjLWZKRlCl7/65AOajwoSRSJHqVbcqcFhZ4Lsj0d+5yW
	Fp1PPl/07E7K9jaTE4o2/z9Gaj47BhynCxpyB1mNzWUJA5Oec78emykKXSJONtbe
	SZ+JE0F9+HHam+4sinZqQ==
X-ME-Sender: <xms:zX1-aHLyzzdH25O5_EFMckyHZjF3KGHML57Wlmnw3pOueHBSkgDB6w>
    <xme:zX1-aDkBOD3ot_00EIbIOv_lZqqLEJr4VRIGSa96kxsaIGMDFWpSp_b9q7mi8RPtA
    Nxd43ph3j_FYFSOsv4>
X-ME-Received: <xmr:zX1-aAIra9RNfi2rzMEEcT14YIDF2EUW-eirzsYHM03WlB8J-rdkduwNqnbj_dPPIoQ6LskA2uEyn6AUbrNnMTQFLiOIceBkolYLXGf9avoYt504ruRfwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvdejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepufhvvghnucfr
    vghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrh
    hnpeekteeffedvffeghfffgfdtvefftdejheegfefhhfehgedviefhgfduhffgkeehkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnh
    esshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtg
    hpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohepshhvvghnsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zX1-aA7rkoLeFUxFUhEIl6uNCND2rVInhhDGMrLgavmTPIwtUJ0HlQ>
    <xmx:zX1-aM3H1PsI1xtz_pNiF7s4GZop9kBt4Jql9AcOp8qQucmnRNOyOQ>
    <xmx:zX1-aOe2H2qA3LjcgCHz4udweHVfEyu7nuRK2_mFgaxN9ZlSjgBQHA>
    <xmx:zX1-aKdulpt3PNLGDavzpTAR47HhzsHP9fht35TeivsPGCObJEY5GQ>
    <xmx:z31-aFkik1Oobyf4KLINSczho7fd5AVRQbT6k_-0R9bJb5KXC2AbWcya>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jul 2025 13:50:04 -0400 (EDT)
Message-ID: <80dff685-4bb2-4b10-b283-88573f0d9529@svenpeter.dev>
Date: Mon, 21 Jul 2025 19:50:02 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the asahi-soc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250721084007.341abfe2@canb.auug.org.au>
Content-Language: en-US
From: Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20250721084007.341abfe2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.07.25 00:40, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    a622259af9eb ("arm64: dts: apple: Add bit offset to PMIC NVMEM node names")
> 
> Fixes tag
> 
>    Fixes: 14b7178a76e2 ("arm64: dts: apple: Add PMIC NVMEM")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: d8bf82081c9e ("arm64: dts: apple: Add PMIC NVMEM")
> 

Yup, that other SHA1 is a stale commit in a branch that never went 
upstream in my local tree.
Thanks for catching it, should be fixed now.


Best,


Sven

