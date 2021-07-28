Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA653D8E10
	for <lists+linux-next@lfdr.de>; Wed, 28 Jul 2021 14:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbhG1MnR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 08:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:44286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234759AbhG1MnQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jul 2021 08:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADB7A60F9C;
        Wed, 28 Jul 2021 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627476195;
        bh=Gsg1jrEEwhKgw10WMa7bDBrN6VmhryIEfCoYsaT7HQc=;
        h=From:To:Cc:Subject:Date:From;
        b=aw2x60ZH/4rkQ7KJEjnT6kq6mqK8P3Sy+/w7BX+FIlOqE/XYGPlOkbN7nh80oLX7y
         6eY13lnlQpHCuCGNCp6S2b8CVK/IsRYOCjy7gUz8lP6bIggZhHEnsEN9Odf/vvuwfB
         YiiO5jc+ErGE6ADWydpWGn1cxx7CJNTyIHgzKNPgCPCeToByD4Szfs2aINkmZsNFGX
         7K+ua8RU/WvR9AUB0F/g4zurOfpy0XLUMw8USsec0ZPfqrwKBt+Gu8RTAVEKGICZ7j
         U1Y4/vSO5MdUx96wAmGlES5jKqAUhOqyuR80qwZyXWzKx8uIq+e5EbVGzQYLIdzvZ/
         PW+0QB6jZNrwg==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>
Subject: linux-next: manual merge of the devicetree tree with the clk tree
Date:   Wed, 28 Jul 2021 13:43:04 +0100
Message-Id: <20210728124304.1199-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml

between commit:

  d18eb76bbd69 ("dt-bindings: ARM: Mediatek: Add mmsys document binding for MT8192")

from the clk/clk-next tree and commit:

  cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 2d4ff0ce387b..f9ffa5b703a5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8167-mmsys
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
+              - mediatek,mt8192-mmsys
               - mediatek,mt8365-mmsys
           - const: syscon
       - items:
