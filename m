Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D411A4AE5
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 22:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDJUBu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 16:01:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36125 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgDJUBu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 16:01:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id g2so992075plo.3
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=z2YAD9IVfPBIEQ1M4lnt47VhmvYYJwcI4M9MbTl1i0Y=;
        b=GPcH5jt5xTWfx8usbCXBY7Myerl1ri5j/caJuS9DSUOn1ex8X2JUA2RgTbn0a0qU9b
         dzikRE5fCDrxRZZ9SqNZkgTRrISxKL5STRvJ7OEHJwiEoSYjzd3nPDzYzHpW+fihhNpb
         rsRnRZqZus9Jv0ObSYmCWA9Md0Z82h7uL8A7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=z2YAD9IVfPBIEQ1M4lnt47VhmvYYJwcI4M9MbTl1i0Y=;
        b=hpHSwPmQwcDdjnzHtf1pe6Yb8CNvhx8sF/dJuQXwzMQ6PvpSTAoo+l2z66iVE+cqq3
         k1/O2WW9dnlowfF0gk3iDIXIQOvvXBTsQ5CPFT4UUSR3ZSclR+rJUWI3Dj8iLyX+NIXj
         hvYi2N0qjjbz9aa7d8v7sCU+ZgVxeSOt4EDul5vP6Lh2jKyXFHIeIrosQ6TDV/dqgWYi
         mHWwppal8ZyjH6Y966MHqc/vScxl/CBE1tJE0612+PtgriSCAJOW01FDNo6KlCq70nJX
         R6xANxiXrUJn2qa+KOEndgWxdFxRriy6SieYvhzulI87s6FyiXSTibdSmpAqlFg8pA7G
         pUuQ==
X-Gm-Message-State: AGi0PuZBYBXA8VSw8KY9QMD2ozoq52LoOvtcQahF4fllZIFvyfIZn3ht
        lLzGOc4Q8of270D9E7PkUAHZ7Q==
X-Google-Smtp-Source: APiQypINRiJN+gzyO2A1z3sfP8drbNXSwEt01RDTHaqLGZ7IQBYFGbMlcqA/pjvbBuQtyc4ZXkgwhA==
X-Received: by 2002:a17:90a:734b:: with SMTP id j11mr7623948pjs.10.1586548908566;
        Fri, 10 Apr 2020 13:01:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b132sm2212977pga.91.2020.04.10.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:01:47 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 10 Apr 2020 13:01:46 -0700
To:     Joachim Eastwood <manabian@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Brian Norris <computersforpeace@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: nxp_spifi_write_reg(): Integer handling issues
Message-ID: <202004101300.C30EF3B0CB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200410 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")

Coverity reported the following:

*** CID 1324209:  Integer handling issues  (SIGN_EXTENSION)
/drivers/mtd/spi-nor/controllers/nxp-spifi.c: 162 in nxp_spifi_write_reg()
156     	ret = nxp_spifi_set_memory_mode_off(spifi);
157     	if (ret)
158     		return ret;
159
160     	cmd = SPIFI_CMD_DOUT |
161     	      SPIFI_CMD_DATALEN(len) |
vvv     CID 1324209:  Integer handling issues  (SIGN_EXTENSION)
vvv     Suspicious implicit sign extension: "opcode" with type "u8" (8 bits, unsigned) is promoted in "opcode << 24" to type "int" (32 bits, signed), then sign-extended to type "unsigned long" (64 bits, unsigned).  If "opcode << 24" is greater than 0x7FFFFFFF, the upper bits of the result will all be 1.
162     	      SPIFI_CMD_OPCODE(opcode) |
163     	      SPIFI_CMD_FIELDFORM_ALL_SERIAL |
164     	      SPIFI_CMD_FRAMEFORM_OPCODE_ONLY;
165     	writel(cmd, spifi->io_base + SPIFI_CMD);
166
167     	while (len--)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1324209 ("Integer handling issues")
Fixes: f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")

Human edit: this issue is also repeated again at
	drivers/mtd/spi-nor/controllers/nxp-spifi.c: 205
and
	drivers/mtd/spi-nor/controllers/nxp-spifi.c: 138

Thanks for your attention!

-- 
Coverity-bot
