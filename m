Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838E436A0AD
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 12:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbhDXKr7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 06:47:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhDXKr6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Apr 2021 06:47:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49D8561029;
        Sat, 24 Apr 2021 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619261240;
        bh=HXNqsJOkLh8nOukAFuP1qnOn4p/EGmkhfv588OM3da8=;
        h=From:To:Cc:Subject:Date:From;
        b=ZFlP8VMRoyI/KHOaSN3ZLAuogmC9/S9osHAmW2YDD4S0+mBsBCzGMhaj1mleORZa2
         MAclxV2ZXOpvC5NDBGPIirBRsJawQzMXCGVQSevg1MxWUPOtT3+/c6VaD0AqmIqjh6
         rvhW71SF17HTy4SvqlJnFxJMjeWDkh9bfx0C2lLs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-next@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] USB: fix up movement of USB core kerneldoc location
Date:   Sat, 24 Apr 2021 12:47:15 +0200
Message-Id: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Commit 855b35ea96c4 ("usb: common: move function's kerneldoc next to its
definition") moved the USB common function documentation out of the .h
file and into the .c file.  But, we forgot to tell the Documentation
where the new information is at, resulting in a build warning of:
	include/linux/usb/ch9.h:1: warning: no structured comments found

Fix that up by pointing the documentation at the correct location.

Fixes: 855b35ea96c4 ("usb: common: move function's kerneldoc next to its definition")
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/driver-api/usb/usb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 078e981e2b16..c08b92558dcb 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -114,7 +114,7 @@ chapter 9 of the USB specification. These data types are used throughout
 USB, and in APIs including this host side API, gadget APIs, usb character
 devices and debugfs interfaces.
 
-.. kernel-doc:: include/linux/usb/ch9.h
+.. kernel-doc:: drivers/usb/common/common.c
    :internal:
 
 .. _usb_header:
-- 
2.31.1

