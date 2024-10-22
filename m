Return-Path: <linux-next+bounces-4376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEC9ABA1C
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 01:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D674EB22995
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 23:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF711386BF;
	Tue, 22 Oct 2024 23:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="rRUpdwfI"
X-Original-To: linux-next@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C412B93;
	Tue, 22 Oct 2024 23:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729639916; cv=none; b=N7qIvjTbYUkFHhH5TZP4lApV6kb4fHABa8v+a2w8SB5QjbRbBEoV6mlnELBmSpP3qcyDNEX3UU4W15saO7h+Cai+MKQhu7rrRrFlD+MJg05Ia5pIGMk7cM4X0pZwXzndzMGOziTtzY82lSeD0gEVhpity+JQGBz1MAWOMZUxoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729639916; c=relaxed/simple;
	bh=nLovyE5AxCBKa6isCjiySqJWBrHuFGQeVxcnuPLzhlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fj8THDhLhLuW0qMEw+C1Bjjg6Vb6XDczVMqD4IYzO1vGa8QkCaI3Khq5Sp3ztkGlTTSjL9/VPYrKPeTxARuS8OW4jOuvE0nGM4kahiQgeVfy4+TAjJNxeNTHOvvxm5rrey8x/Pq0VGYDvbtvzazYjN/cN7qWt+psVFrd0WWhgZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=rRUpdwfI; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XY7k24nGXz6ClY94;
	Tue, 22 Oct 2024 23:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1729639913; x=1732231914; bh=embhfBN4uWXOWSdrNUIyGBwH
	jWFqO9lrlZn4y7cfDAU=; b=rRUpdwfIAuVrDAdzIvCwPWSwI19Z+EXATYUixVd/
	EV4Ub6UgEvkoFOKr6lPn0EC1+zqSXYkfIXpYrEcr6MD7bKlpyRFDlS7B7fJstmC2
	8JGZfCxRLsPbluoJiPonmLj0NNaze5vdvwXC2tcFR061MEFK8+hwaQ6b8xUjc5cj
	0okodXdymaGrkWJ0Ut9i8nwTgb2xyOKO26iTidLBlNXlcaxFyYjLtgcqpSXi87JS
	eXwNXTOTldI56TLfM8ZeyKUfzVmoQBghvrfWMSQvxlLM29MFd2VmHP4XBifYrz/D
	BdtQNpKsdv2idLs+UnkAwekUHzxQwdfO72DqFTMuiFMCPQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zbfaTJVAgrms; Tue, 22 Oct 2024 23:31:53 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XY7k03zGLz6ClY8t;
	Tue, 22 Oct 2024 23:31:52 +0000 (UTC)
Message-ID: <7aaf90a8-4734-4819-b29c-42f8f8b857ac@acm.org>
Date: Tue, 22 Oct 2024 16:31:47 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241023095914.61b9eafa@canb.auug.org.au>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241023095914.61b9eafa@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/24 3:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    6fbd7e0472b7 ("blk-mq: Make blk_mq_quiesce_tagset() hold the tag list mutex less long")
> 
> Fixes tag
> 
>    Fixes: commit 414dd48e882c ("blk-mq: add tagset quiesce interface")
> 
> has these problem(s):
> 
>    - leading word 'commit' unexpected

Jens, please let me know if you want me to post a second version of that
patch.

Thanks,

Bart.



