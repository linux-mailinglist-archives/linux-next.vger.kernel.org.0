Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683DD38E231
	for <lists+linux-next@lfdr.de>; Mon, 24 May 2021 10:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhEXITr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 May 2021 04:19:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232279AbhEXITq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 May 2021 04:19:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C6A1610FA;
        Mon, 24 May 2021 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621844297;
        bh=AlVcLQHTxNloRwDWsV+rNVmvKSeCiwHEajO/2kgia10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jxT3W7cNdTS6rash1fRa+9EOMXQ3xdfHj2CTpT7I4rdZgj3yPhh5je5scL3bS1idH
         u6n/LG6KtpZjW52stfGjY3XKuf+/pCmTNiHq05855UigNExzdYwnQMxKHQZWWtm9m3
         4yOp2QvWwHJS4ro/cd6eIf2zBvJSzuF7jRi5dZPs=
Date:   Mon, 24 May 2021 10:18:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Luiz Sampaio <sampaio.ime@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] w1: fix build warning in w1_ds2438.rst
Message-ID: <YKthRzCGan9WEcmP@kroah.com>
References: <20210524161919.626b3344@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524161919.626b3344@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

commit c999fbbdcf77 ("w1: ds2438: support for writing to offset
register") added more documentation, but had a one-off line for the
header of a section which caused the build warning:

	Documentation/w1/slaves/w1_ds2438.rst:56: WARNING: Title underline too short.

Resolve this by fixing the underline to be long enough.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/Documentation/w1/slaves/w1_ds2438.rst b/Documentation/w1/slaves/w1_ds2438.rst
index 5c5573991351..4fa671fbc93f 100644
--- a/Documentation/w1/slaves/w1_ds2438.rst
+++ b/Documentation/w1/slaves/w1_ds2438.rst
@@ -53,7 +53,7 @@ from the slave device. If it is correct, the 8 bytes page data are passed
 to userspace, otherwise an I/O error is returned.
 
 "offset"
--------
+--------
 This file controls the 2-byte Offset Register of the chip.
 Writing a 2-byte value will change the Offset Register, which changes the
 current measurement done by the chip. Changing this register to the two's complement
