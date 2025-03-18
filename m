Return-Path: <linux-next+bounces-5860-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FDA6773A
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 16:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A89893AD736
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 15:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79320E033;
	Tue, 18 Mar 2025 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7ple6T1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2188B209F27;
	Tue, 18 Mar 2025 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310268; cv=none; b=nAQoQpoMuODwIK/GSKir1O6zdS+c2SET7qC7WFh3liy8XpJ1l9ZH45QkbjY0b7s2+omnecKYMwexyFsgqtV+MWORbSIoEk0QGKvQhxPahn3CCIJhg71SZ4wIFX0xU4xjewArdcfCZ3oY7MHNCx0PJxLXTFUP9tPMRPvM4tX7mNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310268; c=relaxed/simple;
	bh=htTWJT8q3BkXLASrKfgo33X8Dotd0OCoQWZkO1gobFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhmrG31R9wQ/4cqox7hzxMQSx3bzO5Diyz8x1S7vyOliLKxK8t+fRZ5MjfMUfq/3KVFEh1l26kLVPkf/m9GVQNX3X/dwS2fDeGyuReyrtDYqppg5/74HmIb75hqL3DSQqBKt6ku7H/PtQB/4eLzMjD/LzTu6qjU6cggAZ1AnyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7ple6T1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff80290debso5144226a91.3;
        Tue, 18 Mar 2025 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742310266; x=1742915066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGk2k0+HhXLSGN9NKaxJfeeMmSSMs/sqLEl22QXe2Wo=;
        b=Z7ple6T1UUx1Mylaa2XjMZrAI0tAlEzYWETRWV1nOJWFd69Kqe/kuZMkGHT6wUqo25
         Lq4eVK8h8nqt7LoQIbUiRT3OD9Tjxl4TfpuPPoWM7q1OK5GOawuVDevc+hNyl+VgAtWy
         Yjl9vQ0ZFeJzJwnB/MP8raIHed6lUqGHNC3ijxZoKFHs0ol7CGI4Q80dIwoHao/G0lyU
         BBH9XITyyWob+DLsWernEvsA38Bns1aG5tPk9bUldp3JKll7b3sThFCYLJkeuIMsYeHB
         HrbrDBB9Elm2txzAFTSp/0TjCbN8whanp33UllNwIoRWZQ7sYrITh3ZgS8bM0ockih1z
         9DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310266; x=1742915066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGk2k0+HhXLSGN9NKaxJfeeMmSSMs/sqLEl22QXe2Wo=;
        b=fuMAGra6vizBbFpmwdCpY1SnicZ8IH1QWB8Eo23zWpKnXhTPQ0YbJiiHLBqBTsPGQf
         RvfXSKpNXHOnb5Du483ZSbVT0BpoK6ZPPKEYbkdZZIGaVzfBi8Gc/wA2IUKmtsK8QCEZ
         7MZxaw4uzUlcrFo4BOw8zrgFO/3ujhHnEWJ2eJY96VEpiDqA0ix90p5hmuYSCfGdvH6S
         ci9iUFviB3iogygGp7aFQMB7XXu9Q6wi/y6er/M4OiAWzGUIg1zMbvVBPpCcYTTclh9s
         AlaTmpOvpqcLA/c5/n0SfdA5PRtM4ZfAlsPAAoVjVO7wbhccr8JKNqH9QuBt5dgIfbWz
         jwSg==
X-Forwarded-Encrypted: i=1; AJvYcCWFuS41oircM7q33neB6lm+sSJs5S8A5+se80MTXDUkDf0f8fnGz8Y44yUAKCd7KxTQUj60rlZDo6k3rmI=@vger.kernel.org, AJvYcCXkDFIhk2zaV44KgerAKOtohZIHkGYzCYVIbh7KAbEWPxKiWQhodQZffWhNJow0MT9rzPkA4971ujMQ+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQigumB9kHrJhhFn3FZo3H0nx51JiM+13B2WFhYP6rWj72Em/
	RCFb6YLfGW2Db2Dj4BJypH1/HM5cCvSqjl4G06gJV67LXjhokUns
X-Gm-Gg: ASbGnct4TSTDbiASaI91Xz08j8A0o8yZiZOEvr1/t7cflugjlH+YwnZnIL12l7pTFtS
	IW9pwRRweKQ8QGVLWmken9k4Mur4LH7UvkLpGiNhI697bmolraHqTxyYu00W9IF3fGMupeC3SNE
	FX4y/ZLUiu3alo0JsjWi+i6nHlL8hqhN93OwBe4Kn3zcWSUo4SRymifjWSZl9MIei2yrbmpI7gc
	hOTCEfVzrrAWZmSfisGJR/vSFoxIqGSP9Oa+nImZ2jzFu310lc+W9HdpRUM7qr/4PGbqDleBEAV
	LE0MBLnuD0urVO870WTBL9ydj4tBViYQL4hHPQDCG5Pohv+9vvyIfCuwpApaQA8d4udv0VqES1F
	3DPR1vliehmg/anqYPw==
X-Google-Smtp-Source: AGHT+IFfAItsRFy/xchvoER0kJ8TXvvidrFXOgzkyGsO+9gPQWanWhMUyXepREWHJN2b5a98wsJUfQ==
X-Received: by 2002:a17:90b:28c5:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-301a5b1380bmr3850316a91.8.1742310266288;
        Tue, 18 Mar 2025 08:04:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8242124a91.28.2025.03.18.08.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:04:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2c101a96-ce4c-4c35-9c5a-4d02d3934cdd@roeck-us.net>
Date: Tue, 18 Mar 2025 08:04:23 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Leo Yang <leo.yang.sy0@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250318213546.3a560928@canb.auug.org.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250318213546.3a560928@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 03:35, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/hwmon/ina233.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>    c56110bc68aa ("hwmon: Add driver for TI INA233 Current and Power Monitor")
> 

Fixed.

Thanks a lot for the note.

Guenter



