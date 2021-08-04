Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62C63E03FF
	for <lists+linux-next@lfdr.de>; Wed,  4 Aug 2021 17:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhHDPRE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Aug 2021 11:17:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:43802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237114AbhHDPRD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Aug 2021 11:17:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B25560EC0;
        Wed,  4 Aug 2021 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628090211;
        bh=sZdBm64oNa6ad4bs2WSq6e1ECnmS9Cfiytt3Mi02do4=;
        h=From:To:Cc:Subject:Date:From;
        b=ne0FV/Uz343NMgMAqavZ1wAoTj0FHCabTYbdWQv8Q2+0YYq5DjtC0d/Bg4saK+Q0m
         OLOXoUTXG1NwoRz0UCCgQflVed/FX33WB9L2Dg/3+vn9vbdjFGbMp/ek11i2cc3PwD
         or/lIiAMJb/neBKNrYh1FvozxR/VS+Q77cDaw+zoNxQ1d4RmYzeK+GRBa2SFyQnmRA
         cuJCDCyTa3UrYR4pxtRSVRBzdnLiJ4rAsZ0HrlDbce9fap0HMRtibJE+PqSBve+W/8
         DXXY0ghkrZprPKO7S4RSPeceMmEm/hUoUaQ9bYPuwYAxK4vrYeCyPIO0k1HOEJrdMj
         D4rzgqcyq6Cjw==
From:   Mark Brown <broonie@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: linux-next: manual merge of the mhi tree with the net tree
Date:   Wed,  4 Aug 2021 16:16:34 +0100
Message-Id: <20210804151634.35887-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the mhi tree got conflicts in:

  drivers/bus/mhi/core/main.c

between commit:

  ce78ffa3ef16 ("net: really fix the build...")

from the net tree and commit:

  51caa4ed8542 ("bus: mhi: Add inbound buffers allocation flag")

from the mhi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/bus/mhi/core/main.c
index 84448233f64c,c67fd001ded1..000000000000
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c

(the net tree added a blank line 1460 with a tab and the mhi tree adds
the same line with no tab)
