Return-Path: <linux-next+bounces-2938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A092DFF3
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 08:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FD8282A87
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 06:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE458003F;
	Thu, 11 Jul 2024 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kA6/Cg3D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C9B2AE75
	for <linux-next@vger.kernel.org>; Thu, 11 Jul 2024 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720678587; cv=none; b=uIYLYhTYzJRt1RDG+9z827FyiTpQ+30a6xDg2pyRRsbTkhPJb2ZfHMTvldz2IQDw39mWZgkATwx3AsX4p0PA+vDq0NWK7+DuScqmrCJlUmH9fyR1kRa/q9a1uPn2gLZluVrgXcz9pAa1fnXJyHkmG9EHVUntyED47/giv53cl7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720678587; c=relaxed/simple;
	bh=6BBilbEeL52FTT35N7XB7Kzu/8daqmHMoqXrsMdiBZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHK/lIF1lLGr4AKDf9oagRZjQgbLIzyI7dEWDcOyyjD90hFPBu47ro4+jJUWLDVvldpP2SPapODeD15706WhoArPQz6qWcuur2fp8asZkEllf77+q3KlsH3voBOxGO9C4fxUMxr4oBlgK6bj/q4ZqU5Ps4Vm6AMR7ITGTYm93Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=kA6/Cg3D; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea5185ba7so82595e87.3
        for <linux-next@vger.kernel.org>; Wed, 10 Jul 2024 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720678583; x=1721283383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elYfpEJsVdFAh6mq3g1TRr0FkqgmW3O38LkNSBzAYLo=;
        b=kA6/Cg3DNQJSX517pFSr11K8GA1A0jwgQTJ0xou+35IxRXxFB3OrgME/a4XDv4f2GQ
         ViyWvTMQzHaLHtUwWWvb3SFadQPwWJVLWE2giV+dWmNk3O+xvn32704z45VD7XKuGHek
         etTyn1QcRqzFXClwZKhqIbHnzPRI/htf1AI7j5ZjuR47XMyS9P6F1iHlfugOy6lMw+tf
         DUWHmG39qwZV7DTRBGI6XJEnsPOJPPd8OONTbbaeHiI8X9vMyhsDaVafV/V5dguElRLl
         3bPBXYbftqtJhfFxq/m3RO72Jta6CSnerWYK71+w+OAeFO/9dIlbt/BTbjJ8IQqKVKIT
         cptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720678583; x=1721283383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elYfpEJsVdFAh6mq3g1TRr0FkqgmW3O38LkNSBzAYLo=;
        b=SPzg9R2bIFs1AAPl1PGaxNDaXDCuIxCAmCfujm/QIFa5hFUUBoDI167zAHSUnHL9wz
         /Mh7z49nvSfQaDU10x5Bp4GoEwqOWyCOa6A4i4IzyZLQk3ogIGKWTLW27HaQ+eft06iY
         y+mlptYxi4Wu+N5crqv7k3vUUEB1PEXuc7wf7tmNRIvvuO3lhbLQmyYqyrdHZxBK2/u9
         iBV6iavIipQJunMBTmZ9ykgYoUTXdL0rNIng7io3j9Mns7CYZIleGhVdfn6P7Ut7QLwP
         6CE/Dob4IsRmILYFLx9biFpqmM9Pc4u6kpxRG5g0z1ST+6Eie/J1Z8NguwJpe7rIvstP
         GVAg==
X-Forwarded-Encrypted: i=1; AJvYcCUMQHndGmx7JM60Mnajrhj3WovDJTo41QPglYsvdJPp7bsP3LvaaAuV69iEhVlzaES9vTvotFQ1kg8U833sJjBOrRhB69IBGi5fhQ==
X-Gm-Message-State: AOJu0YzBOZ6qzEJ9Fl1MEi0bWTyppStu0WM8G3vXzrEQ5trVma6PRNDd
	rjOlcfzT0dKC1gWksEic9rVMWNYv+Rtwqx73kVdull5CCAJmcePfO37GGMLBPFM=
X-Google-Smtp-Source: AGHT+IEYcKV1fB6RTyZpy4i6Dp8uhrL7s6pAADA4A93BZvxC1tbodpeGJvMhgglMxJAP3loJMukkvA==
X-Received: by 2002:a05:6512:3986:b0:52c:dd58:1a97 with SMTP id 2adb3069b0e04-52ec3fa3669mr1007081e87.5.1720678582700;
        Wed, 10 Jul 2024 23:16:22 -0700 (PDT)
Received: from [192.168.1.68] (87-52-80-167-dynamic.dk.customer.tdc.net. [87.52.80.167])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb8e49605sm879366e87.99.2024.07.10.23.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 23:16:21 -0700 (PDT)
Message-ID: <947e6d6b-f798-4f04-b6d7-d18ad550db66@kernel.dk>
Date: Thu, 11 Jul 2024 00:16:20 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the device-mapper tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240711121729.0d71308e@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240711121729.0d71308e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/24 8:17 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the block tree as a different commit
> (but the same patch):
> 
>   e87621ac68fe ("dm: Refactor is_abnormal_io()")
> 
> This is commit
> 
>   ae7e965b36e3 ("dm: Refactor is_abnormal_io()")
> 
> in the block tree.

Looks like the dm tree is re-applying patches yesterday rather
than pulling in the dependency?

https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-6.11&id=e87621ac68fec9086d9f0af4fe96594dd8e07fbb

why?

-- 
Jens Axboe



