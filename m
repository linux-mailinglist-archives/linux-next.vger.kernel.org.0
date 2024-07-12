Return-Path: <linux-next+bounces-2966-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E5A92F670
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 09:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DDB1C22E67
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 07:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2749B140366;
	Fri, 12 Jul 2024 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYV8zkMl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78C41C79;
	Fri, 12 Jul 2024 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720770527; cv=none; b=b8F4HHcJxR9hNVVXfbQZuNWoG2nkdYzseL3AxPrkaQlOkx2yIi1fCQr3D80EzlRYIlRapSswAh8Y0IAaXDLTk6D2hd+7vxIhznAQhy6ybBclF5RLtAvm/QUvRszLSdFMGe+rlbDqVA9Q+xJwLQ8iwCWxs1u7AgzWh6h8XGj9mgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720770527; c=relaxed/simple;
	bh=/Lq2JNS7VxeYoVgHFt/V8DeU1iX5HnKJpzdJEAmjv6o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J376G3a1hqAVP/7HtiuE6rgXqAxaLaU08PvCQfyRBIrf+DOrn6ltG+u2Uk1uG+RY4KQh1XODtnJ4NLm1V8VjMO9dX6cULbVC9s/SpI/kv/iC9WB2z2bNjQTpI6D26SclnCGY/GCxQbg6u/z+ZbAbTQfPk077x2XnZxaFJvSKB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYV8zkMl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36798e62aeeso1006551f8f.1;
        Fri, 12 Jul 2024 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720770524; x=1721375324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qrjeLS8hT87E8k9W17JKY3tphrxKAS2U+oTS99s7jFo=;
        b=YYV8zkMle14h2WaIEaHdrjQFSV90O5UZrP/G4OaUWCI+U/SG+0p6J2JSB2ZpOeL2ss
         51DEQAGFRJGV6SnHJQ7N19ydROja2Qo7PeTWoyD4vVoidKBVwt2IZ+Mkhwzq+9B1eCKe
         IbWz+x2hbXlHqzubrf37qA575E22iDQKZi6AK5OgYfD62y3JZyjSF7u0Y4TQcv+HsfBL
         VeUK3q5Z9ouuo7rrU9qGlvYfoox7OW6SoCPm3a4PZEmBC65avzh8RmbPPXckesT61OQZ
         /Q3cuSgK3TMS7pV1zWLMGZFekbj2G7TmSKBQPj0B0hVJdnUbOOY7I4H5nqTQk5YLZ96k
         vKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720770524; x=1721375324;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrjeLS8hT87E8k9W17JKY3tphrxKAS2U+oTS99s7jFo=;
        b=KRNmMQn1uqI1Y/7yQg4YerLu8fw61KVa32zZKu4dzwroRluB1xE5q2EhAd9D2gJYt0
         Ae4btvjYyZyOFiMOmqP0OJVO2PasaquImKn2L5MSauHnjt1MdDgkhkKTn1VWsBVOPbRT
         41qHhM6I62Px/ykhvy0lSC4K7oqUGYL71n3xag/W6Lr8im7+Z1GMnYI10LeHaJ+mA+OF
         FUZj2hHwEGPFu549p6PnXPEbSp9zkjJPHoNmY/gjYy2KrxoUeftLv9WIXolh/yEtit8g
         GSrksEEqy0c8kj9EGAw5YSrJf2ibgXTd6fXkKrkVFVH0u1HnnViPBMQ3avF06RVhcDoR
         7Wbg==
X-Forwarded-Encrypted: i=1; AJvYcCVIrxFBamSYG5Obe2T24sbndKRYs54FlIvpA6CLQ5xkref8/1PIHu8wIH/WjDdg/SgSJH3lxNGyi2O+SvFJ5P+bA7pBv3e9vVTZ+Dy9KlDkdceCuWg3a1Zv/ibpX/kmazsvF3qWiKmxgA==
X-Gm-Message-State: AOJu0Yx7WMnvyxEt84ZXbgQXrC5e6FCRE63UrZUi0A7/pZ/NBKBmuXmP
	itG62/Fhw+L7UZ7gptzpRbSkkeuunp8JMKMGGhNioqhIsigKSH1q9hGHUg==
X-Google-Smtp-Source: AGHT+IGtY8Qgva4djAjov2S7pdB3wwqKHxNIpD/W8Gm0jAAbxY0/IIXRdg1WtWKoZEwesV3Tkbs1cA==
X-Received: by 2002:a5d:45ce:0:b0:367:99a7:42df with SMTP id ffacd0b85a97d-367cead1644mr6914611f8f.46.1720770523517;
        Fri, 12 Jul 2024 00:48:43 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e17csm9634651f8f.7.2024.07.12.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 00:48:43 -0700 (PDT)
Message-ID: <6690dfdb.df0a0220.90a81.64f1@mx.google.com>
X-Google-Original-Message-ID: <ZpDf2e3KAnNiC9Jk@Ansuel-XPS.>
Date: Fri, 12 Jul 2024 09:48:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
References: <20240712144831.269b1bc6@canb.auug.org.au>
 <20240712073139.GO501857@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712073139.GO501857@google.com>

On Fri, Jul 12, 2024 at 08:31:39AM +0100, Lee Jones wrote:
> Christian,
> 
> > Hi all,
> > 
> > After merging the leds-lj tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from drivers/leds/leds-lp5569.c:11:
> > drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
> > drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
> >   204 |                           chip, LP5569_REG_STATUS, &val);
> >       |                                                    ^~~~
> >       |                                                    |
> >       |                                                    int *
> 
> The only reason for applying this set this late in the cycle was that
> they appeared to be fixes for other brokenness.
> 
> This is the second set that you've submitted in recent days that has
> caused build breakages.  Something is wrong with your current
> development practices.  Are you able to identify and rectify these
> issue(s) before a lose trust in your submissions?
>

Yes, I identified the problem and the config was silently getting
disabled and hiding all the errors/warning. Driver also was tested on
OpenWrt build system where the option WERROR wasn't enabled as I was
devloping other stuff so this added on top of it of not noticing stuff.

I promise this won't ever happen again. Also I sent v2 for this hoping
things can get reverted and the correct series can be applied. If not I
can quickly send a followup that fix this. I verified with the repro
that the warning/error gets solved. (it's just channging the int to u8)

-- 
	Ansuel

