Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EDEE7C9F
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbfJ1XCg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:02:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38031 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfJ1XCg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:02:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id c13so8026411pfp.5
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DMl9+wXyX1AMLbIbbk3o7UqyKS77qUkQwtenY4PX98o=;
        b=H07WOjhYkWsDKqqLoMFNP4mNsckdI0TmWH6TF+3upEwzhMbo8Skj1h9xXV4MZsTy4W
         x+sxY2gwzN8s/e+1WnWESjHVoN60kexS5WoIxtwKpi8UHhEipVRVGp7SibpXFB23EK+P
         aUdjeoBAW0vP7dZdeloJZXC1EtFIyldrrkH0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DMl9+wXyX1AMLbIbbk3o7UqyKS77qUkQwtenY4PX98o=;
        b=ZiaRLvachcIki6R2wiBFvbuIev8ZS0TBv91k9ji5XsF0GO1na5XfkShaWhlMdDBQFM
         /GHvs9atZTS/FcTPtOsHB9DBEtSneQT18bhUDOml9XJKr2E2Ud2VagjwwcuVy4QcmECV
         bqmyIchgTzI1J/pO12ljQQUcmUjSMkQtKyNPoaFRI45wgieXi1xZMuVyc9tXQr6fE7S7
         nwI8RA39g8gjsQTou+QIULqzCgzVXvw6cjNFo1Rz459vcPClSBhDSmxbbulFXvJ7mxlr
         Vpupq7sKXCN3jGVNpHhUHo3K4L9OXDCu7CLQxFX8lUXp9sjuJTw2FcBkYbf5Y2E0kevD
         0WfA==
X-Gm-Message-State: APjAAAXP0MQTA/nPEFGNJjN0sg+4c7AkVffDdCXNPex9GkQRWV3m24QE
        UgV2SKcwbVPbyTSDXbNafUXCmA==
X-Google-Smtp-Source: APXvYqz7vbpBSaetZlZj+c0Gueb6V2ruCJAHx1fy7PljVxfOxN9rXAd6sQG+V8x6L8QandSaBFonQw==
X-Received: by 2002:a63:eb08:: with SMTP id t8mr24233131pgh.49.1572303754193;
        Mon, 28 Oct 2019 16:02:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f5sm470535pjq.24.2019.10.28.16.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:02:33 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:02:32 -0700
To:     Joachim Eastwood <manabian@gmail.com>
Cc:     Brian Norris <computersforpeace@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: nxp_spifi_read_reg(): Integer handling issues
Message-ID: <201910281602.801D870@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191025 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")

Coverity reported the following:

*** CID 1487374:  Integer handling issues  (SIGN_EXTENSION)
/drivers/mtd/spi-nor/nxp-spifi.c: 138 in nxp_spifi_read_reg()
132
133     	ret = nxp_spifi_set_memory_mode_off(spifi);
134     	if (ret)
135     		return ret;
136
137     	cmd = SPIFI_CMD_DATALEN(len) |
vvv     CID 1487374:  Integer handling issues  (SIGN_EXTENSION)
vvv     Suspicious implicit sign extension: "opcode" with type "u8" (8 bits, unsigned) is promoted in "opcode << 24" to type "int" (32 bits, signed), then sign-extended to type "unsigned long" (64 bits, unsigned).  If "opcode << 24" is greater than 0x7FFFFFFF, the upper bits of the result will all be 1.
138     	      SPIFI_CMD_OPCODE(opcode) |
139     	      SPIFI_CMD_FIELDFORM_ALL_SERIAL |
140     	      SPIFI_CMD_FRAMEFORM_OPCODE_ONLY;
141     	writel(cmd, spifi->io_base + SPIFI_CMD);
142
143     	while (len--)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487374 ("Integer handling issues")
Fixes: f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")


Thanks for your attention!

-- 
Coverity-bot
