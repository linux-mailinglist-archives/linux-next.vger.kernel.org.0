Return-Path: <linux-next+bounces-2191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AC8BCC6E
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 12:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B6D51C21002
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 10:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752BB78C71;
	Mon,  6 May 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSP2+ACv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786B6CDCE;
	Mon,  6 May 2024 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714992951; cv=none; b=R5Wy8PysUBZ78KAqNGK3h6qQ91nZBFBsfl69mIOeUr1xeoRvPNxkLsfL/4z1rXmLaPYEi7GqjuSGxhwDXxwIM8ZHXI7x56A0+WIUriY1GW4H4flSEC9JX0xWmU5AtJcos+PPLuyPWgLiTeEH9gdVkcK6PYu0SPVV9bZR4vnD7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714992951; c=relaxed/simple;
	bh=mct5Y7njPeT4smIls3sbUM7/sO0Lhh1l6Xs5dBHpDg4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=e1VX0oq0gC8dTATeibeM8atxbrCinHGZmtUJec5mRUmNhYKfNsVpIzmzEzbr/QBso3WZI3Y401n1uVyh+IEZbfXdJ93cBpks+a+lmT3asd0bfFbKACBQH+pSrenVG+Gl8boESr0E9OdoMGgm/EkHHFn+oCJwVVgdhAslfvB7byo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSP2+ACv; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso1468907b3a.3;
        Mon, 06 May 2024 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714992949; x=1715597749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zWFTD/Zt1hBpGSdsuo+qdOz+mUpvF5tYZZPdx+vucD0=;
        b=RSP2+ACvhcWo9bPu2qGsTddRHD6WjV694lHpffVsbFuV/WIpCMP0xpI1iNeEwlsXHa
         LQtW58hAcsHy39pciuk5mu/qVEf20mJy+u2JY4X5qJ+4r7TauaxmwFKz/wXyJJhrvYC5
         YJvzsNBY/yCpASaNv6H6HWJXdhxI2jJ0QSH/VEuueVE4/5sdkGQ/KtutrPZyjompDRn2
         IxduI8wLcHD82qeDvSnlnOo7AWkatpqfZqXXdxsMoy9yBx3n4IR9AEP1gKX3rLerbh6U
         d2aaRfiW8xg3jcKm5KJGKsTKYJNt5GLk+/bFricRiOSZSbgJaV2EVGLwxsF03MOQTrwH
         mj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714992949; x=1715597749;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWFTD/Zt1hBpGSdsuo+qdOz+mUpvF5tYZZPdx+vucD0=;
        b=l08YXpUAgkJtngCzSIMD6I1xnikqS628XJ+lIewNaRWobFWVPIxAp5GCOIvDgoUUgo
         A+KUm8+Lz8M5LgHbkM1t1M7KRdB6hMby8eLo7fctoqV+leDmcpPtYdd9MhLS4tFCvH95
         LRWUf8rLWYr0/meOl4Xbcx2rL+hOGlpNG4TBdkYPtPJwk+cl5cWVnKu71uZG2P9AVti8
         wyfV8VOx7AntEw3rCv9NP1QvMVnAPDyxoarK+hluwp67NBt/SGww4ORS3gHrFMuI4uwM
         Wcl6Mlv3K2sEpoSZNqn5bRj2YP3sb90mZADtTJExewA6hfz/3YJjSRKDPnzHltjg3vO8
         QIwA==
X-Forwarded-Encrypted: i=1; AJvYcCXUm7OG1DhUoMiEGAc93ZYxk24VcJWfv8QS2POjlAjVfMrYArLBi+bmLGg96AW48RbbwwKWcaC+J5FJKUPcdHGFazsfCBWdZ97DdYyXBnydwwCGKa2UOM6ZDu4D5KrbTp/2YzxvajICjg==
X-Gm-Message-State: AOJu0Ywf4jUs6ICdDtwdfkkr88sydbaqgaeohSttpxjec6BqHc8dCIVh
	IiyyQb1sBy5ATq2VIrhWeQBeIYCdfBGWhZm9vGLvcEds+L9F8r23
X-Google-Smtp-Source: AGHT+IGVpr6ifI3SzO8o7YgprNvSCHbQ/5jc76oCvgJh+ah/Hb73/r0bDtF7W/VU1OoyyfTLibqRDw==
X-Received: by 2002:a05:6a00:a04:b0:6f3:ef3d:60f4 with SMTP id p4-20020a056a000a0400b006f3ef3d60f4mr11251523pfh.33.1714992949168;
        Mon, 06 May 2024 03:55:49 -0700 (PDT)
Received: from [192.168.0.107] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b006f44ebf4c91sm5323485pfi.21.2024.05.06.03.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 03:55:48 -0700 (PDT)
Message-ID: <65817e22-6cc8-4433-ad35-e3c556f390a8@gmail.com>
Date: Mon, 6 May 2024 17:55:44 +0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the tpmdd tree
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240506162105.42ce2ff7@canb.auug.org.au>
 <Zji1jB9xqOo3es5g@archie.me>
Content-Language: en-US
In-Reply-To: <Zji1jB9xqOo3es5g@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/24 17:48, Bagas Sanjaya wrote:
> On Mon, May 06, 2024 at 04:21:05PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the tpmdd tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/security/tpm/tpm-security.rst: WARNING: document isn't included in any toctree
>>
>> Introduced by commit
>>
>>   ddfb3687c538 ("Documentation: add tpm-security.rst")
>>
> 
> Duh! I should have added the toctree for that doc when reviewing it. I will be
> sending the fixup shortly.
> 

Oops, I feel like had not reviewed that doc.

Sorry for inconvenience.

-- 
An old man doll... just what I always wanted! - Clara


