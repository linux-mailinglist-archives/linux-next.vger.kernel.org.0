Return-Path: <linux-next+bounces-5200-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5FA105AD
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 12:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50096167A65
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 11:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28038234D0E;
	Tue, 14 Jan 2025 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZeK8vkqp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E1234CFF
	for <linux-next@vger.kernel.org>; Tue, 14 Jan 2025 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854851; cv=none; b=Tb6rgxSuLPgBdia5SSWYHGAnP2n/zb9R68VRffgT3A/WZnhIfBRz3VkGd6xqGHmjeXxP8Nr2mVaLFrVJnsFhK5Rz4wOQne9drSWatq95I2MAyM6AQAL6ko4Jin4onLSyJWq9dvyT/gXOhmkepgSWloWl4ALCbhq5VYRBiBX7LNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854851; c=relaxed/simple;
	bh=0DwfetgWmDsIr9Ybvzps+HBaWB3enTRlj4YQegBmS5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR361Yu+gYCHiNRKWxIzhiLIWGH5Znssli/e6DNFPQds7mWeOKT4g4swE5a9Sc237W2PZ5QlnWYmZ5EvD5sZDn4a/kBHKyD8j6O/xv+e7uMoylHRu6LXhl0vk50Q5W6CnqYcTQNO5msbNOZBsSauDK99jzlCJ8hN3LfOvLDvSaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZeK8vkqp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4586276e87.2
        for <linux-next@vger.kernel.org>; Tue, 14 Jan 2025 03:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736854847; x=1737459647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RApK6ABZb5RLkZkJuxLbChpY8t9FmD5Eg7LXWFRYRmI=;
        b=ZeK8vkqplEk0FqAwA08aYf1zkm36W07pmI8ic5K59nsybeWsekZQrChiC4LKI2U4K+
         C23b4Ri+WLpvY1Ts1aL5Rirp8DpNEhhIp0oNZfNfo5kKUwYl6wygdNQ5FqxX3GSKOpl5
         GF3lAv2sBBe0JIxKL02IKVzx+dQ8qVlL1DicB83om+heD0WGZ51dgYGBDNgTqz6eA5DA
         8eWeaMgPxAUbRGEZR2vYaXJXHoFt0uWsZmVnxPkf10QEz7gHBFIc6QLA7ls94vO6RPSI
         1KdiPnt18cGJouQtuUFOVWOw582oNiw/Cy2a/kCi7L5qxGK45hSp8elKSEuED51PLqt1
         rtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854847; x=1737459647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RApK6ABZb5RLkZkJuxLbChpY8t9FmD5Eg7LXWFRYRmI=;
        b=Km/rFO7carlfHYNCaeN21qyFoR8ohnzSI14DcZ3UIizoNmX0w308frUnYddmj8ZoQb
         ug9jdFlnKiJy5h+DdnqR5j1R0fW9BMW6+qTTFTbFrzY0kBGZKjB1ZPw8pGqXZLeab1b0
         2XBcD0FNAF0ZCqBhD+kaai/6wIwYyc2NFei9TsHA7icsOYJoXt+KgxObehz2IaaomFWG
         9w1uOhdnO2XDW1m6JFb7jIXe8A4u4DaT5sOhMDfWltq5fL243G/7ZoAl9Ol//VjKJLgP
         X8iB1nI4o9dKHax+Ql+HaE6Yw+OVVgiRAH6Zv77rTJYhAE26Fr7XxRfJ6rJSChZ9fJBS
         PXnA==
X-Forwarded-Encrypted: i=1; AJvYcCUEKPJQ1ZKOkpEWI1ABK1GYJlu9biNMgJZy02M7FMM4jTeuCY0EgPF3DN89QebP5qgsVJDuuA5YBdH4@vger.kernel.org
X-Gm-Message-State: AOJu0YwAELgG6Avzw9YY5/GVVorRpT2R15fp4Vug0mySmXSBsIXqj2C0
	ZAaxGy+JszZIwctulUaWfqWkPfsMpeoBkJV/8XJIENTekQ/f0rp8rw4JCBkmlvM=
X-Gm-Gg: ASbGncuvcwiZNCIqADtMOLqmPBbeg2hAXwHBiemzF9pMMmPNKIWZYOtPHJux+Zw+rBa
	j6QsglFA/3Xp+6Dcd2LdNFHyMRc+koa73IbWFhVMEnZ2Pj1tAClSxsBLOXsHvdH0qa0Am4Ff+3g
	F8EklSKMWqwjHdSBOmT1ySYsu16Ky6DFPDLjMU9YdSnkAYIWNnnsWhnICz3qj61AozlK4xKhNws
	Z3UUZn8JgtFQdy9mLrKlgKOxE/FthVVHJ0NK3C76EWaSpKjnvQNgJzyQkzVBekUvgYC3Wm03Pwq
	MXYP8fGElegAKFmgPCSN1sziDUGAbL4wp3PT
X-Google-Smtp-Source: AGHT+IEP3QuLGe6bUVSbTfGj70OEbmA3v0rl9rotK0Soo8E/zBAkb5J8r0RoTnIkZJH41eNgQ3s5pA==
X-Received: by 2002:a05:6512:3d18:b0:542:2a28:e30f with SMTP id 2adb3069b0e04-542845d315emr8457141e87.31.1736854846750;
        Tue, 14 Jan 2025 03:40:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49a28sm1633804e87.42.2025.01.14.03.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:40:45 -0800 (PST)
Date: Tue, 14 Jan 2025 13:40:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Dave Airlie <airlied@redhat.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <2f74opyehgqxnd7337fc23hwwow2ggod25obqweu72j2zfbo6g@xuvurpzbwbyd>
References: <20250106174645.463927e0@canb.auug.org.au>
 <20250114164324.3a42700e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114164324.3a42700e@canb.auug.org.au>

On Tue, Jan 14, 2025 at 04:43:24PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 6 Jan 2025 17:46:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > produced these warnings:
> > 
> > include/drm/drm_bridge.h:738: warning: Function parameter or struct member 'hdmi_audio_prepare' not described in 'drm_bridge_funcs'
> > include/drm/drm_bridge.h:738: warning: Excess struct member 'prepare' description in 'drm_bridge_funcs'
> > 
> > Introduced by commit
> > 
> >   0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framework")
> 
> I am still seeing those warnings.  This commit is now in the drm tree.

The patch is pending reviewal:

https://lore.kernel.org/dri-devel/20250107-drm-bridge-fix-docs-v1-1-84e539e6f348@linaro.org/


-- 
With best wishes
Dmitry

