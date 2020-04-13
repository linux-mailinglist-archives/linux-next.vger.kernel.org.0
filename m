Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AB31A69B8
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbgDMQUH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731429AbgDMQUG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 12:20:06 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA86C0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:20:06 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id i3so620871pgk.1
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7ioLMOC16DIjSqb9cCormr5iuj7QXF6Ym8x6iKFH1S0=;
        b=jpXlBmbUhK9zx4jc1Y3gHYpdQr22RC+9gM1ju7Qxp/EexI/g3J09VGaoikDjVA/E8q
         X7TGhlrmdqDsWjnI26AvXgNpaue7+3KNUf3Nze1IfdD2BGXqTDnfpnH29SEjJHEGPPju
         XL+fRpGQe+YD9EacLxpmUNoBJ382KYaVt8A08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7ioLMOC16DIjSqb9cCormr5iuj7QXF6Ym8x6iKFH1S0=;
        b=YflhRKW0gO1j8Qou4X4XfYTwBs+cqboLLigySKnj/+wdjP0pTt43V+i7WWyv6Wss8Y
         PeRj7/LKwmPr79rsBC/usb/JCvKgaHZ1zyWxvw8JYSqjyRzeUx537/lLuw4nw+ByfXFc
         POZDb8j74t8BJ6cUGIBLt6S1eFZ9Hvc9GZfQjzx93KOcHiSfdGLehaNtedn3eYbUmzUK
         uCCJxTvPVKffp4iSby648Atv7/jzdvk8LW2Vu8VOHANrXSYv2u8GeafmMDiHBljDk6SS
         ZcXdlRS3xokBJ08QBb7kY3s1/0yg1b1mVXrtn2zdSOo4zffkOVRT7E6YiW6+Y4HRwwD5
         C4mA==
X-Gm-Message-State: AGi0PuavNfQF7IIb61/aCEd0CLfnVY4bY9OWmz+aqjDmlanYurMECmMd
        ODK2BEsit2CUWzFpYn7aL63CZA==
X-Google-Smtp-Source: APiQypLfIcchQc4tV/o2Qq/eRXHjKq1o/bPz2peecZu56LunFl4uMY45iNwdWOnIfa9LqEMA4yk6Rw==
X-Received: by 2002:a63:2347:: with SMTP id u7mr7228162pgm.183.1586794805707;
        Mon, 13 Apr 2020 09:20:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o99sm1249619pjo.8.2020.04.13.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:20:04 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:20:04 -0700
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     "David S. Miller" <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: mv88e6390_serdes_get_regs(): Error handling issues
Message-ID: <202004130920.8FCC182@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200413 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Sun Feb 16 18:54:15 2020 +0100
    bf3504cea7d7 ("net: dsa: mv88e6xxx: Add 6390 family PCS registers to ethtool -d")

Coverity reported the following:

*** CID 1461660:  Error handling issues  (CHECKED_RETURN)
/drivers/net/dsa/mv88e6xxx/serdes.c: 958 in mv88e6390_serdes_get_regs()
952
953     	lane = mv88e6xxx_serdes_get_lane(chip, port);
954     	if (lane == 0)
955     		return;
956
957     	for (i = 0 ; i < ARRAY_SIZE(mv88e6390_serdes_regs); i++) {
vvv     CID 1461660:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "mv88e6390_serdes_read" without checking return value (as is done elsewhere 11 out of 13 times).
958     		mv88e6390_serdes_read(chip, lane, MDIO_MMD_PHYXS,
959     				      mv88e6390_serdes_regs[i], &reg);
960     		p[i] = reg;
961     	}

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461660 ("Error handling issues")
Fixes: bf3504cea7d7 ("net: dsa: mv88e6xxx: Add 6390 family PCS registers to ethtool -d")

Thanks for your attention!

-- 
Coverity-bot
