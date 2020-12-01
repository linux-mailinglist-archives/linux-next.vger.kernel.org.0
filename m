Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA7A2CA12E
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730536AbgLALVx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:21:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgLALVx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 06:21:53 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C3CC0617A6;
        Tue,  1 Dec 2020 03:20:56 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r3so2076390wrt.2;
        Tue, 01 Dec 2020 03:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9xB6jpQ1dsAogT6mePqvIYF3ajbV+M7gp0Sr2YTDj9A=;
        b=hIWgKicd3POhihx6aSjmdvFyZtZNog6I0NTUrWu27eGBxa/xY8MbkkRPYzt3HgQSTp
         a8iPQtgTe6NThFATBvZ0dERCLpt+HltFYthdRiYkAKxJqMkh8xBnpjwRPdouIlgkg8oO
         BOLFypKYtXvVwWOPwc/a1qpsCgeS8p0CVdx3W36ZH91aDX6wY4hj93q46KD63iny2ARE
         RbvKewAOKVOPtFP4Pxl57S0hqI6PGFqtSP9+V1DSGd4xwdJCtAc07lWs93Usp75Mq/aC
         mKM48NsS+1T97dN1W/n+E/yPSSNiXdXs8b4vvTl3E+hAArfX1jbVnoYhC14fSdiM/g/Z
         3yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9xB6jpQ1dsAogT6mePqvIYF3ajbV+M7gp0Sr2YTDj9A=;
        b=oLGSAsqK9d9U3c6wknUPZtX/fjlNArsx5fEhpW21P8ZhsFS8754yJyCbqmzrGeqIDF
         biM9NRKUxuz0e3TkEq4vbAZrbW/ZduwCXJS3HB/g9T+uzjMuH4E+YbBlexj3nqFpjHQt
         JhLI3GXnYLr7a2aOoGMtaDOWX2NlUgY2EeprTFfB9xw9B/k/lDmdbgG5OLYcsP4asbIW
         Kg+ezD0AQyZ/OS4OxAIvBlc3Xbr3K20Pw3PWKQkcURPkOvIFPcwTEopUSSnXzRMJWTZ4
         8PErWEdtUXH3eOAZAcuGdJGECdnJxwDnmF4e+Ztv9dvYKh2110t/d5A2FbOfRi5bbNnj
         M8Xg==
X-Gm-Message-State: AOAM532GltxL7RCOhn1Mgnvnv+FNRaO6KjIrCVhSs+Ipe+tijrfN4bXz
        NYjB1pP4/aN0wFhtzq4L9EPQ2etcSkA=
X-Google-Smtp-Source: ABdhPJyKwNioOgi4gSvY+MjCU1Vg1wqXLyIYIdU1K+z6KF9fmjlHJM0J+oqTB3uC6U9EKweIRijPCg==
X-Received: by 2002:adf:f608:: with SMTP id t8mr3296753wrp.72.1606821655054;
        Tue, 01 Dec 2020 03:20:55 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id v20sm2223818wmh.44.2020.12.01.03.20.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 03:20:54 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH v3 2/2] phy: ralink: phy-mt7621-pci: set correct name in MODULE_DEVICE_TABLE macro
Date:   Tue,  1 Dec 2020 12:20:51 +0100
Message-Id: <20201201112051.17463-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
References: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Correct name passed into 'MODULE_DEVICE_TABLE' which was wrong and
was showing a warning when the driver is enabled for 'COMPILE_TEST'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index db79088d5362..9a610b414b1f 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -335,7 +335,7 @@ static const struct of_device_id mt7621_pci_phy_ids[] = {
 	{ .compatible = "mediatek,mt7621-pci-phy" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
+MODULE_DEVICE_TABLE(of, mt7621_pci_phy_ids);
 
 static struct platform_driver mt7621_pci_phy_driver = {
 	.probe = mt7621_pci_phy_probe,
-- 
2.25.1

