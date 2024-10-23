Return-Path: <linux-next+bounces-4389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B249AD3C7
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 20:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375212847D9
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 18:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205071CDA14;
	Wed, 23 Oct 2024 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORcInKAt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DDC1E51D;
	Wed, 23 Oct 2024 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707457; cv=none; b=qX6/wcAfdHRVsc5eoEYEIecN2xRwnIYjXMd1qkAl6OhHk0MhBOXtPwI6HtEDNqExFukBkyiuXDoKLTf5cmfDx3XDXMDGB2MqjbjCmMnSOyOUX3yFn4O75vGAMu4UPtKLEHeWJFPOinqeiw8PiE5qXJmLYD5OqnKVcyhA8vFn0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707457; c=relaxed/simple;
	bh=U5/Q7vGP9CtimGPa9u8wiZYe0WrlShDTyaX2x6SzY9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLB96xxkQYNZOVqxS+II0NpW8EjCF5ju+mXyOIv/bML2gIclqexbWZiPGadablDXsUQkpKjT+45cBD0WZBKbjKpgsb3thjNZ08RT3EhtGUjoqZCaDyXCG/dL8wpwe3zQTbmw7H4HFkmun45awPKqziyktIfBns7mx2Wuy/Dpjf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORcInKAt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so258f8f.2;
        Wed, 23 Oct 2024 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729707454; x=1730312254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfOK1nA/YNQetCnyMYWBmbYGNz4UvHbBGo5QOSUlquQ=;
        b=ORcInKAtqf5dVxMqq6lH+deLGIWMOnZE927GyxEkZI/aIE2+2hueoGNi+hy4q1VVpI
         S6OZfAJnlOkkJQ9eZcSfnPWcf0zWwV7H+ykCEw9JNDZPO1EaM1hmxHbwv01O8GHScEZb
         shxISW0/nE7tG1uyq36IZ0KqBznw3cIcJaJA0c9wfzSEsr0sv+ne89osuHewDvPWdeAv
         Pp+JZNPGHKCQCEfaxub4WOK791TyC3ipmGWSeGh4BTVwrM+rdiEwl2wGGWc5O3JwW6R2
         lLz+H4slygBd3LWTIFP6V+MEqZyaWRWxsw93d8LNyfBcLeZN951RT7wZRchOes9BD72f
         rTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729707454; x=1730312254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfOK1nA/YNQetCnyMYWBmbYGNz4UvHbBGo5QOSUlquQ=;
        b=ZPZXnAbxJqb8Td5/riE+Cyasxyq1Ye2lEqpxWir42wf1dPgFR05xN6USDKi/ERpZgX
         8JZHok54a1H+8oHEm96ivFInijecmIGFIt19SuBaJWsw/4s2GJjZ3TBBGKQ67O5MbCcc
         C88pG2qjDGFBz/EmfoaV4SeSM/H/vRCX9Q74scXdJpPtxMF1Motcaeh82nNaqGYkC7Q/
         ZSf4Suv3GbDGzKqMiCBs1W/+KOb1/cgun+zMxtq9Hl1YaCoVEfx4wSHyN1cEcmkaqf1Z
         pdb1TG/elQ/oB3rStZjGO6X3hVOkXZk7psso88Z3QW2G0Vpr9ZqRTyotSCcnvKJV0Mrn
         iQEw==
X-Forwarded-Encrypted: i=1; AJvYcCXPR/8sGZZtZI0at9+BTzf8nV5AW1EWrAeHKBd2q9wrsErNlMt/YHchDyrdnMnyH3pSztBD1nVsdKVP@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIv3cgzjZXQQNaGj3DaZInDGax1Yr0Is4vcYOmJL2Fdv3Yatm
	8uN4hyh4WlWQZ71wdFi3Kav2WQlbh/xYJD2jV8EnFn0nXRLzjDLG
X-Google-Smtp-Source: AGHT+IFgVSVSkx87lrAcfulOqkDh8SzYlS48yZrBfxEeKT+yb3J6Pv9Pg53tAZMPdUnukOsH0DQdIg==
X-Received: by 2002:adf:f0cb:0:b0:37d:46fa:d1d3 with SMTP id ffacd0b85a97d-37efcf33bb0mr2386996f8f.34.1729707453565;
        Wed, 23 Oct 2024 11:17:33 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:b7f1:415d:4bfe:cca9? (2a02-8389-41cf-e200-b7f1-415d-4bfe-cca9.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7f1:415d:4bfe:cca9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd1a2bsm22845225e9.10.2024.10.23.11.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 11:17:32 -0700 (PDT)
Message-ID: <22f9dbb6-ba5e-4c85-8aa2-6090008e7da4@gmail.com>
Date: Wed, 23 Oct 2024 20:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the char-misc tree with the iio-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241023141015.0ec5346d@canb.auug.org.au>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241023141015.0ec5346d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2024 05:10, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/iio/light/veml6030.c
> 
> between commit:
> 
>   de9981636774 ("iio: light: veml6030: fix microlux value calculation")
> 
> from the iio-fixes tree and commit:
> 
>   ed59fc90f38a ("iio: light: veml6030: drop processed info for white channel")
> 
> from the char-misc tree.
> 
> I fixed it up (the latter removed the line updated by the former) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 


Hi Stephen,

I doubled checked the status of the driver in linux-next, and everything
looks as it should: the first commit applied as a single chunk, as its
second chunk affects lines that the second commit removed.

Thank you for fixing it up.

Best regards,
Javier Carrasco

