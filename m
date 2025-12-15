Return-Path: <linux-next+bounces-9408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9196CC049A
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85C1C3014DB7
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 23:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D827732F751;
	Mon, 15 Dec 2025 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KM5ZwUU3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E37432D0CC
	for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843148; cv=none; b=Z5FRlkPeadwDZHk8jK0HizfzXwMwncY9D5o7KI53Xr90Xz0FFUnq+GoZe2ichWNyT21WpI7p2uri1dnSenawBb/Wi1S6GqNs8OTxUcyz3jwqbtud7O2aIaXl2u8O8Tqmev/GpCSMYO+K3pgp9wFv8gf4jA8j5pq+OHIFbdJ9zhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843148; c=relaxed/simple;
	bh=aUUqaYm/em1vfd4H8MXlLWDsJWRcYiIvgnLSp4zmUgg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=mlwx3zQr30gDx4Q1icyHOISHt1s1bwSMeLp7AW7U4JjhGp5FmHzoJhIreu/Pmf0uqe4Z5f9eKvHGgNQ+LAI+b5W9kQmZ3jVNagsvdSH04OuU8If2Zx1xbbNX9it2qLgMXFRLod9RhNVmQ2RmLvtHpzvsKfVx93kpPXYI3Jc/b8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KM5ZwUU3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc09b3d3b06so2373244a12.2
        for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 15:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765843145; x=1766447945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhJoYwe/PCXYwVu0tT+tOeoeCxiWwbIjyVtrV3UZN5A=;
        b=KM5ZwUU3FkVv48lefilKIvq3yJkgh8aEo9yr0CLw8HFD8etE2eddxyoHpMR9fgKNZD
         DoOtmXybJAqqx89dJ/ALIVnPri5jJ2z9LPCQXVNqHx76iYRUQwD5SaUsZmTRl+BRVMzK
         GtnOU+BqRVFZGLxBfo0+ya80R95Y7WsYgDSEdPiECRfs64g7ps7Rk2z8Opt4xHT7WCfw
         8XPwMGF7AGkrw+6OOXyRhzzdB8s0lr2ESFZxypnKcewi2SrtyFCB/zFR+b+aUTyA6p87
         L50gkAQ08CYdIYV03dwSMIfoU2IaNZVDwpURQDD/dAXjrrvZAcBJG1m20yDy6m6v8/O0
         nzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765843145; x=1766447945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhJoYwe/PCXYwVu0tT+tOeoeCxiWwbIjyVtrV3UZN5A=;
        b=vzacH0TfWzq4ODorvq7pwueloOe1L0P4v5DJ4DftUDCNPXKxR4qHo50Ky59mjUMy2T
         E+jMWORD6qStWuNIVOzkCpisMCYXviGcUXHiy/++EYCZY8+A9KbyLX5qQdoZNM7d8YWe
         heDGwy2nIiafLbrVcEZnX52p1PmzY/YEHJv8xzulKxOjvKU+mz0lsoQgVq0iw/2r/3zp
         ckcCLWXJmeRvQG5oPv2q96YFTTE8qB94uEWAAqgQjBDrpjdXVJy8hGkA3bAAeIKdicBb
         aPyIjgelbGJOb1cJBhQRMu1R8Racd7G20GnxCb8/lvWFXiVOiQIPdKUd1CpVxObw1h0e
         yE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5/eKur2RyU5JajPKh5BxEGoq5HnEGko54XwNvjuloFVGtmxkrGh9UPVWqQxhfHF6+hG2KgrzEsLSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4eMal/esCBL2Hc7Gopyk0J5NL75wFGEx/+M+iMiK8fg1ANDsn
	Fwv94R2HtWmHljgiZg0EK7OT+PQhoOeKM7bsTEBeWRhHtBHTJqaMlLSmLrq6BrQ7Eyk=
X-Gm-Gg: AY/fxX655WeU5LqugaZkkWJ6vEjziaypQ037g6LAGe3h+0MgmgfkxVIfd33JOrfDwOF
	rJ8rRBi/EhHOeqnWljPuuCMyHNzhw2BtSb3tlFKps4LJfWDnvfd4bSJuFOLEEbdZcFQRb+mIjyA
	CAO4MG5/x5J+VGM0YaGEGAVr0L3Xz7FbBl6UUf0sDQYzXxQH+cv9OhP/PWEBK08hV/hCn7XQEYU
	uT3wEYFdDNCuVTvWrBzxLFUeyYNAmRZTDdw6x9V9jRQocmWBVmwugu+A9zJSM7B8iPFJToj0nTh
	uqb5CM1fJUFrN8x/lEQw+q1hYVdJJfUkt6dPKRX//YDn17XR7hlgBugu63Cc7pJbzn3O8W9R/3z
	TE8PXbuvSqgTyuPMBW1B1st9ADPRiUR1GJK40zk623uv3lKCAaR4OMZoypC4/TileQlS5E8RLWv
	c9TRte
X-Google-Smtp-Source: AGHT+IEqhN1ubWSuDskzmKUIzAWT6acagrsS0UulZfFDX0DFIKjAjc0DJL4MefNQrAh+wtGqeexThg==
X-Received: by 2002:a05:7300:cd86:b0:2a4:3593:468a with SMTP id 5a478bee46e88-2ac303f26a3mr8104130eec.38.1765843145335;
        Mon, 15 Dec 2025 15:59:05 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f05463dsm63520eec.32.2025.12.15.15.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 15:59:04 -0800 (PST)
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
Date: Mon, 15 Dec 2025 23:59:04 -0000
Message-ID: <176584314421.2550.17138936004167130394@77bfb67944a2>





Hello,

New build issue found on next/pending-fixes:

---
 error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option] in kernel/trace/bpf_trace.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:5264eacd00c08c60a249ef82374e5e5418baeed5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  CC      kernel/trace/bpf_trace.o
error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm-mainline-aspeed_g5-694097e2cbfd84c3cdba2939/.config
- dashboard: https://d.kernelci.org/build/maestro:694097e2cbfd84c3cdba2939


#kernelci issue maestro:5264eacd00c08c60a249ef82374e5e5418baeed5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

