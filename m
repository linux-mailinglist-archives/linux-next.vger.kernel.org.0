Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961723E2C47
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 16:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhHFONp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 10:13:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235485AbhHFONp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 10:13:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD852611C5;
        Fri,  6 Aug 2021 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628259209;
        bh=pQ865Q4sX30TZz9yJEK9ucr+Ft03RkQ52dLK+GbcGKE=;
        h=From:To:Cc:Subject:Date:From;
        b=ERgysFFPiCZ9YnqZDv53bDg4Z6/0JghiR0lGOLgGN8cp/8303V9vSV+CSH9HuFdVb
         QZyhD4s0RQ0eXUq5jEJhW9qOIOVJ5JySQgsvCl2CwtnMms2x4ZLc7oFtUCWqaUPLeK
         TVE+wLyDSqHWZBwfn4XPYAnF157yWYh+fnZ1koVIBBnCOz8IDz89esLAEoAEti12dA
         ad5GYpjLrApp8LjhrX/6cEspwWQ+j4dqmOqFsSgKJYfyKpx9UCGxDw0OMOZrMDuVOi
         +9Pr+jmtUN5uqd/Bu7HrcQz69bEWv/w3UnO/EwRdhoHlBy9JTcIhfyQCIkVRsUNktH
         dy04PVnKVqZhw==
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: linux-next: manual merge of the usb tree with the qcom tree
Date:   Fri,  6 Aug 2021 15:13:12 +0100
Message-Id: <20210806141312.23309-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  arch/arm64/boot/dts/qcom/sc7280.dtsi

between commit:

  298c81a7d44f ("arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card")

from the qcom tree and commit:

  bb9efa59c665 ("arm64: dts: qcom: sc7280: Add USB related nodes")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d086178,cd6908f3fd09..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
