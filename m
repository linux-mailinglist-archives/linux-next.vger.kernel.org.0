Return-Path: <linux-next+bounces-3589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D796B6A2
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 11:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D8A41F21CCA
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 09:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64E61CDA0C;
	Wed,  4 Sep 2024 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k51qikJc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C21CCED1
	for <linux-next@vger.kernel.org>; Wed,  4 Sep 2024 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442120; cv=none; b=IFeqYXPZaXbQTn765qBD/2bNBW10YB4AoccbhwjNNVQ6rgZNJKJyUGfzL6tq5iW6wb07eb+C2LHjW8/2sl5RrYL8vizG25k8/YOTuff442cmZU1KF6zTBMlXchMSibva4Xc7dtC/HUtN24iy/69493S/nMajZmzuacQpP3S/99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442120; c=relaxed/simple;
	bh=SGrjCCtQW4ZdmFMOR4QedGcj3VyM4JSDKs1/b25Au6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCQUlBy+ZTjwe/1AhKJ/fC7XVcPr08vh8bJ79IU8j4PZhIVSQpY0o/pyZSiHYC8YXYCovupCJNJVN9ktjS5lM8DG+nJngktCRWJvF7sceOxuDf2NYs39z1ErrtZUALshuH3G126o/hPLLjGbLgFsLJiyYe+G6OrYsn2m4HM70GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k51qikJc; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533488ffaddso7764527e87.1
        for <linux-next@vger.kernel.org>; Wed, 04 Sep 2024 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725442117; x=1726046917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xuq/cYf8+71Qm9h4676C8ljwN2DXNbLAaqL8sBoWxfU=;
        b=k51qikJcjws5Iq+l6qAAxieFZvVepH8HYv+or2seaBH40ji5kdyQ6HJF6u4nJZqa7P
         UCTxj2FndujwC5UVwL9dRdHTHIHBWRhvYDSA8S2Qe5Ko3/sc8nTbPDFoP4L90AHfYCq9
         MjqqiGr9tKGYqyOT0VQbXGTWArHXmKMyeeirZFbwAnS989FejUL8tcwkjRE68w1kqL8j
         2zsvi6cODN3g2VOPdI2GN4VyI3hpgBJZAb7DZU+M1JsFxArTO+Rh3ezzR+xiMPnd5CXh
         rBQPN3zo4GrLk54yKCENUIIE6xsLrcuRWSWrQNFwfy85QJojV9/GGB1aFyEHJelFSxD5
         LYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725442117; x=1726046917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuq/cYf8+71Qm9h4676C8ljwN2DXNbLAaqL8sBoWxfU=;
        b=Lpy5Fj9uqN4oXlxek9qfUC7xh0TrRkPw+8vkiM5i4sLqAuKzqlJexd+qn0LFqKEc/L
         pDzmnHmR9pMjh09aEZPa4mT0+BwkFgsHud9Oo+3O+3/397rOxjgNz42uNWyOmORXtehv
         GB4XGfUMpC3FUsczazkz6mEmc+QUus85ACpfMAW1p3sB0l44McocMx9jDP8qsbh9BKlu
         srq7Nqqmj9fYvGyIkWKNy6VABVyelbR4qp/PzWvOuWqn/rC8m/lmrzsyJM4ZYAYYK6Dm
         jfmeIQ1vGe98ZP2x3Ltj4V16+ALOEeRKNqPu2oqlfKTE9/zV1YMmKvcDIzPs3MOTgPCy
         S5lg==
X-Forwarded-Encrypted: i=1; AJvYcCUqbmGA2X3/kRxdr3l8yQebXj6VFoQrSoV/xkkwDKakyctPgIkdwJaP/sII6J67pxe+0Br070YR6CBo@vger.kernel.org
X-Gm-Message-State: AOJu0YzZItujU0RU4DQPzl1FU6MlRhiWWN6RBqNtYeJARgfYqzOX0Hgg
	OkQMueq6c1audShCQh+p9V+ZwoOxJUtPqj+B1GTNFMAruiRV6fR02/z7btp0cCORZlmnJ6A5E59
	i
X-Google-Smtp-Source: AGHT+IE2duZdsTgB5bwxuXGiYe/YCnbsFxat+800LtjisZGn1xrJhdX8Dw8rX1FIpkF/8bCDA2G5Kw==
X-Received: by 2002:a05:6512:3352:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-5356992f407mr628693e87.42.1725442116986;
        Wed, 04 Sep 2024 02:28:36 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a898919670asm794444066b.140.2024.09.04.02.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:28:36 -0700 (PDT)
Message-ID: <679cfd5b-42fb-49c5-833d-05cca34b4ecb@linaro.org>
Date: Wed, 4 Sep 2024 10:28:35 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the fastrpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240904153713.4dc28982@canb.auug.org.au>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240904153713.4dc28982@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Stephen,

On 04/09/2024 06:37, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc.current tree as a different
> commit (but the same patch):
> 
>    b056e4e23acb ("misc: fastrpc: Fix double free of 'buf' in error path")
> 
> This is commit
> 
>    e8c276d4dc0e ("misc: fastrpc: Fix double free of 'buf' in error path")
> 
> in the char-misc.current tree.

This is fixed now along with slimbus and nvmem tree.

--srini
> 

