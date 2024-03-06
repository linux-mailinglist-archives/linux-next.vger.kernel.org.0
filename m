Return-Path: <linux-next+bounces-1502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4950873AA5
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 16:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B77A2841D7
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 15:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6964134CEF;
	Wed,  6 Mar 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R7vavYXv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256DE13473D
	for <linux-next@vger.kernel.org>; Wed,  6 Mar 2024 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709738755; cv=none; b=fhBV5exYREyzu3Gla0AIKwPFtkCTiyTrYHGwtNZ5ppHjmJanbNNW+kmDBshhMIvwYgr3NAeDUSbdYcytgwn/awCjRT5JEVcs3R+iz/lhIYW49w4riO7H9ChRLouEXMWHpTBAOGG34X6hyQ57P86trmcYRd/b3ETJxVAPdZu+7Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709738755; c=relaxed/simple;
	bh=88NnbK4oYYA/pLhOD1YetPeXil9RMEv38GNzjaPkMWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N24wJtQOr5wy4QUSXoDYgMYJMDiHEVfHU6AMPH4rAfnQ6kB3+0b4CEw7vqtaWTiMkOzVuj7gRiDnjO3/NANJieK+DdNb5QjQiE0r1ztXNUE+ir/Q8EUjlJTAQKhhqnuvYKP2n0eCwJdYs7vaLkvazJ5W/gIyoStA0eMIGosByTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R7vavYXv; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35d374bebe3so5623025ab.1
        for <linux-next@vger.kernel.org>; Wed, 06 Mar 2024 07:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709738753; x=1710343553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aV64pIApxifZ5gZF6WilMYrL+2CVuzA5DFuqpWTfKAA=;
        b=R7vavYXvtVx2tfZgmkxdb5h5/xVO3eVDP3iNWvhiNUd5XYauS/Jq7JI97krTAGWS4J
         YG1GpW6qCC0LITa4zf+ctsDT8rqC6xq0Mq4ndtAZ4OtwvUZy+4xgFrZhbeIW5CXeaIJW
         6EKSJZ59RlNaXeVuQvoK9Syq8jwfOe5l51wOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709738753; x=1710343553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aV64pIApxifZ5gZF6WilMYrL+2CVuzA5DFuqpWTfKAA=;
        b=pAOyuVZNn2T8fu78y8Rs+PJ94+k7qnPWq+gTi19TPCzR2Q0a4GNxabfIyRhaxRp0LC
         uD3i4UsUCa7AV2cDmNL+1Uwlucs6okchRCnwfWZaS8NyusppXdCy5UzPBQfQNGCO2yyn
         nWeKLJ0d7GXmBbtAOE8gvPzkBS8bs8zh2Uinz0Q6+0CzY33DBSBpphYVKf9wLUAW0s6y
         ayRkYIsKfxLXilb8Wa1DBOlzHxtQfPwbreghpbV3sAgiMfYsrQNapMyiwhri6oXuA6Ub
         Ha9w35JqwPJD/jLrX+zGQ3v96hlj3o+p65qAz2OhjxQZ9U71KY6BW3oH6Pcf5bvFSy+f
         v9tA==
X-Forwarded-Encrypted: i=1; AJvYcCXDECjs4rvkHqvVD0fuMWQGyHz4NITuWhiRxL0uv07rBb2vN86HWjQpBhu9hm8uVMPxLp+lpk23KC4sBEk6SUasnGn4+NBCxWB+xA==
X-Gm-Message-State: AOJu0Yzpo53HRiKbXEPTX3+hRIXJipZxFCN7fd2cXhs0FJYk355vEy5R
	iqPrnru9Yy3yFwsUJ0/VXPl3n/lB743MU98+QlutugQs4kTPF/cmfvgasAdrAGk=
X-Google-Smtp-Source: AGHT+IGHuPURq92vbA7pPIU9ILtciWhlwIdoWOWmF/y51jq1Pi4LCcaKE7vWxQuThE6DWjsqz0iZHA==
X-Received: by 2002:a5e:da49:0:b0:7c8:7126:a44b with SMTP id o9-20020a5eda49000000b007c87126a44bmr3749253iop.2.1709738753241;
        Wed, 06 Mar 2024 07:25:53 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ce19-20020a05660242d300b007c845a3b858sm1148284iob.14.2024.03.06.07.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 07:25:52 -0800 (PST)
Message-ID: <eb5bd055-07d1-415e-92a5-27b4a6229109@linuxfoundation.org>
Date: Wed, 6 Mar 2024 08:25:51 -0700
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
 <b0abafb8-65c8-4e54-a410-8a5ac7dccee6@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b0abafb8-65c8-4e54-a410-8a5ac7dccee6@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stephen,

On 3/1/24 15:30, Shuah Khan wrote:
> Hi Stephen,
> 
> On 3/1/24 13:46, Stephen Rothwell wrote:
>> Hi Shuah,
>>
>> On Fri, 1 Mar 2024 09:05:57 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> On 3/1/24 03:43, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote:
>>>>>
>>>>> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>>>
>>>>>> I can carry the fix through kselftest kunit if it works
>>>>>> for all.
>>>>>
>>>>> I'm happy for this to go in with the KUnit changes if that's the best
>>>>> way to keep all of the printk formatting fixes together.
>>
>> Unfortunately you can't fix this in the kunit-next tree without pulling
>> in Linus' tree (or the drm-fixes tree) - which seems excessive.
>>>> I am pretty sure that the proper fix has been applied to the
>>>> drm-fixes tree today (in the merge of the drm-misc-fixes tree).
>>>

I misread your message.

>>> What's the commit id for this fix? I Would like to include the details
>>> in my pull request to Linus.
>>
>> My mistake, I misread the merge commit.  It has not been fixed in the
>> drm-misc-fixes tree or the drm-fixes tree (or Linus' tree since the
>> drm-fixes tree has been merged there) :-(
>>
>> The problem in this case is not with the format string types, but with
>> a missing argument i.e. there is another argument required by the
>> format string.  It really should be fixed in the drm-misc-fixes tree
>> and sent to Linus post haste.
>>

Agreed.

>> At least the change in the kunit-next tree will stop this happening in
>> the future.

I misread you message and asked David to send a fix.

I will send pull request with the mention of your fix up to this error
in your first message.

thanks,
-- Shuah


