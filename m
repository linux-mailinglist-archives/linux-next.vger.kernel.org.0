Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F3F45A962
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 17:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhKWRAw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 12:00:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:52584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233536AbhKWRAv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Nov 2021 12:00:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A0E560F6B;
        Tue, 23 Nov 2021 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637686663;
        bh=MnkGe4UrT/ksLihVXxBCh7RZKPUAr5U2Cl+/95LiJUg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=bniQWLBLthyEi53MqDu0xIFE5C1snyTZJSSKfZkuGpQpldwDFwxNa4oPnHokOob5r
         DN4fspOkhybCzlgc+O98WnqR8FQ6HFl+iLQSXJMCxJBtF8o6VCDorYUQ0H3scUeJa7
         dNUBhheZHuHgLDxXYah4ph3E+fsSW0VSxMzBvRHf7ChUdXvLRyDZVPnJxteyK2jgpD
         fWoXHHoeHWxK6NsRYjW5LXxTWT8Vj9W2y0kTwKydAR30x5c/Q123o1CUrg0yHpEChW
         Oj8+c2sSL9POSZDzcxxI2rYcnQ5URPDJDLDIYE6rFQOGwNt2J2q83rJ7a12rKPt/Ng
         ChnoDyIM8hGqg==
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        heiko.carstens@de.ibm.com
In-Reply-To: <YZzEP3S7U15bTDAI@fedora>
References: <YZzEP3S7U15bTDAI@fedora>
Subject: Re: [PATCH] regulator: rohm-generic: iniline stub function
Message-Id: <163768666190.1388445.5938847019088932907.b4-ty@kernel.org>
Date:   Tue, 23 Nov 2021 16:57:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 23 Nov 2021 12:36:47 +0200, Matti Vaittinen wrote:
> The function rohm_regulator_set_voltage_sel_restricted() has a stub
> implementation. Linux-next testing spot following:
> 
> include/linux/mfd/rohm-generic.h:93:12: error:
> 'rohm_regulator_set_voltage_sel_restricted' defined but not used
> 
> Fix this by inlining the stub.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rohm-generic: iniline stub function
      commit: cff6f593251cdf5398dc3c57f7032b8e9dcb633e

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
