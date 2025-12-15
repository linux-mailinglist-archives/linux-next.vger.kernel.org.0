Return-Path: <linux-next+bounces-9407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B22CCC048E
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 00:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1948F3015039
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 23:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940BC29ACF6;
	Mon, 15 Dec 2025 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="N5mBlngi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4632ED56
	for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843148; cv=none; b=azi0n3EHi1H5jkAEXA8+bG++3mf5m1Lywx5A9h6PBNmq95MHWmNq8vVOMWwJyaPgmM+U6jY5pWqbBIi5/qph37XT90f2iXGn9GsbGniLuPlRnU2Pv3UlfzOXNOefYyVht9g6C2OUPOSxK39y/DqscTaSzNJ69TDcZ0zLO9rU9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843148; c=relaxed/simple;
	bh=2ET3KuZ6rFu/kJsctJVg1vQrfoym60yOnRCX2c1aPm0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ozd8zuUITgHjM7uMnk4d/6QEUaclZi6I2PAaz46raobKskknejqJi0F/kPf6lUpEhAcT7IC6mDryAZCCEtQVyfw5M2Vpvm8dCYyIfiYHtqRRyFNiiTtu+lCp3UWIzTsmYeLEe6pD08+4ubKo5PebQdWcE1e7ya9+XYmuexrNB3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=N5mBlngi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a1388cdac3so2158145ad.0
        for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 15:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765843144; x=1766447944; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmfAdh2fh0N8FmAqG7oVO1gG6isOT3BiqzvgRJn/wsY=;
        b=N5mBlngidqJD/QFT7GQP1gW5Rcg4jRl4z9K1FQqLRxirRjebZzOClzHB618N8BG53E
         G8CILapEOJl/6jMneJKPGmEFp9VjAFwVPvn6idj7uvV9jeE2/nRicXoqz7qwDgHJ9v07
         yu/MiHyizozYMO0ZNajElHbKCYHpe22vkg6qZ2YLdAZSq5Ydx3czLrokboSnJZCql5ro
         C6wh/L+8ZRWcCDF6T2vxOee9JQay/mwl2XJn96jOppQGdvZIjxE2358rHL4udqG/hsf/
         cxWDnG3rjfg0idbfDte/Lkn62S3wx9c1tIuWG4dmy8uWTKWMtaxta7mTk5GevbKcuwgl
         nhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765843144; x=1766447944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmfAdh2fh0N8FmAqG7oVO1gG6isOT3BiqzvgRJn/wsY=;
        b=lgHfdpR3qMWrJzpF44w5iVWsxEJQiP8QwrXtRPCJtCSRxhb2GmdfsyUA8W+aqp9YkS
         hZDjlt0ta3CmyVaVdmVd0VLFlpXf1BL9Wnq2hzF5b8tziOuV2vga/U7s3mpqomdRRlD5
         CyVD+1y4gLKOvK4nvlVxqR7+bPqYyqsqOJrEMlr54uSVW8IayXJmWbeEnKFgaY2Q5NG5
         QzAiQR9UDH2VD/WlstBUG7OB4r4GcfKACxj8412UU2lz5hiy6teZERr5qMwwOsAVb5EO
         go0WThHk6mkAzq01vgx3FUrR5oEPasmkCS7eGocdSQQ+5f4/v024AsTsMimCHPBnhoAS
         9Snw==
X-Forwarded-Encrypted: i=1; AJvYcCXRCA0dvqNx1VudEq9jwpLN1tRXvhoN8vUcr7Ke1+F5MJ2rkUMKBoZn6I03EKxguVT3DjHKpTzK1msz@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJQY5kF3688bCZ5ZImNTp+axHcFwvlVqHGY2zsW2aa4e+Bfxa
	SJhoDOYlv6/d1t7pxxvxyJgFk6HEgl9WCKL1jDUEstcFjadG+CaKThq68h5yy4St+4o=
X-Gm-Gg: AY/fxX4kIfYGbM1Otrz+CaohdsLOQE7ODh1Gdip/vOC79pPNLT3T9BDjr2GM9EAMg1M
	IB29W3HbrxQXw3ino3MDoBOC9M6yQpLIXUqzlRIIDPA6EcQN/9qRrqcbvTLybvJ2PW+nOPhPOyn
	FqISwc2xXZr4VDkiXHyGv9Jv3N26vOgmO+dm7FuI9d+ogFne2Ev0aoZS0oVeKwPXVY+jVCbNZLF
	kUMiwwEd4vBud08iijZLQGxHtBQHiqUpMy6ALKHue8liGeHVURmN0wAT2oz/qacJpCfR6MbnoTi
	ThtrMcJ6hVKu9WByGgO8xvoUQe7WACtmk5cXBQibgLP95VEvRCKLR7/mHOdxScj03J+nmFUHTcF
	ClLlalzVaUwurR2yZ9G3Li1R3O2osB0aOD5wC1pGGp3zOfJ4hXM+jkoWVxshriFq1zAISxfT5eu
	XOlyiI
X-Google-Smtp-Source: AGHT+IFqv5CDUbEPLsvtcfoqXFR8jX2ihixN26s3jK6NE/gUSHLjb+2D7z6Y5KmSBlrBYwrFpmuzLQ==
X-Received: by 2002:a05:701b:2808:b0:119:e56c:189f with SMTP id a92af1059eb24-11f34ac184emr9255293c88.7.1765843144002;
        Mon, 15 Dec 2025 15:59:04 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e153e7esm39590559c88.0.2025.12.15.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 15:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option
 '-Wno-suggest-attribute=format'; did...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Dec 2025 23:59:03 -0000
Message-ID: <176584314280.2550.10885082269394184097@77bfb67944a2>





Hello,

New build issue found on next/pending-fixes:

---
 error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option] in kernel/bpf/helpers.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:32e32983183c2c586f588a4a3a7cda83311d5be9
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  CC      kernel/bpf/helpers.o
error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]

=====================================================


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-694097d2cbfd84c3cdba292d/.config
- dashboard: https://d.kernelci.org/build/maestro:694097d2cbfd84c3cdba292d


#kernelci issue maestro:32e32983183c2c586f588a4a3a7cda83311d5be9

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

