Return-Path: <linux-next+bounces-9105-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC26C72A55
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 08:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 740713549FD
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 07:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5F016132A;
	Thu, 20 Nov 2025 07:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pk+g/oRq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D3309DB1
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763624777; cv=none; b=luaNI+OlBhszkM+lSCsXulBlLSVLNmTX3hwlOpwB1WYgsCkYL4jg0hlTlk8YlnQHLvCEP8BbA5rG0ZS3ufzSaxg8iInxSSmMvDK+vbk3NGlxw6tTqfaRM+grLVOT4bJBuD8T6nRLNS18eFYoG+sbY4z7q/YCo7BDWo9RCdnNrQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763624777; c=relaxed/simple;
	bh=rzao9CQq1f1nIZW/aBLrQtGT09EvHHa0b2T1Yf5+FQo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fWOYGh9mPo+OjNLnA956sWEGQ18N/eVkFFl3XwB7v/QSFrXctmaUIr4Vb2cL7AwC0/JC2PRStWg2DogYYjiu5KR6DhrFXyHSrf+jO6bW/vWoCyc4LBPNrmtH5NPmDq46zOusoPDuJjTi2jXYaRg78Cwccj8Ma7yoyaqBvfZWFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pk+g/oRq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so293928f8f.1
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 23:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763624774; x=1764229574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiN2RzbRQ7XWjXa9+8EdXNBeUtNmAWvhUITSFquEaOw=;
        b=Pk+g/oRq3WTJIZNJL7hi6BnJqMUWoj9RKQdUBNSGPHBhSIaOcIKtrHtfQkTMRg8qJ9
         rMpeWN1WU7jOROX20d5xfOEedj5Zq9mmW7AlPm0wTPm0cTSoXdzEm8NUv5gY3/MgF3al
         Gsi1vduBxn5l+b0o6xGsVfyriDbFJ88V1XdCFtnG4z2dUNH5Yav3j9G4L3jxfc93L8Fd
         x7DOexSW0eBay1AjPfBjUqu0dQv7gvoP3gYWWJcULsQjeR+sTvME0jEH6Z+tD6UPHbjg
         LaZ8Y0IPNt6OIH6TMLynR5XRRzjyU9DIGGl3ppn5IsXyv+sw0poPJlcFPTYecB8/zMT3
         IjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763624774; x=1764229574;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiN2RzbRQ7XWjXa9+8EdXNBeUtNmAWvhUITSFquEaOw=;
        b=BiReBCcZA3hysC/tj8aSGr4gWCPymzLhwYjDNOUVd6wuBbjBblU3BZkXJNfO3DMnBw
         itOMDF73YRmLH5VkyQ+7ZnCOlhBR+Sw3pjbZqKxCyAOEjV+m25Fc/BsEdDpk+kofb45J
         c0BYcrCGq2q7rYZCcdpYuXvDooGdtuQGGs5RZxg/15sm6eaZU3jAuCWhnGVdo9fYyH4J
         ztTap3zNT+aoJWBFZ+oYUAJNmwcY+ZGJ9xhHWl8uOC3WEGivEOSt/YeDvX8zpwaUbudl
         nP7TttMhvC6nInI3kgUnBLTmr0PWf7NPtLU+O52t3aIhPGIvQ0i19TrT+q4tPJkzaMWe
         yCRA==
X-Forwarded-Encrypted: i=1; AJvYcCW2ysvh4msQmDDtpM+rv7bp/S1qy+G3pq65XjrZRiqwMo8rnlffN4UB5O7/77q9wB7VnVOKCcJQpM3N@vger.kernel.org
X-Gm-Message-State: AOJu0YxCOhO4i4sdTsGvXBa3jv1mbeR8OPD+LOofrS9Kk4MKjkgirbKi
	uQk4xZUDWLfrrVLJ2Y+IHm6oOuunETWL4o/QEN68ac0zLgEdnZB5C0aWBKuJPksGSEo=
X-Gm-Gg: ASbGncsneMQHA408a0kSp/5FnH2Ps5rWY7yskpU6t0AyCOrqUeQoU7D4VcptuSYfpOM
	/q8ZSHvDkaqgxEDrEjCbm7Dpnfcys3MsuUhTmbIibKS7P3Qd3sZ5XXwUdl7HjAgLtZ2Euw2vG+U
	F6OFeCkxviMnX/xjuo8iVTEbrNfUkeF898be529Pjee3tRjGsjjItEAq9N98EVMcbGEf4FpvASf
	hx+QjabxETZ/pEgeuZGDgmkQ6DiLB0VUl6NQ70N7j04fJUBUjWZ5nI0LymoLoLdvpAnLDeHbaa/
	4IMJ8w4TqhLJb3SyGSByNNqyv65+jlx4CavwWGuCpfcIXSfOBrYku/O8hz86im9WdWNt5TmM+6k
	xasc7Nl/YUYfi/HZKocy/rBz1oSpQgLR8Dy9GoOMRj8bS9UdJ52BhcK27NHv15XtvhvtZnx0WW4
	NjaQxEnsTC2mTqthpYJj2ofHHl9RVMT/FL7hxz3jFJxHfZhk4tSb21DZyNz97tK9M=
X-Google-Smtp-Source: AGHT+IEsXYSILpDHdIQsWWyxDc8Stw5uNYfakgrPjDV2CYekGT3Au661Ppl9N1AZ5yKNxUxAIvtYDA==
X-Received: by 2002:a05:6000:310d:b0:42b:43cc:9827 with SMTP id ffacd0b85a97d-42cbb2a439dmr804131f8f.38.1763624774033;
        Wed, 19 Nov 2025 23:46:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7? ([2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e598sm3838941f8f.4.2025.11.19.23.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 23:46:13 -0800 (PST)
Message-ID: <dc507069-6116-472a-a543-7951b8a177a4@linaro.org>
Date: Thu, 20 Nov 2025 08:46:12 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: linux-next: manual merge of the tip tree with the amlogic tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20251120150418.591b5da9@canb.auug.org.au>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251120150418.591b5da9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/20/25 05:04, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>    arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> 
> between commit:
> 
>    fe85b8876768 ("arm64: dts: amlogic: s6: add ao secure node")
> 
> from the amlogic tree and commit:
> 
>    4b6111d677c7 ("arm64: dts: amlogic: Add gpio_intc node for Amlogic S6 SoCs")

Thanks, I wasn't aware those DT patches were merged via another tree.

I'll remove my patches for now.

Neil

> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 


