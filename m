Return-Path: <linux-next+bounces-1882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C698A1FCD
	for <lists+linux-next@lfdr.de>; Thu, 11 Apr 2024 21:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166C128B19D
	for <lists+linux-next@lfdr.de>; Thu, 11 Apr 2024 19:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3DC1798E;
	Thu, 11 Apr 2024 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="MrcYFg97"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E3205E17
	for <linux-next@vger.kernel.org>; Thu, 11 Apr 2024 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712865446; cv=none; b=JNpjuhH0z4he6ErXTbzBMdt2tOg3WdgrNtq/ymb22Q/WhTyBMaSN/87grsK4sqrIPUY3guVKLRKDj0g8xEb+HooO/CNjYFhrYFc3CieR1YLuRWYpTz4Bem2oyVU4bDM+p0ltnRCXybRLGos4maDAjZTgStrbb2aTZnLnqlr6Zug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712865446; c=relaxed/simple;
	bh=qX84F/lXaQ1PVH00KjcK2IThFqDOeXh8hk0g/UzpyPw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=J+1k1Aa2cLYabe9N+5Cr/oP9kDbg7Ar6iPNt8QF90PeLORwDTUFb2ZcvVV/jGYfmySvZSwI2hgrZPXT/3EdYrNRNEK0PtcE7sOG613fU3gkWOQ2vixzPvsskVPBuvYNAbITPO9B9gTC2umd24qSyDVJP4XD+nthLWzmHv2zIQBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=MrcYFg97; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ed2dc03df6so225957b3a.1
        for <linux-next@vger.kernel.org>; Thu, 11 Apr 2024 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712865444; x=1713470244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASuWKF1IyVny77juPKeYhHIQgdscvqAEKvf/s9kut2I=;
        b=MrcYFg97/G9J5mWBaBeiWE4JECOHIYPO5NS+0/90qBKGd5tvfYoQx4fDFMeHk1ZeK3
         sjNq9XTz094XnYQSvvDj5mDyEpzcclvBxDbh3q9aSjk1QnXr2zdo60Stss5l0Dzg61Eg
         Iv1LXIq+dJHXEwZ+gQW5+kLzeU7PmwQ9HY1crQAFOYmdQKGcQpLG5bX4cKx60jV0bRkN
         Khni4FE0BSRNp6R+0USuNWzu9sGxYPsFZfMVfD2yWXh6uvi9PiM7yWQG19qKOhBDehAX
         GwB+CQ1vcF5/tJjG7pr8ONWJ5NnTfw/iKZW6GXAS9xPei5y5Ii8zlYe0P8nbSbYr8OnO
         VjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712865444; x=1713470244;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASuWKF1IyVny77juPKeYhHIQgdscvqAEKvf/s9kut2I=;
        b=Kz7knj4Ny9GpaRiGZcoE9KBXKsKjJZQzCTi3SZoK+Z0alp2hFfPPo5cNKg7BGK2LY7
         N/XjlM40ytHXkwE8hf0vkIDnarsZ0DLGDgqWKowTVT/gzC9TVC9lyyF2NzR+HUdbIu8q
         ZFPOYCi2aPH4dDSXVsuAkF0M5BmLDEvpYqli3XMhPwiauMAt3r7Rj/+sI/bxZDjdCSIA
         la+LZzB8t5xtegDFXBrBqtYXy5s6cJvPVSaKY+ouxQ2fAXHzhwpSDiZEvoqmgkfHvOYU
         sMig2dgOPdaTT7kKcmWTi6LilOcWAKT2EZGyLYd++4HQvUCm8r4ZJeOVJfBBYx7AQkBB
         q5bw==
X-Forwarded-Encrypted: i=1; AJvYcCV2DP9IIQWRIbdR23+h409iKQDhbHEei1mCoHW9RB4Ok9CAX4CwfA1PKNW1iKvSzJQ/xBXLBHLUXpqzYaIFoC4r/79oyjK5Cvl1mQ==
X-Gm-Message-State: AOJu0Yx/49QziCwfpPwHmNUZ3rXVmPEFz7mGUPIALBeaSDMrZHhLnfQn
	aIsLKalUruONnluhxFy0EYJrRqEfHPRdEFpxf/rBTxuS9ryS312y6c2u7+9/oo0=
X-Google-Smtp-Source: AGHT+IGoeWkdZaGSZlUIvJ4+wlGVepb/0/HzuNHkaPvH2S+cbxddwGFXFYFQo0xSCJHBhfC++htiGA==
X-Received: by 2002:a05:6a00:1a94:b0:6ec:db05:36d2 with SMTP id e20-20020a056a001a9400b006ecdb0536d2mr801820pfv.4.1712865444236;
        Thu, 11 Apr 2024 12:57:24 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id y25-20020aa78559000000b006e6c0f8ce1bsm1555237pfn.47.2024.04.11.12.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 12:57:21 -0700 (PDT)
Date: Thu, 11 Apr 2024 12:57:21 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Apr 2024 12:57:18 PDT (-0700)
Subject:     Re: linux-next: duplicate patch in the risc-v tree
In-Reply-To: <20240411080622.0cd5502c@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-e6968c18-74dc-4091-8f0c-6be1437f8167@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 10 Apr 2024 15:06:22 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>
>   36d37f11f555 ("export.h: remove include/asm-generic/export.h")
>
> This is commit
>
>   0316e4b04e01 ("export.h: remove include/asm-generic/export.h")
>
> in Linus' tree.

Sorry about that, I guess I just picked it up as part of the series.  
I'm just going to throw away the version in my tree, it's a cleanup so 
it shouldn't matter too much.

>
> -- 
> Cheers,
> Stephen Rothwell

