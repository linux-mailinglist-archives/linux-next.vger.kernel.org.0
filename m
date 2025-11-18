Return-Path: <linux-next+bounces-9079-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55DC6BCA6
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 22:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 539CA24281
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 21:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434762EA46B;
	Tue, 18 Nov 2025 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="abjdPZ+N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A49285C89
	for <linux-next@vger.kernel.org>; Tue, 18 Nov 2025 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503178; cv=none; b=qy5nkhkLbPcdbH/7CSADwaLlG+I5FGp5FE3caMm3mthSxece3qT+1lBZscw2UNoD/c5GB4iXpgwEK6Zt8WigxTlzTkUoeCs+rFbX+ot0AneKKV8nRey7BgQFb1s4FJTO+NnyaWxf9fWeABPy7bm7DhZ92SWI0qM3LvTysQFx2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503178; c=relaxed/simple;
	bh=qyB4IitAcmvNba2q7faaCNWqnk2JKP+/LdHm1U8GFvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SeJStpSjMNmiTzI5fWMqw2+g/nWSadAavn5SsPeFyhV7fzhQl4jGxlNQCzptxVLm9kehwK43TEMy8MBzP8L5c+kCFdr19Gt9tHP3Hn+EOBg10nHEqJyePkaLXFhF1Llk5E01SqYufSSNkdSSUxpGG/7fT9aI91yJ29rCYpTlge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=abjdPZ+N; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-9491571438cso99888939f.0
        for <linux-next@vger.kernel.org>; Tue, 18 Nov 2025 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1763503174; x=1764107974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4cNa3qMUjlcXse9It79LNLNrvYdSkvCQNM+XmxF/wA=;
        b=abjdPZ+N7FwTV0CYazEW9PFvb/bAnaJZpQS52Ho6m0RaRWGgN3ITiBSP+VgO9DBJ77
         YpFRad3XHT9VComNU2KC6jSrVaoOuZ776DgarZ1VPJPY+7KMTNF1E84RL4e94MmrP+VA
         aVAegT2GDIK1G0FSErpbQUTeJ1dNwHw8yCsfxTY3jEKQ7uvjHKKeWzZ5T1i6mRBGmwSW
         qiKg/5/HRX8MaWzXg/lMusmP2HQXnZUjbwaM+8jBWN+AHWkDQAFRSiZgwRHZztFwKzAk
         7gkq656KKT1tzsWSLhFF1vDWZ4SVHaqMKT9I7GXC1SZ9UmjwNsErKTbMt7WDja+9kd2o
         6hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763503174; x=1764107974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4cNa3qMUjlcXse9It79LNLNrvYdSkvCQNM+XmxF/wA=;
        b=juPwPwt3yhPdZSzD56/hzd35gxt1Mbqunr382hd0f8HRxMXsNWDO2FMSvLoAyYcsTZ
         ldhoQg1QcgGK4FCelbvMYZr9ZIKhptkHvEAJL2PoHgHL642xvFL+kHLENfdg1l3GclhV
         uEC3cIyZlCUPJYvIJZ8T4h6gNpkrsbySuOY7tZljWYPJO6q/Vm+wFvdsgM4s1ebzA4wU
         m7aC93Nzhk975BkjHR6KnXHBcBZzrPZQ6vwlv7rnVmq8XlAfj3K0fk43PoHCGBd8lJ1s
         H1oJAZN4hfTdFnp/LwarFL8U3q+4F+IJwFw9P+F27ohGILTl7AFRtD0TaeSKqysCvV3S
         Jy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvxQoQ6PZEguZ4Ni3AC1nM6RCOn6LIMl7qqueF14uKWzZx4q0wId/mvT3GB8Bqf7kEXBgsdM0y5wzi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlh0f81Gk019qeKYm1ZODt0XE8Z1YM1SzRUHT+U/FAXsJKoElJ
	1OVaIiRCfTJ9Y3p+8b9mba7XM+xut2ZHBxCEZBdVlSTxk0vgkJ+fCL+4yhcXiURzBWU=
X-Gm-Gg: ASbGncv2Prp7gvObPwH3CqJ/tRMT7fAYJy4YROH3+6l5vgPZqUSfPSuSpqVogbpOsdR
	KBdEkJHEZ98dEY4FyMdHquD5hAGsQkEOCNe28JAAJ3aspzLqqcvjh/VD6w15zE7rT0rrLGagBv2
	TZBInsB0SecoqMgiSZzVEYUsiN1hjxFXyIgqFiS3T4Rj8ksDM4p9t3Rr0oFotsWFGMbJLk6gsj1
	KMLIndQQO0xg86PeEbOmnZEuDVojpJu8BM0aZ33dfrrjNZekisco4AZyGWqxfFyBZunWCpgTN8S
	CXdXxMPgNjML11vt3NkHsTcjsR6h0D+8A5a3J0BerkOa49FSmOCn3rtHgWyBitKOoYmJ7s2O1SE
	QV+NZ6PaAWpTc08p8XnaAkcSlhTT5uV5aiRw+lUeD+/XBdNVgU2KO8+Htf8UnMGqVcfkOzW8T2p
	ibd8oi7UlnME7HiSEJvqI=
X-Google-Smtp-Source: AGHT+IEw/LqMj/baNYp/512gdh3KAn7Fav5mMentY0Bus1mr+eBuSPX+rY/0eFKu7nGnMKeDOAfC0A==
X-Received: by 2002:a05:6638:aa10:b0:5b7:be8e:1555 with SMTP id 8926c6da1cb9f-5b7c9d5acb2mr13271092173.9.1763503174614;
        Tue, 18 Nov 2025 13:59:34 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd27fb3asm6555908173.25.2025.11.18.13.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 13:59:34 -0800 (PST)
Message-ID: <a8a99b12-6c15-43a5-900b-205424fca72f@kernel.dk>
Date: Tue, 18 Nov 2025 14:59:32 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Xue He <xue01.he@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251119084822.18534f63@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251119084822.18534f63@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/25 2:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   ddc32b7f2921 ("block: plug attempts to batch allocate tags multiple times")
> 
> is missing a Signed-off-by from its author.
> 
> The commit message looks truncated ...

Yeah, it's because the author put the --- in the wrong spot, above the
signed-off-by-line. I'll fix it up.

-- 
Jens Axboe


