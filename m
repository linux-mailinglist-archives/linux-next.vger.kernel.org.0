Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D603DB9B1
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 15:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239081AbhG3Nx6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 09:53:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:46822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231247AbhG3Nx5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 09:53:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC96260F94;
        Fri, 30 Jul 2021 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627653232;
        bh=asftvaqZKAxKgDpzEbphWN/AE9bWu70isAH4OxawG3E=;
        h=From:To:Cc:Subject:Date:From;
        b=pTyy5qWkeMV5lwB/uhJGG8NSIrVB7IO4UMC1fo5PSm3eTTzWDTVXkAd/lsp5zvA5S
         nWy3Z5LiptkuFda7ljtDI2k0tXfBrCNFEWEIOUaorPAMvBomiFjjO0rd4rIK/9vpqw
         AIOMD5jOch3eg7Fo3mHOj5LNJ7korBIrMAHEbU6/dwiyoaV2qelL3aMAf5D+Ugc4WB
         U4bKqdpVbwZNFdn8Vl+cKy5KIm0y0UxgFAYDqKpCFrhWLXeHFHxMEaQOEHARmshEcK
         ddb9Ogc8WD0iOELrW3AbY1sJVu/EuuUbnh1zagn9PaP3N5TnslIJjVHqnQOpqZFufc
         U2QxzQ42obs7A==
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Phillip Potter <phil@philpotter.co.uk>
Subject: build failure after merge of the staging tree
Date:   Fri, 30 Jul 2021 14:53:40 +0100
Message-Id: <20210730135340.17863-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

After merging the staging tree, today's linux-next build (x86
allmodconfig) failed like this:

/tmp/next/build/drivers/staging/r8188eu/core/rtw_ap.c:22:10: fatal error: osdep_service.h: No such file or directory
 #include <osdep_service.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [/tmp/next/build/scripts/Makefile.build:271: drivers/staging/r8188eu/core/rtw_ap.o] Error 1
make[4]: *** Waiting for unfinished jobs....
/tmp/next/build/drivers/staging/r8188eu/core/rtw_br_ext.c:29:10: fatal error: drv_types.h: No such file or directory
 #include <drv_types.h>
          ^~~~~~~~~~~~~
compilation terminated.

Caused by commit

  15865124feed880978b7 ("staging: r8188eu: introduce new core dir for RTL8188eu driver")

I've used the staging tree from yesterday instead.
