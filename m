Return-Path: <linux-next+bounces-5708-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C01A5A721
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 23:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990D31884536
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D131F4C9F;
	Mon, 10 Mar 2025 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="vzL5OshD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2271E834D
	for <linux-next@vger.kernel.org>; Mon, 10 Mar 2025 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645524; cv=none; b=l97Gogu5TP2nalIr2AfqjACClJYmCPWpE3uqiaG243/tdpATBZjlWHjMHuShwlxWC862f+zGe09xi6qUizc+SEoy5TpyCvbVgn8kwjQ9U4ROSuXO7qj3eK0+hPLKYPlNHkrtwAOTyM6xmaPnO6us1DbrQkunSw+/YH8lcRKKC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645524; c=relaxed/simple;
	bh=4Gif14H/WjRTUhe9bIvPv3YGVJEzbO92IfYGUIfH5e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfBRvq64NbCyLr8u+lCOZaCYiL2u6f1dfppO+hsbvlFFKPTleOaFwtWskSGYn/6xHY0ecilQavd+r7aIL+TshQkzM2+fg1X/3z0Rr4sU1J43/MJ573lNQMGVOoKgch7Iq1ij0juo7f5m2A9jDRcL8tb/xdFh43nhd6+AHCiFJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=vzL5OshD; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b4b18e51cso119070939f.3
        for <linux-next@vger.kernel.org>; Mon, 10 Mar 2025 15:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741645521; x=1742250321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvP0SI37bvQbZpvOfs44QZ7UYY18+BQNpijliAFF6+A=;
        b=vzL5OshD0738l4LnPCXhYm4NuFce5rmBhJ8pvOMSyFSD4U7aKXhygPFXAB0kGKUorP
         FHffrRnuadeQecSWLo5CNyKQD1jfiK/0ywoPEUBMUhmOdQ21yDZguw9ROf3uiEb64w/K
         4FNauvy2qTzGZeNr7Za9vPorvmoG3YxJzCN+II8s3xXLh4RqphoMYF7svTZKx2bsfSdn
         lq7zY+ZKQb1L+pRh2j3GR2b6RofQWC6Xjgi5w6Vltvi4nDqMFlO2ACtt4MO+XNmOSwY+
         1OLu20ZpCT8LkBJlMAE4JGIurX/WyYlH6Nithy95M9JkZ2hsCcZmch5G0vfi3xIpzH1m
         CmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741645521; x=1742250321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvP0SI37bvQbZpvOfs44QZ7UYY18+BQNpijliAFF6+A=;
        b=F/M/M+C+T45kBbAC3iR/qx8+PN+wFhbGHg1u6dfOf2lxBMAlBpgFXPU0i/mT0vP9gc
         8BEDnsVotg5VYgUnHujMqaCx0qZdHMlIjAlheG4a9IaPX/58XTWDUI+iFfDZh2shAFTk
         phy0FkByxB3q+8U2/aUmTtxi2zFkb45jeex1ae/ywiLzZwbgkX1iloYiDAGcYNAaTtgl
         1THYspU4BKWCRQGQ0oS7cvtF33geRaCwqJqmOF8FRDQjJFrha7++8KN8afGO4xUuyG1v
         cC3S7DgoJoJ5JhkL0mNtnDwR/JciDfbMbtGJL1xY1FndscRjLmbflEdxDbqf7sdXDQq9
         4fTw==
X-Forwarded-Encrypted: i=1; AJvYcCVBTcTgfWdIGlvzUBvcvfs7Voc2f8Ua9Q4k2EFT0ovp2UIyl58NQkJGc16Y5hmu32Rw+b3bomtyg1Oq@vger.kernel.org
X-Gm-Message-State: AOJu0YzSze8DT0kAOdw2Tk3KY8zz53NtKsaDUkctj3xB+q/v7RJ5DOnL
	0c2q6Jw7DxOusTxb0VVnnGG3BPaqwcc3ZqmG0IsExMSH0/n70bLB/O4YMjg4JLwwU2WrTpdlzhB
	l
X-Gm-Gg: ASbGncsyKy/YfLNNsn9IDpeKWP2qpHZlMCaN2xTlpw09v+EkPUF0OKbIE5y8MuWQ+tt
	AoELI8DjmX6wppho+1kB0mZ9tE3dlUg8F2s9VNup5TjpOYedcc+NxNYOJtc9T+MaANfaSwKnp9z
	wZwf7892t+bwtexRMCg3kMk/UjCQ6mN4Uc70i8137wsOmartfbdtLGqv6fECcOCcoa39Mr2CeRk
	tArsRf7esvG3NbYqw3yKUlDS0NnPqTas+X81g4s/VA8yFlkTDMKoCmX8wQeL71lHa7HsMIOsPYo
	gavUogUZfvdjxWqavNj0o5Y0Bw0Bq5ioi8CBRi8bfFsRxXn2PZvK
X-Google-Smtp-Source: AGHT+IEC1FD4xPR8qaXBgzUTsr12sjtLQhuUzilQhtXARZV+vEM8pbEhSrVmYKg2tFns2Z7qZDO+Xg==
X-Received: by 2002:a05:6602:4184:b0:85c:96a6:f3a with SMTP id ca18e2360f4ac-85d8e20578fmr152307839f.8.1741645521287;
        Mon, 10 Mar 2025 15:25:21 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85d9db4cec4sm2236539f.16.2025.03.10.15.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 15:25:20 -0700 (PDT)
Message-ID: <6ea84ce7-d318-4ff1-a03a-e6252a5c8130@kernel.dk>
Date: Mon, 10 Mar 2025 16:25:20 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ming Lei <ming.lei@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250311080946.64b06fcc@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250311080946.64b06fcc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/25 3:09 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   cf2132935639 ("selftests: ublk: fix parsing '-a' argument")
> 
> Fixes tag
> 
>   Fixes: ed5820a7e918 ("selftests: ublk: add ublk zero copy test")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: bedc9cbc5f97 ("selftests: ublk: add ublk zero copy test")

Didn't catch that - fixed it up in-tree now, thanks.

-- 
Jens Axboe


