Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541C968B9EE
	for <lists+linux-next@lfdr.de>; Mon,  6 Feb 2023 11:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjBFKWd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Feb 2023 05:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjBFKWb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2023 05:22:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3570521A24;
        Mon,  6 Feb 2023 02:22:09 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C6684DA;
        Mon,  6 Feb 2023 11:22:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675678927;
        bh=S4e4Wg7/PF0778eg7sQm5dW33s7JK8hsgCk+mmUInfY=;
        h=From:To:Cc:Subject:Date:From;
        b=CU9pU/fFYuxbqAsRqGmOoiJSUJPNrLjExO3bzeBazb2kdP5wcFMqlBcPFgPe59lzZ
         YXrt6rm+qfV5jU2vjc1v0FOP91otXgZRcG4DYeqB3Zzpc9Fa0HLtYlX8qnCDAo0OQl
         EZw3tnbo/nSGlPlUR4+sW1E3/tE1UyGR6Qtz0PfY=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [RESEND PATCH] usb: gadget: uvc: Correct documentation formatting
Date:   Mon,  6 Feb 2023 10:21:59 +0000
Message-Id: <20230206102159.747953-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The documentation table added in a36afe780461 ("usb: gadget: uvc: Add
new enable_interrupt_ep attribute") was incorrect, resulting in a new
warning when compiling the documentation.

Correct the formatting to resolve the warning.

Fixes: a36afe780461 ("usb: gadget: uvc: Add new enable_interrupt_ep attribute")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 Documentation/ABI/testing/configfs-usb-gadget-uvc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index eb13cc5d363a..a2d5c648aa2b 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -17,12 +17,12 @@ Description:	Control descriptors
 
 		All attributes read only except enable_interrupt_ep:
 
-		================	=============================
+		===================	=============================
 		bInterfaceNumber	USB interface number for this
 					streaming interface
 		enable_interrupt_ep	flag to enable the interrupt
 					endpoint for the VC interface
-		================	=============================
+		===================	=============================
 
 What:		/config/usb-gadget/gadget/functions/uvc.name/control/class
 Date:		Dec 2014
-- 
2.34.1

