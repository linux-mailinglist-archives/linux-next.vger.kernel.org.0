Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A274F68C114
	for <lists+linux-next@lfdr.de>; Mon,  6 Feb 2023 16:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjBFPLx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Feb 2023 10:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjBFPLx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2023 10:11:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B872D71;
        Mon,  6 Feb 2023 07:11:52 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A80844DA;
        Mon,  6 Feb 2023 16:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675696310;
        bh=11SGDLDQe7sbPNdpImr651tu3ohy7mJTMkZjZMMEijU=;
        h=From:To:Cc:Subject:Date:From;
        b=cXomPMAlHMO14YF0GA/bf1UTPvUmSSX+isS/8KRK6u5jwJR59uQHudvtFMRBsi6v0
         vwaeJmS2mEc+X2YjQYFGGalvDf41P/2qo2ZkdDLFJ23mvxGa+3tm3e3TD2djZpMvgE
         ew0EG6sw8RImOm3XymsJxe3phstiKjyo33LdOMmQ=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2] usb: gadget: uvc: Correct documentation formatting
Date:   Mon,  6 Feb 2023 15:11:31 +0000
Message-Id: <20230206151131.863960-1-dan.scally@ideasonboard.com>
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

Updated the commit message with the proper Fixes and Reported-by tags.

 Documentation/ABI/testing/configfs-usb-gadget-uvc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index fec205044c87..9c716dd3ae6f 100644
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

