Return-Path: <linux-next+bounces-8970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AAC5AAE0
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 00:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3ABF24E1E22
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DDE13A258;
	Thu, 13 Nov 2025 23:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="3OYhO239"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC1032ABC4
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763077524; cv=none; b=UTVKVUfk4hB79zr69W6Kr7NJj+bUEuP4aHyx2sLjBGw+fbO23YyaQGbYH/yAnZjrnzCouOOhCN8p9139ZStLp2v4EazcKIf2mHajV0SdeS1fxPIKYtMag7R64CB4OQ9c4GSw7Hs8+VInif2uW1qSwYW/xjhNEUNy1usxTP8SvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763077524; c=relaxed/simple;
	bh=eCwNx7UCHT50KyonwB7Byy+ImylXXQeSc4yNT1WQeJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L80koopIgitpHqR8gPd18uoaE6Lt8YyfPZjc4PiIlVQsrBMvrPN2RWDKZGRr3978LGvsmYsfCmuYNdpjgYFaatykSAOx6kTZGqyyJytVjgjgRqmbiJz/WyvpBR/A+RYmYcz6mGps1/hh3I6Z3DFKStOZ1IcJ3X7pnIo/NNUlqbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=3OYhO239; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-948673fdc47so66862439f.3
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 15:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1763077521; x=1763682321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NVF0yijrr5gty/zacqzc8QZEE4dNrsypQNW1zUau4Pg=;
        b=3OYhO239uDvdi2k/gQes8Hqo7ACUigv7jVHPRPhqfPPitkBlB55kkO9pGUtsVPzM8A
         cFzHCW3O9LWxLOSVgpdJgoABg+WCJf8PHW8gNpOSBqabGJO6uQHZvTpMWSCzwRD9WWhB
         g8GY4bJ4PtN8uvQyT44ED6QK3y+V17zFc3DtGIRnbiuapKgN+HvDRr2nlfLpW2ies/sI
         IL24NbYJijg9+MQRhIv+VtHmFsGhMwwRR8U6NQNW6tpb6y+XQNtHQ1JFb3kLHStLoUF2
         l13xfpA2mzDc6BNq867pvAmM/qnYyKiAbWJmyTHJTDLo5ThtMVesvJchKX0vyO+oRIwf
         yHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763077521; x=1763682321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVF0yijrr5gty/zacqzc8QZEE4dNrsypQNW1zUau4Pg=;
        b=m0qJ7hRRGnSoxJFaHrT7kKSze+hsuDVB0zA5spn5vOoPxSdhjbIO7PCqANH3XZmPqq
         jZ0ky9/Hz0Ah7TYLJGsgEULB42dJKfPrm9p5XX7+Ued7KbHw4i957xoQ6kRalplYZ6cL
         3+igzr6EL0di9/9KeWU6eiA28OI4VmfHMpXIIrLrSKEcUFge+sD4xnxOLop2Q0XVEq5I
         MOWmvos1eAnARaUP7ps1u75DsgmPocIVYUSdHn8DbovNS11AIiOAwUL3BNzcyospI6jX
         anbfzyVZiauS4iZSriD2R6LpxLE1Dp26ySrR3PtX/bC4O2hZFMTs+xhQLoe8g8EWVG8y
         6m/A==
X-Forwarded-Encrypted: i=1; AJvYcCUn4h0QtD7etAeUlhMmDEEE9rLGBaeucxm0TffVGqSRkPg/zP5SLjBvoqBjJ7S1pmqsF6PvUgkpqv/F@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWwhIaC9ed317V/cBKkr522aRGaGgzVeSOy2Ll/sLeXhkYCKl
	0VmdIolVrrpuFjsQDS3GNVo6+qxI3Ky3sGvdVwtIxnv50Sgb1zSzS0LyTqYO4XwdFSdOBSFCbmH
	Q+8tH
X-Gm-Gg: ASbGncvzp7I5r+IwtaEETq5ljBsXPEG4GUMirJkJhuaLIIxQS8ZWD2FcMVKAoC4YWF2
	T9bYjeuCbPSuMfMDXWfTE3wIJX6oFcXk68m/4eOsgM4srqpxOo830TnK5QY1vFH1qWEoi4Zc2/M
	cssiSKiB5hCorgNzcEf4Ow33DCNoK8KOM+v89qWJQLsIYG3xGD2phqVI6cL9mxemRQCvH1GNU3J
	9HlqsPKc8QpzgVaL8apVQ+derJ2cncDiVhyAyZDrjyQDwXwLcnO6V9/CZ+bYNXuN7h5eY9kCl5m
	gjXe4CZX2UOiUhqfOA9JbfNv42YMzqb1bxvmm5Wj51GPT7IyTLVVA7QnYCXrfrnL3+z79kZcJnT
	x2cDDPQMwDAdXL1r5AmK0FONbOh5RRoysxTD7ElcrYkVNWF7y+0XuFWvuA9aFFGhsAnHq6KL70A
	==
X-Google-Smtp-Source: AGHT+IHMgHtuZpIzINlZtruEMB33QXbUec5A/gH1FBbp7q4lfQQJoqPtISDmGosjbkfyu20ErSZFTQ==
X-Received: by 2002:a05:6e02:1fcf:b0:433:68ab:e2a with SMTP id e9e14a558f8ab-4348c93ef8bmr19216535ab.23.1763077520917;
        Thu, 13 Nov 2025 15:45:20 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4348398f2e5sm12037335ab.18.2025.11.13.15.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 15:45:20 -0800 (PST)
Message-ID: <9c2267cc-6b5a-40ce-b428-05d6ace6f2c9@kernel.dk>
Date: Thu, 13 Nov 2025 16:45:18 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Damien Le Moal <dlemoal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251114090436.2811f38e@canb.auug.org.au>
 <48eff55b-f100-4057-8ff3-1d4b2089533d@kernel.dk>
 <3459d7a5-f49c-4c5e-b010-a3732c3b0e00@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <3459d7a5-f49c-4c5e-b010-a3732c3b0e00@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/25 4:38 PM, Damien Le Moal wrote:
> On 11/14/25 8:07 AM, Jens Axboe wrote:
>> On 11/13/25 3:04 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> In commit
>>>
>>>   7b2038b1b1d4 ("dm: fix zone reset all operation processing")
>>>
>>> Fixes tag
>>>
>>>   Fixes: db9aed869f34 ("block: introduce disk_report_zone()").
>>>
>>> has these problem(s):
>>>
>>>   - Target SHA1 does not exist
>>>
>>> Maybe you meant
>>>
>>> Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")
>>
>> Guys, that's now three funky shas that have never existed in my tree.
>> Can we please exercise a bit more diligence in actually tagging patches
>> correctly?
> 
> My apologies about this. I was careful to take these from a fresh pull of
> block/for-next but I obviously screwed-up the copy paste, missing the first
> character.

Just add something like this to your git config:

[core]
	abbrev = 12
[pretty] 
	fixes = Fixes: %h (\"%s\")
[alias]
	fixes = log -1 --format=fixes

and then you just do:

axboe@m2max ~/gi/linux (for-next)> git fixes fdb9aed869f34d776298b3a8197909eb820e4d0d
Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")

and then you're just copying that entire line, making an error much less
likely. Still won't catch someone using the wrong SHA, but it would've
prevented your issue at least.

-- 
Jens Axboe

