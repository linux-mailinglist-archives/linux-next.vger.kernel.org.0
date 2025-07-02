Return-Path: <linux-next+bounces-7309-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1269AF5DF0
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 18:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E6881C42110
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 16:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07732F4331;
	Wed,  2 Jul 2025 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AxAQjm39"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8842F4A1A
	for <linux-next@vger.kernel.org>; Wed,  2 Jul 2025 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471861; cv=none; b=OaPRTsMifmUveOxVFcuCPsBidKwYdX3AVZ5h4HSGHQtWx8GfzRXEB4W2cplhjzObdC4m2q+YOyvkGHrQREeYVfxbVtDIY6XyCYjdUKgZxk35iYxGiUjM9gpS5TKKdyHszu3qgp8t4Ph6ctDDaR1DB3MfxVP+3ZB/HwNfuyivo4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471861; c=relaxed/simple;
	bh=UBW9AmBKxoaiwqYygxaAtj2TxtrVFxLGmLOlmZwydlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAn5fbvDw2PayzCsj5OpY+YdE5WZE0bmaaJpyVjL1rvyHcBdcPfQeyDufBS/nNRm+JPB90X6jLx67yv+B+/boeJnmd0xhdVxQNQfoyrci8kVlYTvL3N716PATEVVEpf311ESRzlbAmE82Qnl+n1jWc2mpoupuQB42Wv1FhUecaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AxAQjm39; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso26015425ab.2
        for <linux-next@vger.kernel.org>; Wed, 02 Jul 2025 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751471859; x=1752076659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaOezCvCj2SfYR6XkwjTmit8j2uV7y/Y9zEGmjTXRkg=;
        b=AxAQjm39joQBHZft9a5oDr1wlcrJ/ZrcHOkrPfm61kL49Y8VgGoN+dGsknE18nMt+h
         e01e/IaRaGlh6lvzUA7TLDqD9eNhlkEtmPOpjZzPHw3+P8XSD6G8JkjfmakrHrGcgjqY
         izbmLB0z7VD9XwczXX580gFBQPJiK5/jYpzPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471859; x=1752076659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaOezCvCj2SfYR6XkwjTmit8j2uV7y/Y9zEGmjTXRkg=;
        b=QhKrxKSkGIjvUMMgE+F2b7eblmbYQxNYJYhK6lDJpGBLlBXnlXq65Cwrurv6vjq+1P
         crURiAiSG5RXjx48gtV803CoJwER/ZOYo1av6Cb+cnair16o5BoZvyEdHfX8igI2pJMP
         9hA5qtVTnqq8Um/Uq7BCJKRusmfhD7oP5OREWC6ScMCGSeRSiCZsiz7xU63vpH/tAAg0
         wmU8iYJT0fy1A2qMGLeSwqImz7Vk6asU9wnggTumhNaw6aGJYOp4lLFAc/MzSxkw3ZJk
         4e3F45Z8LkdOWIWDQg1Md5tL40eMupmIGH7ooEY0HjzsnukS07AW4kA9wpLQmVRYdxRR
         xwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeFC70XuhbbUs/y0ioWDk+fTDQR3LdYk+f6r5elJj976gzMN35RZEj3o17XRoh2TmHxdlbogwGNbfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIb8wqbTHkSNTpxuOl7c/sLRCMmVieyimTw8LP/OI0zZGA4EBj
	DB7p3W27OUJ7ChiUFRtRxzDgkLeyWvoZks2fAFv50a/FjzNINBxDW48sR4bl83OQZMK39/jodYf
	QIZAO
X-Gm-Gg: ASbGnctkj8T3DQ+kd6gDDxndFQPEUyCnEFf9/7M3EhZofRYEEhEpGd962TDfTdqQNLf
	5S3EWKi5H0xHwM+ArtHQuFrTp0W0Z4m1sWavGfYDZN6hdX5S7ZeSDPJnJO9psHln4lq2F6Y6suH
	81FfYLrG/RUB076xUCcvUbYPkeksewQTn9fwXDPCT9SOMLI8ko0UV0a75aILRHSzyVLLp5o7aAS
	MBJuZbsRyx6pQuV+KztNP8zW+lfRgUzt4NHajSAewSa1Rl9k4ULOw/8rW5RowxeensSNWdmNgrG
	AY5s5XX6JpaJqLKd8SwDwLXIdCxYN+1iLw6voSyHZTstzye8rZZm3XQ/cjx377P89Nf7AXdO+A=
	=
X-Google-Smtp-Source: AGHT+IEffZHObu858zlikGrgCt/g9OhlW9cNLvPa1LkclqEt06Pa7ejia2NnHEl3ekATO4Eo0uH8bQ==
X-Received: by 2002:a05:6602:741a:b0:875:bc7c:5cf3 with SMTP id ca18e2360f4ac-876c693db2amr435512639f.0.1751471858695;
        Wed, 02 Jul 2025 08:57:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204ab7b31sm3014206173.127.2025.07.02.08.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:57:38 -0700 (PDT)
Message-ID: <1181af84-d66d-4ee1-810d-4bd697912b80@linuxfoundation.org>
Date: Wed, 2 Jul 2025 09:57:37 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the kselftest tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250702163622.12bd45dc@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250702163622.12bd45dc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/25 00:36, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the mm-nonmm-unstable tree as a different
> commit (but the same patch):
> 
>    fd4fadf0da98 ("selftests: ptrace: add set_syscall_info to .gitignore")
> 
> This is commit
> 
>    1d8c98f3b408 ("selftests: ptrace: add set_syscall_info to .gitignore")
> 
> in the mm-nonmm-unstable tree.
> 

Thanks - I will go drop it.

thanks,
-- Shuah

