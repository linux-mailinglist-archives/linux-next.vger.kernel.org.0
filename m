Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8E23590CE
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 02:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhDIALH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 20:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIALH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 20:11:07 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F43DC061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 17:10:55 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d124so3008756pfa.13
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fyM+6ZwAO2t78cebvSHcvBRylwpbrAkPYUufSnFnIPM=;
        b=Q8lbvW/6LlEvDfegWYUTEzSqeAVj/0xMHLDhlAqOtbNOWYBQ8VP4Z0ibBrZP62wSmg
         /fEQjmClxJT/elLQp2TNV9zfvwKSqtJ6g1cGNhh0moEe/xk2oEapW8zMlh879KKLyIfp
         NvM1Y897WfndYJLTQa66xa5NTAlNmWAAcVDqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fyM+6ZwAO2t78cebvSHcvBRylwpbrAkPYUufSnFnIPM=;
        b=LPJaxHcMARDtPcIbdLPWBqzKW/lGn9uBZquRLwg0Hccg1dKDolJFnhXbRJOoID7fTe
         TcOmyhlGrtjES4PGRBqCnmMwEUFdFCeaINIpJCSew1X3C0b4ZcbuG989lMAPCWseRC0q
         ruD/rd2IOqexwm2MGdEqjsKbg+db64kZ+CKGJV1AFrhnxjCTjkFpzwi2E2vakMuzqFww
         gzHZkJNJXjD7XKr2eDVfdhgJ84swRil0aAfsIk7fmk3lWvOuzSV7qkouVarwgXGolT9j
         wpVRYBuDUFJ52zE0GKRj4ejKjzLKiiaIaIqB4sgsag+DhLdrh2du4+gOdGHOux7UqiKA
         NNQg==
X-Gm-Message-State: AOAM533/O/QaX5jDPPOKRjbONVDdcNFpabHa8DZ7T78ZkKXhOekPi9dK
        JKJf46VnwGERyzvAUytTu/5xPQ==
X-Google-Smtp-Source: ABdhPJyft4vOAo8dZuWN4tc/r8A1HSyaM2IP6nAmymHCTkbFCWkeGRCU5TJTSHnaf7rA5HSReqqGYg==
X-Received: by 2002:a63:4763:: with SMTP id w35mr10419514pgk.226.1617927054964;
        Thu, 08 Apr 2021 17:10:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x69sm469234pfd.161.2021.04.08.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 17:10:54 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 8 Apr 2021 17:10:53 -0700
To:     Marc Zyngier <maz@kernel.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: rcar_pcie_resume(): Error handling issues
Message-ID: <202104081710.38356CA16B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210408 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Apr 1 12:16:18 2021 +0100
    516286287d71 ("PCI: rcar: Convert to MSI domains")

Coverity reported the following:

*** CID 1503693:  Error handling issues  (CHECKED_RETURN)
/drivers/pci/controller/pcie-rcar-host.c: 992 in rcar_pcie_resume()
986
987     	/* Enable MSI */
988     	if (IS_ENABLED(CONFIG_PCI_MSI)) {
989     		struct resource res;
990     		u32 val;
991
vvv     CID 1503693:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "of_address_to_resource" without checking return value (as is done elsewhere 98 out of 104 times).
992     		of_address_to_resource(dev->of_node, 0, &res);
993     		rcar_pci_write_reg(pcie, upper_32_bits(res.start), PCIEMSIAUR);
994     		rcar_pci_write_reg(pcie, lower_32_bits(res.start) | MSIFE, PCIEMSIALR);
995
996     		bitmap_to_arr32(&val, host->msi.used, INT_PCI_MSI_NR);
997     		rcar_pci_write_reg(pcie, val, PCIEMSIIER);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503693 ("Error handling issues")
Fixes: 516286287d71 ("PCI: rcar: Convert to MSI domains")

Thanks for your attention!

-- 
Coverity-bot
