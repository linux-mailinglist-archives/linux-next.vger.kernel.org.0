Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932493FFC5E
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348457AbhICIzE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 04:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348423AbhICIzD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Sep 2021 04:55:03 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B25060E77;
        Fri,  3 Sep 2021 08:54:04 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mM4xW-008o6c-7A; Fri, 03 Sep 2021 09:54:02 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-next@vger.kernel.org, kernel-team@android.com,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Documentation: Fix irq-domain.rst build warning
Date:   Fri,  3 Sep 2021 09:53:43 +0100
Message-Id: <20210903085343.923036-1-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, kernel-team@android.com, sfr@canb.auug.org.au
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Correctly escape the * not to be used as emphasis. Also take this
opportunity to clarify the fate of the rest of the legacy APIs.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/core-api/irq/irq-domain.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-api/irq/irq-domain.rst
index 6979b4af2c1f..9c0e8758037a 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -175,9 +175,10 @@ for IRQ numbers that are passed to struct device registrations.  In that
 case the Linux IRQ numbers cannot be dynamically assigned and the legacy
 mapping should be used.
 
-As the name implies, the *_legacy() functions are deprecated and only
+As the name implies, the \*_legacy() functions are deprecated and only
 exist to ease the support of ancient platforms. No new users should be
-added.
+added. Same goes for the \*_simple() functions when their use results
+in the legacy behaviour.
 
 The legacy map assumes a contiguous range of IRQ numbers has already
 been allocated for the controller and that the IRQ number can be
-- 
2.30.2

