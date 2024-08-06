Return-Path: <linux-next+bounces-3246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E1949B4A
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 00:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3C01F24603
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 22:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11C2170A3C;
	Tue,  6 Aug 2024 22:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BQvyWgja"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258515ADA7
	for <linux-next@vger.kernel.org>; Tue,  6 Aug 2024 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722983378; cv=none; b=LtFieoZzAsdYv0o8rMPH5K2s7zY8JYi+eEP60+0dcFis3ZBIeZdwERKEoq+CE5SteIK8gWKY3paZOMEtkqFlt9TOZ+gxXj8xIb/Dk9TxpUOyITimysaHoZvg19rxOzBh6jk1/DIllusQlG9FB9B/b2+LMh1D/TB1J1xNaBq4PPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722983378; c=relaxed/simple;
	bh=lJWukiyEOezEPrQUk6c2c7g3HFJmueQVSmT1QZqJWcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHwDLVhmw4udAKMkugJWKy7IgYzdFp0uRKoGvYf8sgLoJd68juD8M/jdhBK0OsGkxtOUEW+h4AIQFKUlYkuKjc8QwxQ1WAPxRFIzZAQsCexaHM6PVAs1jvJ5pUySl9mWgCDnrJxQoDuG5O75JnDzOdqvT1lWDewK4x0H+M7X8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BQvyWgja; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-81f86cebca3so2964939f.2
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2024 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722983376; x=1723588176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUmYPooDKax1SdVUh0CBefLXmkbt7/VGku+jUgP81QU=;
        b=BQvyWgjagyynNAPVlFYL3QObFRW3ZsOFYojBWW1YdKU6NZrZX2BR2HkX0OcZYxqDX1
         R7ZyRjlerIJnsnIzIlXNpDs+4QcWS79oSzC9kDreUBmphJh13sKxvN/YOZyt3e2359lU
         whYBBRbIyKGl1Lf73aCb76YEYh4xKgdizyyiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722983376; x=1723588176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUmYPooDKax1SdVUh0CBefLXmkbt7/VGku+jUgP81QU=;
        b=ZtzpqfJamt/wxaaGQ4bYgo3HlBp5JfqHJ43IhDTLixJtxj5rN6s5lcg3LfSIGHD0ub
         vORJrDStqqucPLTQi8hAeoE+b+TlIBf+vZRUy+Vq70Jn+PEGkcoUY9ogDTn4ATjniYBQ
         E2eR/fndtSf98kTynnRHpUz1zyRD3apfDoy8BjAnOQaCxR29eac3IjXOAgf8M92E6xXT
         LCsSwXAZQ4zMP4Qct7+OmRlD6uIlI27PxK4VYHsPjEEZyVhP1FnZHbPuK1Gjizv4oDje
         VaS5CHCBNU7csGXrHns3noKkXNf5oNH/OgNnYW27ghjAu/l6/kN8OImC0s4C9BNaMYsu
         4SIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+jHeDXQ6bCmehRZrufJ3LQjWeamC40BQrhSXO9LPjzn8QXEoq8d2xIAPgLBpsCTccZr/WkAQ02wWr0f3b5/X4lprBingznq9HXA==
X-Gm-Message-State: AOJu0YxlwWPrPnXtH/jxVoFDu1h3yjxzStZF/SGXccz2mGAI33s0Fu04
	5pt9zZnqDzBmV8vgvnlT+bA6/v5s9rxqkKisSNotgb2d3YHbEzobGxD3LvgFi5s=
X-Google-Smtp-Source: AGHT+IFYEVpw2EALVMQD+7U9Y9zpwag7gZ9SULOondMLHcaYOTDf2ce2qHhIXrZpueCFpR3H+B+vEg==
X-Received: by 2002:a6b:f415:0:b0:81f:8cd4:2015 with SMTP id ca18e2360f4ac-81fd4395206mr1007903839f.2.1722983376108;
        Tue, 06 Aug 2024 15:29:36 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81fd4d82ef9sm274995839f.52.2024.08.06.15.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 15:29:35 -0700 (PDT)
Message-ID: <ae5edb38-5f77-4104-b541-d2cf2c3011ff@linuxfoundation.org>
Date: Tue, 6 Aug 2024 16:29:34 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-fixes tree
To: David Gow <davidgow@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240806091818.7b417ee7@canb.auug.org.au>
 <CABVgOSmpcXOKFVYOm4jgJ7STxhA7o2k5SfQgxn=fzkAZYyW-rg@mail.gmail.com>
 <9bd07238-5540-4b6b-9532-8e3590cf2b77@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <9bd07238-5540-4b6b-9532-8e3590cf2b77@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/24 13:20, Shuah Khan wrote:
> On 8/5/24 20:06, David Gow wrote:
>> On Tue, 6 Aug 2024 at 07:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Hi all,
>>>
>>> After merging the kunit-fixes tree, today's linux-next build (powerpc
>>> ppc64_defconfig) failed like this:
>>>
>>> ERROR: modpost: "__start_rodata" [lib/kunit/kunit.ko] undefined!
>>> ERROR: modpost: "__end_rodata" [lib/kunit/kunit.ko] undefined!
>>>
>>> Caused by commit
>>>
>>>    7d3c33b290b1 ("kunit: Device wrappers should also manage driver name")
>>>
>>
> 
> David,
> 
> Looks like the above patch below is still under review - I can drop
> 7d3c33b290b1 for now to avoid build failures. Thoughts?
> 

7d3c33b290b1 ("kunit: Device wrappers should also manage driver name")

I did drop this patch for now from linux-kselftest kunit-fixes branch.

I will pull the two patches together when the patch below is ready.

https://lore.kernel.org/linux-kselftest/20240806020136.3481593-1-davidgow@google.com/

thanks,
-- Shuah


