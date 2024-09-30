Return-Path: <linux-next+bounces-4010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B5989A62
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 08:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67650282931
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 06:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B007B14D6F9;
	Mon, 30 Sep 2024 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=datenfreihafen.org header.i=@datenfreihafen.org header.b="wQnBL5H5"
X-Original-To: linux-next@vger.kernel.org
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F83FBB3;
	Mon, 30 Sep 2024 06:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.171.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727676119; cv=none; b=g1REaHNMoEhs7afHsdXuOyw8I5DTdSPRnxe1CPkdZsdbW9Mm5AN9/KaJUg0G/iNBKllq5ArtMO1spejdIy0Q7T3lPZcKrWg1bH7xe0jpZIafX2o50fAlghTBuDlTGOFGFSSSr/PE+Eo8QUwEqh9TbfZrXFqaxWDFnkXFL214o7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727676119; c=relaxed/simple;
	bh=AKeWlXh8IAKdewqcrf5yes6uwuOUzFs97pX9dWJxwtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUwPvBw+ac7QcHSEeJRujme2MmozaF6tQHmHp/vdLrMpbx7Hj+Z0Dq0AyZhgeIXeVhpl603XoI0nG90uix1Zxg7xBfMxqwOmpPrjV9eKErqx+SrZCOC3zx4RkqXCH5MTS259iJmLucj2uXnDgnPPQYluYswTbcgCwzqxEVVwsP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=datenfreihafen.org; spf=pass smtp.mailfrom=datenfreihafen.org; dkim=pass (2048-bit key) header.d=datenfreihafen.org header.i=@datenfreihafen.org header.b=wQnBL5H5; arc=none smtp.client-ip=78.47.171.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=datenfreihafen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=datenfreihafen.org
Received: from [192.168.2.107] (unknown [45.118.184.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 6FF16C00AC;
	Mon, 30 Sep 2024 07:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1727675612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qm7Xs8vuQxyjX6wUIUkt9Ro8/RsFM1gAU+YpM8pGsY=;
	b=wQnBL5H5Et9bZmwsiS+Dh3Y0WEKQwjtykaF83LO6a4OupCTipA82QnTaQYMQo3tFzoQiCz
	Mj9FDd182EwJ9NxXy9VV2A/CxkFOs4zdhfwd3Xidj8vksoGQ9B7oND8PcgC12w2U5xdRww
	LgHQ9xN0d6uhwPJg1xRxzgYvl4GEqx1UqHqiqY0asY8nSZCWfDFtGVeL0QI81vEY7sJsmq
	p5Qda6yBhndg1CIUaEoINXFWiGKLIwS/fDZUFvM4O/A2fvibeHVElWoDlorIkc7oDmdMkj
	0QfXFQ2TXXlM5RUe/u8PiYmc2FB/r57ZDzueGV0sJFuRPUh4jLF9lqCQn0dXcA==
Message-ID: <ca2fd1e7-772a-4c77-af11-7f1156a7a506@datenfreihafen.org>
Date: Mon, 30 Sep 2024 07:53:31 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the wpan-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Aring <alex.aring@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240930111849.09fa7c9a@canb.auug.org.au>
Content-Language: en-US
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20240930111849.09fa7c9a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stephen,

On 9/30/24 03:18, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the wpan tree as a different commit
> (but the same patch):
> 
>    ace2b5331355 ("net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in request_ir
> q()")
> 
> This is commit
> 
>    09573b1cc76e ("net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in request_irq()")
> 
> in the wpan tree.

Totally my fault. This should only be in wpan. I will get rid of it in 
wpan-next.
Thanks for letting us know.

regards
Stefan Schmidt



