Return-Path: <linux-next+bounces-2632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0C912D37
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 20:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72EC51C2281D
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 18:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7206617A92E;
	Fri, 21 Jun 2024 18:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="s9Ovq1xN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489E1662F3
	for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718994749; cv=none; b=lsunl+ioy74GAy6hG/3Df47z0S9LTpxXX2T7WMeYkRUMLqTqiTbZhMhh2EPT8OZ8DiUf44waECFHONBNJWAKQ46LV3VldS+Ej8NpnmuoDwWPcTHeDdtZGGKvHlIHn8rAwkuZK1TNE1abdns3WFZVD/Jr/ah156/YzlfP1JO7e9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718994749; c=relaxed/simple;
	bh=tGHhtRac8Lj0UhkMJFUBpO475OEk+R+2PdOc8uX0UE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VDuGTkS204BUVsoIcOZ0eXRBZrjJlbJ91tpw3AWL3nbS2lJZBYktZXcxjqcb8wvk4MihM/r9oqBy6OvruTJe7RyTemsvoTBOzanD//ior25FHT1EJhjJHfLM1ea31ueHLun3ObIie8tVTiZya361jfP7t6SYGmG3Dm+97mvL0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=s9Ovq1xN; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25cd2b51fd3so195250fac.3
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 11:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718994746; x=1719599546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T3jCmWwe1qtOEm4AV/Hq8j7QmmbF1sq5HEvcR2ludU=;
        b=s9Ovq1xNiB1EYGA3BcJJ/pKdEa9ACJPAlIijL+bscUoYxESLWviGH0bSZ/W52Dxr/4
         fkB0uY3r2GfFUG8goiOtbCAB8cRM7wTJ43IKzTriSYNnpi+JaoPJKz0xY4vGijPc0Bcp
         NQx8dKsQTegT2AYCtI87EFP4oVOSlC98lw+GLsIgtFdYF/o6RIYeXc6kbjgh1P1h+WcV
         ZRClmjkybxyBMoksmHdpQVN468k6rPv7m0DzkvJ61mBYb5xLlIVUTPAA5X4m/qp8oor5
         kU0nJKAHt5zaFyclOl2UNx762m/aq9gNjXyzvrk7DQj1PiliG3kcHGmrPJszYzFjcuaY
         ZplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718994746; x=1719599546;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3jCmWwe1qtOEm4AV/Hq8j7QmmbF1sq5HEvcR2ludU=;
        b=HggWiI7+zWDn367m8gpWYwnvm7pvikgZ6Ma+khmzb3Pv0g2neK/73SpjMhYfatJ+Li
         5b1m8sfX6l9dlJJkIGVqTkR2Wxw8R5TwSZPCAcxl4Va6WFGPN6Md9nhL8zBy+uNB6d/Q
         wiDddCto0Sf14rxEuSL4PGxjBE3NiB1EscQl8MjlXedp73yodh0o2NAMWOH/fpPtDWD1
         AzDPmGP1sZvZw+V45ub6LlrsWsY5ed3MZjK5JoYJdfqhIHE0cy21F1znt2kEQOtEN5LQ
         fWa88Yc87dNttQ0rwWCRukYX300FlkYCK9FfjooTFyitkWfC7KwFKHzZhqEP0BL+B1f6
         kv5w==
X-Forwarded-Encrypted: i=1; AJvYcCVEDpx5IwlD9gT7rR9Iovf4NOz7fDLhagWcLrEvKfNV1Bc82WNMlUpxqFziwfBhqpl0vfR9OTrqG2GodxvCcEVHevSHGJHFguw2RA==
X-Gm-Message-State: AOJu0YwsvDH83jVGGsvCTXfimMWDHFA0Qt+M+9qg+cibjSnuuIwmSqPb
	vBpIyCqaRV3wgPQMQH/hxnMVDJvJojdw79mZqPZvPOt5n8Rr9TniGP3/6QITX2A=
X-Google-Smtp-Source: AGHT+IG36B6le8tvml3S3bJBGefpCApaORZSBlIm5LdQKtdIOR1mLOCLvkCIHHeQq2OwPmogG9QccQ==
X-Received: by 2002:a05:6870:b022:b0:258:4dcb:7d51 with SMTP id 586e51a60fabf-25c94943702mr9984384fac.1.1718994746577;
        Fri, 21 Jun 2024 11:32:26 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4c040f0sm504037fac.50.2024.06.21.11.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 11:32:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: John Garry <john.g.garry@oracle.com>
Cc: linux-block@vger.kernel.org, linux-next@vger.kernel.org, 
 broonie@kernel.org
In-Reply-To: <20240621183016.3092518-1-john.g.garry@oracle.com>
References: <20240621183016.3092518-1-john.g.garry@oracle.com>
Subject: Re: [PATCH] block: Fix blk_validate_atomic_write_limits() build
 for arm32
Message-Id: <171899474485.173167.18019920711327723687.b4-ty@kernel.dk>
Date: Fri, 21 Jun 2024 12:32:24 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Fri, 21 Jun 2024 18:30:16 +0000, John Garry wrote:
> For arm32, we get the following build warning:
>  In file included from /tmp/next/build/include/linux/printk.h:10,
>                   from /tmp/next/build/include/linux/kernel.h:31,
>                   from /tmp/next/build/block/blk-settings.c:5:
>  /tmp/next/build/block/blk-settings.c: In function 'blk_validate_atomic_write_limits':
>  /tmp/next/build/include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
>    222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>        |                                   ^~
> 
> [...]

Applied, thanks!

[1/1] block: Fix blk_validate_atomic_write_limits() build for arm32
      commit: 8324bb755a80d463ff53379e5d64991656512069

Best regards,
-- 
Jens Axboe




