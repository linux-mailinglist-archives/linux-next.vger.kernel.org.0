Return-Path: <linux-next+bounces-6796-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C038BAB860E
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 14:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A884C330F
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7945829B787;
	Thu, 15 May 2025 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nBtQRvb0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211A29B77B
	for <linux-next@vger.kernel.org>; Thu, 15 May 2025 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311122; cv=none; b=cW+R/SxiIPjzPTQAvhQaCavGidYcXsHTW1/f42bhcaW6WC8W07xU6l70TK9c33qtTjJP00P37uHCXZgaapAF/RX4jJjOpAEphm/riIQ93BfRseNbNSMX/VH4m9/he7ZM7Ixa2CWJqojBudUkL/dO6qScy++hMPV2UzJC3mj1HAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311122; c=relaxed/simple;
	bh=Yi075DnB0ddrASsSnNHyXEnUvGN34RERyEPTP/kj8pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz+Fd/kD5sS0vb458vzR9JO1EKIzfnJdsy5x3OUxTYP3YcRo3xLn4uYR//gIvPOqtscXBVAefLxehDjek/C17YwWFSU8oa9exQrYAWDzSLcUfqCLq390N3Cwjb0Vs9PbG8iXl1JPJotpyriPAVwCldOzP9IAS8NS0ZElPq5TIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nBtQRvb0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a20257c815so724483f8f.3
        for <linux-next@vger.kernel.org>; Thu, 15 May 2025 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747311119; x=1747915919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhgWYiKAZKVlkO6qOFi+ufzO8bDM2t8jbmNg+EGBmK0=;
        b=nBtQRvb0ywAdzBWIVmwoiOwLMHxuH3WmTVl/N9cff1QJdpMcPwGBX9pcYvJSroy12m
         QSvz/VkMQvvW/J5pBANrXZjVM6zkmYB4Ht2YZkC3cdQaKc/B3dAZwpYvjJWsZ4lAWk5I
         01aMcvBBGVWJhEU6gnLYKzjvbfeE16NlBP32ziT90RSdyutOnqCxijh37lBbPOt3qc2s
         wasMBDoRr1m9X9CVMVwXvXLyORNhg+5BDmPH9Np3v2ckVhknMQCPKslenH5oCKRtAPkM
         K65XoqkxZ9YrJeSVxV4/11ARxhQ/RjBd086/HLG2ujNrJ1/D2AHUPEJ7UO/rGyezk8XP
         odSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311119; x=1747915919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhgWYiKAZKVlkO6qOFi+ufzO8bDM2t8jbmNg+EGBmK0=;
        b=QbiZfV+gp1Syu+pQvgSKLBzq5EFNLosZxGNycTQ6kstUGo67EMXFH66LicoTtKYgRA
         GmVXWZhdx39A1DoKTVZPHQYmvYDbmPYiBncgQObvkXpGOZfC4VTLq2I7YsDABEKysUyx
         7uksjsIuWbDzz22ag+9LOt1kbkMdq46rKtWZ8FgiLIjjaK+BAMPit78hfjeRV/knbtYT
         b0Q7v8YmQeTOeVlwopr96i1lFCYN4Q+WxdUy86jQrqV0ypSVeX8G+L4v/9bemj2monXX
         pj4KdD0s3nfNu3rElfZTRUvA2gkovQ9+7we/MdNmhfv0QEGnnveyBYCKrz2VKt2zXuyn
         J1DA==
X-Forwarded-Encrypted: i=1; AJvYcCXL/fOV1vaGEMeW9gOvwIzC9eamwYwuVKpnOZ/ZQLjT/fYjmN9ym0F80vB/LWd0E2BEQIlrODK+tNWs@vger.kernel.org
X-Gm-Message-State: AOJu0YwQISYqbEad8FXNU4VMNzEVm/ePqKLv8d62xxIsXRZW8PX62l6F
	KK1gNYj9/PmBGBcr66sgSQ9XgRFnqNnrH9rwmNV8iRdLZXJkKuBr4fC5i6r69Ic=
X-Gm-Gg: ASbGncsHms3MTQ9os0QqAIvcgKBp6UKJMlBSgIDav+j9Z/jOqPGL8jl7Xyrt39Z4jyt
	OWxDUd4JvfiUMastWOiKXV1hKwOQ1rrLqS97hYVAuKri+4L1j6tHR18+2xzdsaj/P6HZgJOYQ/6
	SvWZp832/QfCbF/U4AEDi6pPv5aGzQ+96ZulyKVQtdcm8BPU0JXIuP2uqFrsduVcW+Hvljx60Ow
	xzShQVbr/Ht4p+6CY0ROUnrynh4vUKENJXit81u8J6NgEv3MCNehZGFKh9ZzkMp/7gErh9FNR2l
	+XxEVy/lkGpHx+4vT1B96ms9rfeUxtwzo/reW85NE4HkA7TdRJackG9B56vPDLtPSyhswz2IT+K
	8Vg2I6cqBuXViGOBZXmjFEYI=
X-Google-Smtp-Source: AGHT+IEjSwS5fnNmgBDe/niubQoDsW5LEae3lQuFFF01eXcj/RzozsMURi3EVcCH1WcDlMMiLfmUTA==
X-Received: by 2002:a05:6000:1889:b0:3a0:8ae7:e2ad with SMTP id ffacd0b85a97d-3a3537a0d4amr2100266f8f.37.1747311118802;
        Thu, 15 May 2025 05:11:58 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3368d1csm70739075e9.8.2025.05.15.05.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:11:58 -0700 (PDT)
Message-ID: <2ffb83f2-a7e5-48f3-b96a-447d330aa895@linaro.org>
Date: Thu, 15 May 2025 14:11:56 +0200
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

On 5/15/25 14:10, Stephen Rothwell wrote:
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


Yes, correct

Thanks!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

