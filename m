Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFBF13E28E2
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 12:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244996AbhHFKsx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 06:48:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231627AbhHFKsx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 06:48:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A955600D4;
        Fri,  6 Aug 2021 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628246917;
        bh=K7xSW1BrPtsORLTEfeXSn9ivIG1WzzGR6n91TTw+1uk=;
        h=From:To:Cc:Subject:Date:From;
        b=T2BsGEgfH2Q9ZDOvY5ShbZZtBpwkY8OYtxCeB7WohECeAMVaEDBmQ66cKKrOS2Bmr
         ypAIHABLopzFwBxBSo3w9pvXz8PHjnKRtGRFkn3JqnobHr04xoHNDtFYUeTJZIyHQG
         uTR8GB6yVUkjcmrMkLvalnphzl1ygl0xS684iMBARi4zjeEL7Mqjg0ug1mYibdtp5I
         43+5dLQKZIrmC8s+glAqK4r06Y5zDcZW8/nHHfrFRN2UHw8EJm9h4tbs+WUUWNW5cq
         OEthq1rSo+QiJEAcjKIW1LZCvEgBHbLpNaEjaZtLZ+axPAucRq84L9Ll27lwTCgT5t
         NN1Ooo2bhnMdQ==
From:   Mark Brown <broonie@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: linux-next: manual merge of the qcom tree with the usb tree
Date:   Fri,  6 Aug 2021 11:21:38 +0100
Message-Id: <20210806102138.27373-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm64/boot/dts/qcom/msm8996.dtsi

between commit:

  1f958f3dff42 ("Revert "arm64: dts: qcom: Harmonize DWC USB3 DT nodes name"")

from the usb tree and commit:

  9da65e441d4d ("arm64: dts: qcom: Add support for SONY Xperia X Performance / XZ / XZs (msm8996, Tone platform)")

from the qcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/boot/dts/qcom/msm8996.dtsi
index 78c55ca10ba9,31686950004e..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
