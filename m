Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0221E13141D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 15:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFOxt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 09:53:49 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33068 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgAFOxt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 09:53:49 -0500
Received: by mail-pf1-f193.google.com with SMTP id z16so27090412pfk.0;
        Mon, 06 Jan 2020 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YhQDamaD2tNdmc+V00meTK3ORRFRFdzBTdJOGSQGU3w=;
        b=qN/YmmVlqcMs6bjhH0TQKxVmMSiaYC/KTjHDLMQ1juGRg/rC/F+l7b9g0jqb1A9ZEe
         P++6gN1aSXwUAH5nLt5AKZFDJJWcpF7fj5nMeVyfZKo8NT1cro8LRZxZmsLOysBlawfe
         dWGrF9COCIeIf5Bjo0i7GBlZgCT0SRzP5pEAGlFs/U5m7d01xQmB3iGgS+UneBuregtY
         JOb9uOawmtLcwZfre20gC8+6ajR3WnrJY1jt8n/yvohaklvwQHADGpfne98M3v/CKmUC
         bm11mc4TuOave3+pTojj7Ltj5FonDJ5whibztnkmErqVDz3+c85fxt/+dC9uKXcca3we
         awtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YhQDamaD2tNdmc+V00meTK3ORRFRFdzBTdJOGSQGU3w=;
        b=YPxdozV0JkICN4nGL7wBB2mH9a7D2gp1gSp5mXNXf9w9Gw0U95kWionTxnCr7BUVCt
         6CMYjLKv7JWbOB9PDtKHs618rabArlYrgFBn4nk5H5iwF3LwS/hBqEQQHj4wQuReu3NP
         5k6ZLMiYdz9DFI2Sg7YxrvTKZxdD9PL3n17cj6NCbtUjInyliFmmmpNuGPj+gfhV92MI
         KqiNTebNKwKjdJ7I+u++u22J3KxBx3YBtQHIHbqMViFlFFzwKeTHecyo09zJ/hLnmp/W
         4xkGmOz7o5+fequGk9WJk+q02zAmY1XAuhXmwwlC6XEFmfQWZ0zUZzfF0Vc2n+j1SLCL
         Q0iA==
X-Gm-Message-State: APjAAAUKU4yi5svrSLWKetm5UTt9Pyq/WXG30e6C2nGwUyDCjRpEZtIO
        HLPmx2lUfbH1mcrxci5WNJuGpsL4CII=
X-Google-Smtp-Source: APXvYqxEyTjAmMLLrt4adDCZ6oS0TylD6XosUAW+7ur1eAZcA8/6Y5ZBwOvFxGH7WHSpZPvd8ieAhg==
X-Received: by 2002:a65:4d46:: with SMTP id j6mr113572562pgt.63.1578322428186;
        Mon, 06 Jan 2020 06:53:48 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id j8sm51602193pfe.182.2020.01.06.06.53.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 Jan 2020 06:53:46 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Stanislaw Gruszka <stf_xl@wp.pl>
Subject: [PATCH] iwlwifi: fix build warnings with format string
Date:   Mon,  6 Jan 2020 23:53:09 +0900
Message-Id: <1578322389-13716-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200106171452.201c3b4c@canb.auug.org.au>
References: <20200106171452.201c3b4c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This fixes build warnings introduced by commit "iwlegacy: use
<linux/units.h> helpers" (iwlegacy-use-linux-unitsh-helpers.patch in -mm)

The format '%d' has to be changed to '%ld' because the return type of
kelvin_to_celsius() is 'long'.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20200106171452.201c3b4c@canb.auug.org.au
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/net/wireless/intel/iwlegacy/4965.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/4965.c b/drivers/net/wireless/intel/iwlegacy/4965.c
index 31b346c..34d0579 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965.c
@@ -1611,7 +1611,7 @@ il4965_hw_get_temperature(struct il_priv *il)
 	temperature =
 	    (temperature * 97) / 100 + TEMPERATURE_CALIB_KELVIN_OFFSET;
 
-	D_TEMP("Calibrated temperature: %dK, %dC\n", temperature,
+	D_TEMP("Calibrated temperature: %dK, %ldC\n", temperature,
 	       kelvin_to_celsius(temperature));
 
 	return temperature;
@@ -1671,11 +1671,11 @@ il4965_temperature_calib(struct il_priv *il)
 
 	if (il->temperature != temp) {
 		if (il->temperature)
-			D_TEMP("Temperature changed " "from %dC to %dC\n",
+			D_TEMP("Temperature changed " "from %ldC to %ldC\n",
 			       kelvin_to_celsius(il->temperature),
 			       kelvin_to_celsius(temp));
 		else
-			D_TEMP("Temperature " "initialized to %dC\n",
+			D_TEMP("Temperature " "initialized to %ldC\n",
 			       kelvin_to_celsius(temp));
 	}
 
-- 
2.7.4

