Return-Path: <linux-next+bounces-7391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D9AFC130
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 05:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A82617FE9C
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 03:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C96A231A37;
	Tue,  8 Jul 2025 03:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="AxyVYQg4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A42225A32
	for <linux-next@vger.kernel.org>; Tue,  8 Jul 2025 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751944399; cv=none; b=kXJX+iQP5JbXKHNUD5hUvQAcrPLQ2k45+NKtHagv0xVyIK8HUfyw0GNDTP+ZtPts3H5HToEHVJGi4mCWozfcU7+J59Pmp8X2Abvk1+iQ3SXVJCuxVHKB955zDd+AWXAACXaSqXJV9S4V4CB6I4ipHAoWgk9QI15yGy11f79Ss9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751944399; c=relaxed/simple;
	bh=dlqspsRSNSE08Tg/3IQQ5eGtPGuk+I37SgCZ42ZpKUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRFDMqiQnzEsi+w6ZmdT+RRc94GlGVfjROLs0meSvwNCHfjNZhSExIf8FEJNI5NV3+fyy5QQpMvtBCQ3UblRPZLVBDAf0ALfHBkZ8/3opMIO9FOycBJO37Bhi+H2gPxgaI9g6Tj/M4+ClPIUjxYm5mSyRgiOoQWOL2+d5XursbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=AxyVYQg4; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86d00726631so106638739f.1
        for <linux-next@vger.kernel.org>; Mon, 07 Jul 2025 20:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751944393; x=1752549193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mENbnW1wFkJXzp57kx/n/Cuvx0hvkcxx0hJLyypG27M=;
        b=AxyVYQg4pPu8gzSkEQiCV0XfirF3+rLTqheDzrF6oLreatfHP0TPpNy2ybLSOu93ol
         vZu4L/GCoyMblkWN57B+z131F9reJXTzdc15db3G7JU1USccelQ+8vFQnxAZWHW3TOzx
         +nP70ilPdY4rVvGs7CfLo1RMGZzMFrGzCxuiWNZZRJbTCV9Y0HFve81iWyNiBJsNRHg1
         0jz4ZyfVaCjsNf5zs0ETOI0ZmmCMo+S7KUbdp88AH7wKOwbHZFjs6SZndREhVrHvEYWc
         Ps67Me8QkYnjT7HI1T+QAYELDs1WoZwp0zKRKCKnG3oXMfpLWi/IiEqNxY+428QElOu0
         ZMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751944393; x=1752549193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mENbnW1wFkJXzp57kx/n/Cuvx0hvkcxx0hJLyypG27M=;
        b=V78CI6CNQR1OKs9c0pQV4Md4dL/Cexy2iQDJPey1R2asD8hFPIoiD5zRmFHxKpfnSE
         MCxQoxlIiCEv2sjH9CKDHli6BNeUsBXs7eyKxmKUOyBmySxucYiTcJw/ZxvZ5upczt/y
         W2FOHh2rSsYZDu4OnsZw+k3xoDqQ+aVTzCGTgYU5yENWx6jRzoVvD688wlCsfz60wM9k
         E1eSXhx6hU6MJimqazR6jOwW1v2GhEsQu8kl0tPSIskySHXOkYLpsuowwaSPn4ps+3JU
         t9f3d1cwYPsNW4ujtp8gLCQGZy238Vs02zP4cNXyx3OlPEQwV3Y8i0oaXFm6z/KbXRL/
         ooUw==
X-Forwarded-Encrypted: i=1; AJvYcCWbXllZqfG//FEYlqXUxvZArnn1Hh7ztmKiAXPYhkcLCCI9Ch6ZjaBULkwtODmiTDT+vQtwUeD9v0eN@vger.kernel.org
X-Gm-Message-State: AOJu0YxrtV2H/XVYWsIixyLvCANIKSdFoTtZ5lxTvPQn+GBr71TOkwh4
	T9SFl8Ms7LlJpooMloVoB+98aUBvszATXPQ0SQTGWuJhR9xVwg4ZFU03evim66HDFVBkxzJnHs7
	/SvtS
X-Gm-Gg: ASbGncshM6bnPiyjJnqBFb7eKrzkBzdOrcLCnKM0pBUEGvqG1BbxAvNG+jC+PFqV8aM
	PZkhCigq9Nnl3b/HuNHUbKYmRY96Eg9dsw1172KM5huCvjpWleKy1fpwrIqYAc9kXAh971DkvfE
	FN5VheH4IaDxlWKQqADBqekJfTay6lgGvbZ5Gv4SOpjmAthS0hQaogTINNTJOSinqoR3p/+Y2H0
	y46mM81OiODqbtg0HBguDkAWOXXO35/hNzoPYvz83BBO5ukZvAmW1iGr2m1VNBpERipdoe+6cxn
	+LyFXpGb7fFeAuds8o7RWToKicsGW9CC9jp2Uh60a9b2G7w/yt5IdWtHVYM=
X-Google-Smtp-Source: AGHT+IFtwCYSBbPnq7MAU32xreN7WfYm7YtV13PTKzHfEq9UZ2+U7gtCqVUuzNrgb/DFNWAbqVNHXA==
X-Received: by 2002:a05:6602:1483:b0:873:f22:92fb with SMTP id ca18e2360f4ac-876e47683damr1116197439f.1.1751944393275;
        Mon, 07 Jul 2025 20:13:13 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b5a29eb4sm2018772173.57.2025.07.07.20.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 20:13:12 -0700 (PDT)
Message-ID: <47b60314-1099-4199-b6d6-dfca57689530@kernel.dk>
Date: Mon, 7 Jul 2025 21:13:11 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Yu Kuai <yukuai1@huaweicloud.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Zheng Qixing <zhengqixing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20250708114925.2413cc77@canb.auug.org.au>
 <c1e6ab2e-7562-1c99-38cd-5083e728057d@huaweicloud.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <c1e6ab2e-7562-1c99-38cd-5083e728057d@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/25 7:57 PM, Yu Kuai wrote:
> Hi,
> 
> ? 2025/07/08 9:49, Stephen Rothwell ??:
>> Hi all,
>>
>> In commit
>>
>>    5fa31c499281 ("md/raid1,raid10: strip REQ_NOWAIT from member bios")
>>
>> Fixes tag
>>
>>    Fixes: 9f346f7d4ea7 ("md/raid1,raid10: don't handle IO error for
>>
>> has these problem(s):
>>
>>    - Subject has leading but no trailing parentheses
>>    - Subject has leading but no trailing quotes
>>
>> Please do not split Fixes tags over more than one line.
>>
> 
> This is my fault, I just build a new development environment and I added
> the fix tag while applying the patch, without noticing the line is
> wrapped automatically.
> 
> Jens, please let me know if I should send a new pr.

Let's just leave it, it's clear enough what it refers to. The sha is
correct and the line is there, it's just broken up. Not the end of the
world.

-- 
Jens Axboe

