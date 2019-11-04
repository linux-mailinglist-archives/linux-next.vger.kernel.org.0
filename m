Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F76EEE626
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbfKDRhm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:37:42 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:35661 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729441AbfKDRhl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:37:41 -0500
Received: by mail-pf1-f170.google.com with SMTP id d13so12741999pfq.2
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3VFx9jxEqE/jovhwumUbCqC78GNOsq8lv7kufNPIZos=;
        b=F0/Sqe+Sr0zz0IsZx60pY/BPXbNKCVNuFH9gtaQfwstOCVQCavff/cpCGhgEvYtVZd
         CiF+72vkCEprwd+kllaXH38PXIf4g0f52RFQxLwVTpTmjJ3c0r9cuS1BEqpX3j1jUmZm
         E8+pstEpY3/1RvUI/kxQW/rFzDo+oVxCOv8JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3VFx9jxEqE/jovhwumUbCqC78GNOsq8lv7kufNPIZos=;
        b=IQWg4B07U28ELob28DYSWkMdPr0Qy07kBrYszepCzkHRzdrLUbMsGWUMT4DRzrcA2X
         82ECxNUuzkAG0RoZMpoHoSrcJKwx0lUxdOxkM7+/A62V4c0BsuCLOOuw3eepKCqiHY6R
         +fpbEAAcxZs2DSHWlm9IqspI8LkyPlANM9rulUrN+7TLqdweG8Xbi8+wcRXb2AnIrfJx
         vHqYIpNQOBdXXyvDwLvzM8Xsoywblf4Zru585aTcGPwWDnpLDiyVYvzP65TzCsmAT9iz
         uXu1z5x/7dw3LXS+8L4B4KLKMNudQNfxwnTbFi5dMiVuwBRyrETWs+UAw6qssRczN5eT
         CKug==
X-Gm-Message-State: APjAAAWlCT+bC2eGCuJPcYyIWSbA9yLD037A20Y6rfpX2NpxEToadEZv
        NU/ULTwMxLYLMZAYBQJkDW8fDQ==
X-Google-Smtp-Source: APXvYqwhuB8/NCw6n30mrQrTfH5w1NYeAO75aa6HdNjkLvpsARMhI05+45IvQf/azBThVRw3zojb6g==
X-Received: by 2002:a63:2cd6:: with SMTP id s205mr7430662pgs.443.1572889060648;
        Mon, 04 Nov 2019 09:37:40 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f13sm15117018pgs.83.2019.11.04.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:37:39 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:37:38 -0800
To:     Shahar S Matityahu <shahar.s.matityahu@intel.com>
Cc:     Luca Coelho <luciano.coelho@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: iwl_dbg_tlv_alloc_fragment(): Control flow issues
Message-ID: <201911040937.0079956C5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

14124b25780d ("iwlwifi: dbg_ini: implement monitor allocation flow")

Coverity reported the following:

*** CID 1487402:  Control flow issues  (DEADCODE)
/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: 497 in iwl_dbg_tlv_alloc_fragment()
491     			 pages * PAGE_SIZE);
492
493     		pages = DIV_ROUND_UP(pages, 2);
494     	}
495
496     	if (!block)
vvv     CID 1487402:  Control flow issues  (DEADCODE)
vvv     Execution cannot reach this statement: "return -12;".
497     		return -ENOMEM;
498
499     	frag->physical = physical;
500     	frag->block = block;
501     	frag->size = pages * PAGE_SIZE;
502

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487402 ("Control flow issues")
Fixes: 14124b25780d ("iwlwifi: dbg_ini: implement monitor allocation flow")


Thanks for your attention!

-- 
Coverity-bot
