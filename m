Return-Path: <linux-next+bounces-5152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A355A09496
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 16:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5438616B082
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 15:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912E3204C38;
	Fri, 10 Jan 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0WLMew2h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB222211487
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736521369; cv=none; b=fuvaOYjXKAKngmmS1Je3jwvdwy8F9dU2f42/ptcYLOs59iBT2tb2xoI24unO7Wcmzr+suhgUe9FCJDvW/rEslXQy8x7Yy9Q+mkn+iQoO8kAPjRPqTh2An4yhQVp6FPWdBpnSEAzvbsX1diiAsvZ6DHvlRtYCxllhhXrr5YVrCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736521369; c=relaxed/simple;
	bh=rf6CcJMEMkWJLbVR755i17pre52sTWSm+8n10NRmPwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIrZxsHI0WuyiQPnZU8laeXuSgIZdMyuj4iUmyrllA+4IdZw8vk4oEzWPl59K4ejDHbVGfpJ+G0hLqannBqZSSCUlnB7X+Zn+C7CF5crWuhNEFgCf7MxNpCfQTZRZaDccsyT3AEkZOw+wMaq0pQ8Z0hkrD+gsY7ckZBCrVOG52Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0WLMew2h; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso155791739f.3
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736521367; x=1737126167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKHq1I4+wS23tZRiPsoNDVnIf5eOdGV6U4W0dd2CTxw=;
        b=0WLMew2hMlQU6a8PgFTniI/R8U/xJN57z3r58A/7kH4xbXBWNT2uTXBJp3AvCVYjht
         XMSTH87K4JMgtIzcu9uzgEvrdqy3/od7H2XCC1u/NqCfnTB2lO1xpYGP6v4D7niwxfHu
         G2SkMGWyyEEKJV72bjLgIVYS3h78cN8KWY7t6HJtqc00RDN9T3ZK/zIpT1tkrQqpwKev
         0neAZBMZzwP8JDpCwdH/DVvyouf3QqXl8rosOAimTtnKTJOxNqEjHY1rGx30i8iBhvmi
         1QrMGI/XCHYse7ZhoXeZ13Mi3LbOTFP96VTHn0H1ZNqz4boK5BKXu/S4L13R01cAZVCS
         vPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736521367; x=1737126167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKHq1I4+wS23tZRiPsoNDVnIf5eOdGV6U4W0dd2CTxw=;
        b=w88BekIiuCSw3s7GOpnXQJUzTVlMAiE5ZBTeL7Z2L/PdF+WQeAraNXEFTKX2FyGX1A
         74BupwotsB9Tfd+4oRuMck1F/IA0G3AZF96/NY8izq9/g8+Xd4HssL07ejeEElH1kmVa
         jzTH6eLFoPjZpoHi44DSdeuFk0nAtoWOtf5zeXZl+s5HaeS/JjbsjkoHAz4Bmm4gOA2c
         poZWgUmiaidGRMaSAfM4etpXCWamuLdam6mq/C0avQ2MOYG8Pk8cnHQzEhDJSQA1oNjt
         oOI7/t9CH/bqTxMX8v7rPqG5Z+J10Ued1KlORCQLsQxUBq7axivC1iXopLd8VU1oZlqq
         2jfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQMWRDB5SIIcQ6XBeeP3mhEPR+zblWpyZxLC4QfKpV6xLIWDLBA04HUs7ixsZuwcwyCh7Czhyl9Skm@vger.kernel.org
X-Gm-Message-State: AOJu0YyPW2Uc3Kq1EyDRhNff4q8AXMY62SOc0Sy3Hdyx7Pi5bnCtvWi0
	Ahnid7qVxetnC+X0F1bROD1iZ8w5VLyRP2m//+yK6UaUEDC2532iBR56Df4GAYg=
X-Gm-Gg: ASbGncumS0vpcWX2hXg2ZwcAbEcuC7MYPcdHJuFTPVp5inQ70dyZkqkZMaR+jHLvyMF
	GUIxRSPSYNthzqQkXGmd9vmIjXZ8nxdZU2FGTGQMeCBVo9WHDg3jR7nvk0pnEJorSMOXwUGfIaU
	3hTC80QHqAJy/bxJf9Bd1DGEFI4i9p6BM539SKQ8kVPETtAgJ1Tyz+0JiUeQbUtomH/9gj8z1DV
	xWubM7JAAQtSs/c9C1szIJxwtlqBm+izZd1gge6iojF6BcpKumM
X-Google-Smtp-Source: AGHT+IHyLhnHpkW1aRd9Uy/4dFtRInCS77Ck4Pzm8qkgIw4buwcaWXv/o+BaPPgFubE9f39qTvqxhg==
X-Received: by 2002:a05:6e02:3a87:b0:3ce:394a:ad4c with SMTP id e9e14a558f8ab-3ce3a88853dmr84298645ab.14.1736521366894;
        Fri, 10 Jan 2025 07:02:46 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4add9b01sm10150675ab.40.2025.01.10.07.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 07:02:46 -0800 (PST)
Message-ID: <00e4ae73-f4e5-491a-894a-8f6f166c1bef@kernel.dk>
Date: Fri, 10 Jan 2025 08:02:45 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: John Garry <john.g.garry@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Milan Broz <gmazyland@gmail.com>
References: <20250109124617.1b4ff0b8@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250109124617.1b4ff0b8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/25 6:46 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/md/dm-verity-fec.c
> 
> between commit:
> 
>   6df90c02bae4 ("dm-verity FEC: Fix RS FEC repair for roots unaligned to block size (take 2)")
> 
> from Linus' tree and commit:
> 
>   5c292ac6e69f ("block: Delete bio_prio()")
> 
> from the block tree.

Thanks, I resolved this in my for-next branch now.

-- 
Jens Axboe


