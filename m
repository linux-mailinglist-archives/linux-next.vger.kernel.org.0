Return-Path: <linux-next+bounces-1474-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB001871628
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 08:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45C701F2297C
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 07:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369E87C0B7;
	Tue,  5 Mar 2024 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OpAEBn9y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985B4500B
	for <linux-next@vger.kernel.org>; Tue,  5 Mar 2024 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709622132; cv=none; b=mrxTbeZ+kBUGfhL11vXn59YlsyfrfCFrHKmKVJOyyDmP3fpY8IjJ3il84zbRod7ousTRQvchadKG0C2P6WZeefmcxKcts0QfzRqwfygSkXoGFEvtANFTqMB7TdtBIqkVxUsU3WHGUn9ziJjZUg2Bu3TbnkaXpfSeT/FJeIDxUR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709622132; c=relaxed/simple;
	bh=1kyYdsDkAP6TGaLjxGuPa5Gb0wu87h1MGzMU7RSPYFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U879UXYmVo7iDNcTmccjAlygwXhdTKAHslRyb1gq1b7gdRtur8GWQr/FWwZolnMdIMiUEvtoGpriUHrvox1TkwkCTG7rL+2vLB8/J6PbRePkh0Dtj0UT7QE1dH93SE8Ix0dr36NiM3FtyE7Kr2/U1UDqWlpKptWEt7JJ+9RhqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OpAEBn9y; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso8033441a12.0
        for <linux-next@vger.kernel.org>; Mon, 04 Mar 2024 23:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709622129; x=1710226929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SstHDqzCw0+nfzxAgqKGI1L56sOy1jDIi6jQlSBPYww=;
        b=OpAEBn9ylIrpmXHFMXm16ojfdLANAkmap/a9PuKEOMNW2VYz3RMvj9NJujPq/HFViT
         T481RoLup3cXkqM1nHdVU7VPAvXy4OgDfGATTQMIukGZFojCFDIQxfkUzHae5NAVkpy9
         p9hFJVTM9HqV1/rMETk2kmG+Wap4UgRFf8QkgrQpCbeiuO64ZTeZUduAK6ycUb/bcrmM
         bu6q2FxY5v3biAuNv4t6YaNYkL4DoAnzzpWHv2ADe5RaTZCcmjXPyjr+kCl4STufxDgK
         96+Ime1CTqj71tFuGK6SyQaum1RB5xB3peW8RFBmJGYXOJ2gEjh5DT03GckT55Z6sQls
         TmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709622129; x=1710226929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SstHDqzCw0+nfzxAgqKGI1L56sOy1jDIi6jQlSBPYww=;
        b=w2y/m6e1u2AARvK9jrI1ZJfhqQLVmVSr8p9PBD8bjgaLinhFRmbIGamQ27GJdS2h5e
         036zlzkmImN0WMj8e1Sp9BtQmT5h87cW1dg3v1JJEQ2DxitCZoqTHgBJh3zopz7iWBG0
         z+K1JGXw31gRnIxJMv6R4iSArr745ELE92lbfZsXjLV/BJQAVFD2i+4Fz6Vcg/a8P79B
         KzArwC+SyXqIu+r46C1Qo6jW9NUyIXCVMo8hZSZE0wKMeo1BTP3FVpkfts+8kYNxaN1t
         3EtM124eU9M2waD9ynrx5hK231IjDrfNCQ8pT5Y6h9EBOaUMKYMBmULgKp9SHs01mn9l
         K9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/5zIh3Q3fwbwgdIwXxCQni5dyRCb9kxaQzeu1SLK9nXyDIwQq2DjvMFYa/sw9giEgm0QcqPz7vURjgFYqiEhe6S9vxx5Atw2dYA==
X-Gm-Message-State: AOJu0YxK2HNiQqe9QiZMxueXw93qx7Hc0ltY8V6yFZcex2EDdp6RNkCx
	tUGT7cj/Fjbp6SD862yDz4Ly2eg01tIgE76OKiu2q+La+YR4Zx2VnnsU/AvO+kk=
X-Google-Smtp-Source: AGHT+IGuKSHSvTXHU/zbk57JkXkIoGlfnh5Xlplpn5+UdlZuaAtOAeOwB5i8lHX0C9xf2Fi01i8wAA==
X-Received: by 2002:a17:906:2b56:b0:a45:6c62:1b96 with SMTP id b22-20020a1709062b5600b00a456c621b96mr2336346ejg.61.1709622128627;
        Mon, 04 Mar 2024 23:02:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id h20-20020a170906591400b00a3d5efc65e0sm5692735ejq.91.2024.03.04.23.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:02:08 -0800 (PST)
Message-ID: <c9950c7b-9157-40dc-9c5f-fbbecb7a2768@linaro.org>
Date: Tue, 5 Mar 2024 08:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the samsung-krzk tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240305100340.6abe706c@canb.auug.org.au>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240305100340.6abe706c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 00:03, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the arm-soc tree as different
> commits (but the same patches):
> 
>   213b755e42e2 ("ARM: defconfig: enable STMicroelectronics accelerometer and gyro for Exynos")
>   5fb1252944fc ("ARM: dts: samsung: exynos4412: decrease memory to account for unusable region")
>   b43b68935124 ("ARM: dts: samsung: exynos4412: decrease memory to account for unusable region")
> 
> These last two are also identical to each other.

arm-soc is my upstream, so that's expected. I'll drop them from my tree.

Best regards,
Krzysztof


