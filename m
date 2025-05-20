Return-Path: <linux-next+bounces-6859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C675FABE1C3
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 19:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 763974C1D9E
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 17:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E53A27BF8E;
	Tue, 20 May 2025 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pY4/4ioT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83827A47C
	for <linux-next@vger.kernel.org>; Tue, 20 May 2025 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761813; cv=none; b=uNx0ZmAJZFH6u49LlJp4sN7UD+ihufCzjimrdTk35tWuAMvDcj8zrMFYCY8qdG3NeUkQqez5qKGPUBPbSB6QMTyIhB4N/V+b5eLZl2842QNCFtEDCIYFKDzgu5miYOZgPMOquigbvzAs08uj96LaT4+bPowNeW0xD+DIerLr0Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761813; c=relaxed/simple;
	bh=NRca4Y6qu8nkewkPpvHf2xhhqHItqPfzv6QrsEkL/MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNojatd403NsXpJMTEFtNox/rQwoZhnZS2lmkq60PneygTXuL86lBjnzmq9D8hq6zfqlQEmumZxhVtypPyAWJhh7tV8IG7hX2napc7x/Jv6zPzwBQ8lD4OJ9v70sJKrq4HVvFOhA30ApcQA2eserM5K2l7qYrW+iPK5ziL0Psm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pY4/4ioT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so65155345e9.2
        for <linux-next@vger.kernel.org>; Tue, 20 May 2025 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747761810; x=1748366610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/sRfxl2+2t5SPJHNc4iAAcwkRcbLLz8+Z7hZmgE/IE=;
        b=pY4/4ioTyYfgvso78Rx5Wd3sIt93kiHeTvngs+e/X8o0nJ6zc4lUrHgyw3lTkWc8wf
         ppcRp51srN+adNYLMiXFx8ts07fzQP6BpSnv+1CwL+YIXJvp1/TZnAhitJQrVgoZrvsC
         ABTkGFp3oY8AtiSPN3LuGk0Gb9Q9mSzzpFGPfVV051zX67aJryT6Ah2paRqzG9G+R34z
         YDfFSNlgcuAxOAQkHz/2jSRzz72FQuUGPLtGGv8y2HkiWbrgo403/B8SqpDAp/bvIYRI
         c3j26fhMlXH2a6PoyVtBMNSKP7jPOYJh/Lj0am7w6KFO0rs80tDaQmOa0iGopmCG4yJt
         86Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747761810; x=1748366610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/sRfxl2+2t5SPJHNc4iAAcwkRcbLLz8+Z7hZmgE/IE=;
        b=EWf4WXiaYs7UWyYW26Wtgi+7uLn9I23FIqeyFkDkkYfCLAiJH9QI436c/YROt6DZHa
         1mvHJf5VinCMglg6iT8AMRdPP512uFqoKKxMcK0UCVBjm2kA0W7Lt2VqCpZnzxnhwRFy
         K20QnZrOewXnIY28CsaH2o1GYcVxfJ09QQD/G7wa0uGQ2a/UIlfNPqaFL+4VOO4b4tRW
         Cll/pvE/tl1bMtkAMCMyz/05RhP5WtWLbV0lA5uJdJdfFPHLAGm3X6am9iSZCqggoeR2
         QUspnev4SQC+Jdo44/juOwUHn2bdhwBK9jBRNu6o0U3JR3iYZG9e/lbWot5LJIpaJQiU
         +wqw==
X-Forwarded-Encrypted: i=1; AJvYcCVOwOyjCv4jX/xB8UkfAZ3OkU4oXvTaDgTLS0WXkWVP5p6m/Zftlg+ctDrYcPAenVS/5bTqu87v2ClT@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYj7MBP6P0yo+8EZxZ9B+IRKFebN6NDAp8IO5g4ZdiC9ZNifE
	4hOv6NpjYWteeoLOxsJNEk3GtfBxOSMPY193XZv9IatspAvP6pigYKkBO+dQjW4liuLSkX8kbp1
	AIcHnfGM=
X-Gm-Gg: ASbGncvAOcwObNdLvI8FhjTwlxqQ3gIZfN8vZ1kV7aCIiESt8PL07LpCc93gS1lkfh6
	R21XjoLxq1r36dHyxOZtGAGJQDIy1ZKRYeuPtRfSZD8SVrj+up31JdEXGUqCDksG5IY4pHAq+vY
	JbndO4rMmWJIVNsuaED1yj7oKNVGlq9Pzsm8AcJUI3ae8AFJEGrsRfgAD93VliCQvDlrM7Rwd6F
	FHr/x7bjxAzaf86aLXFZxRiUF2l9JWa1WmoDpyWfJy9lm8SB+myQTjNSk//x4zXEVdEeyU0pfUz
	M8fM3M/oMxxAE87DU6YBKsa5uwx+WAUjgkdakypn7I2iewcekA4ZhfXwKvkfe9PM0qGMxMIIGGc
	p213wQFPRnrrLYTXjGbib0h9oaw==
X-Google-Smtp-Source: AGHT+IGwCCZ8Sg9DBlCN84G63Xe7YsdRmlSqvWxSOiYJVHsSz0HNbKBDVzoRJjBywJlpUwr+vVAOYw==
X-Received: by 2002:a05:6000:18a7:b0:3a3:6af1:cc92 with SMTP id ffacd0b85a97d-3a36af1cdafmr10489267f8f.7.1747761809843;
        Tue, 20 May 2025 10:23:29 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b10sm16831581f8f.45.2025.05.20.10.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 10:23:29 -0700 (PDT)
Message-ID: <3f2c15b3-1daa-4386-a6a1-1d05c33d58d8@linaro.org>
Date: Tue, 20 May 2025 19:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
 <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
 <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
 <20250515221042.7471ffc9@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250515221042.7471ffc9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Stephen,

On 15/05/2025 14:10, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Thu, 15 May 2025 11:20:01 +0200 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> I had no time yet to migrate the git tree to kernel.org but the
>> servers seem to work correctly now.
>>
>> Is it possible to enable back the tree so its content gets some round
>> in linux-next before the PR ?
> 
> Restored from tomorrow.
> 
> Just to make sure - this is still
> 
> https://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next

I migrated the repo to kernel.org:

https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#imers/drivers/next

Is it possible to update?

Thanks in advance

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

