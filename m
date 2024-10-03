Return-Path: <linux-next+bounces-4084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AF98EF46
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 14:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBABF1C2226D
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 12:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B32A18593E;
	Thu,  3 Oct 2024 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="tqSlWdYo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7306E184540
	for <linux-next@vger.kernel.org>; Thu,  3 Oct 2024 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727958700; cv=none; b=mczFzFtpwsXN3vkJWP+eMg3c3Z86Hl45CBKeT+uDRb6SCByLpDHta1T7c4i+DCUkJDaLS7yBLa7tk2ufZLaILBp7z/M1yrh7KICTzmvNuuZg5qQf4U+/KDOqyC+0KpLbYcbHSVXWu7pKRFD1M9mv/ERtZIML/14PdJ4xZRuSWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727958700; c=relaxed/simple;
	bh=tIaG+o3yh9ERYoIZKvf+Cg1UAgJ2cQTtbQ+wkw/kiQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWFvojQxwTn6YU1aAE8nLq/A3C3RHoi6ZWQXiHjhHWqQnDF6JPRfW1fCO4is93+6hyjpo+B7fXRPmZFKm6nAID71e45g9Ep3OBYFcaxezgnzga68LLnu2wxrGtDq8Mkt4YpxOdEr7ICpnhFx58X0wyu9lFxPe5GmAXLYGfWnVxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=tqSlWdYo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-717934728adso773489b3a.2
        for <linux-next@vger.kernel.org>; Thu, 03 Oct 2024 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727958697; x=1728563497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiwZ0+kmP+aB3WknQP4rCVFKu+wP1zezgy2Cp2IqFhY=;
        b=tqSlWdYoWrFCvZTYKaJV+HFllI/8LyC/qQ8U3l66MpnV1/4s8pvoIgee63ibYaLyys
         JvDRsQWyfEo0HkRuUIucM6bXm5Udm57iqZDOnPDknGMJiERzkY0D4aocG+ptaKJHa9JT
         gLeLsGvdaZLvyG1dx86ksHm/AkDv9D4FD20CBCqiNw+N7BrZVEfITjLp3l6166MtAQVx
         dFnyvuc0SxDp5GuXGvIIkLonG23G8BsLnfByHEuNX1Alx8dCy67mbix9QBqMojcu0ANT
         ybX7NcMLTE+yfadMgW3quffXoXfWcWpqOE3H7ccIsa7HT1pEvk1XpbtWnmJaqk22z2Yk
         BxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727958697; x=1728563497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiwZ0+kmP+aB3WknQP4rCVFKu+wP1zezgy2Cp2IqFhY=;
        b=g5FBs0ylBK9FfJOf0yXTY5jUeq5e2lC13JWiOxHMisnSGYowG+0xmz+utepxk6QlUu
         nDJmteEj6uaDV7TWNFMfDMiMiLLyzd3Ag+HwIBALTG0F2DvTnD9EUX4gXFW+Bf7wLf6o
         Rt6wYs7C1vO5hQTDQ65CTnmDGqW6xnr9O4+9oZIl1rgK5P7pVifArjGBG/d2dYVeGZUw
         CSOIo3e6RYkXQqQycEb3dAxGToAHIdTSj+/duEF+Dd/KMNhf9z+hJsTubdHLHZ9oszza
         09EjlysrLf/rdpYQcqn1arv+ztjZjDNCzlXDq2+VGwyVURQ0mKiKxBZe1KIXIdo9QkrE
         wjng==
X-Forwarded-Encrypted: i=1; AJvYcCUwkk8DoOPgNLoHPv++gFlbx+FnNSyp7MejZS/YdDYKAB60Vcakw5S8yJtomsVQ9WMgtsbu8XFc/hRm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlz2BjNmOiZYipkdyPcXoUGX0/hz/utxX3QPeJrRC5MchBs7MO
	10NTkNj2RZylivImTjPidk2hejtGXVuqHWrZ7oa/1ckj6IEBuThHnn+OqvVULaY=
X-Google-Smtp-Source: AGHT+IHslXTW8E/KDVEXW4QBQq9ZpCg6TWVa4MOxHC7w0me3UQcmiCvZn3otzixI4LzHjlTjRjoryQ==
X-Received: by 2002:a05:6a00:1ac7:b0:706:61d5:2792 with SMTP id d2e1a72fcca58-71dc5c7b61cmr9066922b3a.8.1727958697456;
        Thu, 03 Oct 2024 05:31:37 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9def6ebsm1246188b3a.149.2024.10.03.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 05:31:36 -0700 (PDT)
Message-ID: <4af8d410-9930-44e9-b558-7ce6420f3d96@kernel.dk>
Date: Thu, 3 Oct 2024 06:31:35 -0600
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
 <e6971851-477c-41c1-b0fe-1d813f8b9319@kernel.dk>
 <20241003131848.62a8a6e4@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241003131848.62a8a6e4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/24 9:18 PM, Stephen Rothwell wrote:
> Hi All,
> 
> On Fri, 27 Sep 2024 04:20:40 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 9/26/24 9:43 PM, Stephen Rothwell wrote:
>>>
>>> On Mon, 16 Sep 2024 18:36:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
>>>>
>>>> After merging the block tree, today's linux-next build (htmldocs)
>>>> produced these warnings:
>>>>
>>>> block/blk-integrity.c:69: warning: Function parameter or struct member 'rq' not described in 'blk_rq_map_integrity_sg'
>>>> block/blk-integrity.c:69: warning: Excess function parameter 'q' description in 'blk_rq_map_integrity_sg'
>>>> block/blk-integrity.c:69: warning: Excess function parameter 'bio' description in 'blk_rq_map_integrity_sg'
>>>>
>>>> Introduced by commit
>>>>
>>>>   76c313f658d2 ("blk-integrity: improved sg segment mapping")  
>>>
>>> I am still seeing those warnings.  
>>
>> Due to travel, didn't get it queued up before just now.
> 
> These warnings have reappeared today :-(

It's because that fix is headed upstream today, and I re-did my for-next
tree and didn't include bits headed to 6.12. I'll pull them back, but in
any case, it'll go away in my tree (and master) shortly.

-- 
Jens Axboe

