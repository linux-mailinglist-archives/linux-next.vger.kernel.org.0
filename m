Return-Path: <linux-next+bounces-498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91D81AD11
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 04:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA661C237C9
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 03:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652C45248;
	Thu, 21 Dec 2023 03:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Lb02DA8y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E37B522D
	for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2037ef59df0so38481fac.1
        for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 19:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1703128267; x=1703733067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GmEy/1G532CwG4AT34Q355aJksdu1DlJSbYzFg/dkLY=;
        b=Lb02DA8yI0ZzNiZMrd7deVBNfSO1uEPUEQkNKQ37Rxprq1KJqCeqNEK5PXfhy4RRLX
         mr4X/xbtZLv7tTbnm7eRRgWIMQDP+QE8t6O8V8Hfh1XsO2oW4nBOX7gDSFOH4ixA+Q/E
         o4X3tRH4Ic8d+TKvH5cvP4LaI43QBn0DwJCRGLa52H9ityQQyeKUykYnfKMF1EUgvdoa
         +YKz+959qzQMrpchlsVLfR1UloI8GTMrF0OpVqmaH4Q/Qr9f6IN8J1Py5cYqMyI57Nzf
         63HJiWUNmhvf9bHiGE20lNPSGbegNlYVOaXECz6Jtrcqt3/x3V3bWogwz5vd9MtYmoiS
         XAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703128267; x=1703733067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmEy/1G532CwG4AT34Q355aJksdu1DlJSbYzFg/dkLY=;
        b=Ld8aCszjxrLx8EINbySkW29rwaJ9j6Wv/YvNyxrIgx2lbUuTWXw7lkze55AWAy3W3h
         ORlDYWmYzWOYnBWZxBNmdPVzH05tc4+/2bW0DRv1vxTDorusxGARxDCTRp0ekU4pPPVE
         3oOjaR+mqDco95JLvQyiHNsg4LgKWm2Ycu8pJEU44DRH6Tqy6jKN9BQmCMGKX2Pn0W29
         CmpAMHs3hl2hEpnDuNOwBppQX8QjHdjMBLm7nwn84hWzhYC3WTQp5kgfssX4aMG2ATBe
         ajjdL9yHQkBy1/bamH8Oy74BraDVK5mYRweGudtS5tmU5SC+3/Bp2tBFw5L73c8mOLdw
         9Q/Q==
X-Gm-Message-State: AOJu0YwQ7u/0rxKH3d2hzQ7Y6Vj3mavuxiuBtn4pLnKXx2Kj5yiw/jsc
	Gsm8vuWX2wAzsnoz4lDB9k7a0w==
X-Google-Smtp-Source: AGHT+IFDsk18QMxGkQpEbC1aT1ITuGrkbqfiR5rv1/05sf2oXeBRRGrXZKdrnOA470/dBajOFYhwOQ==
X-Received: by 2002:a05:6358:5284:b0:172:d475:20b0 with SMTP id g4-20020a056358528400b00172d47520b0mr14803788rwa.3.1703128267299;
        Wed, 20 Dec 2023 19:11:07 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id u3-20020a056a00124300b006ce39a397b9sm476306pfi.48.2023.12.20.19.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 19:11:06 -0800 (PST)
Message-ID: <afa3550e-f522-4243-a7ef-da171628c345@kernel.dk>
Date: Wed, 20 Dec 2023 20:11:05 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231221140124.16418659@canb.auug.org.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231221140124.16418659@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/20/23 8:01 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: "disk_clear_zoned" [drivers/scsi/sd_mod.ko] undefined!
> 
> Caused by commit
> 
>   d73e93b4dfab ("block: simplify disk_set_zoned")

Oops, yes that's missing an export. I'll queue on up.

-- 
Jens Axboe



