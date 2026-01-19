Return-Path: <linux-next+bounces-9705-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8DD3B23A
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 17:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1476312BBF3
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E666E318EE3;
	Mon, 19 Jan 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8Rre4Lu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432C32AADA
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840636; cv=none; b=bQ/GdYaPR4/VoQKEdkfB4kI2849nJtShMMBs5Jw3jlp+w+w/SgCqcfi5lTmhMRsRplPvdd43T489i/SMUw3lt/RYHbQF+3VLJewzhOO8kP9hqmAGXwz6SPWRwGXA+0zh5hM52XPNrNb/JPN61pJ/dWuTgyK2tnkvrdByTVCQ9r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840636; c=relaxed/simple;
	bh=xhPq6vyVXq/t8DTmJz4PBw65c49oPRYfLCM/hMXONns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFEmxqC3/Krf8XFJLX/sSsa6UMXn+DlFNlpecNjEMfyHEUTN1VSdaebC9ua+7LdCJbww01j2XObzolUrSo6gQSXwTbwYP0Dneq8ANceoRsrUAQmuTeKvnwUz1+xvMNYR2BXsqYx9esm4wv67Eoqvk9KFORXzH4VEVs3Itpd62Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8Rre4Lu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee974e230so36525965e9.2
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768840634; x=1769445434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DiwrTDONQZBujzCBqOe8PwEAiutQPkGvspgfQR6ntkk=;
        b=E8Rre4LucUGzmIJ8rcELYaJNPBx9rpLsvMWbR6pAy7jULof52C5ocVw/bGuOlQJzxm
         DNry8Jr2pvMpgAKUckf2AG6Hr9Ht8jEUVizXLgFnStlNQYS76M4CpWfFl947tn/DshCo
         lPzaiIF9xcdGuZb5tdML2S3nMQq6KbRjGW+v4OOEXowsXfPjXpW2s4wwE6h8lE/E6dyU
         sZTgFbb7+4UFtid9AYEwPaP8FBKGYyUHwqHL2mHO88A02VQtN1IyRWB2vTjFfjJGR/N0
         Pe4AlZ4fgJBtKnq8Kfmzb0wsKHwehSoF/6LZqFWX3J09c0xC9N6Ae8aABCtg/0TJyFI4
         Q5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840634; x=1769445434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiwrTDONQZBujzCBqOe8PwEAiutQPkGvspgfQR6ntkk=;
        b=Bdl65tWw6l+2BhEt1XF2stzH3Jz2TMs+GM4sgqqUq+m6QxoAMpoVmPzN8RICHYrNpO
         3I1X5MQW02ePZUexC4BHRcfuCD2sVh5kl3sJNW/KXm3suRWJlFUGBzs+htXhewhmaZxD
         bqwOvVUse3CHjaeM/g6uEBntpt7Z/MnATKqhgO9+fWwfeHtbvmrx9KHiF8Gv8+H7Jsk+
         i9LYgix2SuwHpj4Ew4hr7qDQkJn2eHWgCbBNgb8zsxJ4feqS+mEiEd4HNy3vScZHff4v
         f9I1MoMGrMFLmSsrWyl68Tg5XIjqGoSEf/ITv4xh5jHMXLurvDiLiESMORlx8iY1buAC
         8XZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgC7i2igJxtlBcP/C/YdR6MTAp/0eTJaN99hL6APYAZzdHMWcIZuqh3F0y1ARmowTSw6Vc97QLgh9@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0ZZmF6iwx/TSRJMKiA0udC9EVt146Ou1C8Ua/ZBrGOF9tyWh
	4flPXyEzVYeeLS3a3x5hzj8samhq4D2ESkrCcZoIHd/q7iuCHBH7xOvwt+VY8HSWXLM=
X-Gm-Gg: AZuq6aLAJvi0jTsaUtJtsUuzOD5m1L3PxerjhZGU0DJZm/uUpnIFaXk3v+uBC1xq62/
	LFLE0fE8EIgLEmi12p/sWhpAaUqtGtSQgMwcqm5nFtPbB+MezHg9k5bPdavviSO/uD3fq92AqT0
	hSI6RaVtRpBirJZ9PqvIXiJTQX6buUBw9Nhffg78fe3O6EPkLA3GobCnSQqtaUgGRW0bymM7ynO
	kC8mSln+UyFpaNGrz9lJ8tEBi5KzdXmommigDvCzg4aDNOVsNr/r5sGdO6bVOgIuNuDHZ6u08t4
	ug/426XO2+nl9jG7MiE/88wS9Ru/11Ql1rwInD82JjGu16mphSPpDY9u9FG9CHOjUV2gsdAr4pd
	J/eJ5PvngmfLVb3HSZxwAhTwAzZHaeh0BRSggK30O9xzkVpsyiiYtQQOQZEE7oaNN6mgdMXSlv0
	zg5HktgPZE0a3ASqyO
X-Received: by 2002:a05:6000:3102:b0:432:5b81:498 with SMTP id ffacd0b85a97d-4356998b140mr16740013f8f.23.1768840633676;
        Mon, 19 Jan 2026 08:37:13 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996d02dsm24324933f8f.23.2026.01.19.08.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:37:13 -0800 (PST)
Message-ID: <25abe5e2-463d-40b1-8f7a-09f845d042ef@linaro.org>
Date: Mon, 19 Jan 2026 16:37:12 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the perf tree
To: Mark Brown <broonie@kernel.org>,
 Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aW5XSAo88_LBPSYI@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aW5XSAo88_LBPSYI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/01/2026 4:09 pm, Mark Brown wrote:
> Hi all,
> 
> After merging the perf tree, today's linux-next build (arm64 perf)
> failed like this:
> 
> Exception processing /tmp/next/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json

Hi Mark,

Do you have a clean checkout? a66f6242fbf52 removes this file and at the 
same time removes the definition from common-and-microarch.json. I think 
you would get this build error if cortex-a510/pmu.json exists as a stale 
file with that commit applied.

Thanks
James

> Traceback (most recent call last):
>    File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 1405, in ftw
>      action(parents, item)
>      ~~~~~~^^^^^^^^^^^^^^^
>    File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 656, in preprocess_one_file
>      for event in read_json_events(item.path, topic):
>                   ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
>    File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 464, in read_json_events
>      events = json.load(open(path), object_hook=JsonEvent)
>    File "/usr/lib/python3.13/json/__init__.py", line 293, in load
>      return loads(fp.read(),
>          cls=cls, object_hook=object_hook,
>          parse_float=parse_float, parse_int=parse_int,
>          parse_constant=parse_constant, object_pairs_hook=object_pairs_hook, **kw)
>    File "/usr/lib/python3.13/json/__init__.py", line 359, in loads
>      return cls(**kw).decode(s)
>             ~~~~~~~~~~~~~~~~^^^
>    File "/usr/lib/python3.13/json/decoder.py", line 345, in decode
>      obj, end = self.raw_decode(s, idx=_w(s, 0).end())
>                 ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3.13/json/decoder.py", line 361, in raw_decode
>      obj, end = self.scan_once(s, idx)
>                 ~~~~~~~~~~~~~~^^^^^^^^
>    File "/tmp/next/build/tools/perf/pmu-events/jevents.py", line 422, in __init__
>      raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
> argparse.ArgumentTypeError: ('Cannot find arch std event:', 'PMU_OVFS')
> 
> Caused by commit
> 
>     a66f6242fbf52 (perf vendor events arm64: Remove uncountable events)
> 
> I have used the perf tree from 20260116 instead.


