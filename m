Return-Path: <linux-next+bounces-5509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B3A3CBD4
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 22:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DE967A7D74
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 21:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BCD2580C4;
	Wed, 19 Feb 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UiyrZ8jd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1023ED5A
	for <linux-next@vger.kernel.org>; Wed, 19 Feb 2025 21:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001964; cv=none; b=pNqNovWIOjiY9mJ8hD2xvn125uL1MVRmhCxvYnVBy+3ZZMVph8LsTXH5GvQepTgID7XJY5QgCY7HHaTswKpKGPbmRAJT20rEsvLlPyNd0bh/pF97KPw6bjdhJ3DLFU/KUdOIu0urC/XPuDhTOu4tLY7Roj2pnDVjV0PLmnz6OXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001964; c=relaxed/simple;
	bh=fh9ZVJ2I9C5CQ5kpkV5A2PRiDffiKTGkZaaK1WWz7/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjmHL7FffP0swtOvcWthkjtqzzTAzxdJmRldaI0IB03VLPM0T2LhWUUFWUKiFHIRlltDQjtekFgKaxDgU58b+5WHZSEOGfDU0I7b3B89di5qkBD1qubkTFdneRQWTkYMJcbLcaaTzSO1hX/lbQ7cwG0bAG5hIQWDFvtV6Q+58XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=UiyrZ8jd; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d2b3c0b3fbso1855785ab.3
        for <linux-next@vger.kernel.org>; Wed, 19 Feb 2025 13:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1740001961; x=1740606761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fcihMsF5MEa3PMJJpw5KAMRg9ye+pHOyIpzaUV9zkY=;
        b=UiyrZ8jdTZX4V0zETE+4MLrb3JPUoj1xRrhke3vBGNGDzU3CMizWcw8kaVn3S4g31x
         hGIqk0em7smlwds/n0DQ2OCCB6ouYV+57jFJDYiFz+dWR/eLPbUwnXhYkeKjXZkM3KCA
         viK1Cy102SBVLexYhwPeCBJwls9VNgWtupRiMMJH5LMrjHR9pmdGO9Ei7Lg0x5vzPCWO
         VXuZy/HVPHhb9+1unqRnCxhnQzJHa0EY85OXrTvMCRrEVC5de2wXl8cyzyq0oNTnOuni
         Y7P6tDETyiX+WDSotuOl4BmAdt5Fc7Gicn4RXG88i6tGmEbNgfVSabcGYXbrHSaXqNJD
         urvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740001961; x=1740606761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fcihMsF5MEa3PMJJpw5KAMRg9ye+pHOyIpzaUV9zkY=;
        b=V7e7d1Zq4HDr8HXhUvlNdRj5w4bDah5sGpk1SC//n5oPoaoukvy8chSOArBolCumDw
         A4fBttO9S3xBOL2oAOHU3mNFz/K1SiV6fIkLI95HhuYIMZpJgiZrZfh6Jw5yCbna8dWv
         +CR5bjor5jmV4JMYpNKDjw/iaVp5/ErV579XqvSOFIuyuPKUuidMAfVdZFVxKge1gypP
         640u48npV8dJMGndRvkPbWVXg7v3z5TmH2rVHP5rKLqebda5hFuHsJUBywRy92Ar4NQG
         cC5jxya1nwa9kfaVqxHR9wuXNAN3IxFCNY75b1BZNnTOyUU7G9WMoknqrvNnynLHb1ho
         ZYtw==
X-Forwarded-Encrypted: i=1; AJvYcCXeFa+sKnB4PHXTY6vQu0fioqM5E4QtjWZp51dTq5k5M/N0jVfiyP3cWI+8JXS5Jo5IS+DBkeg3EpC7@vger.kernel.org
X-Gm-Message-State: AOJu0YzMDeBN3qc6u/eChW8FjejXDjwN5QjMTtimH7WXTVNiSktWSIq+
	fHHx8S+c5MVwuQvvotOiYuCLXfe5PlppcfDo7FLZygyRGxHxCVP4sAhx7LA0K+Wb5DCf7XTsQn/
	0
X-Gm-Gg: ASbGncuZsYjXdpi4wm7OWokqGuX8fEqNTqM3EXGgC0+jFil8R7H0xg+ZAZnW/vVcYno
	KFpxHoPZmzvwCWHF3and8/K5WPI0kuZKHM66LcaR6UBaYX+bDKzS/BTCrAGmEzw41gjQSXekEEd
	yzs63o9gN9Unioyae5iwJrI9QHddSpcgY7HXvmFH87RKaBSmqhHKrr1EMa9rXgKSoEJo6S9BDYS
	a86QApY+L+7I1mRJMupW2o/USnh71tPrQ37NxYnO3i+WmaxQ8VrLYHUDT8TKX0vWpLxXBg+p8DD
	tkCVbFk/tQY=
X-Google-Smtp-Source: AGHT+IFLt3AeBJ7f+PdPJ1liHm+gk3zN+nhOjD4Dv+4rd5YKqbbfrdRTWVg6WMFJdTceMOCut+5tDA==
X-Received: by 2002:a05:6e02:1a4d:b0:3d0:164e:958 with SMTP id e9e14a558f8ab-3d2808feacemr188569535ab.17.1740001960871;
        Wed, 19 Feb 2025 13:52:40 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ee7d9653aesm2608219173.16.2025.02.19.13.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:52:40 -0800 (PST)
Message-ID: <9bf2510f-9a04-4199-b626-a27c4e4425a2@kernel.dk>
Date: Wed, 19 Feb 2025 14:52:39 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250220085120.149904bb@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250220085120.149904bb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/25 2:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f6977b06c598 ("io_uring/zcrx: fix leaks on failed registration")
> 
> Fixes tag
> 
>   Fixes: 9fd13751abf5f ("io_uring/zcrx: grab a net device")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 035af94b39fd ("io_uring/zcrx: grab a net device")

Oops, I'll fix it up.


-- 
Jens Axboe


