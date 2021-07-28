Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF373D938D
	for <lists+linux-next@lfdr.de>; Wed, 28 Jul 2021 18:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhG1QtG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 12:49:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhG1QtF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jul 2021 12:49:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AF1260EB9;
        Wed, 28 Jul 2021 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627490943;
        bh=FKqbqCd321Vu1qA1WxXaxi8ArsIJvFzWb9kp8ZOmwMk=;
        h=From:To:Cc:Subject:Date:From;
        b=H/9sm8PTk+VoIljeox2RDuudekoouVrSp33e2Zdv2061pbDYGzMTFOhSqQz52l/FY
         mc0R/OLWt+SUQ0s1oZ96JFjxGaWhHGdloz/xCh7Xrsf6ErkFg8Hsfy9fzrhyFgz4nX
         g0fR45atZzpbk92CMrkXXyUQLmuEKaRsd0IkZfb7PPO9Lcs4+Zxuar3eyJbZIMnx7D
         W3tqGe1G9JdxiERZdrDgDIRtoGaODKrfNpHHrX3Ow/JJ6eUvvNJHaHgj+I/OzLlaff
         fNQowHh3dkuPPwjJ2qwmW90uJlb4QvKlBTVtfLnJxtEksUXdTntqD7Gq1lQyk6qeh4
         bKXfvkM3+O9uw==
From:   Mark Brown <broonie@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date:   Wed, 28 Jul 2021 17:48:47 +0100
Message-Id: <20210728164847.46855-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

After merging the drivers-x86 tree, today's linux-next build
(x86 allmodconfig) failed like this:

error: the following would cause module name conflict:
  drivers/misc/c2port/core.ko
  drivers/platform/x86/intel/pmc/core.ko

Caused by commit

  29036fcc92b22d ("platform/x86/intel: intel_pmc_core: Move intel_pmc_core* files to pmc subfolder")

Since there was nothing in the branch yesterday I've just dropped the
tree entirely.
