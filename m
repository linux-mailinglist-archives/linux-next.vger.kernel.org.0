Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F056BABC5
	for <lists+linux-next@lfdr.de>; Wed, 15 Mar 2023 10:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbjCOJMb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Mar 2023 05:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjCOJMG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Mar 2023 05:12:06 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E401EFFF
        for <linux-next@vger.kernel.org>; Wed, 15 Mar 2023 02:11:59 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2CF8C41B46
        for <linux-next@vger.kernel.org>; Wed, 15 Mar 2023 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678871518;
        bh=MpqJ7yUI5cExdfWQOS/tjCzS7DTEtC5WTJpFk2vxYHI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=js36bwQskzpoYlOzoMm7kCN/sfJiY+VctCn1fEFfBIpHsF+VHJsboxBuY4xhbbTz9
         e9C5+jaWhQNIcN6nNC7vXCcI5Vu4fB5G/OrP6DnwA1mW3OUyBTSM2fzNaFOfauKW+H
         DLcwbtbw5Q4c1JtRoc4cLzv0jQz1PIdyTFwPKeBgronDcGoZ6wgtUXLgUOp3QzvFLm
         B1+/tzTlU0x8IVq1OsTSfYwe5CQhtYUMAVVkHuBTpxc3a9sVrhhMu+6t/jEIjLZVbL
         4oZz8y2UhGh1EWO+2tOkg/aRLGiaj6n1kEb9+YR4XzW6yDUXJM0NdfnAd36N3PDaeq
         4CnaXn4FVTL7g==
Received: by mail-ed1-f70.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so25476359edc.9
        for <linux-next@vger.kernel.org>; Wed, 15 Mar 2023 02:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678871517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpqJ7yUI5cExdfWQOS/tjCzS7DTEtC5WTJpFk2vxYHI=;
        b=fDcbu4eyLx1kDj9vD5XNHOe4Q+iVDp9MZHYnmKDhoELgh6TzLmS0t/PmgJRKtMVlGe
         UbI19v9blxRD7474u1kKRGz9Lbh6giREqbuQjCOiV7xZ+nhdbaPWieuc2xr+nVQ31xde
         JBMz8cN49zw7DEczRbamAl//rVnYpViMk27MAIbrmhUJQLWAo0g2edxs+zrwSKuOAhBn
         gX7lSUumGv0HhIzIZCM3qS/zlfzlutLoTrHranE/GOB426hiK6fkSMBRGKtX6/vl/W4E
         l8mPc9Q+TEf3sbQWzJVhGo2LNg/mdO9hHzGg1vg1bmoap5Tg29mq7K2GPQRBrxXslMUT
         /Kpw==
X-Gm-Message-State: AO0yUKUSqQHTXumxX96hY7PJr6B46erOf66rjkHLN5e7Mth1ovlUzsTE
        gN91WaUp1MN/bzd0dLBR4CUr6edV3qWhUJN1WpZIuW6jN09UqfUpvNtlec+c4CLwmxyXY2OtO96
        7zBNiRL+HnzSWBLawH3tau9A8J4MXSXsN36r9Q4I=
X-Received: by 2002:a50:fa8e:0:b0:4fb:98e2:3df8 with SMTP id w14-20020a50fa8e000000b004fb98e23df8mr2001078edr.27.1678871517727;
        Wed, 15 Mar 2023 02:11:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set/nzaWIB774alFcqWYrbiez5la/w6tU6YOVja/BGwglwNB9o+vB78bdA/MbM7nnBlLjDcjq0g==
X-Received: by 2002:a50:fa8e:0:b0:4fb:98e2:3df8 with SMTP id w14-20020a50fa8e000000b004fb98e23df8mr2001059edr.27.1678871517511;
        Wed, 15 Mar 2023 02:11:57 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id t26-20020a50d71a000000b004bc15a440f1sm2075719edi.78.2023.03.15.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 02:11:57 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
To:     tony@atomide.com
Cc:     arnd@arndb.de, juerg.haefliger@canonical.com, juergh@canonical.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, olof@lixom.net, sfr@canb.auug.org.au
Subject: [PATCH v2] ARM: omap1: Kconfig: Fix indentation
Date:   Wed, 15 Mar 2023 10:11:52 +0100
Message-Id: <20230315091152.132443-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y8kXVekfGHEcPvWg@atomide.com>
References: <Y8kXVekfGHEcPvWg@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

---
v2: Updated for latest upstream.

---
 arch/arm/mach-omap1/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 8df9a4de0e79..cbf703f0d850 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -118,7 +118,7 @@ config MACH_OMAP_OSK
 	depends on ARCH_OMAP16XX
 	help
 	  TI OMAP 5912 OSK (OMAP Starter Kit) board support. Say Y here
-          if you have such a board.
+	  if you have such a board.
 
 config MACH_OMAP_PALMTE
 	bool "Palm Tungsten E"
-- 
2.34.1

