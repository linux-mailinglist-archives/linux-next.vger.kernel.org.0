Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DE61B4C93
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 20:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgDVSVb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 14:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgDVSVa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 14:21:30 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF3FC03C1A9
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2020 11:21:30 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id r4so1507683pgg.4
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2020 11:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0dAlAHSIUuf0qPGMLA5qpp+9T11jhaSHZ/cKKTKrM4M=;
        b=V5bg4mP/xsozi4qHrZsuvHSpaSRTCImgoMbp1/tPmUL6ige/esd1K5ellFdgIY82Wo
         CY7O+hyoUFbxGIOzzypXLWMqPfzUfwdfnEqIlueHZtHK/Q0GP2vGEz22J9quI7LQ7Mcg
         ts6d+2IeKIO/9gHi3QVMrJt8D51GiufpMCGnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0dAlAHSIUuf0qPGMLA5qpp+9T11jhaSHZ/cKKTKrM4M=;
        b=qWvBziVk8jdtRTIAxiUSDIM1bpExKNyjBNCkHlT5iotv/hWqlAQmOoS3CxlAlcpMrP
         Q8Mm9f52467kKmb48Hu0tOSxIFzbJAnI7FrQYBpCeyztoqlyUsVSoPWbcD0BZ6P8UaxD
         hMhSSaS14m5r3DYXnbQ1ssJd6ZDJlUpD0Uz7wPngUK+UH+ZQGbisGhXLOHnkGQ9uRoY4
         fZ8Ogc03N5gjwcSvld949FUSwy0gOoVGLpNN9lj2N20bRboFXxIwuXAqnQrv2CJ7DlC/
         FsaC9snH8kdsy0SyEGw03J3iwou+zFJDNN0pk+itEb11l2EXyKJnO2WcpuyNcRl3jqJ/
         zCTw==
X-Gm-Message-State: AGi0PubkolMWyUXw9cDQuQWNM5hzg3DwOCTDIwlEyhgAEbT5EK0cuE+a
        +Nbw1pzqenT+D0HCpwrRAiQIxg==
X-Google-Smtp-Source: APiQypLI52OdQQbXPqWA2KHdXBptvuzUkclYgXQK6DmUnV+S7ohktIR8xWQcauXncz6KsisdObEsJA==
X-Received: by 2002:a63:ea42:: with SMTP id l2mr294345pgk.193.1587579689975;
        Wed, 22 Apr 2020 11:21:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l63sm5709595pga.83.2020.04.22.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 11:21:29 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 22 Apr 2020 11:21:28 -0700
To:     Tim Chen <tim.c.chen@linux.intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Huang, Ying" <ying.huang@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: scan_swap_map(): Memory - corruptions
Message-ID: <202004221119.20619A68B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200422 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Feb 22 15:45:33 2017 -0800
    36005bae205d ("mm/swap: allocate swap slots in batches")

Coverity reported the following:

*** CID 1492705:  Memory - corruptions  (OVERRUN)
/mm/swapfile.c: 972 in scan_swap_map()
966     static unsigned long scan_swap_map(struct swap_info_struct *si,
967     				   unsigned char usage)
968     {
969     	swp_entry_t entry;
970     	int n_ret;
971
vvv     CID 1492705:  Memory - corruptions  (OVERRUN)
vvv     Overrunning struct type swp_entry_t of 8 bytes by passing it to a function which accesses it at byte offset 15.
972     	n_ret = scan_swap_map_slots(si, usage, 1, &entry);
973
974     	if (n_ret)
975     		return swp_offset(entry);
976     	else
977     		return 0;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Human edit:
I can't tell if this is a false positive. The detailed analysis points
at:

844        si->cluster_next = offset + 1;
   	67. index_const: Pointer slots directly indexed by n_ret++ with value 1.
845        slots[n_ret++] = swp_entry(si->type, offset);

It has an execution path that reaches there, but I don't know if it's
actually possible...

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492705 ("Memory - corruptions")
Fixes: 36005bae205d ("mm/swap: allocate swap slots in batches")

Thanks for your attention!

-- 
Coverity-bot
