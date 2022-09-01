Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6F15A9A95
	for <lists+linux-next@lfdr.de>; Thu,  1 Sep 2022 16:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbiIAOhr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Sep 2022 10:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbiIAOhb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Sep 2022 10:37:31 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C0D2C7E330
        for <linux-next@vger.kernel.org>; Thu,  1 Sep 2022 07:37:11 -0700 (PDT)
Received: (qmail 235714 invoked by uid 1000); 1 Sep 2022 10:36:34 -0400
Date:   Thu, 1 Sep 2022 10:36:34 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] USB: core: Fix RST error in hub.c
Message-ID: <YxDDcsLtRZ7c20pq@rowland.harvard.edu>
References: <20220831152458.56059e42@canb.auug.org.au>
 <Yw9vYaqczVlWzONt@rowland.harvard.edu>
 <20220901075048.7b281231@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901075048.7b281231@canb.auug.org.au>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

A recent commit added an invalid RST expression to a kerneldoc comment
in hub.c.  The fix is trivial.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 9c6d778800b9 ("USB: core: Prevent nested device-reset calls")
Cc: <stable@vger.kernel.org>

---


[as1987]


 drivers/usb/core/hub.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -6039,7 +6039,7 @@ re_enumerate:
  *
  * Return: The same as for usb_reset_and_verify_device().
  * However, if a reset is already in progress (for instance, if a
- * driver doesn't have pre_ or post_reset() callbacks, and while
+ * driver doesn't have pre_reset() or post_reset() callbacks, and while
  * being unbound or re-bound during the ongoing reset its disconnect()
  * or probe() routine tries to perform a second, nested reset), the
  * routine returns -EINPROGRESS.
