Return-Path: <linux-next+bounces-9713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02FD3B531
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC0453025318
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3004332ED2C;
	Mon, 19 Jan 2026 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rtfLjtwG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C032AADA
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845922; cv=none; b=DjHAdWBG+abBcgcLzTqoCzJTZyUiJr/kbRlFbPfoCdEEnPA+bibVJ1fSF/OU4GNcu2Xfoo2MDui76NXxwEngVjau3mS0Dc1WmJ7/A3Rduj3px0XjU7f73w7pzu9QKLaapONckc2UK//EyDjEQJOeTsZRNu6liM1+u/+VCS3udrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845922; c=relaxed/simple;
	bh=YdybMpAz4wBeMaKydaaknVw0GLCvs7AI95I7y5/prHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItmWMI68BxXuv+rQx8/UpQ8eDvnSe0qRHNwW4lowERye3dJwerKAC//I5AALMm+M/Cf4SoTCHgLSRZhQv79ecED0MY7ats4OkvLaaVEF/9gC/UYXC9MDdvQcixtH3LBA20Yhpzo3fL/FKFVKrkttx8AJqGbC0fYZOfWvXEoL0Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rtfLjtwG; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4042fe53946so1764188fac.3
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 10:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1768845919; x=1769450719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20fQ8Sv0fSbbtiRLRh0tSGwNNg1vKWJ2yewxK7xovDw=;
        b=rtfLjtwGQeVP5/FyUBK5nIQqX2zExxsd01FHAm0f19wCdeoLleOIl5vocmcFr1ZT1H
         zQqkpzKKPvgiXpFb7IyIyiJ5F+v2693zlQClw44LamsD2q3I4jPSDBKsvo/yTto6xC7c
         PmZAfvSh/Ow6Z7dmcS+yriqxLuM+FtDt0L7uHRAgL3iN5IWRqh65Uud27cG0CLmzHRXW
         NavkaWmzlOfsR4UXtTvyiVXWIqHrAXEMn4lWo53Kf/xw29V1SKAD/+QiPVp201lXWPx4
         mNYIiwdejzqyUiR7DZMd9UAi6aCAP/vAjyLKgjZ69qEq0dz6QO6MmsbPgRqR7vC8HsGr
         Xo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845919; x=1769450719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20fQ8Sv0fSbbtiRLRh0tSGwNNg1vKWJ2yewxK7xovDw=;
        b=fm1E73NAoP4IHIi9Vgo7H2P3Y0ls5mmgrvosRu10RWjfKSs5JSPmVa7AYfTr6A1zOE
         vpmVxL2tRGa71dVRn66E6+0OGHS5Gxe24jZbGblUI0GpQnuAdPjIG8kE+aGX/wVzWHr0
         ElulCf/16apPGeZUFKrOEw6/3nI1XyYrH2M41zBPzh5AQEN63wftAUYMwT/02zeJNP0/
         /e+xpSTSvaeKzZXCZSH2Jd2q/N+ygcuZEPamnkAxe6pG5p2iyIvAk7jpHM/CQ3aNuDBE
         sfR6WkNJTv52gPegsm/laMZfPyMK9HGuA4645WzrCImFERlR1UkuB0gUJXiwIjUu/DZX
         1Rew==
X-Forwarded-Encrypted: i=1; AJvYcCVdvgNz3jc4lB4LlnpANVfe6lpAYBVizvegitQ4FpfevSZl0ON3NHqleVtFJRgNGOxyKn+XGWhNf/pF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2cOeQ3Rqcry+NNSl5J4xlhiWNxO2Fx1P670ebog5WsmmGb6os
	m/9IbZHnb2q1KnIN7A7zg5KAyM/CnoD1sItpDy6QZgxTn/pURrRJWKeVaUggDOrVwHI=
X-Gm-Gg: AY/fxX5tRUnSWVJUUKgzqJIdgxoMaxGEMwvNNWbAAqjOI5omvV/YBkL9/hKQxUIw4d5
	ex5oDpm2qQ1K/19k8gofkpiwCiiqSoGB1hQPPdfycOzma9iWFyq9PEcWARbYjuF/ZcKdb/MGVAT
	M4d9RjpqhMz6keCuACOwFFuROft/dkjnDuu6j3C54c5kw3GGrXxEHB2io6ykBRHR6V6t0/yLzt2
	Z2iQfb005MQxQjEpgw2Lx8177SlYXikBtkYq57YVDaZEkU7XEtd8KsOqVuIhluPcxmgYlnek+cG
	fU8dv0oq9MZ9F00oAs1KsUU246AloSp+0yuIFKBwMVy1g6Ny4W7ihWPHDa8rKrvpfs6SyLCBO6U
	CcpIad+Mx1J82V8kCk6CJOboLwhinOGt25a2KT4vV658i4OMgJZnQi0Pe7//5zbHHews293kawq
	vpoz8/HP49vx6RV68rm566lKjLXckdY4ThGcgL/RrEhWilppGX8rfiPtbEuqxUcGnozbIYcA==
X-Received: by 2002:a05:6871:3867:b0:3e8:8e57:a7a0 with SMTP id 586e51a60fabf-4044d0a5d10mr5450426fac.55.1768845919462;
        Mon, 19 Jan 2026 10:05:19 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bb545b9sm7282400fac.9.2026.01.19.10.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:05:18 -0800 (PST)
Message-ID: <7481981a-1441-40cf-9924-de1466a9f33b@kernel.dk>
Date: Mon, 19 Jan 2026 11:05:17 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aW5xqLq7gatOy1DV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/26 11:02 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> error: unused import: `c_str`
>  --> /tmp/next/build/drivers/block/rnull/configfs.rs:6:5
>   |
> 6 |     c_str,
>   |     ^^^^^
>   |
>   = note: `-D unused-imports` implied by `-D warnings`
>   = help: to override `-D warnings` add `#[allow(unused_imports)]`
> 
> error: aborting due to 1 previous error
> 
> Caused by commit
> 
>   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)
> 
> I have used the version from 20260116 instead.

Adding Andreas too. This is a bit annoying as other stuff in the
block/io_uring tree would be nice to get exposed...


-- 
Jens Axboe


