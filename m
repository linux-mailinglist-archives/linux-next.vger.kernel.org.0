Return-Path: <linux-next+bounces-8114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C3B379FE
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 07:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D312363BC8
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 05:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB09264A7F;
	Wed, 27 Aug 2025 05:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hw3nvmqY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB02586C7
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756273773; cv=none; b=eJw4S6M+8l0Oh/myySAlhYjLM1wObz6ctPLZ7aaQd+zZXdYfTmGmYd3sqQc3Ra8VwcETHo29BISe9otiE2utdu3QxOEU32cUfOylEV6IimJPW26QhtZK3EaXkXoGG1Vm1aL75MtZZtiIhE5BdFXl7nSgq8KGkRJSlkxDoU7aXiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756273773; c=relaxed/simple;
	bh=pUJmrIA2x5LczKe5rphw2E8dq4urzGNQhhsVJS1L7BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBUIyjrFtmOVhs3XZ7nDxyC1bbv/SeCU4udaqTYYhtCti2sIsAL/LnFH5/GSYDu43p/tqOE9IxwvkeLm728+h4NspcbuoU7oAkdtPhiweTtXWOsNB9vA5rtH3zBN3saFli8NCMAv0WNRFi3X1NPXNcHnTSNxVypGaGGaRHstobE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hw3nvmqY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so516147b3a.1
        for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 22:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1756273771; x=1756878571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcHF6RnbmpTEQbStJ3Ge4aHFj+SeTRpsf2Mr2iXfDM8=;
        b=hw3nvmqYNdUSWFIVZBT2gh0NSpOWoBTO7T1t4275kyxqIi0NlKl3HzMn+EMyGEq5X9
         OpDcz9qdbttpwNNxVLUh05F8nu9QVSOiQI6xALC344lSQjagRPrDPWJ9qjZKfdjvxKZA
         nA4EUToAfXEu3V37bqA5CusJ4oyv5idntHL6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756273771; x=1756878571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcHF6RnbmpTEQbStJ3Ge4aHFj+SeTRpsf2Mr2iXfDM8=;
        b=Ryebi/3NRUcnf6uDjSJlU0bk2knVLGk0NNLuBKQf9zb03qOazUr/PhECEExb43Zkdd
         zVgWmFwGPk3xNdRHCVFobiZfK7PV8owLtvXc5NfpzEiL4RGuPQTUO53Piv1FC5GVNLID
         Y0i61WtoFfJS2CInEivaa26dpzW6svjniYPNSVpBPCgB5xqo5uE0W0tTmgXr4FG1dtaw
         EIBOJmZjmod8+wywfCzEzc3yqyGLEx4m8BDcnWa9GV4Qe5bmDW73VbhZLgleA+PN6PHt
         CPw6NVUMPGfIwhFx6BsCOg9m+wR+2NMD50nz1QPOjARaFg8WroZZxE0W3fKQdRoXGOYf
         gORw==
X-Forwarded-Encrypted: i=1; AJvYcCUpgVK+ztT+1DJctyUso3WNGfgEdecSB/J0G+FS8HfKqnpbk39dcGUWm1MrBsW2nFopGsV6rWi6dOd8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9crxl/KpZZPV+yVUJGZP1n7EJHhDVZs+tZI7s//nhKvXs/7dH
	FL2/TngOXoXwLjCMNv4TFnkyqxgmkP4gi8G9DBfhALYVOkvJGiXYjHBmDeO75Ex5yxQ=
X-Gm-Gg: ASbGncvthS6T+6gUwMsJGOhbGNnlHtAynWnf8+iaTjgnB7cWqcjOwKURlrAKCsOf/HW
	JWnk4vzoKhPtSzqGLWVxgBf0sG5hHq8ok7olDe+fySBBJY9+J8r3X43MIzSHcWtHUDYZY2bNyYc
	0jqyuFmT6hvtqQBjB2BCo5S+0wyzzEfTZmuxN8dgBOu6oX+EZXS7vyr+ohbX8oWvw1IseH2Cebb
	s55u6ut2FU9RUuUPRsqbu2rI7pWR1r3OLMtZufSLpFBFxfmvpJN1hPwuAQ84wSg5/uZ84iO9vMq
	z6yeEcfUDvibKE6mc3SnevxFvR6INRTS0bsRI/9wToNNq9UU+Q2AYC7da9U82wtj8CA0j9mrehQ
	Fa8VovtqUE04oczMfdtG0g5TLdUyxBMelLO040UJjXGQNIAtgaUyJAaLLdQ3pZTsxQkGbI0fMXS
	H1aw7426hfRSBDZQ==
X-Google-Smtp-Source: AGHT+IEPRjnzRJoy3RI7aBDNF9oE7mN9+D8p1oqa7z508XWwunVdVtcVLS9rgz2/V4+0jMlyan7bKA==
X-Received: by 2002:a05:6a20:7490:b0:243:7e4e:3cdd with SMTP id adf61e73a8af0-2438fad29d0mr5907065637.16.1756273771075;
        Tue, 26 Aug 2025 22:49:31 -0700 (PDT)
Received: from ?IPV6:2405:201:c017:f074:2f08:3cb7:de48:e39a? ([2405:201:c017:f074:2f08:3cb7:de48:e39a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fbca8d4sm976356a91.28.2025.08.26.22.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 22:49:30 -0700 (PDT)
Message-ID: <b8dbb85b-124b-4d25-b734-069809240e81@linuxfoundation.org>
Date: Tue, 26 Aug 2025 23:49:26 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: David Gow <davidgow@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marie Zhussupova <marievic@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250818120846.347d64b1@canb.auug.org.au>
 <1befd7ab-f343-450f-9484-0cef21fe2da8@linuxfoundation.org>
 <CABVgOSm2_FGfjQpUBttuUH5ZrMEqnaGkYVkN6N96wX7Qs8EE2Q@mail.gmail.com>
 <4d5bad8a-6afa-4284-8f78-b52e2cfedbf0@linuxfoundation.org>
 <CABVgOS=groSq6Dcdbb_PxFwikQTDodhA7gCAJBvv3jWzk8jrZQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABVgOS=groSq6Dcdbb_PxFwikQTDodhA7gCAJBvv3jWzk8jrZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/25 03:24, David Gow wrote:
> On Tue, 26 Aug 2025 at 10:15, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 8/19/25 01:44, David Gow wrote:
>>> On Tue, 19 Aug 2025 at 00:32, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> On 8/17/25 20:08, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> After merging the kunit-next tree, today's linux-next build (x86_64
>>>>> allmodconfig) failed like this:
>>>>
>>>> Thank you Stephen. I did a allmodconfig build on 6.17-rc1 base - didn't
>>>> see the error.
>>>>
>>>> Marie, David, can you take a look this. Looks like conflict with drm
>>>> in next?
>>>>
>>>
>>> Thanks, Shuah. I've managed to reproduce this with:
>>> ./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig
>>> drivers/gpu/drm/xe
>>>
>>> These patches fix it (and a corresponding drm/xe test failure):
>>> https://lore.kernel.org/linux-next/20250819073434.1411114-1-davidgow@google.com/T/#t
>>>
>>> Ideally, they'll be squashed into the corresponding patches, as
>>> otherwise there'd be some temporary breakage during bisections. I can
>>> squash these into the original series and re-send it out if that works
>>> best for you.
>>>
>>
>> David,
>>
>> Please squash them and resend - also I see a kernel test robot
>> error in patch 1/2.
>>
>> I was going to squash them, but I saw the kernel test robot error patch.
>>
> 
> Thanks, Shuah.
> 
> A v2 of the fix series, with the kernel test robot error fixed, is
> here: https://lore.kernel.org/linux-kselftest/20250821135447.1618942-1-davidgow@google.com/
> 
> I've also squashed the fixes into a v4 of the original series here:
> https://lore.kernel.org/linux-kselftest/20250826091341.1427123-1-davidgow@google.com/
> 

I applied these to kunit next and ran test:

./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig drivers/gpu/drm/xe

Looks good. Hopefully next is happy now.

thanks,
-- Shuah



