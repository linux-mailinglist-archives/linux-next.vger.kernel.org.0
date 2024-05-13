Return-Path: <linux-next+bounces-2283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC178C4A32
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE5D21C20F13
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 23:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BEA85934;
	Mon, 13 May 2024 23:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="uBIry12q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDED1D559
	for <linux-next@vger.kernel.org>; Mon, 13 May 2024 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715644227; cv=none; b=aogpiTbf5csew14IvcHznyUxiHQI7iRy0KfVCfbzBqoe0sCL5ANLZnudDoH9eRFVebSiuhdPK0q/nGzel52z6icfjJWc8JJFXIYH5bbrU8IjqF6VpoqLfk0pgHZJS3JNMtYcSwgrxoiHkyEeB9mMmguSH4blW1TTmQHnr+kBWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715644227; c=relaxed/simple;
	bh=NAXJSi4Tt+bnaT9DgJUdHaSGfyAM/pSw2r4arOIex+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9LHfpHR9XxiUPs4/Gox9cBSllVGmy/iWnRtHnwnlE8Ge4rxTRukbdlixjg0dLH/RSrbMYaJPxy1e6GbImCG7JoLBGAFze4tXd/YBqsfZ9+VB0sqWpq6F/1RxA0IQ2V4ykFk18k2FhgstWPsg8/B2ef/53iCDuhJe26slHRsRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=uBIry12q; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c74a49fc4cso119394b6e.3
        for <linux-next@vger.kernel.org>; Mon, 13 May 2024 16:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1715644224; x=1716249024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eni1/VbwuWwNZf5Mgh8+VsuI37bGfwDEcei5bm7PZnk=;
        b=uBIry12qz/OoLCSezvKVc6KN5PhiSBATuxHXOGDBvp2KLche9IqSJkSLGzq9wmO6hU
         QbSZvclp3OOT/zYFZl0JrelCXM90YCsd9/Zr4HibkWHfVnlDZcKnT08LF4fP8NEM5OnS
         eqdPDDQQ9f/IrUFYJ+YJ1fYtQk8Kda+J5Q6z1kdGkkUUIKCRYlpA9Usyo2S6Nrz9P6KG
         H0cmis31clUmxbZN8reJmPoLlFP30pFrcpUEp/r89k4WBIRbvR+LC2DoaGK5yDzMkDs4
         /v9buXvsg8D8WGcYCjibHHFFTm+ls/6pwBo222MX/BSXabu24r3R57J2fBGLijxvhIh3
         AhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715644224; x=1716249024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eni1/VbwuWwNZf5Mgh8+VsuI37bGfwDEcei5bm7PZnk=;
        b=I0ECaaYSzZEu6hLxiag+WKy1FTujGmhtYZuIZ2xY1kWVqas4SVkKU4LEe4I9afbbpH
         q184JDhWc6B7i8MrBB7gQhhhLcOVwrkULbo9zX3D++qwl+EnYzjKeUoHTjJ2EbgxRTWW
         /T8uvUkx2EEtm33tOKa2AeL2U6wfWxFPNQx2+z2R6+Fy9UZCiwPyu9AU5QXPO1/C12bI
         j2g13R0/OTlHZLmfJOB1E+EZaE76iySAu5pE+VC/8+ebRyJY5ssLgYrDBQPnDKaxqNly
         eETrw74Tnjp5NVV5Esa5ZrTY5eI/ydw7BgEK2xLPioCQ2yUagpho4uzIvuioVL8zQt2M
         EUMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOXm41DETRjaOvvhwSRY3U9+oE+HTWvLNZzzGWLYNxXykcWfXmMYM9AjZj2CHksj+N3HIDoyVzF0xTQmoslR8CGOwSH6McAmnNjA==
X-Gm-Message-State: AOJu0YwwLqnhvCAGAkU3lBx08MUGESM9iNbySWBl4hDNHY6VvsqJRvjO
	rszdK+JqphKQ85NMV+4RhlUjcce8KQtakUwaf8E6DNr9IT6QwY8Xp1yHZMi6ns0=
X-Google-Smtp-Source: AGHT+IEz1fMTS9/cuGPsvFnPtyCesgGuQT3FIewHTuYEJ6jRtBBQDhiMSKmJvFfBzjBKqPJU1rxjRw==
X-Received: by 2002:a05:6870:d109:b0:23c:66b9:6a2b with SMTP id 586e51a60fabf-24172314711mr13607217fac.0.1715644222363;
        Mon, 13 May 2024 16:50:22 -0700 (PDT)
Received: from [172.21.17.150] ([50.204.89.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4f2fe72desm4308766b3a.135.2024.05.13.16.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 16:50:21 -0700 (PDT)
Message-ID: <a2a87d8c-eb92-497f-bd30-99840c9e0ff1@kernel.dk>
Date: Mon, 13 May 2024 17:50:15 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Uday Shankar <ushankar@purestorage.com>
References: <20240513122334.135fef82@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240513122334.135fef82@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/24 8:23 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/block/ublk_drv.c
> 
> between commit:
> 
>   eaf4a9b19b99 ("ublk: remove segment count and size limits")
> 
> from Linus' tree and commit:
> 
>   073341c3031b ("ublk_drv: set DMA alignment mask to 3")
> 
> from the block tree.

The block tree currently contains just that one pending patch, and I'll
pick it into a block-6.10 branch now that Linus has merged the other
bits. Hence this conflict will go away.

-- 
Jens Axboe


