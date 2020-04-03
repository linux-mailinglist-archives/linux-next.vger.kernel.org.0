Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145D219E16A
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 01:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgDCX0F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 19:26:05 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:38902 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgDCX0E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 19:26:04 -0400
Received: by mail-pj1-f50.google.com with SMTP id m15so3702965pje.3
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2020 16:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ewS2Lc380xH84B3Judf+b+VnGBZpV40YOpE3IopvlCI=;
        b=aLTPuvi1duztNh4deJ5wKahKFc+6uE8xlwkIIMWFsa9Ar70zB5z0EXRLBdCni9OTip
         pDNm1kYspZ8ljgJLxSUS8qDLzrbr++VDujkP5iuahF0yOnTKvUoGT4vzkqXrbBfpLJqo
         dhTzXEQq5uldH2A7xbqa3J5L3vdOmloBfql9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ewS2Lc380xH84B3Judf+b+VnGBZpV40YOpE3IopvlCI=;
        b=hOwwnsO0AanGclkZb7ZSth+khTEYx+g1LnpMAk/OkZuKAMq05RA0yDglJxmHXDn5az
         FKdcFIGjPQI8IHqF2MkJys2J9ewLlrH2jsvRPGZe/cXGVhFFPY/wKbwijEB3q4ER9ByU
         GMlUYbEgOREZw2kTQvG6pxUvsQrWNHHllDbNu3v6HHjHaEGFJhJiJzrKAOXCF8r7xmXO
         dVeDYPK8hZzlCAoBZj2o0odJvWDIZl44D9auDzSdLr2slCCz44Pa1X31r4eskrEbiGsX
         Tghk0JIOD+bZMXf2qX05LcV8IArdDI4SQ1vv/g4XPfH8C6SH5cxPZc8DuzmRDpcEKwmT
         jQwQ==
X-Gm-Message-State: AGi0PuZQh0pfRVtVsF4MMpdJ7vtT1l8y0VmdN9I8vmK5P4LadlAA/Bnd
        oaCfTi7AGJSehTSloUnPgnxwQg==
X-Google-Smtp-Source: APiQypJbVq51TEnbkO88X7g2UMDjcBZFUrwnDoqHGHCgb5oTZ+dGmojYhw5yn/2mhK7kLy+BsvXO4w==
X-Received: by 2002:a17:90b:430f:: with SMTP id ih15mr12532178pjb.56.1585956361848;
        Fri, 03 Apr 2020 16:26:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k6sm6525741pje.8.2020.04.03.16.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:26:01 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 3 Apr 2020 16:26:00 -0700
To:     Thomas Hellstrom <thomas_os@shipmail.org>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Roland Scheidegger <sroland@vmware.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: ttm_bo_vm_insert_huge(): Incorrect expression
Message-ID: <202004031625.AE91497@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200403 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")

Coverity reported the following:

*** CID 1492487:  Incorrect expression  (PW.ASSIGN_WHERE_COMPARE_MEANT)
/drivers/gpu/drm/ttm/ttm_bo_vm.c: 227 in ttm_bo_vm_insert_huge()
221     		ret = vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
222     #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
223     	else if (fault_page_size == (HPAGE_PUD_SIZE >> PAGE_SHIFT))
224     		ret = vmf_insert_pfn_pud_prot(vmf, pfnt, pgprot, write);
225     #endif
226     	else
vvv     CID 1492487:  Incorrect expression  (PW.ASSIGN_WHERE_COMPARE_MEANT)
vvv     use of "=" where "==" may have been intended
227     		WARN_ON_ONCE(ret = VM_FAULT_FALLBACK);
228
229     	if (ret != VM_FAULT_NOPAGE)
230     		goto out_fallback;
231
232     	return VM_FAULT_NOPAGE;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492487 ("Incorrect expression")
Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")


Thanks for your attention!

-- 
Coverity-bot
