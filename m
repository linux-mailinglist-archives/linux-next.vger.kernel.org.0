Return-Path: <linux-next+bounces-9340-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA6CA5A40
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75F3930645BF
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED913358C9;
	Thu,  4 Dec 2025 22:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="LHarwpVS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E12652AF
	for <linux-next@vger.kernel.org>; Thu,  4 Dec 2025 22:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764888293; cv=none; b=HyGgzCReLVH03jVFnhLw0FNRD5c27TgQ5sTaR/S7esLbEkgbJB0AosM6Ycl2dlPgK0C4GEFo8Ddl07RM3PAEnRiyoOYQtHVWWZvyCYrT4VC8lSxOhkgPVSzfFruEh/1Cfae1YMAxAL66QVn8M1RcwXE4kJOgwl5rlpQXJ7t6uA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764888293; c=relaxed/simple;
	bh=Z2CwydMQxahvHci1WFpCRdgZXd9zjPPjtROIIpL+vPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtVFcuJfWPplRLcpKvNL4cQq4eBiGtECv2LWWlPyRcqbXn7bGQ2uCZLgX/48h2D5rAzMD19UJa2ZTLN1hcb64oqlMk5CwNva6/kJpvShSoarVGuyAL+ULln5af83atnSxm/BKLv97OCWUiZ6dozxFL+HcYtSLAF0USZDgwO7CCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=LHarwpVS; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-450c6f5ff81so852028b6e.0
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 14:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764888291; x=1765493091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vmkx/Nq3NBvDRF1hn8gltNreOpSRjS4JcboW2dGenzk=;
        b=LHarwpVS6lM0UDU474cLF6AsLUEDHjXAgUmV8Jk9GlWEm3n17sPn4Y33GTTai7bXx7
         RtHWTpYybMVzqKNtEz7DEmGLAZqoH7GSguFLAZ19RbhzzL8q1u7wopReF/DD3lvWm54E
         PVqzckp2H3X5xB1lN2GzlH0HCtgFLjpboFx64zNfVveHpdzYwYw3mRBkZU16+Bd+0WtR
         2GYFIUwe7bPiMEminSJYW0w1hK2OgKCCWlltfYkfvgX6AXgir1COQnBvBqshtONpg3OV
         kkVyx2ldvuwHKOnuFAivMKv8vE/BvoOOppFi6URMwM1covkRgqlkJCuzFvTcL+dU49Zy
         ndVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764888291; x=1765493091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vmkx/Nq3NBvDRF1hn8gltNreOpSRjS4JcboW2dGenzk=;
        b=c0JOzVLrwrM8L7iD1YArMOzxsb/gvNuqUR+PLa38jmwgBXb+5o7Gt9xxRk97m9UEbs
         gevFUvAVETFZwMvBKtR7hV/g55KCbUJmM0pYnjlzuSmZ0nz+n5s6heg87FqQhZNkv4YN
         YX4RZDpzklAA+4UUP7HZgZPrB6P9RJvLHXFbmXkw2rCk6TtP2i5+M6iRQCTW8qRKoSiu
         VCNMy8/JPmqWVHFjv0WmIc+NkoTovmpwdD+CEmdyTeXFWla8jFOYpHuXJacN0p/D10DN
         SatyubANARBiyCIkj6s84k+tstKtv+21y+y7w+qAvLe4e0tc8hJczhMM0emsyKMG7Gb2
         PF7A==
X-Forwarded-Encrypted: i=1; AJvYcCVWKDITmL6OVF6/ocUWFZ7tOs7uv8W3aMPxL38m6ndMX/51Kp6ya9FavvrV83eWaR0age0N+/UtHEex@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0WixDu4CSLJRC3UNbImHd3OGTrhSboVOmMcvNlrvYAFlvsLs
	em4oUFFWHoAh+6gF6w6iCtGcXwNHSdnMTwa0k8n/ncIiTsQhUB0IVlr0Hqy1lLR4GvMaUym6ly7
	m4Q7IhMQ=
X-Gm-Gg: ASbGnctswLPTSKr3QFRvaGT07u64KIfQcqBb+sfkTDYt/ipCq0MtqwBD+X0ea1lmUpq
	xpjqxJ3q+AyAO9+QPXmxEb8wPTEyo/C4ikGdKrC9KVu9jl90yXJCytpbNn6QTdPkviv5qr7foOL
	HsVAS0/fVhkcscQq3gp917R6GvRNG7b3TuD0xgGRMtZz/wwhRATth0/ZsU6/jy87zBV05WcfC1v
	GBVVr0CwanvmQ/R9QJJm4oSV4hNKGJYD0GvPp7JrhcwXBWEyQUhgeKa2hcJNx9uIGg9dpjvMumq
	Gohk0qd0fvtAcpejaWWJMKIGeQn5LtjD/3V0fhBF2RK3og+qNNjeHh2M3sIF+Kg6dlT6MvdHm5W
	gvk3Hm75J+qfvB7LDO7lZkjhsOvb0ibP3HiLpu+I4fXFmPKadTfk7xJgqZu01apDQr/HEgmkoYj
	Q9Po5FYDKn
X-Google-Smtp-Source: AGHT+IEEFzK1MAGTl4brvee9XDCFzuOR+BFWLfT2iVU05EsMmsDUW5zdUm/2dLSq3NOeNA78D7G+wQ==
X-Received: by 2002:a05:6808:528e:b0:44d:aa31:d929 with SMTP id 5614622812f47-45378e937b6mr2997245b6e.20.1764888290735;
        Thu, 04 Dec 2025 14:44:50 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-453800cc734sm1368222b6e.11.2025.12.04.14.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 14:44:50 -0800 (PST)
Message-ID: <a699a3aa-50b8-4258-ba71-d28c6abc9f7c@kernel.dk>
Date: Thu, 4 Dec 2025 15:44:49 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Keith Busch <kbusch@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251205092150.0e64adb3@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251205092150.0e64adb3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/4/25 3:21 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   d3132d5a1720 ("nvmet-fc: use pr_* print macros instead of dev_*")
>   facf78e89270 ("nvmet-fcloop: remove unused lsdir member.")
>   d4a3dc77e6d6 ("nvmet-fcloop: check all request and response have been processed")
>   92ee1738dd50 ("nvme-fc: check all request and response have been processed")
> 
> are missing a Signed-off-by from their committer.

Oops yes - keith is redoing it, I'll re-pull when that's done.

-- 
Jens Axboe


