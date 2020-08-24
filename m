Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D2A24F0BC
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 02:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgHXAiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 Aug 2020 20:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgHXAiQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Aug 2020 20:38:16 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97542C061573;
        Sun, 23 Aug 2020 17:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=e4c87ctQhlZQXOpEqjOjyddKq7CyiWwdiKzpIL2sS/o=; b=hTNISxl/LEjiFoNBMo6kVNkVCW
        Oi/Gxu6c8Wyda7/8NY+9479motELpRBzQcPU7kuRvc167St3VJjRjBbVdhV2zkLGPXb7ITwATsEy3
        fwGXcGV0R6egcJQjcZ3Jlzwi0opY5bhDf2JIlqLX+UVDLtshNFGphiIX4qUplaoFWJLDyFsXMX+Jz
        N2V/BTYOJP/5c3XIGBsSp/sERGRENLwS3zMrJKuWmb2worpJgOMWKEJv2JHoLEv76RLz9uG0BxTNz
        ETSZCXLNZoQVCKwNXNAgp8hSXJylBFKTrzgd7BFV4w/6SVDRTQt8vq7YWl8y6I0hN1i5MGQPjCqG5
        fpJA2jWg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kA0V4-000412-Js; Mon, 24 Aug 2020 00:38:14 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: submit-checklist: add Documentation clean
 builds
Message-ID: <e38b108c-afec-fd0e-ad09-b4dd5da59fd1@infradead.org>
Date:   Sun, 23 Aug 2020 17:38:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Add to Documentation/process/submit-checklist.rst that patch
submitters should run "make htmldocs" and verify that any
Documentation/ changes (patches) are clean (no new warnings/errors).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/process/submit-checklist.rst |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20200821.orig/Documentation/process/submit-checklist.rst
+++ linux-next-20200821/Documentation/process/submit-checklist.rst
@@ -24,6 +24,10 @@ and elsewhere regarding submitting Linux
 
   c) Builds successfully when using ``O=builddir``
 
+  d) Any Documentation/ changes build successfully without warnings/errors.
+     Use ``make htmldocs`` or ``make pdfdocs`` to check the build and
+     fix any issues.
+
 3) Builds on multiple CPU architectures by using local cross-compile tools
    or some other build farm.
 

