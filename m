Return-Path: <linux-next+bounces-5162-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4DA0AC10
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 23:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4341E165E76
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 22:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B2D18CBFE;
	Sun, 12 Jan 2025 22:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="SNKMeUhm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5E839F4
	for <linux-next@vger.kernel.org>; Sun, 12 Jan 2025 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736719226; cv=none; b=m32gtscLu/Che78wIuSYt5GV9bvkf75u/FFiqcyLsJZ6gaTmi1tocqyBhflx0O2UfM5gmXM5jsEbknLe7BouuLiyXhpJKck+0YqfaGq6jS5OXSR79KsP6thqO8J1QyguxzX9p07V6nP3E2BSTWKZcbvA+8gIfB2O9Ec4zdF/Wp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736719226; c=relaxed/simple;
	bh=j9ChWlFz37Ht0CvmQ6luBJp+SBesfB/3xhnHYkzKcGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aA2/J0JX5TM+zVEyhJ22G5Lq9S7W9no3WZa8Jy3KCvx9VS8NGR8iZ8ethPjlsA/FLjTE47mA0Yv6MyJiqL7JSfAIiBSPSmCAAGqrQPr9pI6FHpPsQoCsMrATY74wIOj+KpCX/EH4ejfvL8lkFFnKAL4BvaKjFWJX3taDYrdAQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=SNKMeUhm; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844e161a957so310622239f.0
        for <linux-next@vger.kernel.org>; Sun, 12 Jan 2025 14:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1736719223; x=1737324023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqDqN8RiHpsdqolUOa+DHwAJPWi38JcC0MdE7FuMO4Y=;
        b=SNKMeUhmB8tggG1teAVY99ScwxXN6+OcnWA2fdgQN6LWEnxVRgQjTyv2c40j9wHT3u
         HOSIVxnjiNFsj+CMm3+OQs1qRbHEgFc/rcBWaDMesUoD6eOZjlQA8Y90fIhs2ntpI3u1
         cIW5l5kDFfpnGScrILonSZ0EXwHBIgkx2DhsaKu30BV5/t1MmZHu1FdBySkhzOYTo/kP
         ZPD7ZoGl0oN9d1CFxcrmhIyjaf0yC9RIIdE/a9FQ80qsGkH3bykTwSNiJVFriJnvbUsA
         vn/LXdhAmuvfI1AwNlv9p/aD6jBQeMNsFfqC793QFJn1ihBQPWZhs9PUbZa+4SJiPEEK
         VFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736719223; x=1737324023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqDqN8RiHpsdqolUOa+DHwAJPWi38JcC0MdE7FuMO4Y=;
        b=r1y3FS3tqsBkwdeiLaHCte5IGuOaf368L6CIo4Q1H5PjE2ECXCxly7EbKBn3YeG20J
         ibRZ9MgQFFT8Sw6O9vXxKT9QGiktA9Kvd3xNYskOy52+a0i+BP7Ffu0GaTvbYAsipoYd
         iKLLlLdKuIoJSZKHElYHsy2UmnipXAWs++t9+9BEds7SMW4U9nVbyj3gfkSYpmwsQHQx
         +/fDmbPGo7C6iZ7mQ1BBh8MZgdH564HDYm3lsDcOZe0DYRqZOhU4ycdUaZ0yX4S9MP2M
         V+UkIhMphw4DhBBlBMq9M8wTp6tA0CxAc/9EYYVFJXmd7pkfM+pjeiwz06eXL0X+JEe1
         RG/A==
X-Forwarded-Encrypted: i=1; AJvYcCXqfBsfCRmW3cKrQ/2y3NWnsXoD0irRduv/345wTu9Y6mNsmvKl+XmNhFzBnnCqGROezpBrWR/pS/Lx@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUTcXBfwg2Rrdj7ZA/orR72hWjOvO3yP+KegeO/jn3xb7yd0x
	iBaTpO9ljaqdds0r7kLzV7VAObYdYEvhayu05XHQFuwfAs8EN8Jr7lKjj6NMuTYB3BNVUxyRuIT
	n
X-Gm-Gg: ASbGncvcmc6vzCPPMYLr4M+0Vc6pf8nt8o2rEtartrM35YW1DJp9ZX0+XXd7F1HYYdP
	HxcGmnWiyoV316ATSnNHZrwf8svsYmnVpoUFw1Fbr3AOLrz1KsiTHwU44z8lqcEVHaDySLoBd6M
	C+hwABwgPmL5jVf2wmJZlvT5aC5oB/qEVVaAcbpkcQPvUvAg5oJk9QWzFEsncMB1OdvbiK5HApb
	otxTNfVc1MKDQcjHVRL6PR8Xds+VrvNwO5hd8KDob8CFcrs80lcZQ==
X-Google-Smtp-Source: AGHT+IF/HJK41HHlDKE84bdH8yEq8afCJ9yo6g+CSq0kUMKO/MJ/8yonLWLXNV5AmZMwn4uTa/+kaQ==
X-Received: by 2002:a05:6602:b8e:b0:84a:7906:21e3 with SMTP id ca18e2360f4ac-84ce00c2d93mr1676263039f.7.1736719223129;
        Sun, 12 Jan 2025 14:00:23 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b5f82desm2345889173.19.2025.01.12.14.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 14:00:22 -0800 (PST)
Message-ID: <31a7362a-bda1-4893-9680-2a10fc3cfb34@kernel.dk>
Date: Sun, 12 Jan 2025 15:00:21 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Keith Busch <kbusch@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250113075119.6d1d8177@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250113075119.6d1d8177@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/12/25 1:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   ae50aa677503 ("nvme-pci: fix comment typo")
> 
> is missing a Signed-off-by from its committer.

Due to this and the bisection issue, I've dropped the nvme pull request
for now. So this issue should be gone, new version getting added once
it's ready.

-- 
Jens Axboe

