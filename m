Return-Path: <linux-next+bounces-1396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E107F86A730
	for <lists+linux-next@lfdr.de>; Wed, 28 Feb 2024 04:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10EEA1C23A39
	for <lists+linux-next@lfdr.de>; Wed, 28 Feb 2024 03:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3B7208C0;
	Wed, 28 Feb 2024 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KxZPePBs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB14208B2
	for <linux-next@vger.kernel.org>; Wed, 28 Feb 2024 03:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709090818; cv=none; b=bGkjewjRO9tiVafybSq/k9NW6Ku08XwO8LWet2BxqM38keN7KFgAA9ZH9yEV6DhqySjgxEyc7OA9txt11bD/FLbsRIadvK9IN8MLL0GYVE86L0qONQswQqLey6tH/rOJX2h76hlmammcuV/XWQmucELgnCC+r6wRZ6ZeGAGrVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709090818; c=relaxed/simple;
	bh=9sgBLMSmPHbQ6S/7FR8Z40PMJ1wgvAaZxVC6zH0FcJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hh+tZqVJQKvBZgsHoywNq0IWdQnbJ7gf+D08aio8JBbsbRB5oFGk5dwJgT7/DwhR88Zpjbq9eUEZ+0WRO00jwUY3vfZ7mBgx6bjaxcOhzWfA2Fe3Da2c14sDl9MeJVuyl/Wjv+ITLEk6Fe6lxfN11RT2QSuDWzCUbZc71Sa22F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KxZPePBs; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6e495e7d697so1008427a34.1
        for <linux-next@vger.kernel.org>; Tue, 27 Feb 2024 19:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709090816; x=1709695616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qmklizh5oLx0m7Lfl3aZkWW1kWh8OoR2QwqrAY+bquw=;
        b=KxZPePBsUxcSHPb+h0g+RZ1BeQGrHLToD+Hnf1ospGETW9UovXrNDVn6OVHfT0H5Xm
         HxaDFC5JUwk6ouiW86B7r/eEiESuNmPz/u3NtuCe5KrpWUZtdpqcGBv4VxN3KHD01s6s
         E8y31A+axwMZ26DLdxGMcCqbiHcg/tzT4k+Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709090816; x=1709695616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmklizh5oLx0m7Lfl3aZkWW1kWh8OoR2QwqrAY+bquw=;
        b=olifjtuLKgBUsTzEgk+FjDkmX4TH959Ka3TyZrua3m8oZS2pUc9fwTx3CyAge1tdjR
         fiIDt37lgiSfnWwwRVidQ6PYDzMhKOD0rdsup8XrTUHSf2irPpk3GjWla3m4WoJaGcvZ
         2By8sKgb5swlP0+0N0V93bQrDGRjlwJ5NnowpPeZYgfgq5bWqjZlCixFgrgSKFxyXwTh
         JrlhAyTp5eEUDMW58koFy0zvxpHOszY1pkw2lc1znFJhNi4iT4fO1/oyAhR0z+G0GvAe
         nI0y0t8z5g65CSk1PXzUWobi+zAxXejHSiUb7oNmlvpeKd8TkKuL0wXT493qKvupkM1l
         LwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk881vz9imqHRe1v6VBbNMKPuOQbsK74jiPTZFPOZvELIlxW8YUTuJuafqEqpFetxLh8utk8AXt0t7bOjyS0hXA1aGO5DaHu5t7Q==
X-Gm-Message-State: AOJu0YwVNg6ixHiHQoeH41zWl+suRhzonyDx8o13DbCEAT5gqP4KgX1T
	XAH3It3kIIvnQ0uG7eyN6SfNDi8gWQOs3OZpBs0qIbkWzHXRGgvVq7U67cRnLDk=
X-Google-Smtp-Source: AGHT+IGnHFbb1so2f7aoWSa1l04J123hGVtY9lQXTx7D+iBuFHn7258UTIDSgMfZ/We2JkEJbW8AQQ==
X-Received: by 2002:a9d:618a:0:b0:6d9:d582:1970 with SMTP id g10-20020a9d618a000000b006d9d5821970mr11885403otk.2.1709090816345;
        Tue, 27 Feb 2024 19:26:56 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id t25-20020a05683014d900b006e49357f639sm1531000otq.77.2024.02.27.19.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 19:26:56 -0800 (PST)
Message-ID: <4eb24c55-6a8b-49bb-a54a-59f00b05b3a0@linuxfoundation.org>
Date: Tue, 27 Feb 2024 20:26:55 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>
Cc: David Gow <davidgow@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240228134818.7b6134dc@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240228134818.7b6134dc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 19:48, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 

> Caused by commit
> 
>    e00c5a9fa617 ("kunit: Annotate _MSG assertion variants with gnu printf specifiers")
> 
> Please fix all the current problems before applying a patch to warn
> about them.
> 
> I have used the kunit-next tree from next-20240227 for today.

This is my bad. I should have dropped this patch when I couldn't
apply the patch that fixed the drivers/gpu/drm/tests/drm_buddy_test.c

It is fixed now. I dropped the problem commit

e00c5a9fa617 ("kunit: Annotate _MSG assertion variants with gnu printf specifiers")

thanks,
-- Shuah

