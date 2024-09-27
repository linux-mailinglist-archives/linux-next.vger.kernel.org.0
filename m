Return-Path: <linux-next+bounces-3993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03C988256
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 12:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D59285579
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 10:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A741BBBC6;
	Fri, 27 Sep 2024 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="iDxbQId/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D715B10E
	for <linux-next@vger.kernel.org>; Fri, 27 Sep 2024 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432445; cv=none; b=etOWvUIEjOB+GIlT/axuBXw+utVK9DafAFwJqa2WqmS3G+capCRIqGggbq8htsaGBTfpUwLcFlzZFq6h/duOg0V0t1Cc4iNt74wolhg3I5rBrjnSbfnWDVn+LDuZyyzeS0UIxd2KJRGJosySC28YR+o8RLHq0HllK/1NVpy7d6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432445; c=relaxed/simple;
	bh=QaIf2OHv2FCRI4jD+DjQDMIScp5cQp7VGmtV8rFkH58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrQEuKKP55BfhxYXHLwWTDEdI49itHttZdQNcxsmCnz1anLL3BCK9DZPZGuFpYPdL4HhgKbrpTURwDE5dQ28zpJsbKtpudbqbpJ5gqXo9fXW3UflO2DrMAMi5NzPVMKzFl+n/f46Vmbjxm4oo/nLybU0IiWtANxwF1DRkR1RrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=iDxbQId/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206b9455460so14518995ad.0
        for <linux-next@vger.kernel.org>; Fri, 27 Sep 2024 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727432443; x=1728037243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=245SVimhBY/4RdQSCjSigvJmIT0nvIptUInN7qYYUCY=;
        b=iDxbQId/AJ7K2XZAnnGWEmh/zWTVtirkXE4K7vIxfofv2BDddI5Fyvbz2msrokVQHD
         OiLpG1hQg3vYQqTxZRaqqCw31tYRFOx+pSHp4Rb9UlHqvF3OM5KJX6AEOo1qBt2mbkfk
         NMc68slmUIM6VNWEA6Hov5ia8yqgFKCFCTu3VLRHJTH61/L+qSKybNirNr/98y7DPZMk
         ydHWcBr2Mnx/euOCG8OEsr0YcmIY1wNbLoaGAomQLiOIdXQ5rVew3SYZackx3vSv+s1D
         no6nt8KIZbAL7ONdVwOEOwdhDEJtXaADueZ4K10RF6dU88Rp+BDl3K2XFX3UoIjZE/zM
         Heeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727432443; x=1728037243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=245SVimhBY/4RdQSCjSigvJmIT0nvIptUInN7qYYUCY=;
        b=fQZemYYYZ+OdqMtH+bSll7+1gfOXl4zaynhKq1eMQVZIfu50T7BopzmXpa/AYRThyV
         VND5nGCNN4rwlQWxbaWxJ6/xzW+NOoa+fpGEd0ODPBa4qbRNWvPAzh2sERWF9DY4sdjY
         /Fh/Y3nq791ZoZIKUxHL25c2a1phbEz2biwHbM12UUigCE1dei3Og+un9WfnIiXBOznh
         3xPo6HKVRupmemTEhTP7zAdtt9yoPAP/TJebAqrr0QR1/PmSmhU8yiAAmv7qgKeWO6yc
         LdLhou3MdHaKfMvgHDCG8W79W/XshgY5n+EHMre/wtQcSE4G2OxG4Lbyemc8O1WHiS0z
         KsVg==
X-Forwarded-Encrypted: i=1; AJvYcCW73LjElAYK9BZiRDvihBDxVYybnM5cW9RgVYxiNrXiwgCylhSF8a5tXx80Lpk0w1AnK3PJYSdgD5gC@vger.kernel.org
X-Gm-Message-State: AOJu0YxQnjGpWgufB1xIC3B/og+sm5CpgtPmH4GczoEjYixbS1duNcB5
	klpD4NtsJ0MCSKC7GImiWarM3EAd/1aJguNQMF6p1+XcEJAKSnHqd5S8wDa96d8=
X-Google-Smtp-Source: AGHT+IEOqhLE3FfQM6EpVLEy18nRkxkIw6K1dANGP4m8yefVDBP4oiz4KzxnNxA3v+lPafHKUwCH1A==
X-Received: by 2002:a17:903:228f:b0:206:b5b8:25dd with SMTP id d9443c01a7336-20b3668c278mr43293325ad.23.1727432442859;
        Fri, 27 Sep 2024 03:20:42 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d5c4sm11051305ad.157.2024.09.27.03.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:20:41 -0700 (PDT)
Message-ID: <e6971851-477c-41c1-b0fe-1d813f8b9319@kernel.dk>
Date: Fri, 27 Sep 2024 04:20:40 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Keith Busch <kbusch@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240916183622.105641d8@canb.auug.org.au>
 <20240927134337.021b1ec2@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240927134337.021b1ec2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/24 9:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 16 Sep 2024 18:36:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the block tree, today's linux-next build (htmldocs)
>> produced these warnings:
>>
>> block/blk-integrity.c:69: warning: Function parameter or struct member 'rq' not described in 'blk_rq_map_integrity_sg'
>> block/blk-integrity.c:69: warning: Excess function parameter 'q' description in 'blk_rq_map_integrity_sg'
>> block/blk-integrity.c:69: warning: Excess function parameter 'bio' description in 'blk_rq_map_integrity_sg'
>>
>> Introduced by commit
>>
>>   76c313f658d2 ("blk-integrity: improved sg segment mapping")
> 
> I am still seeing those warnings.

Due to travel, didn't get it queued up before just now.

-- 
Jens Axboe


