Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA9FF8667
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfKLBe2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:34:28 -0500
Received: from mail-pg1-f179.google.com ([209.85.215.179]:41960 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKLBe1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:34:27 -0500
Received: by mail-pg1-f179.google.com with SMTP id h4so10692302pgv.8
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NymeSOKX0BateqkObTKtYu871w0RJLqJw0/u/aH3H/Y=;
        b=LOHY2w3GJQL7CcGbfaAulLcLLnJ8mDqbulZ2sVYJKXpkzCRuG++HBBSJ/ZI2kdeZ6T
         1pqvhr4dCWtigNTJpvh7Y4EwFjDbrZWyz3PMNb45+ky5ZONI7bFc2G8DtsDs/HbmAoR+
         HvG/8EsoWj8/S+kcFB1Psxa1Q65f3HcQZCLxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NymeSOKX0BateqkObTKtYu871w0RJLqJw0/u/aH3H/Y=;
        b=nlYSGcyLkPfNtLEdPmUE8eKgMrQRtAFyY74kdOFrhTc2nLPW8rpBItC7BdQE1BBvPB
         BROVqRfPQtdHU3wUETa4GV4TqvIK//Nhn9z/gvoqbnRM1vF8jggjIqgAbo9G3ikEkUxw
         uWi0meEXjyWFHMtYkQmrtIsqbzu7/LpZtwV2K/pfSpNqCThLZEXnkSu1rVPIy49n1RSf
         ym2+jL/DXGii7qK0GpDd19XOcRxet9bK5fBpW+kIQhuzZQZ9EHpgnn7mNb7+Ehm4JP/3
         uAIXKFpzlrZn86tDRG5ce4sKPY3wl0TM+lFuJ4oESMnniSK3u8vvq/fdXEkojYpKvITr
         DHWQ==
X-Gm-Message-State: APjAAAV7/UCgU16/KgNi9eUB+dDSVA4rN6rejsWe7Vb15MevgUQokx4p
        NQscQ3R8rdo62AC8VKkwkpf8HQ==
X-Google-Smtp-Source: APXvYqxwGYKyT4mwOWE4QCZxKQrXwbTSJGLok5+fSTLT+2e+ioFjOhUorTu2zmOYI3SwXPdyG9lCqw==
X-Received: by 2002:a63:5406:: with SMTP id i6mr29767349pgb.1.1573522467001;
        Mon, 11 Nov 2019 17:34:27 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y36sm16029253pgk.66.2019.11.11.17.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:34:26 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:34:25 -0800
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: xlog_write_iclog(): Memory - corruptions
Message-ID: <201911111734.4D8A1DB3DF@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

79b54d9bfcdc ("xfs: use bios directly to write log buffers")

Coverity reported the following:

*** CID 1487853:  Memory - corruptions  (BAD_FREE)
/fs/xfs/xfs_log.c: 1819 in xlog_write_iclog()
1813     		submit_bio(split);
1814
1815     		/* restart at logical offset zero for the remainder */
1816     		iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart;
1817     	}
1818
vvv     CID 1487853:  Memory - corruptions  (BAD_FREE)
vvv     "submit_bio" frees address of "iclog->ic_bio".
1819     	submit_bio(&iclog->ic_bio);
1820     }
1821
1822     /*
1823      * We need to bump cycle number for the part of the iclog that is
1824      * written to the start of the log. Watch out for the header magic

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487853 ("Memory - corruptions")
Fixes: 79b54d9bfcdc ("xfs: use bios directly to write log buffers")


Thanks for your attention!

-- 
Coverity-bot
