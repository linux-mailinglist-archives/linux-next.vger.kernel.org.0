Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2056FE7CB5
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbfJ1XGT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:06:19 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:43410 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XGT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:06:19 -0400
Received: by mail-pg1-f180.google.com with SMTP id l24so8027385pgh.10
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ajJAXvJBiuW+rdGyiHFHaJ8YTJ6d0F0ADLeuDcD+Poc=;
        b=PnlOMdYNGfQLPTHAl6mmFcOO5Xa1b6iiO4qpP636LMDwJ/OL4xW/RNBQc4BWFxaWhu
         WtNMIpZ0pGcFLa8m0loQOjlfH+Z2G3SJjuy63JBRtDZhq1+QGdF6iq+mKIjik2DhS+z5
         pVhR9wGTy+0ZEcHe9Kid+innYzo/dg/9SuWlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ajJAXvJBiuW+rdGyiHFHaJ8YTJ6d0F0ADLeuDcD+Poc=;
        b=Z1g2lz4KobPk2Ib3z19SV2cNifSWRdOtC1hqomhcwsJgY+gvtgX8x4wmLP3e0+gSpD
         wpEzdsh7Dh/PxsHbdxs4fGmHRSGHR03w7ZSQ5TT1mcccAdavbjFFg4vhjnWDIwNDvzf0
         q3CXqe4KPiwS+QiMWPbUTeXto3Fpwp2ByGgCmXsG395GzZRK9hXrOn+lB9bdE43qeAaH
         gGNJvMm79xTtBO+bXO8taoaCgQvmaNYjJ7k0jksd4kE4qWLb0jEDYxppkpeS+HUAMiAk
         spp3nGHYqMeOOjRlEkqyiyZhCgz+WLeug4vuwD4AU7Ad84vvydHzB/+xICxcM2tzMzW9
         E7Qw==
X-Gm-Message-State: APjAAAV+sOV1Y57AocdAdYtBPNHMQ56tJ0CS948Hhr1xapRVkMFcpfZW
        O5Gw8lG2ILLCTWl9plAKUgg1wQ==
X-Google-Smtp-Source: APXvYqzkBYSIQCmPWXHAMvZhJWsEGKCsxL15zBJByB/6utjZAac/Wyb5naW68QXXhkJ9pasdG31n2g==
X-Received: by 2002:a63:e255:: with SMTP id y21mr23240465pgj.353.1572303977533;
        Mon, 28 Oct 2019 16:06:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i22sm12000681pfa.82.2019.10.28.16.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:06:16 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:06:15 -0700
To:     Sasha Neftin <sasha.neftin@intel.com>
Cc:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Aaron Brown <aaron.f.brown@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: igc_hash_mc_addr(): Integer handling issues
Message-ID: <201910281606.99B58CD542@keescook>
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

7f839684c5c4 ("igc: Add set_rx_mode support")

Coverity reported the following:

*** CID 1487361:  Integer handling issues  (BAD_SHIFT)
/drivers/net/ethernet/intel/igc/igc_mac.c: 851 in igc_hash_mc_addr()
845     		break;
846     	case 3:
847     		bit_shift += 4;
848     		break;
849     	}
850
vvv     CID 1487361:  Integer handling issues  (BAD_SHIFT)
vvv     In expression "mc_addr[4] >> 8 - bit_shift", right shifting "mc_addr[4]" by more than 7 bits always yields zero.  The shift amount, "8 - bit_shift", is 8.
851     	hash_value = hash_mask & (((mc_addr[4] >> (8 - bit_shift)) |
852     				  (((u16)mc_addr[5]) << bit_shift)));
853
854     	return hash_value;
855     }
856

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487361 ("Integer handling issues")
Fixes: 7f839684c5c4 ("igc: Add set_rx_mode support")


Thanks for your attention!

-- 
Coverity-bot
