Return-Path: <linux-next+bounces-4625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B729BCB87
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 12:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4355284019
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 11:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA721D359C;
	Tue,  5 Nov 2024 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2iuLbNb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC71D31B5
	for <linux-next@vger.kernel.org>; Tue,  5 Nov 2024 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805673; cv=none; b=kOchji4xvMLL8aHXfLskx0cb0awOjhOouIy7IvIJt3mH/m+3XqPp/fZSFkPdvR0rNNukTIUDC7Q5D8K79OUQokFAHMgYDNJTQH+7TI4eFiuqn8khMDdgl3Mc3aqxLRS0Rkgfc0PZD5Wh70N8ltcD9qMzjfaNUlMxTvw7qHXhJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805673; c=relaxed/simple;
	bh=vkFnC+rSGUkoS+jKjuVKkkDMvrTfK6S/RoHYKwYEmXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2I8fOn+tThn5IJR2NQG/7Bt26u3tR/vPohn0HE7of+2krwTmoS4sYILd+RyNVf0HeriA2gMqNATemZL8DsLZrBWAkQAmHQTdt2hSn+uj6venlyrW+Xdbisu/KdJcdlIR3w7frTL5TGWu+ny7ycBqGqDl04I/49ghGp6FIrTH+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x2iuLbNb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so63105615e9.2
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2024 03:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730805670; x=1731410470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ykugm/W6n+W4CEM0IiJCah1ND7sVLkXlU9W/5AGMvZI=;
        b=x2iuLbNb+O3f6vhGxVZ78LE+8Pfyb+6mGMpZIubJLPnydXCkz8xy0dTuZll1mqEdlc
         2xDr4aE5fYtmiJu+oaKwgvxYobqGEba+mIaUvo3lQbI6nD8h0LVyy1lY9FhzTsuJ8OUX
         ysEWp7cr9T+f7pgprMzkDCPkSjhtAefYTiMHEuaLTd3ZMJdEcfhAutIjaU+LhA5lRXSb
         Qb+azpD7zX2yn1DLbs8Ec504RBpwN7kMI7xuFk2HjXigd+LDNzqC1uQAlZ29UGGvPqvp
         P8HOTJoFU5Xn72mTUaGxh9zObj2QNoHKLSxHlWh99VoIkG9mw1fTiSmpx4khPZmRYFQD
         VYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805670; x=1731410470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykugm/W6n+W4CEM0IiJCah1ND7sVLkXlU9W/5AGMvZI=;
        b=a57ZJacIIvkur5W59r9zR8Kvt5RAuohLSWhTjzTBPoIqnimn77wOV1DUx0WCci1i+y
         ZU/JMHjbecVrwPL8ge/a0wHuXGPsSjioSHW1NVi4+cDN2c+jdUNuRg522R9yPkzdpcHp
         z9xxshGXwiFL+FGRo2NsLwY8cep7OtumPr8MKe3dlYY3z1UfBX3Lut0KrUlYrCzFfr1j
         IFhrAarK0kRqUwpBGgPUjoso3yt9kiXgv0JxAJI45CEgasrR8oojkCpjmIbfV5ScvrBj
         c8lgnbh9yhTSNW03wBVcKcbMidUk/fLO9jTZ3x1n8kxC6uYUH4Dw5mijodUUc2mX7C4g
         5afQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLn8t32g5Sd0mpTE21gYG4QyU+Bepi/5gs0Y2Y+Ti1u0to6NWJ/GgGF7T1En/CYcPPnwcKxB7aGRjA@vger.kernel.org
X-Gm-Message-State: AOJu0YyzG01gwONQ74nWvmb9eJqnCQ2R/HW2NRpawJshYNCnyv6b9bbg
	RYdeQTFxknlbR7cjiQ1GDB32zH4v61H+bQF1mgYpOqmXcWHdTh8K3fHVINOzbPw=
X-Google-Smtp-Source: AGHT+IFHeKkyaCkx9uuqquXPDS+/TKded3NyYow051JrC7BOtVMMubWS37lQ8B+dtzOV5UvAlkKMzg==
X-Received: by 2002:a05:600c:5127:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-43283242b5emr159398265e9.4.1730805669798;
        Tue, 05 Nov 2024 03:21:09 -0800 (PST)
Received: from [172.23.56.241] ([167.98.219.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113e856sm15878916f8f.87.2024.11.05.03.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:21:09 -0800 (PST)
Message-ID: <5d2af7fa-f697-4ecc-a341-68713b1594e2@linaro.org>
Date: Tue, 5 Nov 2024 11:21:07 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the nvmem tree
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241105165950.05d01c8e@canb.auug.org.au>
 <2024110546-muppet-flashback-2e2d@gregkh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <2024110546-muppet-flashback-2e2d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2024 09:46, Greg KH wrote:
> On Tue, Nov 05, 2024 at 04:59:50PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> The following commits are also in the char-misc tree as different commits
>> (but the same patches):
>>
>>    24c50e7003bf ("dt-bindings: nvmem: sprd,ums312-efuse: convert to YAML")
>>    786700e267b0 ("dt-bindings: nvmem: sprd,sc2731-efuse: convert to YAML")
>>    17d6f058403d ("dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format")
>>    e2ba37350d1d ("nvmem: imx-iim: Convert comma to semicolon")
>>    3e93f43ae64b ("nvmem: Correct some typos in comments")
>>    5ac5933d4e06 ("nvmem: Add R-Car E-FUSE driver")
>>    149e83f1b385 ("dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem")
>>
>> These are commits
>>
>>    b8357f6764a2 ("dt-bindings: nvmem: sprd,sc2731-efuse: convert to YAML")
>>    1c4ea801570a ("dt-bindings: nvmem: sprd,ums312-efuse: convert to YAML")
>>    5e61687075e3 ("dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format")
>>    2e7bb66b55f4 ("nvmem: imx-iim: Convert comma to semicolon")
>>    b3d75e9ba013 ("nvmem: Correct some typos in comments")
>>    1530b923a514 ("nvmem: Add R-Car E-FUSE driver")
>>    2aea0d17ff9e ("dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem")
>>
>> in the char-misc tree.
> 
> This is because the nvmem tree sends me patches in email :)
Its fixed now, I will send a PR next time if that works for you.

thanks,
srini

