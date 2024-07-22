Return-Path: <linux-next+bounces-3097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F6493964F
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 00:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1FF1282153
	for <lists+linux-next@lfdr.de>; Mon, 22 Jul 2024 22:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F58744C86;
	Mon, 22 Jul 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="xsocAl/W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D2381B1
	for <linux-next@vger.kernel.org>; Mon, 22 Jul 2024 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721686453; cv=none; b=fY2Or17SOaeTAuKKKbseqZJZCEy5N9QHO8HXYvpF/nUVGGrj5XJGq0oelESr/XPsIw7uOfrIuSKxa3VY7NiD3pTh4nJ863fvRBVLR9pzYnlq8nzz2RdFuDAajujgavBZMFGYjzIntx0YHlRj8OoyyxhCl+nDzym25pEMp+RHqhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721686453; c=relaxed/simple;
	bh=WpOlRs4TOSTE1yLR4nzWEKz1bJL5jPW4Utj8q3Bmro4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7JwCXQrkD7D7mypjHQ2fhogI8JWGeqMu0qUu9IZM6ICZD7I5ngcvwOUt75csaDwznFxDRqrIJHnECUYxafTnDajLrNFXqTHpLom5dSVKgb3alPPkJo+gkwTrH6f/CiHDbNztZmKqyVNMqrHhBHdsKEItgDOoFJIS3sjUKF62hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=xsocAl/W; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cb77ecd7a2so469208a91.1
        for <linux-next@vger.kernel.org>; Mon, 22 Jul 2024 15:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1721686451; x=1722291251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+nljKvLkh0rGWIbsB2pQpM9uK/ktoXnRCGn0QKA544=;
        b=xsocAl/Wx8NQmCbmrLjViOuR/CEh2PQ7Z/x1tAdc1b93u3fuFNwiTdrg7EZ/AytSSY
         O2x9qFVlng5oxEaM56V2qJizOc4vvz5VTiNUHtPXQciTKL/O1lBrI2DPX+EhSwmSZYjp
         DY0rUUWBSltZh6wgqvUabdzpIv1mV/bfQqSQhsdkZndGvxCXRXhHXTZ/Prj1fZnngWbW
         2NJRxjzla9nj39LsX9Bn6SdnlWBllFr7FyhTLnyUqrNvCISuEKEaCPBQBr854hA7h7YK
         a5XcR0lZ7G8LSxTi6t07/Xm5GXJNRGvaRXB6VAvelM1qkQSzPuwNrwOB+4MrZroX4HDl
         29Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686451; x=1722291251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+nljKvLkh0rGWIbsB2pQpM9uK/ktoXnRCGn0QKA544=;
        b=LrW1Uk1/eVX5ah2i9d6TJFiE3+8B4D+njoAJ+9cSgOJ2PdOaLQ0gfAajnU7XQ/4Uwa
         gdpuNGqoYa5FJWq2BO5Rvt3a755oxMWJM1eOh7ol9XiLPilbqMVcgiOGH6lm6t6dDs72
         TY1ZLoUtOCdncWmqgSKW8zevjjvqGc2yocRTHxnPEcQnTvGjc8RVeIJdZE/L37OFATbB
         Bv2ywsix3TGbF11tKB1Mu4JNghjW0FI8B6WI0LvFvazDX082Fktc+62NKmGejsyonbNR
         0MSsZ/jGI65vjtaF3Qb4RnMd1ZpPak3jQyc+ID3taNcbBUMWQy9Z+vTEMwxASdv6UkWO
         845g==
X-Forwarded-Encrypted: i=1; AJvYcCUzguA822AWx1L8Kd6kwuVPICSx1hBdBM8M8vnGaLgWw9rGHSaXNlBK+Bp8e4XqdzJ7keCMvvYwu0k/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe8jAyZ7/T079GB5aZGuD3MmkR2LE1ii/MyD/+uHyKQhbDuKdj
	NaqjeziF9XMJI0c9rkZGnpD3SuilFSrpstRlvFBR+AhuUs961fPQadUFm2KhlAW4h5TWRnuMqDF
	opW0=
X-Google-Smtp-Source: AGHT+IE2S4TxHAoAj6cfc17mler1Q209Xj+EYn/BpQ9nbAqCDBkkQZRbXDCslzfR5c4eR2owAtOsBA==
X-Received: by 2002:a17:902:e749:b0:1fc:4377:d946 with SMTP id d9443c01a7336-1fd746034e5mr74208745ad.7.1721686450689;
        Mon, 22 Jul 2024 15:14:10 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44d179sm60356005ad.212.2024.07.22.15.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 15:14:10 -0700 (PDT)
Message-ID: <6aa71f3d-9eac-488e-9d90-be3b806108ce@kernel.dk>
Date: Mon, 22 Jul 2024 16:14:03 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240723081113.1487a535@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240723081113.1487a535@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/24 4:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   2554b855a2f8 ("io_uring: fix lost getsockopt completions")
>   77feb9505ce6 ("io_uring: fix error pbuf checking")

That's fine, my for-next branch is dead now until after the merge
window. I'll reset it to master.

-- 
Jens Axboe



