Return-Path: <linux-next+bounces-8691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD1EBFF49F
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 07:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBED819C70D5
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 05:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E20422DF9E;
	Thu, 23 Oct 2025 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Q2d0wmvO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE8B248F4F
	for <linux-next@vger.kernel.org>; Thu, 23 Oct 2025 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761199147; cv=none; b=NMRPo7QmWAxdkA6ZQ5gAhueGX8Is/qUl0oiMrMLfNGM0KNL1Hq0wakOBxXipbiZvr4HL4uSrlEnnSNc9WG6KYT4Ezm8Uy+pzi0NmPEIuFBzAq5NqBJDaSEpnW1ndeBC8mjDcdVtROf6IxArl02OxvrBjcY+TRmcKTqbcI/yS8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761199147; c=relaxed/simple;
	bh=6qVv0hqjVVa2EuvCRKEFgPgndZnPGApPEW0Q+ZDT7nQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=OiRxE3SDOnOjHEh7WDm7BMimehThIpXvieD8hhAVyDJ1FNZClBkpImaCRJE1vOdkG5a1MPw7HLpVsqL91NUT07ICN9zqXJvtfuCjraQyXLHi4QJEAbw0KOqhgQmC1WDakH6s+hdBoEECQ+xfewtwsE+Q7yGmfa/jA0D8rDWYHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Q2d0wmvO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so434059a91.2
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 22:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761199145; x=1761803945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c3ggub3azVi2UUDrzH85P1fZp3UlOHvzKmdXlEy0lI=;
        b=Q2d0wmvOejNvWEEmEihFzoMM52UzSjMPHBg+frJJbSXjmAVw4JGXlu8JiW5mY/KUzT
         OZYs1Pewz7zj4SkrAjt93/YzNt66QOWrUdWAWO2uf+OwB9wNOkseHqYoau4vL8bxFUqT
         O4FBZcD/1A/wqi4rw6iuuogf40Wiv955CX8596i43KlwAcGl6xlIWPAxyCCfSxyHV98N
         BVcCMvXvBWakFfhXONeztPGQkKKWvkHIX0tBkPr5mjP/EWSE9NhmII38smu1f5c2FFrY
         VyOAxavm1c0vkuD+ILv29SYPUMAr4i1x8LqdBdy0f+b3Q5Xek4jI2uNyQKvn08AJ38l5
         zOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761199145; x=1761803945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5c3ggub3azVi2UUDrzH85P1fZp3UlOHvzKmdXlEy0lI=;
        b=bJkLdWcEsw2aD8qxniL2vPwsYBSb8ejPEEoZHV19i3qFrju0NOqYHLNQIFhRgTQ2jX
         wq7mEeXJSdoUShSqKqNkeH0ttiH8YLjaolwsMug7nAQhCeR7iJDYv1puHceGJdLVpKsv
         qLgvFLTsliSdqbewsoZJDDLuFuDfYN+D39dYeMJ1pandmY9l5soMiu5TJYczsEAZCJPJ
         2Pcv95L8tZGzNSyyNpoNNNd0ekBT6RkqT0eROxs8HzQslrfNmfm9RbBSQugYGs1XbGtL
         DIDxfT436YvxRMmsgjEN8z7wZlzzrOiHnyvKq54KWZpjzmrUg2DjJAntw6nhm4kulIHS
         sDGg==
X-Forwarded-Encrypted: i=1; AJvYcCUrUCm+ZJinjKeBl2gbGb9Wf88s9wYHQPngRfkY3kxmTinqkDIZJPMqWTVtGnK3srh1jbxB1umMbZZM@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfZ/hidEJkSSSABPrVCBFVveQFUKxcPf0gUWthJ55YrM8KSMX
	ZD8oIFmvmCagcDVinpPjOs1RQlOh4UhsRMWHceox8SLuiXnoowxwhcY5tIAGWaR9O0s=
X-Gm-Gg: ASbGnctKFEpjuyVek9+Kx+znqA756hSRipNax7j5djM4K0itguhGpwzOKBlpj3G0TWi
	EUPfosxEhV4Mm93yxqKTSiilbiXjv38AhXYh2bIiZvugJWtnl4FyhafeQ+EjQDWCA1agD7SvXzX
	OpfmcX8kTvC2h9efLuzc3Qs8/xQe1XFT3gtX68vEk2HmKCGWdv8l2CiQUzxijk7rTT0LPv4xyeG
	0vQdN3nEprejQypLsZQWqi0zAftR0n5aaaW/cJgX7Qb9uRAQPTBPkcOz4O3lvFQFSQUpN0MgEec
	uq/h9M/aHcVRA4+NoYailUlW93SHLS6cUk/60rTcqHogrRhzTgO++YRMrkqwwycZJb+1fVLi1Ma
	jNj5fbKUGsVnXiX+XpCLquEeIuGKqOo5rmy540HgUzXhmNN7vIkSX6QKn0E6Tcw2/0wP1IQ==
X-Google-Smtp-Source: AGHT+IG56nXu1ZMDM659NRev5dAktSS/wI8ALooe+1OPqyY8UqZDIiJv2GB4aL3AChwewJKa4mMaEQ==
X-Received: by 2002:a17:90b:48c6:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33bcf8e95c3mr31820285a91.17.1761199145115;
        Wed, 22 Oct 2025 22:59:05 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0144c55sm1167195a91.10.2025.10.22.22.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 22:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) cannot jump from this goto
 statement to its
 label in drivers/opp/o...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 23 Oct 2025 05:59:04 -0000
Message-ID: <176119914391.5792.9020817346274859760@15dd6324cc71>





Hello,

New build issue found on next/master:

---
 cannot jump from this goto statement to its label in drivers/opp/of.o (drivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:992b985637471b20dfed6cb78dc938315a3ba8b6
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  efb26a23ed5f5dc3554886ab398f559dcb1de96b
- tags: next-20251023


Log excerpt:
=====================================================
drivers/opp/of.c:1545:3: error: cannot jump from this goto statement to its label
 1545 |                 goto register_em;
      |                 ^
drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
      |                             ^
drivers/opp/of.c:1539:3: error: cannot jump from this goto statement to its label
 1539 |                 goto failed;
      |                 ^
drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
      |                             ^
drivers/opp/of.c:1533:3: error: cannot jump from this goto statement to its label
 1533 |                 goto failed;
      |                 ^
drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
 1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
      |                             ^
3 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm64-mainline-64K_PAGES-68f9a84f9533132a189903f3/.config
- dashboard: https://d.kernelci.org/build/maestro:68f9a84f9533132a189903f3

## multi_v5_defconfig on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-multi_v5-68f9a85f9533132a18990405/.config
- dashboard: https://d.kernelci.org/build/maestro:68f9a85f9533132a18990405


#kernelci issue maestro:992b985637471b20dfed6cb78dc938315a3ba8b6

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

