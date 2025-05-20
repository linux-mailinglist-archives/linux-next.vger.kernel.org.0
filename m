Return-Path: <linux-next+bounces-6864-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73820ABE7D6
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 01:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E733A83F1
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 22:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E277F1E5702;
	Tue, 20 May 2025 22:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWguvM7I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E146B253322
	for <linux-next@vger.kernel.org>; Tue, 20 May 2025 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781976; cv=none; b=Vp8mqalvR94vs0AtdjRLEGyUerQw1gATfqcqKyRJeZXVF85F/F2q+56BqK2rtZN2ZtqQJ9Dm8rK6IFHzFuraK8VJbVK2tlHgJz2Rw95S3wbVHJKDJ2/1KMmRjYzsg+FeQ04Cn9dQ1Sf3AoL2bHtVFlAmHHrIPichYw6+yRIR000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781976; c=relaxed/simple;
	bh=IQJohgPWCdlFH+adn3NB9AK+Z3ZInB6656Q7LQzmLvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EimUj6bng9lZcPJXXuaFYBQ8hp14J3IPFL8s3QVtHq1+6QG0zPSkNeVF87XsVLpRwc/mM8WTvJSte0bp6PV8vgtj332wdJ7lD5OygyuwVvpxI/y5s+FmdYcYLP+vAkabmOc7da+eE3mNivMudkfswp+wCA7nijX0yaLOjtMQt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jWguvM7I; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a37ed01aa0so165878f8f.2
        for <linux-next@vger.kernel.org>; Tue, 20 May 2025 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747781973; x=1748386773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jA+zWn7LyUWwrF9KyXeV+qDY8o5jLYOZcJod4rumtg=;
        b=jWguvM7IoSy4KwK5ySHnZLaBvUr9hA8A4RN9mnxr1ncOwcOKV0zn3fQxcVncFEi3Jf
         QgXJRRmYvioEllTAYe2MPBD4+VuODPBFyKtJVkSrZyyHBsfrKoH2BL38UpJAbD10x+wS
         3Ng8eIIhG1gA19sdygvB3MruhACt97pkHF8MBi4WyKojLj7CnJsYcbXfjAsrCFwkgjXy
         q0IUtWceDljLOqmKG8H9SaEP8xVkGj9cN0g8Zwum02zuLZiZBeb3+pwDPjrAchzOyHrG
         BPAuyDvD4fH1brrM8xCIlsUu0hEgYVsqGnOqnowP/pSjRKd7EV3suFxSrSE+Dxjyfi9n
         F00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781973; x=1748386773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jA+zWn7LyUWwrF9KyXeV+qDY8o5jLYOZcJod4rumtg=;
        b=ZWU7L4YUUch6h1uWzW4L16JPnTbq6nyNFr0NR7RaLCjg6jeHxD1yqip475SCY5mEei
         YsnVzKr2HsLlEoqo1OwpFPMKvlvp23q0E8ptcuQeAw6JWvu3vB7xe2/moBRjsrfpijgD
         ikSUAx9aK/fIpYm8WV6uPdnoKIYCluMq/L6GRmsiYqvfql7Ymvm90OxOpRtUBicKhY9f
         irJ/0gXM2G1AcBwCaToYJ/T94mEZXY3XYLnBT2iFcr4S8fSul2zNazh71G4cYIALQc5I
         Yawo4jfsIBMBYbE12T+dl1nSjagy2gWUVKjRvKg5VshV01hDUwx4+8ttgHt7JjLUtDen
         swcg==
X-Forwarded-Encrypted: i=1; AJvYcCUeYLeeg3ymILn9aD7H0rITFnngXtymajRcuxzsLNQk1D7at5Gngz0P71Dgv8cJK48cHf5RN+3+3fNO@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxeRfYBaY03hOHhAOglDE3zqTfD0d/AW8iGYNsSb6XCVx7UL8
	olfBL5Y9Gw+Tnii/SMtHN8EHS+9bZfQQ4wOm7TY/sIaUV0MguxbpKm2Fbvw65QlrkiedfL9fxU0
	G2TKW32w=
X-Gm-Gg: ASbGncv5EwfG1k84z1/cN1dXJEHJmJKashPxgH3+nsx69BgzSkayW69S8BMWtN/RROQ
	IdQxYgxc2LfUcq4qyfwheX0Jr4hzcup56J+EHkklmbOImfhBelbokNpL96MDcTvlec4pSLsgKa1
	xEhO4NOB41uQaxl4wIM/6vueoGljsPlsFAIn0ry/pVjXxyBdKBrj90i3DRPNgMWyDN+jh+JQ61t
	xKFFrD+HB0jAPYlobo3JqW87pjuIm6GE9sHF7vlVeZqhT+2zhDNOfNa5XMpMP+8+GJ4aSZMJZYa
	ziPgM08i6CtNMM89LkvffhDNwntPMwPUXsmxWk8Ln9kXG7JxDaJYruoQ90vglevQClDkV0qbGeR
	lk1OUFEjydI5zc24=
X-Google-Smtp-Source: AGHT+IEm6oXO2r4KYTKPtSE9welSwD1abs+PtNx7WWFB7TzUWo7i/XmNEQUtlW/kMqxWORKwvWU+qA==
X-Received: by 2002:a5d:51cd:0:b0:3a3:5cca:a539 with SMTP id ffacd0b85a97d-3a35ccaa7c1mr13513449f8f.20.1747781973118;
        Tue, 20 May 2025 15:59:33 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1basm18088864f8f.15.2025.05.20.15.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 15:59:32 -0700 (PDT)
Message-ID: <ab0d0755-788d-493b-8599-524690e35b11@linaro.org>
Date: Wed, 21 May 2025 00:59:32 +0200
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
 <3f2c15b3-1daa-4386-a6a1-1d05c33d58d8@linaro.org>
 <20250521084729.002e670f@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250521084729.002e670f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/05/2025 00:47, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 20 May 2025 19:23:28 +0200 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> I migrated the repo to kernel.org:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#imers/drivers/next
>>
>> Is it possible to update?
> 
> Done. (I assume "imers" needs a leading "t").

Righ



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

