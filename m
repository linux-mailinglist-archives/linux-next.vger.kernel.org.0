Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DAD13AD22
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 16:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgANPIc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 10:08:32 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42521 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgANPIb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 10:08:31 -0500
Received: by mail-pl1-f193.google.com with SMTP id p9so5340906plk.9;
        Tue, 14 Jan 2020 07:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8rpa2DTMKBUpU7PSeVZCOwWKjfcl4QZLI8268nb9OR8=;
        b=kS4cMATDa920zQP8KA/lx981IvG+CXVpSkc3ZJlJ1Ks9JvZdBHh8aSSkFhVL0VUtTG
         jsnSfIOqN3G3C2Fj2ZZ+Nntre/yPcKxof2GVsDNBEM1LxOny7J9SnLimP4mDegbVgw2f
         LWfDSqXZSDCMbVlziyz4HooiolDkY0AX0F1y5dtlElraiXky49ppMZhim3Zy3fHgVkMm
         zQ0JGPC7QpXsXmgGIJtXFINWGPLj193T0oci+P4j1ophKfUbhsWhUq9qsvOUBJ4XIExn
         CRaRAIS4BEIIEeJ06r4Um4bfMQZJ3o3pIFy6pVyHgMzZ+ziXBm1tBEV0eHAUvh3rmIYG
         V/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8rpa2DTMKBUpU7PSeVZCOwWKjfcl4QZLI8268nb9OR8=;
        b=RQZMEVn/QgullKlAzZwD0dEc5QOClMhoDOTfSbhck+x09QiyRj9c+1zxOLYmmnZS49
         KQ66c2FSccbqjzjYbDGHCjkLuHMyMTgW8TCSpr0PQa5YCMzm4bUrA13UjUTD6ms9gkT9
         6GEEFoInFUmzpiiXWJe/JjlTP/+gV2YNjSUSdt/RIisQZFJADvFkO5A/vWpT4Fm7TUss
         NBrrHSFKu1y5ME5hi10k+z6P1vxfzj+lVFWpMvFqvKwhRaklB3XFAxN5E576izg302SG
         XEY//R5tsrVnjTlJSWidVAr68ghbGU6uGBYAW7A1FRq4Bg4l/udjApT8vmFyM0rw2768
         TemQ==
X-Gm-Message-State: APjAAAUa1XsN3a4Al4N8VlJ0fHmeQHN9y9mCCQZlST7nthC78YJjVsip
        M0OkFiF+f9Pub3lE9jhQtrcZ2WFa
X-Google-Smtp-Source: APXvYqyDn+HL5CnYDQ8AsxYxY/88v+ejGsozlp0bvsuT6W2fd+zvkxwg2c1UX5ValvbuAnNoBO/GZw==
X-Received: by 2002:a17:902:9698:: with SMTP id n24mr20469473plp.312.1579014510423;
        Tue, 14 Jan 2020 07:08:30 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id 100sm16964654pjo.17.2020.01.14.07.08.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 14 Jan 2020 07:08:29 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        linux-next@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Stanislaw Gruszka <stf_xl@wp.pl>
Subject: [PATCH v2 -mm] iwlegacy: fix build warnings with format string
Date:   Wed, 15 Jan 2020 00:08:03 +0900
Message-Id: <1579014483-9226-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
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
* v2
- fix subject line (s/iwlwifi/iwlegacy/)

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

