Return-Path: <linux-next+bounces-4667-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC339C0627
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86D41F23184
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA31620FA81;
	Thu,  7 Nov 2024 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="PW2wWdCi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DF1EF087
	for <linux-next@vger.kernel.org>; Thu,  7 Nov 2024 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730983763; cv=none; b=C8Blquv3nVwOb3AyC+YgZqwDPDkrgChQhpc5EpYIh7bEpjRLnfKJwKcRIaoYIQ2slDdc1CDCRnRuZSLw438Hsq6BVSQmdPWsblN5hDF90UTrilO11dmPClVzpmwESXE4Wf9iex/3PW7UBnhnKZIecH/5Ald1cp1u7dM2W7rG2Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730983763; c=relaxed/simple;
	bh=YaluIJlgoCCuBdHgOKc7RYey61qon8eAc7qQZACWI6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0UrjX5t8u5CuEqU/RhQD/THy+UIxRKj3oFua2sK9GHxO/yB3FjLodjE8eoja0Z/XHVLcYNfdH7ocNyBOYEx1e0Ux76LM0ST9wJVtC5nViUg8qoVXlPdVzL7gMGFkBHI3xHvh0bktD4UOYKTNG7KrC/AHktZE9zGNCqCMH07F1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=PW2wWdCi; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so721062b3a.1
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2024 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730983759; x=1731588559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94jLGAE/7l0i/fZSh0MjmULEecf21MaMbr8LKDkqjrs=;
        b=PW2wWdCiGYFR3YAnjIgbVNOebgQCC/2Qaxgvr/BYfuiYaaqrS9U/csDt9DAvPCNWMg
         m/aSzn6/3PHjqh3YVBSWv9F4Y4anApYyqTk2GtgZppszeUIbY/zml7Q6sX9uFFxYldmb
         O8us71BeryylIXg/yuRaSAEM0hcQBvrpRiaUY5+IhwxsbjCRgQxJqAyBexGViykh+oZZ
         Jc/J9Igd+gCJiWDDBJDuTIiB8kQpC/lN5+3c4CIJodB3fOg82FTb/ht7IBjHiKMu0Ixe
         loPXSgZU6HFQ89UmHf83Xj//SEJ2J6QSpF8ICmKZhyvAT2FrqvM3y1I3Ti0Rk7fjSjVV
         tB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730983759; x=1731588559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94jLGAE/7l0i/fZSh0MjmULEecf21MaMbr8LKDkqjrs=;
        b=megWtkfYVDMoJ4usAa3EtvNrGD78GjFAWicdOHCYlCEeuKK49FKE7Qt+y6DepcO29y
         8oMjO81rvJxTuKN+LP9Xm/fPczHnwuw8kCTWwC1LrZPVXnSAACgD+Ope0cNaF1AWgb1I
         9WQJVaD7VJ8vah98t2gcNkZqLqCQa3AdawFJ2XBcam1ovXaTg70kR8ZNDKp7gRSKIUKB
         hUys9PFJNNVQTXDYWKJbX5Lq2lmCrde2cxPTwvnp6ucPx53tlwb0niMlTXHsMDlcnlLq
         4qZFNKzRc+hKQL9CS5pXhSxs7yLvU9LnHgGpIcW/VhiNhvWIQqhZEtI0gDHzQjCt8jFa
         yV5w==
X-Forwarded-Encrypted: i=1; AJvYcCUCZ68yQbY5pmf3A3lMyDI6L0hqkOQeOJ3UIy12N7KdyETT2fYp9gEnyYjIHA1TFk/2wEAFEysb+W0u@vger.kernel.org
X-Gm-Message-State: AOJu0YyIi4zQ6TzIdfrOEwYTUmjkbvV6ZMuaJhosz3mqzaJLedv4v4nY
	qpDEmiRMjF8/VztcCMquzwKe91K3qcRLj8EZXi2IAMt0JOFVPNKy7air9zyyhXo=
X-Google-Smtp-Source: AGHT+IHX7sxlTETvpS+WLgqZfj1rC52dnNzvMfoR3p6xBcHaEDdnd4Ruh3GT6l4lurUPhTyFKlPYvg==
X-Received: by 2002:a05:6a20:4c9b:b0:1d9:3b81:cdd3 with SMTP id adf61e73a8af0-1d9a83ab2d9mr45744337637.1.1730983759535;
        Thu, 07 Nov 2024 04:49:19 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56421sm1444525b3a.185.2024.11.07.04.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 04:49:18 -0800 (PST)
Message-ID: <fa092ae5-d15d-4f53-9de5-d06ebd985b33@kernel.dk>
Date: Thu, 7 Nov 2024 05:49:18 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the pci tree
To: Philipp Stanner <pstanner@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241107162459.71e0288a@canb.auug.org.au>
 <71860affadbd3efe72edbced28b3135924a28594.camel@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <71860affadbd3efe72edbced28b3135924a28594.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/7/24 1:13 AM, Philipp Stanner wrote:
> On Thu, 2024-11-07 at 16:24 +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the block tree got a conflict in:
>>
>>   drivers/block/mtip32xx/mtip32xx.c
>>
>> between commit:
>>
>>   5080394a8fcb ("block: mtip32xx: Replace deprecated PCI functions")
>>
>> from the pci tree and commit:
>>
>>   91ff97a72259 ("mtip32xx: Replace deprecated PCI functions")
>>
>> from the block tree.
> 
> Ooops, that should not have happened – I must have lost overview over
> my branches when submitting the latter.

Ehm that's not good. I can't drop it from the block tree, I have
merges sitting on top of it. Can it be dropped from the PCI tree?


-- 
Jens Axboe


