Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106513E0412
	for <lists+linux-next@lfdr.de>; Wed,  4 Aug 2021 17:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbhHDPXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Aug 2021 11:23:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:46884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238324AbhHDPW6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Aug 2021 11:22:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B5FC60C51;
        Wed,  4 Aug 2021 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628090566;
        bh=ovDUOoVhQtVbR5pY5X4EDSq5lR4QMG9dd1pLVfP4CTg=;
        h=From:To:Cc:Subject:Date:From;
        b=YSYRcWSHAVN+wB+yXKXj2JyMZlWEbGEPBI55wySVW7eJ3IOhy9/DL8MOrIkmW5Gui
         SLWIDrfaXWYMZURs8xMwMnA98Kow0WMjioAyqHPGkkuo/4JXJE68WQSerCA+Rq9J0q
         8WZvMv8hGg31y3n46MQjnc9ohg0nKKchc+XkNCDsJinjDZPxd+GftH3leKBXEIpnOa
         omkgLxtabH4wVSYM67FNGhSmFcm1sbCiU2gb8h53wm34ZMGZyCgxOs8gxgaD8U2dzr
         MJjd3/FZmpgTAF5yZpO3K98SpaTPt6/4uD6KIQrve0xwuB9H1eNaaNZT1nyznRaS3w
         om9ypZ40lxH8A==
From:   Mark Brown <broonie@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: linux-next: manual merge of the mhi tree with the net tree
Date:   Wed,  4 Aug 2021 16:22:30 +0100
Message-Id: <20210804152230.36220-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the mhi tree got a conflict in:

  net/qrtr/mhi.c

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

diff --cc net/qrtr/mhi.c
index 1dc955ca57d3,29b4fa3b72ab..000000000000
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
