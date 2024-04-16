Return-Path: <linux-next+bounces-1944-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 012688A660E
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 10:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACE79285FD9
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2212084FDE;
	Tue, 16 Apr 2024 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CXDAdv2c"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0B3B78D
	for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713255943; cv=none; b=Sihmqil8e26jMFzkWM+Go/jjyoS6rm5nj2OQxjfR/HYcKsF8SJVigyXkIhG1Fxr50z2GlEvwrNteP/6cxZd42BzAcwbms0d3nFWVer3lgzHNjBsBhykDLvpXYo26Cpk3iHM87E+87dyVsYo4TW6fnhTCQ4WPEAWPuxdM5xu9rhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713255943; c=relaxed/simple;
	bh=h9QGKmmAl3E+10Y8FZ97vaLKSeogYohkbJTw71ZWmXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBcbmW8ZZtV1joPUQEY+tf5hRP6EC/bGfTuTte/ChEouyx8BSVS+ulOXiqwjE9JqDmyjBtB1oIH13zzaYZXhahqW+RmF6jciRC+cFN/+GMNcngkeE9DuRiBLv6jQWnXkgG7HWT03phzHZXriIfiZMnGBpTj0tBdVhzfnEQ+rrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CXDAdv2c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713255940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlRGwveZNaKTf/vaEO9gfk6UvaP7DHItsQdZ9LD5yHU=;
	b=CXDAdv2cicIzYL0XNcCz0PzMP+YSgTVo89h1TnYdQM/xlNPddTtMM44ob7gYq67U43mRAt
	TaRzmXAmfl7VBhAcTrS0LLKI8cGkCarb+UOcJdtRXAd2/lKUeQcgOOkEki59xPl1A814cq
	QzqE6F1F3UgdlkcF4vYXynIB0BWcVnE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-L6nD1w5YNOOFIQHCE4xsiQ-1; Tue, 16 Apr 2024 04:25:38 -0400
X-MC-Unique: L6nD1w5YNOOFIQHCE4xsiQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-345c686ba9bso3083551f8f.3
        for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 01:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713255937; x=1713860737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlRGwveZNaKTf/vaEO9gfk6UvaP7DHItsQdZ9LD5yHU=;
        b=JHcjlBk22NniiC3n16qUC/2pM05DQpm3L+p9QgNj6gR2k43+UlAjD+mwM+/1JGszeM
         njpcUS/+iwdQHrnJfh5pSilCR832nLZqUVuBnkODPxE6Sd6zlqmtihwXrwPsS8Yxd3Vo
         L6QZhL7R2dhNQBr92Efx26s6XmU+3alXzyJBzEzeLfq9t3UXL9PorA/6kjR0swjAb4zU
         2K6hcD6HC+X9R5Y6EVRSUMxfBX2qHaXzMNh5mrajPM77DhUcgUmEX0jTNM3HBUGAgNyJ
         K7995j9X3wv/6PHK+sIZbR9VC0337BpgsPgTsRewoUjJQGVYGMrhgsqXtXMP3Me/+NsJ
         x5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwna1JcayNlrnE4IfVXXU0Vn7ZulCtWxNdt+Sz5sXP3c4r7rWDmPA89cm1OMoXALNcNJv3SNT0sRYT//LbxulD5M5iBnjffK3LPQ==
X-Gm-Message-State: AOJu0YwqIgUjNtJOEam7gBHWWSNnPbmXCHOXSLYnOcQcKZz4FqzOsteN
	/v+MaTvu7MX6vjWwNrn6888uPQKBQi0B0s1/8+BwSKd4dw3VSIb5nVDV1HDkK8kxdcm7n7/Na8U
	xIA5Rb9AemxjDiyb+swRzLiwfT2+ByT/RTyQvdmFeJP5dHjNZEoUAl5qShOE=
X-Received: by 2002:adf:e350:0:b0:341:c9d1:eae5 with SMTP id n16-20020adfe350000000b00341c9d1eae5mr7129806wrj.27.1713255937580;
        Tue, 16 Apr 2024 01:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKytJX+FjhQR2w1i1oJtNMSD1iHaqi6KTBm9EVmUYy4DH79bYUapQe5OqUrK74IzMetGwlpA==
X-Received: by 2002:adf:e350:0:b0:341:c9d1:eae5 with SMTP id n16-20020adfe350000000b00341c9d1eae5mr7129796wrj.27.1713255937264;
        Tue, 16 Apr 2024 01:25:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d4d8d000000b003432d61d6b7sm14045151wru.51.2024.04.16.01.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:25:36 -0700 (PDT)
Message-ID: <70ec563b-b6a8-48d6-9f9b-287b13df8f36@redhat.com>
Date: Tue, 16 Apr 2024 10:25:35 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Content-Language: en-US, fr
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240416173112.04579e40@canb.auug.org.au>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240416173112.04579e40@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/04/2024 09:31, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'
> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Function parameter or struct member 'sb' not described in 'drm_fb_dma_get_scanout_buffer'
> drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'
> 

Hi,

Thanks for pointing that out. The parameter name is 'sb' and not 
'drm_scanout_buffer', I will send a fix.

Best regards,

-- 

Jocelyn

> Introduced by commit
> 
>    879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic")
> 


