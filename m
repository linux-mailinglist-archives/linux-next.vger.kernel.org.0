Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C47352129
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 22:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhDAUyu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 16:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbhDAUyp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2021 16:54:45 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8B4C0613E6
        for <linux-next@vger.kernel.org>; Thu,  1 Apr 2021 13:54:45 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id g10so1602303plt.8
        for <linux-next@vger.kernel.org>; Thu, 01 Apr 2021 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3z2metKqf8UpK/KqjwRaU+L+HAo616WhIctrjhu2LXA=;
        b=c/Oo1vL1WEq3adFfRG81ukYLlevdJ6zCA+rO5XJLW7jT3nzhZTFPu4Wvujd8/iJEZM
         wNdZKLEIYc3lWoFt63TOBIi5lfeKkT65f3ELa3PZ2J4JvqBcQ2A25SuUUUORMjlXivSz
         uRPHr/BwiBgldbJzMzr1cgFZNSaV1YiSAfWFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3z2metKqf8UpK/KqjwRaU+L+HAo616WhIctrjhu2LXA=;
        b=duexU2b5uvELMcCynDq68cJ0cf5hqOI7K4futsYSH1Gohv0kkR/uD/SRmk8TscAmd2
         5xCPAcFELf2Jbgi7F2lMP/QAc76ssrlcGvARj/XyRbhUuJq8vEtctDccAni0zF/jV8yo
         V6KD+q4xnfTkXOU15g7+kImjvHH8y0rqcbBO7uPhpMG+Lu5llpU6yVVDQeMti8dbT/Wq
         9lC5nLAlNGe9u0honhaHuLWKHWbS9sr8ia8ACrsclLuZ1T/Z9vUrjWJGmrh7vk1oUIMP
         i65cCWhd5isTe2eugkSvX/tLZhqfB+rUOgAnlmMw8RXykbJ3F1B7PSKtChdzlFvvP5ZX
         rEGQ==
X-Gm-Message-State: AOAM532MsfXiiQ7fwZw1Uy/MDhjs9DACW8jQmIab7zJCaqOkNugXIagZ
        SLxMCMaTYG9R9Aqsc07OPlVIAw==
X-Google-Smtp-Source: ABdhPJxUB73Vo4zx6kad5OfIC/xsgO1hJUHdEbFmHx1r/qAljax/7pnuyE25doyRxvQsEHSwrqUAfg==
X-Received: by 2002:a17:90a:c20a:: with SMTP id e10mr10201331pjt.221.1617310485188;
        Thu, 01 Apr 2021 13:54:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u2sm6241430pgf.93.2021.04.01.13.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 13:54:44 -0700 (PDT)
Date:   Thu, 1 Apr 2021 13:54:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Swapnil Jakhade <sjakhade@cadence.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: cdns_torrent_derived_refclk_is_enabled(): Error
 handling issues
Message-ID: <202104011354.5048ADC6D@keescook>
References: <202103311458.B02B4B13@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202103311458.B02B4B13@keescook>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 31, 2021 at 02:58:33PM -0700, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20210331 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   None
>     2cca0228f364 ("phy: cadence-torrent: Add support to drive refclk out")
> 
> Coverity reported the following:
> 
> *** CID 1503589:  Error handling issues  (CHECKED_RETURN)
> /drivers/phy/cadence/phy-cadence-torrent.c: 1678 in cdns_torrent_derived_refclk_is_enabled()
> 1672
> 1673     static int cdns_torrent_derived_refclk_is_enabled(struct clk_hw *hw)
> 1674     {
> 1675     	struct cdns_torrent_derived_refclk *derived_refclk = to_cdns_torrent_derived_refclk(hw);
> 1676     	int val;
> 1677
> vvv     CID 1503589:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "regmap_field_read" without checking return value (as is done elsewhere 101 out of 117 times).
> 1678     	regmap_field_read(derived_refclk->phy_pipe_cmn_ctrl1_0, &val);
> 1679
> 1680     	return !!val;
> 1681     }
> 1682
> 1683     static const struct clk_ops cdns_torrent_derived_refclk_ops = {

This happens in /drivers/phy/cadence/phy-cadence-sierra.c: 442 in cdns_sierra_pll_mux_get_parent()
too.

-Kees

> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1503589 ("Error handling issues")
> Fixes: 2cca0228f364 ("phy: cadence-torrent: Add support to drive refclk out")
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot

-- 
Kees Cook
