Return-Path: <linux-next+bounces-2382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC08CBAA9
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 07:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01680B21593
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 05:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD9717997;
	Wed, 22 May 2024 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK6tyone"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DF433CA;
	Wed, 22 May 2024 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716355987; cv=none; b=HJSR9bF3SrqKifk3egT+JKAu4wrb1Dt7pj/qPmF5aNRerwDFwKdShW+wseUvE/uSMWwsYuX6exqE/ufMwPfSDPSL/ccv5eR4ajAXGDUrIbA1dXpUIVEs+LqGvnCErCyupLV8cd1W0ecmEq7JXYvu9kR7Z42wtb9FgdAQVcxxdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716355987; c=relaxed/simple;
	bh=OO0I4/Keq6NDvf7HsiwmfjVb0XHvauGZWUoT3EbqoMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IeS8C5sWAbAHypTsWT0Z+X87+Q4aV14NGAyfkcbYQUnM0zVPHq0WZc7e84P9IaQMalcRFy+0LTV4KoBgMl9HfSrk+Z5qLmHLvh03yuWIbgVmdqlXUtvP+ZQoLmPqBk+seOl/p9e5SzoJFMVC6Pl1H795BR4zcBxSF2Ry6UE0ah4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK6tyone; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-420104e5336so1862035e9.1;
        Tue, 21 May 2024 22:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716355984; x=1716960784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IO8VtBkSuEHF59QWLoIGkPY6IJWTHpo8HEzyRNqu+NA=;
        b=nK6tyone08/goE7/6rUaiw+IkP2OeOi8WbCmwX7k/YotylVL+UnB7eyYJW41thOlcD
         wRvWIdqq0iPhSG63uxiE8YFBSKe0kFQroSxeJFBgVhgd0uqVfvdUhAr8VtwOoylPFfX/
         X7GgURA1Dfd9PFZh0p3DbQJLPUWPwNZJyKI5Nbao/Vnn7k8Y53BnGGuzLIo0ZChBj5LP
         pwJpJoYLopUlwadcXSjWberrKLqboAsa4ZTpxsy7Hi2YLvEFqt2OpMOyFDC140K4p1gm
         PwZt30HhQrAnm9o3xhlff196qgAgI2RLamewB4Jx2gcZIGJEEO+mxy4kl67JjuZDMAVo
         5Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716355984; x=1716960784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO8VtBkSuEHF59QWLoIGkPY6IJWTHpo8HEzyRNqu+NA=;
        b=W+hHL8mP1g6OpHaYbnxkW3DFnsrcEp5L2G9Ri5iT6cDlU16JqfPRpRJEjV5h/twBQE
         n/HjiJ3G741SjOZPQlt1XJ7BkY7WJFPIjoadpXpY0vAODb/S+7w8MSGb7DfSkr/9tAXd
         6OaXxhzLcu0XjGft/n5ownQwBRgZYMKRlZ9SMw/3P5Oc7d1Qso8OCWYYOM30wL8y3WzY
         KBXi3BSkInP6jb8EH9nEuojc4d0nm5U8/zi8ppNT/b4YLz2y85iW79I0l5y+rM7am8tG
         qCkKjmM8HT9m/NA3qxaRp6aVYCFssT77TsyRgxm1pvdwCawT/PjSOK5W0N6/qtN2wkHQ
         bbyw==
X-Forwarded-Encrypted: i=1; AJvYcCXefVJb0vgck452Xx0RqOSOK55UvNLDTR5JH3gFMKJit08YgO9a3Id/0881RGA8oKwJL/wwfLZkm6nXwIAd7ICfk7cKwvvEzVIshInGSbvr5dEl1zkGRsjyULgn0c24zBwilOLH1fNVoQ==
X-Gm-Message-State: AOJu0Yz1uBu57jE0WObEAnE9I/5MdQSv4oUzV6Nm8I5qUuJ6HRTsCIDU
	piscL5e1d9qv5022WlxxS18PHyGOAfapXDdrXBP6zOhqgubIXSKlzW70/w==
X-Google-Smtp-Source: AGHT+IHU6ak2v/ZJeLRQ2rOaTKI01x1WVA+mYiy2/J+DGJP9VqnpYMQuZ506FzzpmBAeLtAzUFdo8Q==
X-Received: by 2002:a05:600c:3508:b0:420:f0c3:8672 with SMTP id 5b1f17b1804b1-420fce6d67dmr7705845e9.7.1716355983769;
        Tue, 21 May 2024 22:33:03 -0700 (PDT)
Received: from ?IPV6:2a01:c22:77fe:7c00:3433:dfdd:9df2:1fca? (dynamic-2a01-0c22-77fe-7c00-3433-dfdd-9df2-1fca.c22.pool.telefonica.de. [2a01:c22:77fe:7c00:3433:dfdd:9df2:1fca])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4201c3f8032sm336870145e9.28.2024.05.21.22.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 22:33:03 -0700 (PDT)
Message-ID: <c0cd58d3-f01a-4852-bf8b-fee4c865e4e2@gmail.com>
Date: Wed, 22 May 2024 07:33:03 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the i2c-host tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240522104128.37c646af@canb.auug.org.au>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240522104128.37c646af@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 02:41, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the i2c-host tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c: In function 'smu_v14_0_2_i2c_control_init':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34: error: 'I2C_CLASS_SPD' undeclared (first use in this function); did you mean 'I2C_CLASS_HWMON'?
>  1565 |                 control->class = I2C_CLASS_SPD;
>       |                                  ^~~~~~~~~~~~~
>       |                                  I2C_CLASS_HWMON
> 
> Caused by commit
> 
>   49b33f4b3a9e ("i2c: Remove I2C_CLASS_SPD")
> 
> interacting with commit
> 
>   3e55845c3983 ("drm/amd/swsmu: add smu v14_0_2 support")
> 
> from Linus' tree (in the current merge window).
> 
> I have used the i2c-host tree from next-20240521 for today.
> 
This conflict has been resolved by:
e22e0e483b2c ("drm/amd/pm: remove deprecated I2C_CLASS_SPD support from newly added SMU_14_0_2")

