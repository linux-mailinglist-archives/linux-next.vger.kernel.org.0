Return-Path: <linux-next+bounces-9708-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 619CFD3B3CD
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D9CE302FBE5
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10C226E6E8;
	Mon, 19 Jan 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNxryrdT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20642217F2E
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841735; cv=none; b=MHd7tDBr2W4O66T0C5gAWAos7dLp/+KQNAh1fayhJ+MCrO62lX1YevzSHUk2XSNcA2dIlI/+duwmLgyRqO8P5r5Fu79NseKFx0/nzj/ZfiUpXxWdSWQhlYiaMhVzQpLnOjpVyJgQe6LNU5GCZu3yDKxGCClhY1zaFNYsfXrQO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841735; c=relaxed/simple;
	bh=rKEOTKI1u2exKci4ZgTa87AUTqEyjUdjCeBRJtYXcs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMNzC60LuoPTALmiq15ksxe1oy/JFdl6tK6Xj0vrzV4xxqOpiUa2RsLZ/UaoFgyWV3JUxci1c7pHSWm2x16Ci2DZfPpDSuGtJqnYc04y2dQuGy8RMlLmMvViTM8psXZeD9gEuHn31/CyzcOMNtR6qBt2EfEzi3qyK8FCHUuYn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNxryrdT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso15195335e9.2
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 08:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768841732; x=1769446532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sukZCvJPrsfRYu9GIyqfnxrZCqX6B486bsJEUw0G2Zg=;
        b=mNxryrdTqa6LZ5MuqhyKcSgIi7oE6I66+yPLKTvCSdRhYdNC/PRAAdLMSXm13f6gUI
         Q3lSfXJf9IECFwJwcHzViK7YmMA7e/zs7Oj+9yhonnODVIVxAp+JdMMFOJknp2laZZjl
         wvQ5K+9IUWTti4FHqcx8mPy/5ETLMia6pywOENUvcYXkpPgr1exwVugFX31xOE5aHwax
         h8e3vTk2hM1j7rkZRhFyPMOljkX9NCi8Mp74Kxzaj+h/pU0qBtmwDQ622ogRDBhraDH2
         yYYWTCNsY0McTsxrbcs0JWBHhMJQArai+kqaSuVJsnlCQhqhgBOS2eB+AD9tzQduwxh9
         Fn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841732; x=1769446532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sukZCvJPrsfRYu9GIyqfnxrZCqX6B486bsJEUw0G2Zg=;
        b=prXR6EhfxEKsmAWD7IgQ8R3+WUiBADj17dKXWXo3BV62ZhMcxZXyxC9LYEdW4f056w
         McVALiT1B7aIdm9l9ubpIVoHjGfwwKAPTy7sIyK9HUl0UDF5t7YtVyDuj7xH6GIFyj9w
         xtmlFl83PRdFEJuVP+q1Rk/hYOg4k7+hbTW3boh0AQU+/6Sr11lefH0Aj4ACLfdA4wZs
         CamFiwFi08XilWSRfs7aV5RztIgmf2yyYEHCFT1DxovV253eJ46hoXUgQ7HXWmpVZkjE
         Oep+j1atd3tVv4lfqOt/qHsSep0abMoAMAm+I/pCjVVVdA7NufkHA1YeVSK6FFNlFHRV
         f1xg==
X-Forwarded-Encrypted: i=1; AJvYcCUDp+UCVc4odgZdMwbQ66bMRazOkvEP3i35u+YfeMlM9Y2VTYN1xKOgSYW6wKtc8s41K2NOxcPEdWZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YypVyK3I9hYAsFXodnvALFZMUkMrfjApgrqPd1Ga8EpASjgeXvb
	6GLNlWYa9lDrmMYJCHn3bWBmOXf7cAICFET3AjzjT8SgM/R79Moonp+ZeIFNBOz0O0Y=
X-Gm-Gg: AY/fxX6tuaPeybHdv5hcA0Bwa0S7NBfkg6qHfWI6BiDKZRt77i+nReNuSg/nkl3MVbI
	UI9CNsv4y6XBprASoO+2kcNaMEeSoM5IiaYo2l+XSalu1b3Iun/G8EVIsl05Zvv5d6U8zFs8bkk
	3r/SKxoNEvE6cUQolE3Wz0kt1vJrZ3AJTmE4hnFpAOGkR4zihieDENSZn/XSejrjL4CfKCr6RG3
	IMMfQllNZ+C96WO9SeZzNZm01VqdAxSpD0oT9VefxqvORJuFE38l746/C6WIytZNQZiqf8elxWU
	e6hrkZq+matSJgqXmAYPp21d3qe1mc+XYyAfQIlD7YyANTRqMUai0FQ3RGfSZFU2vW+jbrN7Qsg
	z/OGdVxrGjBJ8PjRvKZCbNtAxWPhGvspFchm0yy3KZLCa+D3Woqmc6VnqLRpqKvNqkxTQkzyqXo
	ZftgBK9YEWX7FG39QD
X-Received: by 2002:a05:600c:6091:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-4801eb04160mr144754215e9.22.1768841732530;
        Mon, 19 Jan 2026 08:55:32 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm256850165e9.12.2026.01.19.08.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:55:32 -0800 (PST)
Message-ID: <f4c1f996-57b8-46a9-9014-10e818ad0832@linaro.org>
Date: Mon, 19 Jan 2026 16:55:31 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the perf tree
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aW5XSAo88_LBPSYI@sirena.org.uk>
 <25abe5e2-463d-40b1-8f7a-09f845d042ef@linaro.org>
 <576e6cd1-7009-4823-83e2-bfc66fd786e1@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <576e6cd1-7009-4823-83e2-bfc66fd786e1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/01/2026 4:43 pm, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 04:37:12PM +0000, James Clark wrote:
>> On 19/01/2026 4:09 pm, Mark Brown wrote:
> 
>>> After merging the perf tree, today's linux-next build (arm64 perf)
>>> failed like this:
> 
>>> Exception processing /tmp/next/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
> 
>> Do you have a clean checkout? a66f6242fbf52 removes this file and at the
>> same time removes the definition from common-and-microarch.json. I think you
>> would get this build error if cortex-a510/pmu.json exists as a stale file
>> with that commit applied.
> 
> No, all the -next builds are done incrementally so the working tree will
> start with whatever the last commit that got built was.  This would also
> break bisection cases...

Oh I see, that's an out of source build path not actually in the repo.

That is a problem then, will take a look. I'm not sure why those files 
are even copied out of the tree. It would make sense if they're 
generated, but those ones specifically are not.

Seems like the build will need to be fixed to either handle deleted 
files or just not copy them in the first place.


