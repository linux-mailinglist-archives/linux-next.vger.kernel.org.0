Return-Path: <linux-next+bounces-6326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AECFA968A7
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 14:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 306CA3BA0F8
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED13027CB3F;
	Tue, 22 Apr 2025 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kITc1WdS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2A27CB1D
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323996; cv=none; b=URCNYi/5FYY8HP4LTCDzcWDJDXWxBA5fkreBvK7Rb+LmMEkrZ19xnJDidMCkm+cbj6+lOcP6XU6LguR3/iKWi7yvnSki2jo4RQk5QHetvi7Vf4VbBBtWPs7YFzQ9gbFc2O4RPZ77MKQC+78RIYbN+RaD0c25OZfAlMS7XnuKOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323996; c=relaxed/simple;
	bh=zw0Kx0vwXl05LkDdgW9mYr/vrDHtjtl/E6rMarjAzVQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AYmZoGgyGB29vJAb2QvAQ2YhV65DGBE9xyFed82T4PBhmzOcixhndhN+V6o/JRrhy9SKVq/U7vMy4FDBMZSCw9XTB8odIrnDKofyNoaiMFEYAvBTL2f1ghEcbXulwmzcTyiCe98IWuynarwM4GMC7Hgl9I16dfTiJoTFg4EkDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kITc1WdS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf257158fso33754475e9.2
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745323993; x=1745928793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+uEvjm3W1Mv9sborJNH8uTHXI0JDlmAQqTkyMWbehQ=;
        b=kITc1WdSwgWL/7j0Ikk/ZlZjMDSZv0mw378fdGd4xzCau90VQ+s6uvWNipnmtpxkGp
         8LcDbnfKTBBtNOBFtTNJyBB4Z6hz6gFx7KcBswFKKIl9Ff24WpqMZuoUrdgIkaQaYx8v
         YGCvkabYRck2AnffVEjKmOJlq3Jt+RDxSJjEIdFODInuO6KWvIrgcXegaGj7q1SRNBi/
         oAGOJ8fS0gPcsTb0a5DZ61sDx9jWE4so2uxXIaVYoMtNYs357AuCLQRyIcyk2joi+ROw
         p+aE8E5Ih6busmWJ9LTq8wmTybkDHkfscTdL/IxKmjruht3thFuvZAWTnPmC/rSKprg2
         buZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323993; x=1745928793;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R+uEvjm3W1Mv9sborJNH8uTHXI0JDlmAQqTkyMWbehQ=;
        b=Goz5nrsz4WWGX26UwmsuErO95Z1MYyHPEE83RJjqKLJFG+7EFuja6pIXGkn+ydkXKU
         Sm853OKmCuYOnxxnBF/fNs5ObilPiCn+ZMHgNGS0dFxdEo5cfvG3zxCLG9XavmV5jR2s
         cbBdArmZu5nkhe/ePIM/DRlJkkAsxsJrgQmeiHV9j4cBN4UA+g2ZYPkTANrLcwx82YqD
         C6wgPM4XiW1lmQC8pFkjtK/UB/ksWGSUhyD4/y7LRTgzzDisK4uWAyviVdJ2oNwMcYsP
         Qn3uTnbCNp4CdsFa75m8i+6XI6gxfot36NeKrqQR7P5fTRlhCSyv+mnA5iK+3gTLT8BK
         sbHA==
X-Forwarded-Encrypted: i=1; AJvYcCUeBhWhCr+xcX3ZdKo28+cJD2PpOc/r6lvmJECTNTMoQdM1RafxpEaKReNBbZ5rFjmnbTLhRN+iWKB+@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRNxOHNz+e6Zdk/UM4nIpEo6DqyOzBMg6KiOiDwGNv7GpdXk0
	m0pt0c0NM6kpm+pZL/WOVQBP1lEJRz5XA6wIOEm0YhNubKs6UhT7b/WqU5Dt4eo=
X-Gm-Gg: ASbGncsv8np36YEDPSKSbo96YSGIg277ehi+3HJbg09bAHmVu5Fo88aNdTZntW8gFeX
	Gc/+L+Jg6OmPjqkbgwLG4ccWZuf7DssKtItA7Oh+K1d4bi7TDq0DxfsgV+n/tyR/squVXsfesVY
	y25nSlP1EZ+BsBQ7lsHpFMGpB8gOaJtxEGLHTTQ6h7K5AtzzkR+am7PQJ+kT3LnUT52iMHhL+dt
	T52Mx5+HV4apB+PtW5iICCBFOLZKaVHFZ7rgsc+9Gw2vDVExSzl4kkciLFF2Tay8Wk2uB3UgPm1
	NMQsR2orZdh6Xl+CFGwEf8dtUO+GjckX+V396Ex1nmQnxc+LSV9GCTrk8hHnf3FYLomklMiFiLO
	wz7v/7pfhP7Sc+XwHYA==
X-Google-Smtp-Source: AGHT+IHCdLHJXHFmqzRwlauNx1lUbKvNFoCFYbXRUe8L8AzRhWbDiofTzxnFq1ebCtvwINLPkXLXAg==
X-Received: by 2002:a05:600c:1e10:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-4406ab95a4bmr147544065e9.14.1745323993335;
        Tue, 22 Apr 2025 05:13:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9eb8sm171356085e9.4.2025.04.22.05.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 05:13:13 -0700 (PDT)
Message-ID: <04ea8702-0298-4e2e-b466-8811e5788134@linaro.org>
Date: Tue, 22 Apr 2025 14:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: linux-next: Signed-off-by missing for commit in the amlogic tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250422212406.39ac44f8@canb.auug.org.au>
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
In-Reply-To: <20250422212406.39ac44f8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/04/2025 13:24, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>    0d057d35f371 ("arm64: dts: amlogic: S4: Add clk-measure controller node")
>    72e295292d3d ("arm64: dts: amlogic: C3: Add clk-measure controller node")
>    bc93a99ba90b ("soc: amlogic: clk-measure: Add support for S4")
>    67c618a5852d ("soc: amlogic: clk-measure: Add support for C3")
>    97533fc48892 ("dt-bindings: soc: amlogic: S4 supports clk-measure")
>    e5635febb4f0 ("dt-bindings: soc: amlogic: C3 supports clk-measure")
>    ac2edb9b7bcc ("soc: amlogic: clk-measure: Define MSR_CLK's register offset separately")
> 
> are missing a Signed-off-by from their committers.
> 

Sorry about that, fixing that,

Thanks,
Neil

