Return-Path: <linux-next+bounces-1443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40E86EBDC
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 23:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0578428ABCD
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 22:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A031059174;
	Fri,  1 Mar 2024 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D+B9Jc0n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057A45007
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332221; cv=none; b=pZjbIWqz/MAy238GgslFnI0RQ8zan71MyzNs4BDFSACbYvvNHjO1KNCVI8U4AShdG76idEfe1VTrXKhIPMBWNCrW530o/GQoeHRLQXP78ZhgET/Wnw3YvQ2z00MkGqcMZHN7GVN7U72R9+497G9bOzxyGG8J+S0iKjDcgEsnfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332221; c=relaxed/simple;
	bh=43/L7/Su1/3ajso+ItTssDyr22lmIhTbDJTuAMSS9p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sk8jnlkejVYfgArzlYatazelcP1Op/sLCPLyvPT2Nn3HRcuhAsGGz+h2/FTQ+Ul5oiHz2s6nsTyHjZe7slZat9JqdRewWnFQ4MDYB3of7qWqGKGgGUTL0zIMkAIEtCgdmRCyqvrvQXcPF3T8UgYC+sHXbF39MMg853Igahbdcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D+B9Jc0n; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7c82d2bdc31so9002439f.0
        for <linux-next@vger.kernel.org>; Fri, 01 Mar 2024 14:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709332219; x=1709937019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8x2mxeFdohQWYY3zMglPyZFTN/Kq6RqRSv1UGmerBI=;
        b=D+B9Jc0nMys/9T/prdagMjZOgtpuDN5cc1FtJJ30mMSfQVPRNkUUKpZhPUXltJ3MEm
         3OlcbxIBPeLP2oO9qHBeFdP8knnwcOarbSV/J4F88kzzwtWf2WP47c3OxFrUdJJidW7n
         OGSUHF8itWe4thO/he3i+6Hw+YfWiz2iwgTWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709332219; x=1709937019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8x2mxeFdohQWYY3zMglPyZFTN/Kq6RqRSv1UGmerBI=;
        b=CtF+s9d7a21DZeXcZQ9YeQKC8O7LwV9882LTBpDBYZBPvRYNwBe1pQbL1sCtnODRLQ
         4IzOl1f8shlLo2CBgaHVgMb91zKD0uacBneN02dnwWxx3YWJO0vkmhMcrHXv7sO0e/Q/
         DDyXrymHkH3h57ZShHVGLmEuhsy+7x52376l89E/BW4QP3hz7hLnnmd3Ksw7MoWIWBm7
         aFv7cqvRojS2ODYiNSlS/t2kuT4px4tL53wP8XFPedsZ3MR2uhF3b5lU+5BE/8nHkX3/
         kn4VJzQ5C3wpYnRqczj1HsPyRbYfbxIlsnkpoiWQrjjFYxa9hkBBIBV5aai4QaR+W490
         crlg==
X-Forwarded-Encrypted: i=1; AJvYcCU/lfdUdIstIOUKL5kzIunqR/z/yYTHIsr1atIrIxKwD7ezwC93D4ZpZXspOfaOe4nBid2eM7fTzTkbfxU400eTDl/MMPzNIwO/bA==
X-Gm-Message-State: AOJu0YwKvaSZva/CHHaExHY0hMn9yzN3X9qtEtxQlDieSG7t42nLa9Bt
	n1ZDT6RxJO9WzMNGgV103Xz7JhnZxx6AYQ3IAhnw9daIwpGifqCgz2i03GxA5Tc=
X-Google-Smtp-Source: AGHT+IHgWkGCfWnHsje4/UxTkcI+GY6iZPTcibjb9fiZXNTMC/s9IGJS4fzp6cW5nIoplalJJpzPjA==
X-Received: by 2002:a6b:6615:0:b0:7c8:1ede:72ea with SMTP id a21-20020a6b6615000000b007c81ede72eamr3027448ioc.0.1709332218959;
        Fri, 01 Mar 2024 14:30:18 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id x4-20020a029704000000b004747cb8b342sm1006814jai.15.2024.03.01.14.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 14:30:18 -0800 (PST)
Message-ID: <b0abafb8-65c8-4e54-a410-8a5ac7dccee6@linuxfoundation.org>
Date: Fri, 1 Mar 2024 15:30:17 -0700
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
 Dave Airlie <airlied@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
 <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
 <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
 <20240301214358.7fdecd66@canb.auug.org.au>
 <86d87830-100f-4f29-bb7f-9a612b90866a@linuxfoundation.org>
 <20240302074643.6e1086ff@canb.auug.org.au>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240302074643.6e1086ff@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 3/1/24 13:46, Stephen Rothwell wrote:
> Hi Shuah,
> 
> On Fri, 1 Mar 2024 09:05:57 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 3/1/24 03:43, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote:
>>>>
>>>> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>>
>>>>> I can carry the fix through kselftest kunit if it works
>>>>> for all.
>>>>
>>>> I'm happy for this to go in with the KUnit changes if that's the best
>>>> way to keep all of the printk formatting fixes together.
> 
> Unfortunately you can't fix this in the kunit-next tree without pulling
> in Linus' tree (or the drm-fixes tree) - which seems excessive.
>    
>>> I am pretty sure that the proper fix has been applied to the
>>> drm-fixes tree today (in the merge of the drm-misc-fixes tree).
>>>    
>>
>> What's the commit id for this fix? I Would like to include the details
>> in my pull request to Linus.
> 
> My mistake, I misread the merge commit.  It has not been fixed in the
> drm-misc-fixes tree or the drm-fixes tree (or Linus' tree since the
> drm-fixes tree has been merged there) :-(
> 
> The problem in this case is not with the format string types, but with
> a missing argument i.e. there is another argument required by the
> format string.  It really should be fixed in the drm-misc-fixes tree
> and sent to Linus post haste.
> 
> At least the change in the kunit-next tree will stop this happening in
> the future.
> 

Thank you for looking into it.

David, please send a fix in as you suggested earlier. I will apply
it to avoid compile errors.

thanks,
-- Shuah

