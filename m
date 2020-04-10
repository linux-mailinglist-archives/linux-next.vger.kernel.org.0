Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66CC51A4AEA
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 22:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgDJULM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 16:11:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40177 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgDJULM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 16:11:12 -0400
Received: by mail-pf1-f193.google.com with SMTP id x3so1207748pfp.7
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EvVNecBN3YEn+0hoTp9x2cM4QRogXsBzFjuvK1spABo=;
        b=PxBvYVGJAF6Hv4qWRQgen1oQFYhB6ifjWhwP1Vzu19BmxcMn/4UqEj4ShT+RR/z9hk
         QXVFVvz4HAmqfx3aP4yX3cUzOpIYUa6qAgAZ8Xq/GjOlViOljtXWloBzZ+V/tEKSuhjz
         Iiqh57ZGYk+Xap24GKy41zWRdY6Xs2aatgY7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EvVNecBN3YEn+0hoTp9x2cM4QRogXsBzFjuvK1spABo=;
        b=I0P6wcZpn77vrpRfIkrDTJZTuhL8H9gCi8UvDltWB/b8bp/HfCU+A7+9M33HvAlO65
         gnIUyz950iMVnmSSclK+AzCbPApLNR2UfhNP1hCHCUy1PB1H5O2yhwUbp7Z69aHvy+D7
         Wp8MzzTYtmFqVv89uW2ljSFrqNM8uv8Rxe/4Khoi0kB3n4fNDXy7Kffeg5CTmj+ctzwA
         DI0nVSm33rGUaXDdEv2TAWeWQAG1JVUsLX/pkU8UBDbBWV2j7In+Okg0S+p+8sgiSlLc
         rzzYiAI/uBq5J3G/z5lyqbxA/063C5QqsO2Q0R7vHo+vjoWLqXmIDFLEZ2rHtzInLJGO
         ZV6w==
X-Gm-Message-State: AGi0PuaWlN7A9ipUl1MarQbmx7um1vMoMs0kRtb0yrp2mHnGoaAUsLn6
        HOB0WqiMm5nnD0P0NsbIEL+BjA==
X-Google-Smtp-Source: APiQypKaxYeha5cWPybB06c1GraerI1iiyyz9K6NL/QaFEW0V/kC5FV/eFeTUrT+la4uyqF9apwZNQ==
X-Received: by 2002:a63:9a1a:: with SMTP id o26mr6208714pge.447.1586549470489;
        Fri, 10 Apr 2020 13:11:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s13sm2407000pfm.62.2020.04.10.13.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:11:09 -0700 (PDT)
Date:   Fri, 10 Apr 2020 13:11:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Boris Brezillon <bbrezillon@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Brian Norris <computersforpeace@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: nxp_spifi_write_reg(): Integer handling issues
Message-ID: <202004101308.FEF65E27BA@keescook>
References: <202004101300.C30EF3B0CB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202004101300.C30EF3B0CB@keescook>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 10, 2020 at 01:01:46PM -0700, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20200410 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")

This commit is from 2015. I see now that this might have gotten
re-identified due to a file naming?

a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code split")

-Kees

> 
> Coverity reported the following:
> 
> *** CID 1324209:  Integer handling issues  (SIGN_EXTENSION)
> /drivers/mtd/spi-nor/controllers/nxp-spifi.c: 162 in nxp_spifi_write_reg()
> 156     	ret = nxp_spifi_set_memory_mode_off(spifi);
> 157     	if (ret)
> 158     		return ret;
> 159
> 160     	cmd = SPIFI_CMD_DOUT |
> 161     	      SPIFI_CMD_DATALEN(len) |
> vvv     CID 1324209:  Integer handling issues  (SIGN_EXTENSION)
> vvv     Suspicious implicit sign extension: "opcode" with type "u8" (8 bits, unsigned) is promoted in "opcode << 24" to type "int" (32 bits, signed), then sign-extended to type "unsigned long" (64 bits, unsigned).  If "opcode << 24" is greater than 0x7FFFFFFF, the upper bits of the result will all be 1.
> 162     	      SPIFI_CMD_OPCODE(opcode) |
> 163     	      SPIFI_CMD_FIELDFORM_ALL_SERIAL |
> 164     	      SPIFI_CMD_FRAMEFORM_OPCODE_ONLY;
> 165     	writel(cmd, spifi->io_base + SPIFI_CMD);
> 166
> 167     	while (len--)
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1324209 ("Integer handling issues")
> Fixes: f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")
> 
> Human edit: this issue is also repeated again at
> 	drivers/mtd/spi-nor/controllers/nxp-spifi.c: 205
> and
> 	drivers/mtd/spi-nor/controllers/nxp-spifi.c: 138
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot

-- 
Kees Cook
