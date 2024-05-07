Return-Path: <linux-next+bounces-2201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B34938BDC57
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 09:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6819B1F21F7F
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 07:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D406713B59E;
	Tue,  7 May 2024 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="wEVosgnP"
X-Original-To: linux-next@vger.kernel.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE223D0BD
	for <linux-next@vger.kernel.org>; Tue,  7 May 2024 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715066548; cv=none; b=OiGJ7XA537rI4FR77imuM+/DLn0dVddViM0Tun8S3sFNrgfeXoUQXwborHj+LlWiEUopmMzOvqoik6MV+gS9yoxw7laBuCjXALpW6co1Yvdp3ugritIECxcMxnZLgqCSfCmwI2Qo5SPVUCpt1kd6qO2YRpSdYszF/afWDMpTxjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715066548; c=relaxed/simple;
	bh=M26r2UW12glVbvga+yrb1zM0uEake+1P9tFx7nhOgSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5ZvWgj/oK4oT3TEhqO1qewoxvEyPSctiKWZLO98GjAhfww7jDddfvKTuuUuRCGrQ2ci2L7JVDUFLgv/qOXVOXwD3LzHmXA5vF/GEknTCTEZaLAZ8egrKp/vcPsRvGrQSnNpKmKd0boz1SA55uM8226/w+xypdgXzviI+ElUUq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=wEVosgnP; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
Message-ID: <d6e2f37f-5823-41e0-82f1-76adda5b5027@kl.wtf>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1715066544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XVof7DrhvYqHGWyS1HO9aY2UmifNoMKhn8nlk1iNY8=;
	b=wEVosgnP4vXjp5K/S3HIc9o2REu/wugApchDQasdGjJ+KHGT51m6hqp1Al1II+7KEk0KQ7
	Y01CAkFwBgmRHwmNkBWgF0Iak3eidQv4NP1JQOCZP2TTZCqcp2b47UTiq8LERWmxb+VPBF
	8vpDbr/fgVvP6ck/LU564iVNOLuVkGohfi0PEL+bsb8TnkoALWC6eIXCx5eZ/hpGq5bMmP
	/oUlVCofcjmaTuC4sx9OfvbIMovX9Y0eA0jVgfDjbPSRuJZwzH3fsrYUZyGibWXVUkkFZA
	0mlqQw/VMMpKUzhW68/4vq1YPnq23ki4ShP6gD+v/KUaeLiJyaG+EDQl8dwc7w==
Date: Tue, 7 May 2024 09:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: build failure after merge of the hid tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240507110652.7478cdf9@canb.auug.org.au>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kenny Levinsen <kl@kl.wtf>
In-Reply-To: <20240507110652.7478cdf9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/7/24 3:06 AM, Stephen Rothwell wrote:
> drivers/hid/i2c-hid/i2c-hid-core.c: In function 'i2c_hid_set_power':
> drivers/hid/i2c-hid/i2c-hid-core.c:410:1: error: label 'set_pwr_exit' defined but not used [-Werror=unused-label]
>    410 | set_pwr_exit:
>        | ^~~~~~~~~~~~
> cc1: all warnings being treated as errors


Apologies, I did not realize that I had missed -Werror on my kernel 
builder. I have posted the fix[0] to the input mailing list and made 
sure I have -Werror enabled for future patch work.

[0]: 
https://patchwork.kernel.org/project/linux-input/patch/20240507063656.2892-1-kl@kl.wtf/



