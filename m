Return-Path: <linux-next+bounces-5185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0DA0C4DC
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 23:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750CA3A6FF3
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 22:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CDA1CAA9F;
	Mon, 13 Jan 2025 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B39B5i8b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E821CB31D
	for <linux-next@vger.kernel.org>; Mon, 13 Jan 2025 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808338; cv=none; b=HFjUdgWowdHGtnbQ3oM3MH3dWREZQ84vdc0hV4aRqAlmzGujctY5WBQ0OMrE6wZkj1sb8B68HzXSImZJkk5tEHOGmyuonxz2mxkZgZL57MUqTUxRX85GfPaChFTfaSoUl4SW49betLhLsjE16WI1Yk4tBKKdyOhm3deQdzZXc4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808338; c=relaxed/simple;
	bh=nkxYTgeUkUlfDrEtj0he16g1lxeqFMIA0vKIv654i8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REgor2kszmnbyJ95Zoj4m+rXHz0vCmyTVwLATAQV09rQ4jOhzAzMqMmMrbZ6pfc/fg2bvys6nUmCj6serwPS42hb/hLsylYR2/coicx8vGaAQqprSbzU2KdtOPhoOvzGnIi8d0x3T5dids0+X1UFZBI0aYYTXFbTIsxzo1MmNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B39B5i8b; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a9c9f2a569so32758005ab.0
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2025 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736808335; x=1737413135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgVvEIFG1uSmiDxP57dichY34o2izSezGlpeFWsj++I=;
        b=B39B5i8bs82PpjIq4NWA0SChcwUNrkQLYPHHDzfENxAjb3dvbJhrGIzs1s9q1NWtIV
         S+OY1XIg1WE4vBIi2CnifYjNrIhRgyyr7v8O4iKIGWRWrDRUwzr5WR2FobjmSLWBytFU
         VHpw1j1/ZO+Bf5f7MMt5R2FahGJVHzQ4hm7ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736808335; x=1737413135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgVvEIFG1uSmiDxP57dichY34o2izSezGlpeFWsj++I=;
        b=gBGJsoPET4ZIg265tj+78j4uZDm3coCXJmBQFM+4QZk3XmYatgSsuM24HUK8FR0yRg
         SgknMZfyJVXOxzlav/6Ar3bUMiefs02M7xcPKHaXTldTfSxUKGl2/MtUvcacWdVJC7eB
         XxZ4sRNod5gFV8+ihKH/LI41f0VBn7kbpPs9Kmsbm+bmEn+zpE7akGRdv2wdo7xCv8kQ
         eoYLceohvJgVEdYzVDXFDn4UMNFTgx7aANuXI1m3ZAUhAegB2mKzA09szWkcdZR78vZl
         YQt4QdX5FvK8wdkt/K8yNR3Vm5RN5cPoC38lzg8YS91PCa5cdCXHvdp73xGjurJO5uKr
         Z0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWcmuPeFr3L/5n8bLwP0Ww+IbTpqfBjSm2uvSxjTHlD+qWI0fEl61tgS96vQWLj4viWfkUls1hjzCY3@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqrqalHELnFrCHdLHjJudVMce1uSPHZzj0c7rb6q9LK2kIwlf
	YUCtsXOu5eaoPc1jGa+Z8l4RRaA+etOdnO27QRG318JdhftAd8Pbq6Jou2ygnSw=
X-Gm-Gg: ASbGncsZc3VXHPEvxrr1z0fqgL1WoYjGa2fzA/iqbGlRZYQHeDSSXECCMdDaJLaxGW6
	hyIHA4oBYHWdgi6VkjoL2lAn8ywODVfrggQKYlnWXecKKY+5m52QMzU/1SZK5jC8PkOnOZa/SH8
	vIxbQ+K7wgTqFTnxj0KqX2tm/vdESlwHNjUCl9DnMoE28RoB2eBfLHht/BP/LhDUTTdfqcW4DRl
	ydNMJ2hbDzov4dOxkJrnnysN2g9TEIAyRlFm0Fw7PrNs3sHqp2zaH4rjet5H9WruSs=
X-Google-Smtp-Source: AGHT+IEgjO/vBs1RlHK0/64Crw5ifVV3oLXzNLp3a+I+kb+7df8sLl0plI+qKMD/Agp55p3qgZMZcw==
X-Received: by 2002:a05:6e02:1f09:b0:3a7:e0c0:5f27 with SMTP id e9e14a558f8ab-3ce3a86a220mr197338035ab.2.1736808335722;
        Mon, 13 Jan 2025 14:45:35 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b6293fbsm2963222173.68.2025.01.13.14.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 14:45:35 -0800 (PST)
Message-ID: <5e7eda18-6a1d-4008-bc6c-c3b59c27cc9e@linuxfoundation.org>
Date: Mon, 13 Jan 2025 15:45:34 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the kunit-next tree
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250113152511.4f7f382b@canb.auug.org.au>
 <2025011331-chef-unwired-e143@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2025011331-chef-unwired-e143@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/25 22:21, Greg KH wrote:
> On Mon, Jan 13, 2025 at 03:25:11PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> The following commit is also in the driver-core tree as a different commit
>> (but the same patch):
>>
>>    875aec2357cd ("kunit: platform: Resolve 'struct completion' warning")
>>
>> This is commit
>>
>>    7687c66c18c6 ("kunit: platform: Resolve 'struct completion' warning")
>>
>> in the driver-core tree.
> 
> Thanks for letting me know.  Ugh, so many duplicates this development
> cycle, probably due to delays in the holiday season...
> 
> sorry,
> 
> greg k-h

Greg,

I can drop this patch if it is better for this to go through
driver-core.

thanks,
-- Shuah

