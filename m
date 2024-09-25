Return-Path: <linux-next+bounces-3969-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88D98689D
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 23:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C595C2822EB
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 21:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FD514B962;
	Wed, 25 Sep 2024 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT6z+l38"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F81534FB;
	Wed, 25 Sep 2024 21:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300903; cv=none; b=KOgaRJoD5oNUFa6PusWTNTi4yqOAif55nRj/13nGbn/hv0CCjhermF+u9I7g1iFgUC8OR8W09BZsNjhU475vpdCmx0Wja1dSXaC9+wFaGldvLu6div285ou2J73+uZ+16mCwTQOiKl1heYjBGc3aGCFZ/7QWGtDj8y4EZ9TfKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300903; c=relaxed/simple;
	bh=gIuq3j/vk4QENlsKN1z1Jl50uyrzP5n+cqaLRzVaI4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2sWOTX5/2VBL/4Wk2W/p3gpqdVRdjMFWa3yXXnL54eTcF465tXgg8rCqRwG/SJp7pBdGD1blPoDi93W3y5H0WijTYz44FiJ0n8wQwntlOmY7NVYfTaNG181FA6RGFfOKTk6VOS673vw9ylZCGtyWUkYOKOMkOMSJSxOCfW/0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT6z+l38; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e28ac7b12bso242468b6e.3;
        Wed, 25 Sep 2024 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300900; x=1727905700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgDgTNt1xHEn/31thmR6WrDz9ziq+k5ge1OgcgLtktw=;
        b=KT6z+l38PLwsdZxUl3PiELi1w1DeQZ9dQ3c8bc6SgjCw4godJKTGh+SW8Ck3Gr2kvg
         7fEx2hzy7McZxSNUXoKDWrL4pHCCh9uXuwpTjj7FHUq5odruOR3/W3xeZScuhAGp1wVA
         OyAZx6SGi9bvkzVcdVAN9LAXg4/fzJDaLivMLUoOiZEPEeY/eF5SGDBqFAVejywOUAlf
         9RBUwAnNrR4/aZ9FN26TIiNYBrIOfkR+gnAwyY7S6HqgIW00epGSjMPV7gkcvRAYZXpM
         /JxaERqGccx711cAhk9mzAg1TXK9T9Has+GKHOKcEq0gz82f4yZTFHGirrn4PI6o4383
         qiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300900; x=1727905700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgDgTNt1xHEn/31thmR6WrDz9ziq+k5ge1OgcgLtktw=;
        b=lZEMCOyKE+UsncqKVY3+WMAoFQQMvM2cCMKhlCovMeOVBvegID+W+2Vc2LRF0vQA+M
         f/LBfRBkUKrcCeIZurvVn1fnyDSilXPiYk9maxxTlrjXcqSKWfG7bGabTHtaMnYiNrLT
         b6Y9CJ3q5CfCLAapdeQWiEuFR4SnrKp4yC3ggT2+y+qqTn8TtO5P2Q/Pnl+AkeOcG/Gd
         Rncx74xD8Dp73Zmwvf14846Oj+kZbVYI+tHvpiQe31LY0aqTtbQsEVdP/caX3wUxsYc2
         gVGOuWUV2OkrCI0bp6wMlav4hPhfKEWj+Do0x/PDPOYIORyx0Jb6IBSC6XWxyLPIjMbA
         +9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCW2p3xXn3IMqZu2GyNv9VQZRkXDTYrPuv04XBRTkhhN4R1IC8izHzbXE0BWx2peeJIZv8HOSJTUmoK7@vger.kernel.org
X-Gm-Message-State: AOJu0YztDa3eyZQteLNS5n9qk9QRGJKxh+WMe8zJWMl7YLLGa6U8MYK0
	xFQlWH6KmxN/ARmZrppFo/zTziEodyyuN4WllPK6vAgX9C65nRi1tpYSlw==
X-Google-Smtp-Source: AGHT+IG5pmmTp0Mjtgv6/9Ce+4Bz9PndkQcw1XsYxiBQn6xUjDL515OOnzFCxh9/FlWcVr+OJb5+wA==
X-Received: by 2002:a05:6808:1153:b0:3e0:37ca:1b29 with SMTP id 5614622812f47-3e29b7e50a4mr3436821b6e.46.1727300900527;
        Wed, 25 Sep 2024 14:48:20 -0700 (PDT)
Received: from [192.168.1.224] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e5bcfa1e41sm1179986eaf.6.2024.09.25.14.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 14:48:20 -0700 (PDT)
Message-ID: <9cc0310c-1fbd-4bfc-aad7-f092583bd81b@gmail.com>
Date: Wed, 25 Sep 2024 16:48:06 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
To: Bert Karwatzki <spasswolf@web.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20240925213717.3555-1-spasswolf@web.de>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <20240925213717.3555-1-spasswolf@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/25/2024 4:37 PM, Bert Karwatzki wrote:
> I managed to get the complete lockdep output via netconsole:
> 
> T1;systemd-shutdown[1]: All filesystems unmounted.
> T1;systemd-shutdown[1]: Deactivating swaps.
> T1;systemd-shutdown[1]: All swaps deactivated.
> T1;systemd-shutdown[1]: Detaching loop devices.
> T1;systemd-shutdown[1]: All loop devices detached.
> T1;systemd-shutdown[1]: Stopping MD devices.
> T1;systemd-shutdown[1]: All MD devices stopped.
> T1;systemd-shutdown[1]: Detaching DM devices.
> T1;systemd-shutdown[1]: All DM devices detached.
> T1;systemd-shutdown[1]: All filesystems, swaps, loop devices, MD devices and DM devices detached.
> T1;systemd-shutdown[1]: Syncing filesystems and block devices.
> T1;systemd-shutdown[1]: Rebooting.
> T3113;psmouse serio1: Failed to disable mouse on isa0060/serio1#012 SUBSYSTEM=serio#012 DEVICE=+serio:serio1
> 
> Here I was curious if the failed the psmouse message is related to the deadlock.
> I checked the locks and I had similar messages on an unaffected kernel
> (commit 6ec41c442e55) and I had a deadlock in linux-next-20240920 without this
> message.
> 

Thanks for the info.

This definitely appears to be the issue with asynchronous shutdown, which
shouldn't happen anymore now that Greg has reverted the patches.

I'm looking at this now. The async shutdown makes each device wait on children
and consumers to shutdown before shutting down, but it depends on the
devices_kset list having those in the correct order.  The "fix async shutdown
hang" patch fixed a case where suppliers could end up later in this list than
their consumers, causing a circular dependence (and a hang that looks like what
you are seeing).

After that, Andrey Skvortsov reported seeing a hang, where it appears that a
parent device is later in the devices_kset list than a child device, which I
didn't realize could happen... I know how to fix that, but I'm looking at the
code more carefully now to try to understand exactly how that could happen
before I resubmit a new async shutdown patch.


