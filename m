Return-Path: <linux-next+bounces-5358-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E36A2517A
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 03:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C0A163049
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 02:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4981172A;
	Mon,  3 Feb 2025 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="iAzPVrTB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58E25A630
	for <linux-next@vger.kernel.org>; Mon,  3 Feb 2025 02:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551402; cv=none; b=OVF8F03yO2pQO81+3/DT4XulACDp4yQi5OfSl4YOBRxd7Hdw1fjkClMU5IXKR0+kX8aswc+snpa7aZraauGIynBFJPUcUe/GZx/Fr9DAAyGsJhzJQeK/9/X4hPoowhA6NjBKOF1URR3zXb+Ndco+KR06T+WgnYT2mQGMxSjDis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551402; c=relaxed/simple;
	bh=xO/RMkNWYfJW5EfAaeTQExpxZH9Emoq+GcI52bu2g5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAZSmT+oSKlmcj7/+TApyc2byHG6+bUc9/bRLhA33+p/GG9UkbDs3Is2nIeAaByCjV5qU7/PpmzG2c34NK52QufyonOcu0nLtDSZotHrDYemHEf7GCyRxRPOGH7VX3GkHvm6US9q4SkDSh7Dmr8VXMnXj+FTEWYRW/5ANXoQ3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=iAzPVrTB; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844e12f702dso98312239f.3
        for <linux-next@vger.kernel.org>; Sun, 02 Feb 2025 18:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738551397; x=1739156197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVtq97j9ICe348ocRanCKFkmU9emEBsOz8Azqtk3h/4=;
        b=iAzPVrTBJvxXmLSzUcAxj1vWIlLxQCgpJHd2FzhRsyJ+2eYjUqtU2ZGJ6pSTEDfJAP
         S+h7QLNtzWjTueQv8H0iNi/y0DsTzRiSqdTMCiTeNVW0FxezKZcZPBlhdeyfMVQLRhB6
         KkcbbMAHLgobb3ZVGWzMsCLMUA7NM6LXdNh57x5Wg3urNOTkvijl23ciBYU1oseug43R
         pSSU1bqyOYG4Xfulurmp+fY0j92DGfOLD9t+/haPO1viDH0IojMp8N5LZisHxN8D86zN
         TCFa6UAwGgarx8Mj5DLYh/CQRmkeEcRUNbLsI6ddq67z3M5jx4jVRaZc/YA/+zS2AabS
         OQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738551397; x=1739156197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVtq97j9ICe348ocRanCKFkmU9emEBsOz8Azqtk3h/4=;
        b=FCjlV8Y4zNhX4y3tQ+/lB16zvVgNvuCCtHRAuknzqkMJCNmnI/KJKJEjbW2tFxTxK6
         ogZ6h5gZB2kMc1wAzNaIF+UfTSgf54hNktrU0rFhkf94vrqCs++uMMBKASirPQw3DCQ6
         GaXvE0stBYfOCoKS251UxR4/amlbITQsy2wf7MflH0gfsGUgkoqgVfQzm4QxN75o2svr
         GlgzzSBcmvFXELUOkur83AOHFhwXO8GXvs2FWPRJ+gwotWHTUumGhajymCus/Dx5u3t/
         1J0R+A6FLuk8CcgWjKp3HDw2ulv7Yi6gEz7dk0+XWrIAQtXgAT0QluyKcSdOtdC2UGHq
         fvrg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Jd7cSTVzF8M9Fmt93nG0PSMKhsFjzHveD8EmNvLAC/1eHRnzw1/lJZGK74puEnTagxU2iCG+UNlc@vger.kernel.org
X-Gm-Message-State: AOJu0Yws1AzhwccRvDQPGLdX3Y8P/lUfDatNhvlRj7NHA6l+vr7yfD1K
	0NtLZP4NMQF6FP6cVRa0LNg3QxmDsl606JjMpRQhpwy/kDxQ//6sjx/5Dxnc7os=
X-Gm-Gg: ASbGncswEW3yfWzAA/8rZFYmGnW5B5LJgfHjry+ZOp9TitEZQb6vFf1GeLj5Q3FVD+v
	+1XErhWtdf9z1BdUhScCx2hcg6cGyp5DZMZ0q+kF/txQV6p13yLFtlvVitRKBawk4HZT+dy8KwS
	SoUWwuGxZ8ZFt7gyIwTbaib91J/51oWpfOS5vEANZaBiaxX9zYlpBUdQ4Wr5jENHmv1j0UO2hKE
	79ZkaSCFCTwH8GpzrFoNDxfzmLCRSWctPCTp1bwpFxw/Pa44PmhviWc6gIzTqknXoH9pAetDuI4
	lW0sFHTcISXX
X-Google-Smtp-Source: AGHT+IFNK7rOqQb3JV5xTgQckQXlw3xSt8jA7xPZ3nlNZEIOit+k7XL+xGUX7QmDN+wZlEblX/jCGQ==
X-Received: by 2002:a92:c24f:0:b0:3d0:1abc:fe03 with SMTP id e9e14a558f8ab-3d01abcff3emr86079835ab.15.1738551397025;
        Sun, 02 Feb 2025 18:56:37 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746a0a3csm2024871173.95.2025.02.02.18.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 18:56:36 -0800 (PST)
Message-ID: <8d47be36-c317-4392-a242-64d6c1727d46@kernel.dk>
Date: Sun, 2 Feb 2025 19:56:35 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250203125914.439f72fd@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250203125914.439f72fd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/25 6:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging Linus' tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> drivers/block/sunvdc.c: In function 'vdc_queue_drain':
> drivers/block/sunvdc.c:1130:9: error: too many arguments to function 'blk_mq_unquiesce_queue'
>  1130 |         blk_mq_unquiesce_queue(q, memflags);
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/block/sunvdc.c:10:
> include/linux/blk-mq.h:895:6: note: declared here
>   895 | void blk_mq_unquiesce_queue(struct request_queue *q);
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> drivers/block/sunvdc.c:1131:9: error: too few arguments to function 'blk_mq_unfreeze_queue'
>  1131 |         blk_mq_unfreeze_queue(q);
>       |         ^~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/block/sunvdc.c:10:
> include/linux/blk-mq.h:914:1: note: declared here
>   914 | blk_mq_unfreeze_queue(struct request_queue *q, unsigned int memflags)
>       | ^~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   1e1a9cecfab3 ("block: force noio scope in blk_mq_freeze_queue")
> 
> I have applied the following fix:

Thanks Stephen, I've applied it to the block tree for 6.14.

-- 
Jens Axboe


