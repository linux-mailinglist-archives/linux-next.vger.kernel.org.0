Return-Path: <linux-next+bounces-1439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7289F86E4F7
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 17:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 180402819BC
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 16:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7247970027;
	Fri,  1 Mar 2024 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PZawj0qS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970C70CA2
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709309162; cv=none; b=d6xQ7fxBASJLwJhTdu+PO21+2IE+XA5yh/So9o/rtqbIrIRl5FHBXUIxTWE1noSCm+CQBqRR1G2V93rY1lf2jpqEV9Fw7vR9hAT7HOSbEPS2GfvfXWwkkWmUIDq0/ELGslwg2BE45pJbIt6J9YB3bYVl3+CJXDEflo8thpGaQrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709309162; c=relaxed/simple;
	bh=TzHp7LMxKU4/yaD2LgyvJPfYK3JqCpLgV4Axu+A0WPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZ2pW8Phnvq3Q7yBnlHnsyZNltMzX44C0qWDb7wlxKKVWsEZ3Y4bkDGdT7Yq/LXEgGWdLCQCps54Cy9hZ0i0mVnsHuai+rEoFUyNz6BQl6aK1Xrg2sctxqGT/neuyD3RdAzKT6tcoERC7F2yTCDcVv3WMRe9K+tmBGStKyp3JRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PZawj0qS; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7c82d2bdc31so1888839f.0
        for <linux-next@vger.kernel.org>; Fri, 01 Mar 2024 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709309159; x=1709913959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUbUE7aHZo3BLjOSoTSY6Sj6NCxr1dF8uNficZHUOxs=;
        b=PZawj0qS3GDFXI7ml7XmnDTU31IuypV/qeJnBd6D40xXnQk66UmjNahxsUW0ozxiid
         AkcoLljCV80swc1oe+lr9gLQg1bDUqU3RXUO6OFyDn1lQa/jAuJMI7NKF91ajT3KyUAt
         xDO3Y9tpeEw63BcBS//IpCtZ5J2AFpqcnR5yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709309159; x=1709913959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUbUE7aHZo3BLjOSoTSY6Sj6NCxr1dF8uNficZHUOxs=;
        b=f3+OpPDZfYdosnMSmUwU7SnB0kK9dVY3WmHZo3rK0951n6SWkEZtc2PGt4vyIUz6Ke
         8i+VsS5SecYyn3lLVNaWl5/53FYHbWemTi5R2F41gHEXt2E/V6+cqviMxbGKF8Z7dGog
         mYPmqYcTNy985EmA2Wwxk047bb5WPag+vu0pJdtSpYO/AqXk3LT6u63DqmRiubveGo9W
         HQNS4+TH6HKxJ0GIR5G0mSq1OeQbCXQYpm+dAK/zYNO1WyEE/+ynJR47WM1okcHnS0dM
         5jeMx7arHYKUcoXGozO/H6RmZd1JsWd9buRLhu+2KkA7RwHIxsnNUn8RkGvXWHF7G4FV
         CLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU49T/xkDPCzRAteG6kE2YVyxkHIk0JTq++aRalfSGZGd0dhuL4qVztoh/DNVoIsZgp8BAmX441yfRwJC9BCIWWuCjVrYnD4vj8jA==
X-Gm-Message-State: AOJu0YyIF/+1YZDw7KmQtund9bXD2z2vfOxkLoiU+Ori2IOt2+xxsogU
	tE0ncVtyyBqxGjpvm6uubvHQblTZUtydeLm2zhXDweQPq76PGwU+PgoHzj07AVE=
X-Google-Smtp-Source: AGHT+IGLKG/dlw1Pu3A6/meWaV0By6c320QkCU8gs6LdvRo4CGlpb1xlzzuSAIl6HVYSrqxP9Zte7g==
X-Received: by 2002:a05:6e02:1bea:b0:365:2f19:e58e with SMTP id y10-20020a056e021bea00b003652f19e58emr2334918ilv.3.1709309159574;
        Fri, 01 Mar 2024 08:05:59 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id fw20-20020a0566381d9400b004747c7f22bdsm866787jab.74.2024.03.01.08.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 08:05:59 -0800 (PST)
Message-ID: <86d87830-100f-4f29-bb7f-9a612b90866a@linuxfoundation.org>
Date: Fri, 1 Mar 2024 09:05:57 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
 <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
 <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
 <20240301214358.7fdecd66@canb.auug.org.au>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240301214358.7fdecd66@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/24 03:43, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote:
>>
>> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> I can carry the fix through kselftest kunit if it works
>>> for all.
>>
>> I'm happy for this to go in with the KUnit changes if that's the best
>> way to keep all of the printk formatting fixes together.
> 
> I am pretty sure that the proper fix has been applied to the drm-fixes
> tree today (in the merge of the drm-misc-fixes tree).
> 

What's the commit id for this fix? I Would like to include the details
in my pull request to Linus.

If this fix is going before the merge window - we are all set.

thanks,
-- Shuah

