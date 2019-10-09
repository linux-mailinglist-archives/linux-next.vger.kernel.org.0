Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2349FD0C10
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 12:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbfJIKBA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Oct 2019 06:01:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37080 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfJIKBA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Oct 2019 06:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=jOarO4Eh1p5RlVKQTdwkeSKmVo158ikbV07LA/3FdDo=; b=aCDZm1Nf3xp6
        igbdigKiPb3bn0i2AlS3zvwXQW0nA0XXHef4E/YVTznUtatHRZ1+CwWA+1MxFvZMeJp56FLz3wH1Y
        z7gggxhm3dwxt/C8wzzmClCEGH3R7xQJuxA0kRm7bXadp5pq5UtyDI44q/BcdlRNFj4kK1hXd7bfn
        Y7+Nc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iI8lY-0004Lx-4n; Wed, 09 Oct 2019 10:00:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 5E7B02741DF9; Wed,  9 Oct 2019 11:00:19 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     <alsa-devel@alsa-project.org>, alsa-devel@alsa-project.org,
        Arnd Bergmann <arnd@arndb.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: jz4740: Remove unused match variable" to the asoc tree
In-Reply-To: <20191008235212.228856-1-swboyd@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20191009100019.5E7B02741DF9@ypsilon.sirena.org.uk>
Date:   Wed,  9 Oct 2019 11:00:19 +0100 (BST)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The patch

   ASoC: jz4740: Remove unused match variable

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ad4abed36433a4fc18d21c0f0eaede84006f219f Mon Sep 17 00:00:00 2001
From: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 8 Oct 2019 16:52:12 -0700
Subject: [PATCH] ASoC: jz4740: Remove unused match variable

After commit 67ad656bdd70 ("ASoC: jz4740: Use
of_device_get_match_data()"), the match local variable is unused and the
compiler rightly warns.

sound/soc/jz4740/jz4740-i2s.c: In function 'jz4740_i2s_dev_probe':
sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' [-Wunused-variable]
  500 |  const struct of_device_id *match;

Drop it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <alsa-devel@alsa-project.org>
Fixes: 67ad656bdd70 ("ASoC: jz4740: Use of_device_get_match_data()")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20191008235212.228856-1-swboyd@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/jz4740/jz4740-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d2dab4d24b87..38d48d101783 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -497,7 +497,6 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	struct jz4740_i2s *i2s;
 	struct resource *mem;
 	int ret;
-	const struct of_device_id *match;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
-- 
2.20.1

