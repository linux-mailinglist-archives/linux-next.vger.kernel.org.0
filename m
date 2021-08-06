Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE553E2C17
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 16:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhHFOKs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 10:10:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235700AbhHFOKs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 10:10:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2589360E52;
        Fri,  6 Aug 2021 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628258978;
        bh=RfxbWQYQfGK3Y6LfgxAbUvVwpwj0WoPmTHvAVkw1ZP4=;
        h=From:To:Cc:Subject:Date:From;
        b=fIbwcUKLXPOamUGs+WFs0sH0HprG28Keb28w3mpi1QXk4Obay2dH0k6SmndW5QaUa
         AIfvOjtiarM2b7uXCuo8+SnFvF+ZKeVSbMUfGl6gZc7zxX8yIAGOEloa/XJj2UsgNn
         SS2ERtmBGGG7wQHgOy/LCzNaZF58dgQ4mX8QoERknOngJG3tZiIh/uY/OYAQlVlvvX
         ppaXCNJJGC6jSP4ICpzqghIZ06LYnGdV7lQ7jOD9ITt3ed2gn97ZB9eXirXgoshAzB
         JTtBSLltp1ykkaLq5BtDto0RPiNTF+kVLxVc0EYC55sbUMpNA7RNhsq48p9clE/bAk
         9Y6md3Kc0iP8w==
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        satya priya <skakit@codeaurora.org>
Subject: linux-next: manual merge of the usb tree with the qcom tree
Date:   Fri,  6 Aug 2021 15:09:22 +0100
Message-Id: <20210806140922.23050-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  arch/arm64/boot/dts/qcom/sc7280-idp.dts

between commit:

  7dfb52dcc5a4 ("arm64: dts: qcom: sc7280: Remove pm8350 and pmr735b for sc7280-idp")

from the qcom tree and commit:

  73cb0912894b ("arm64: dts: qcom: sc7280: Add USB nodes for IDP board")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22aff33d..894c3e92a0d7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -68,3 +68,62 @@
 		qcom,pre-scaling = <1 1>;
 	};
 };
+
+&uart5 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p8>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+};
+
+/* PINCTRL - additions to nodes defined in sc7280.dtsi */
+
+&qup_uart5_default {
+	tx {
+		pins = "gpio46";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rx {
+		pins = "gpio47";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
