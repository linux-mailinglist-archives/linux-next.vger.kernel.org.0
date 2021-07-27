Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DE33D7418
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 13:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhG0LPC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 07:15:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236301AbhG0LPC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jul 2021 07:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F184A619E7;
        Tue, 27 Jul 2021 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627384502;
        bh=SHNmjykDf+/IHH82HQeFn3YwhgbHyD3jCgQMSP69lOI=;
        h=From:To:Cc:Subject:Date:From;
        b=FcemJGhQdYRVe3m7zefdJe3mE01yPbdu6/pSiqD+oMEaq5E1aNeu92z8xkuJt2mn4
         BYrGadW6e+eWvW2kBIh0nV00K9vCimI23lU7GPwJoc86AlFhfdqrJrBawLDdXMUBY6
         8bPr9ULDjldPEZgZX+hz4YhIpl2+heI74hSgOQ2aGJ2JNrstig/1TVbN6027Hqc+Lg
         rTCNC2q/mQ9zEjxjNXxe9c+7eUUt9sToLS5lxW8Xc1BNL+U5d0nAyAPmy7WhXkB9yw
         Y7iVEA/EqL3qROZR3dzxFFFhZ6AgNjvub2Mp3ONnpaskP+RXXtzaT05rSWI+wnvu5J
         nHoNaG+LYge9g==
From:   Mark Brown <broonie@kernel.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zack Rusin <zackr@vmware.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm-next tree
Date:   Tue, 27 Jul 2021 12:14:47 +0100
Message-Id: <20210727111448.1443-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h

between commit:

  ebc9ac7c3dfe ("drm/vmwgfx: Update device headers")

from the drm-next tree and commit:

  be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 356f82c26f59,5652d982b1ce..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
