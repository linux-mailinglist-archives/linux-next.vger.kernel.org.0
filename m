Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58547E7C9B
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730567AbfJ1XBz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:01:55 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:45397 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfJ1XBz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:01:55 -0400
Received: by mail-pg1-f173.google.com with SMTP id r1so8012199pgj.12
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=14VV+61LPmAUa1GF+7bepeKeGh0DuFXSoL64UDvjHo4=;
        b=J8fHzNwmsUeFR0sloacgd7qMx+gCgpFbUaezoXN01l401ZlZrSKhziOXyCmpZcaSjJ
         Y48KiTUVpLar2ImiMFN7vTwpRbtUwyoqVqjpNZ9aJQM8Xq+L8oqKvM6GGlcMFouiOG9q
         UFdxat/pG6pgmbq6TD5N95G2ktxuouke+dtqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=14VV+61LPmAUa1GF+7bepeKeGh0DuFXSoL64UDvjHo4=;
        b=pJYgEdoQksxNOblcEjJjLLmX1TO2Qo3Y05hK0hdSZA/qNDlFsRJZfm78agDIiYIY/d
         E5meK18ilKGXXQh9C/xH9gQdPC2+46Axy2/7sA0DCOazi6LXNRD+ro5K7NdRcOBYNSDV
         s8EKDB6ui+XvuVLZlq6ItcgrOjZCkgiKqrfFdsPhdPo/ZKa/OO7tHrpd1tURb2WbFYTm
         Bmb/iicnN0a6K0YGu5JLwPnus2DnV6PAKEWiLdi0qO+3Bu26TqfhwWB1mdWPfn9wA0fh
         wAVocFpVGRdzMBgczwrSQlQX5V5pCFBYYfnTb83Cju53V5DVGJV1J/WzL98YdWuRNZ/x
         y/Yw==
X-Gm-Message-State: APjAAAXLlQa6KYumSEf9K6of3nFxXHLvqCMk91WBTl4w3FJX1Ln6i6m9
        za5arzBbuqK0zv6zoYl5wA7sAA==
X-Google-Smtp-Source: APXvYqxe97ztmfZEpTk3zghSpnMkJIqZ66/inWemsMqiJsBRdp3nIEbI3/EnH9eoB/RI2KjqkyP3nA==
X-Received: by 2002:a62:3387:: with SMTP id z129mr23568433pfz.41.1572303714153;
        Mon, 28 Oct 2019 16:01:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r4sm4101374pfl.61.2019.10.28.16.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:01:53 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:01:52 -0700
To:     Vivien Didelot <vivien.didelot@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: dsa_switch_probe(): Null pointer dereferences
Message-ID: <201910281600.407E203F02@keescook>
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

7e99e3470172 ("net: dsa: remove dsa_switch_alloc helper")

Coverity reported the following:

*** CID 1487378:  Null pointer dereferences  (REVERSE_INULL)
/net/dsa/dsa2.c: 849 in dsa_switch_probe()
843     static int dsa_switch_probe(struct dsa_switch *ds)
844     {
845     	struct dsa_chip_data *pdata = ds->dev->platform_data;
846     	struct device_node *np = ds->dev->of_node;
847     	int err;
848
vvv     CID 1487378:  Null pointer dereferences  (REVERSE_INULL)
vvv     Null-checking "ds->dev" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
849     	if (!ds->dev)
850     		return -ENODEV;
851
852     	if (!ds->num_ports)
853     		return -EINVAL;
854

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487378 ("Null pointer dereferences")
Fixes: 7e99e3470172 ("net: dsa: remove dsa_switch_alloc helper")


Thanks for your attention!

-- 
Coverity-bot
