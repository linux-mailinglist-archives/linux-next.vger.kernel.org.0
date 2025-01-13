Return-Path: <linux-next+bounces-5183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C359DA0B936
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 15:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDEA71613F7
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 14:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C29022318;
	Mon, 13 Jan 2025 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ShAW1y/Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20ED22CF12
	for <linux-next@vger.kernel.org>; Mon, 13 Jan 2025 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777772; cv=none; b=B8SU1XJfRMw3C86ruN9XcORb76AIFURTlJGYXQaSFj5ftEYnZz1HWfkCojIKOWQmUnwKJU7QVUkuSOy2lXIQMay1xQ9/qbv2I/EuHsXA6hLpWMxIRwE2BAXX4+ajHsw6voLSAnirzxSx/SenxF2g714XgkXOtlEnwGnElBvRLZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777772; c=relaxed/simple;
	bh=YsBwo0LosVTctopRwN5cmooU+vOzhUer8hU+iOrMuxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GReqwNYDCHVfjONahtk38shQqPZPDn5FKM16rZjkeBZqWPe6eFiwe/+xaef26u1fRC3++rQaCMC4QONAlWz8o14qrAsZijduE6ECJYuZGXe0QMEI05gp9u2S1OyOdFoCNKR8oLyhaatQiIrr5lo0CFQp2ypWP+oGJhsnw6QrdDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ShAW1y/Y; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844e12f702dso148976939f.3
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2025 06:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736777770; x=1737382570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GEhOR+92cA4nIi97CMuOZcNU2oAyXbWgYwXXymSEJTU=;
        b=ShAW1y/YF37lDkzqrqTglOkNm9qXudh1Gl74T3aiI7AjsRGxuYsPupv7Jpctssv0oz
         PVzlEp9+tBqpiJ9OfI0zrBY/kLm5Ao/3QFGi2eSS7cY2qzd+cFGdpCeIx2UFyJRLUvL3
         7cehEQ0rK2C9nG9OjoqZvMtAAa524zQ2x2thSpxIW7w1eg8u60ixP811UHk36sSr671K
         31GSwHt/uhH99OSz196T4IjVryG1mjmrZRti8VQ5AJdoWbWgA3TVTVLJkTof5YmMbp/0
         QrnAUMwkxFi+jzl/lGSQaCLnaPwhwV5Og3VMo8UnYDJRR/TUWUpMVMuEs8tRZWHdkAsa
         Yd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777770; x=1737382570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEhOR+92cA4nIi97CMuOZcNU2oAyXbWgYwXXymSEJTU=;
        b=ZJWlj4xweNRl2+x2K3IOTNqRV4CReEUCziA0yRHQUXgK53/h9rKQzni+BgtQy0glmW
         BkwkrVdaA0vxZOfp7HuJs5IFagRs5Fcr9q55ZvsulfwmhDDOmC/pfuNbtoGz3pOrc/3p
         DPu/8DP7l/iB+nEziKpLUTPJi7b9C7esNOQ2p2XdAdsHDGFpYWLwCzeKeKocxUjYdALO
         2b5VFiyMxxdH5HsRU0FyRBdk+9J+HdgdWmejmhH7RNqYnbLoVWvfymJvOvrCS23c9Wtg
         +LEHCN2/OBoaOu8nM0Tr5nxa51FcBJZ0wHQAMgWPY+ARj2fEZKOimvH/vqn0j+PpX611
         kFMw==
X-Forwarded-Encrypted: i=1; AJvYcCW8CwxpH5cr/0Im6x+zFYKvMrAvkRFssknqASpAUFyF+rv3O4awJDqwsfiA2VA3i7gA7sjU/ZgZg1o2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9uvItSrg6kswl27CDbyAHSFtUypk4KsmW4Lt/PhtOs3j4adIf
	wSZ7uw7sNaCkd9c/SzlX+QFdjpt6MrK1PvxDWB3lVR0XEvthfooaBm7rgQB+u8UY8YWbIEHMyDN
	J
X-Gm-Gg: ASbGncuoULIoT5MlkaxW+o1yNoSxjwfAfsc5o03qxkz+KL41fNGNDL17gqWLB56L69s
	IOhVE4/z00AihY6Nu72VFxnZEiOTXR10pf71tr3wZY+3EoXEChMF17DCBB4KViRYZDwEpZYgnon
	HPz9mp01jVUl8eDn8CUqwCAu2/vpAeQiiZy68RVF4wQNgkYcGYKxKma9ZV1Z4VAYr9JzEhHtJR8
	lvAvS4gxBo/pFtvO9GVFDg/4Vw/5Yt1ApepN8XSaBxAiyZ8VFbx
X-Google-Smtp-Source: AGHT+IF89vwyQreClDu+jlg1tet7IbNQU91u5Is2tUYWgypmRBNudVqaOsjvgZ/awv4H1vPOA9Ri9A==
X-Received: by 2002:a05:6602:4192:b0:84a:5201:41ff with SMTP id ca18e2360f4ac-84ce00c84d6mr1885427139f.3.1736777770083;
        Mon, 13 Jan 2025 06:16:10 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fc893bsm272796939f.43.2025.01.13.06.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:16:09 -0800 (PST)
Message-ID: <d3ef3372-f896-492c-8ae5-29efc216bf7b@kernel.dk>
Date: Mon, 13 Jan 2025 07:16:08 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250113125142.001f056b@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250113125142.001f056b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/12/25 6:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by 'drivers/md/built-in.a'.  Stop.
> 
> Looks like a missed "git add".
> 
> Caused by commit
> 
>   7ad00dd67641 ("md: reintroduce md-linear")
> 
> I have used the block tree from next-20250110 for today.

I've dropped the md tree for now, current tree should be good
again. Sorry about that :/

-- 
Jens Axboe


