Return-Path: <linux-next+bounces-1184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9D855EDE
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 11:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE60B1C21E44
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 10:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5DF69DF5;
	Thu, 15 Feb 2024 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IOPJA24N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6469D21
	for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707991891; cv=none; b=uNl6vUd0x2QkbmX8RjL67pWHZv76GjKrD7jeO4KdkJlxP/ierjBBm92v2QsliFGks/95EIimSSEH1Hax3mdrxO7HDPmX0CLC0I1vdDB71Tz80UUY/XiU+BQMCv23lYm2+pb42qPt4MHNM9IfY54SIDfogftCUMH4xh9/6MJXPxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707991891; c=relaxed/simple;
	bh=a79toeYJmYUPXuCP+VQUzup7jbk+ihceTcg7eZEHkY4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mYZl5Z1+V41w5d1DH4F+VjIIsarBuiWOfsQIbe8TXl/Wfcdi3h38a6WuTdBvzTCi5GGMiJDrhY6laWoOp1c+POI1sSdJ6Sgw3ZcQvidTZTFXx1hHgmvZjSK1aO127ccy4HaalZ6/4ZaSTBOb/WE22swfnfXi7B+DQm/Bh0QZhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IOPJA24N; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7d2e1832d4dso311555241.2
        for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707991889; x=1708596689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a79toeYJmYUPXuCP+VQUzup7jbk+ihceTcg7eZEHkY4=;
        b=IOPJA24Nd9FuF+4+4+96AaYqxrsu+ef0BOletZk5/Y3Z96jQox6aFvhT5fq8FMcTqz
         cal0Rb05ty51ngJtaZlcbey/fyFayklu3DMb/fDs3CeeLIqYc3zC6zaJOF1oQHDlrP0m
         x3LvaMK5yWF1X0ySMRY3LRzdn7DVLRKRAkbd5i2wsNjiqis6KfhJP4omgtVuRnBRK3CH
         1wbsgeBjHgPxxmbIMVyC17NrS8YOOmRhpxfssfzfNMTKmqd3giP5LDYRdWmBh85HMEUF
         otzUf2y2owmfJoqntpebNku7hT06chswiBGVYoqPkLSBiFPB0d3G5m0E8mxmwFbjr1re
         ppcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707991889; x=1708596689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a79toeYJmYUPXuCP+VQUzup7jbk+ihceTcg7eZEHkY4=;
        b=EOAmWJxFEDIw1NBRpkzWahMvOQV8/6azEoG0NYgDufPO7mxUi9v/296Z1pbSvb1kEh
         rDtLGbOt/LRhQ4uZXaRSJkhty5wDZ5jEyt9Ue0ucD0Fx3hqpPd++t9SSFv8rxl5kf1Dn
         t9aKc7H9NgwCxsqrYkbsyKs/RwFRyr9MyR7HGk56sNAAa5NVE5+SHICShwo2JmjrcF0Y
         pACqDImtcFToexHjRteitmIxhfETgNDHgDwkVw6d7lYsJqWbi/ZH5iFfm2vj/i6WPcGi
         PHN/tP4jT0kQjCXiLSIF86wSKgNGAmBhHeAANJp71A8DFxc2bp0ZC2bAMvkjzTz8Hl26
         BCvA==
X-Forwarded-Encrypted: i=1; AJvYcCVwwdd7W9R944FXZxE1Z7FHCQ+rLRnptV6AwU0R7VsfTWqeF7s4z7iynLLBtKU+4cOEBBBUbCZ7RgF4MKED/Z3Qj/4DTjqSB/NpWA==
X-Gm-Message-State: AOJu0YzvEge+oDeiwU1yft2bv9JaPTJQFUIej0oWsd1UeRQBG67MUlmG
	qzEHBfATd/7spe5nx8UFh3zICXHIE3dAVCOBgOi9zu9O3jM+xLPCbC9koOXjFBdWG+GLAZyYQHs
	PwqyABb6s3pORZUZnDGqI6lJYGjWVWHUTxbPlpw==
X-Google-Smtp-Source: AGHT+IE4dAp0+3pjqzG/5JaQHmc+LoQBsUmyYeVIoxgjylBum1+YCV1FOUa5yOT/OCSjTws5nQmPvSW4yQBgfosYdig=
X-Received: by 2002:a67:ce1a:0:b0:46e:cf01:95fd with SMTP id
 s26-20020a67ce1a000000b0046ecf0195fdmr1108822vsl.32.1707991888925; Thu, 15
 Feb 2024 02:11:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 15 Feb 2024 15:41:17 +0530
Message-ID: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
Subject: next-20240215: workqueue.c: undefined reference to `irq_work_queue_on'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On today's Linux next-20240215 tinyconfig builds failed on arm, arm64, powerpc,
s390 and riscv with gcc-13 and clang.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build error:
-------
aarch64-linux-gnu-ld: kernel/workqueue.o: in function `kick_pool':
workqueue.c:(.text+0x9e4): undefined reference to `irq_work_queue_on'
workqueue.c:(.text+0x9e4): relocation truncated to fit:
R_AARCH64_CALL26 against undefined symbol `irq_work_queue_on'

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cO8iztCdxtnbSeW3ekjN25sY6G/

--
Linaro LKFT
https://lkft.linaro.org

