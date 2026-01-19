Return-Path: <linux-next+bounces-9725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47CD3B86B
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 21:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2190304322A
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 20:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225712ECE91;
	Mon, 19 Jan 2026 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="b5S5Ry5k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3A2DD60E
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854710; cv=none; b=sdXWCPt44WCoXgu6Je+OofLdPjzHLD4Ppz3qwxHaPh9Aud77UvMPlRMcWOeM3pgyYruG/tGzMM6HKXJxQ/bvBH/UjK1XP4jBUZwd2PKiLWx0wNBmnwReac2zkyounUWH9qSyYJfyzH/G9RYRx/ZXd9K8lunt2LQ/eRSX8mN0fvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854710; c=relaxed/simple;
	bh=iC8NAI660WqK2YHEXo/QTsywt2GY23tG6yij0o2E8dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFnXnmNZb3mP+6xic4z5O0BJS+Bgla6Y4npip90KjDvMKG9Pu6vHHpJYbwWWIJ6EGJAthP23S04NwxzZx0rmTr2VhYjVVKahSaGZpOLiT4sgwX2QibPIphKxRpOk9wDaKJTD8whfM/nir7DTmlzIGw9ZxWjMy15VddS9HyrO8Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=b5S5Ry5k; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45c838069e5so2815290b6e.0
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 12:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1768854707; x=1769459507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+JJKJlNNn7d1kYRSZXPVl0LNnvOQMGv58DtJ6neH+I=;
        b=b5S5Ry5kSjRxuwWdqMzmAqBWZmvT065LltCfqaRqdDgGb7KhCHqBCLC5pjZ3N/PhMB
         lTQTcMsM65iLUmGdV+Xv9NSzJ88jmaENvXoDlsvP4ymX71qtCDUndjDvzmdOLHCEMUXl
         T59ZU65cyheJi46rdeNAeIt2ac/vByznM/Kfm4ouqf3v18gtErVlGDZiNMv49H1ElYBr
         FGcJAOKUZH/cq4qMwm1z4vOyqyDDMdRInFerGP4p8tm3FBiGW0Mb/EOvk4vKRO5xJB/w
         CHJV4joeVETHdKRWzAp1O8FrM5EHeTEPGpZUeKh7NpFVT9/sicXlxLN4SUPIU2+HHqf/
         /RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768854707; x=1769459507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+JJKJlNNn7d1kYRSZXPVl0LNnvOQMGv58DtJ6neH+I=;
        b=F9HGiHgsTtHlTc35YnQEzhvS4H5pEvYJ561cqVJV0baAZytUtmnSS1NVzB0MTINpQc
         bgI02YARXUOrI4C6usEvjg7P06dM2Poh0cZlk0shYH41vIkg1gPdM5BB/evkEQR6Nxeh
         PsQY9uFfDAc94DINEqIAMQPwk2rJK6DEmmHeObv7a2qh6/VAvokixUGAW0Vvtn17XHMV
         oFpOZq3FeVGz/NAsFQ3qfJ/CYI9dHix+4lkDehc/JRnaxP6wG4y575hZ/qYKbBojUVk4
         xGymKP0KlTbmrI7S7fiybuV8KbKXgbQ3goT7YeokTh00JWF4rHtYeLKcB05bXI2enIzv
         eNtA==
X-Forwarded-Encrypted: i=1; AJvYcCVpVW+AMEKlEY2VonffYnIz/DAP7RZO/6x1NKfPZh5txisiiMr2vK89sckinMcM4diXvJfeFK5lOVS1@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgbgcq028bFSzeQcNeCE+rx4icmomiyWI32tkoNEPfYf5ylbn
	MTkYcCAalbjD9LIitmyCBZ5XJf/ibc90jiO5oy7j/35jkiU1POp4sg5P/4AMHqUx+Y3W2FzR+8q
	w2KV+
X-Gm-Gg: AY/fxX6Onn01CS+4HRTHUQsxCSFMb/lWra+Wj8PTwV9TuIF0QzpYVkwA2qKBgIgVmdt
	mEP5LXTRsVh7bbliP76Nt+9VF3qwq2ATIOgbrngJ1QwnEomXKmT9K/rVysuHPHF2BzNgAFLwNSg
	UOaxfVQWp+wJa9gempI/IvnrIZcXFf1UQpJMceqbaM/zWBQWKBxEpTBL21gCjdbZEMa+wR6Tpxz
	AsrBANo4hP0jNW6n9fpU8NWPlrdpgGYKW0hYRCRjTexM3+hYJpMqWCjRnc5sjNVwf6wjqvARyCA
	3CQ/KqPHbaA+8v5A/LAHy/IK7XZRmd4DtHHe9uBTCKCszICOexgC1cb+FOfHuxSDNHkl9QayXgO
	+IE2c5UjYirSXuYa4/HBLuiKnL7lDSn+aE4OqwCVFMZV3o6FQ/yAro73ZZ4/veT2y/tIgZ7WB+U
	8Q0BPNrVsYN5sgN/bOO3ToAwX+POPdf9lv0GDvVAfyr6t5l8SO1Mt325EyPKs9bz6a+ezmbQ==
X-Received: by 2002:a05:6808:15a1:b0:45a:8af6:24d4 with SMTP id 5614622812f47-45c9c09141cmr5435792b6e.41.1768854707396;
        Mon, 19 Jan 2026 12:31:47 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e03e82esm5949017b6e.15.2026.01.19.12.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 12:31:46 -0800 (PST)
Message-ID: <493fac19-4299-4d8c-823b-12eaa79ce010@kernel.dk>
Date: Mon, 19 Jan 2026 13:31:46 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <7481981a-1441-40cf-9924-de1466a9f33b@kernel.dk>
 <b5e4e92c-91bf-457e-8cd8-5bbb926ab6b9@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <b5e4e92c-91bf-457e-8cd8-5bbb926ab6b9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/26 11:20 AM, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 11:05:17AM -0700, Jens Axboe wrote:
>> On 1/19/26 11:02 AM, Mark Brown wrote:
> 
>>> Caused by commit
> 
>>>   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)
> 
>>> I have used the version from 20260116 instead.
> 
>> Adding Andreas too. This is a bit annoying as other stuff in the
>> block/io_uring tree would be nice to get exposed...
> 
> Like I said in the other mail it turns out this has been there for a
> while (something has triggered the rust build I think, I *thought* I'd
> had the toolchain on the build machine already but ICBW and might've put
> it on after the release on Friday) so I'm going to do a revert instead
> and everything else will get picked up.

Perfect, thanks!

-- 
Jens Axboe


