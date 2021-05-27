Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B9539357E
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 20:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhE0Si0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 14:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhE0SiZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2021 14:38:25 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47188C061574
        for <linux-next@vger.kernel.org>; Thu, 27 May 2021 11:36:52 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id 69so399365plc.5
        for <linux-next@vger.kernel.org>; Thu, 27 May 2021 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=YcX3i4SjvdD2XN41YU+ZDUb+9ax+irRbMi3KZwfnWW4=;
        b=Y6ZnBaOCDGFlGg9aYYrOMAXhLHyIU+/jTjcO8MDY8GEKFTyqZhl/Gbny0SJx1Gmd2E
         SphPzl8jofRfyuEr4xhSawvYNxnt4kMKKYqT/Q6ud2foiWx7CUC62i6QgNai/oHwJxG3
         QuD8OMtlG9GuHPn1yTctRIw9/3tcWmCKoa9PCBqI3L3k0YS2E6zleCVHaiIHj9/ZSKYt
         aIsURNgwEapFfkjv5uiRzxJ3Oof6ERPMgYLDuCGigeYR4kHuZ6wYUrc19NXzcVkbl027
         kRVyjHP4qKPj+99OLP8qJ31HYTK5S3dL/hM3av/769lqJtoG+j6mGl+IiDTVWaQaHGsl
         Tqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=YcX3i4SjvdD2XN41YU+ZDUb+9ax+irRbMi3KZwfnWW4=;
        b=Bjya2cBMW1YWCxU5/O7hrx0yH3gjpenz4OBMWQH6t8JfYcvEqKbyJoNoY1GCS9fPgZ
         FRuM0Ity9H0lAE+7lIyQGGtGkOGkYi/ySiEqQM/Wb0PurFVEzKgTSavVDPmUVzRnsK6U
         5mNIguoxRhaluFc6rPlnIBD+CxBw9tXdqJVD3Z4+OytB7GPK5SDeuwWy52QDONQEqsDk
         +/MrF5I321uZ3zoF+BsO9kXz9j6Wh+CIPUe0LJFKPeGFACkr9tCbwfYAq2hmEIeF/NZA
         UREjZ4Kc9dTK0g6k9jhDGPM0f8f5st5V41HT9BpRxdxvXV5pedqffClaAoIfdxw7t1Br
         hyIw==
X-Gm-Message-State: AOAM530d7tkEvjuZia627de2mIYnpYsxTRG9gtwH0Gd232lfO5o2NMXB
        U0F64rkvw7EyplM5ZKaiSmzZ4Q==
X-Google-Smtp-Source: ABdhPJyoZI4QjTPevz096XryKV7ooY3aBfbSQgmCbQVUw75nk7wD2Nb53XNHOQBXTx6ip+OvWHG3ZQ==
X-Received: by 2002:a17:90a:5649:: with SMTP id d9mr5181545pji.163.1622140611610;
        Thu, 27 May 2021 11:36:51 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:9965:8615:f331:180d])
        by smtp.gmail.com with ESMTPSA id x13sm2513600pjl.22.2021.05.27.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 11:36:50 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: updated Amlogic repo used for linux-next              
Date:   Thu, 27 May 2021 11:36:50 -0700
Message-ID: <7hmtsgrpkt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please update the tree used for Amlogic SoC kernel development
(suggested patch below[1].)

We've switched to a maintainer group for this tree which is now
co-maintained by myself and Neil (cc'd)

Thank you,

Kevin & Neil

[1]
diff --git a/Next/Trees b/Next/Trees
index 2d22ca1d2911..1794b9144f3a 100644
--- a/Next/Trees
+++ b/Next/Trees
@@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux#for-next/co
 arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git#for-next/perf
 arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
 actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-actions.git#for-next
-amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git#for-next
+amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git#for-next
 aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git#for-next
 at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#at91-next
 drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
