Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B63F8677
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbfKLBf4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:56 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43278 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKLBf4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:56 -0500
Received: by mail-pf1-f194.google.com with SMTP id 3so12088190pfb.10
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=cbhF93I3rFr/aMBksXfFoarN7esdOC3JrDTXCYvLt54=;
        b=DlbJfWSuW2Pif/at8UH/p20Wb1ipFslia/9fTHNrseYaZKuXqP4mcbfGi4EqYLIws0
         PnJUBBvN7PYns7ue3VV3hCQk618M63ePp1EOYiTrgT9D92NsqC7XrEI7VjEl7iXshXDR
         kXa6chIaMwYPddjawmybYmQ9FGjBfLoH4JlUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=cbhF93I3rFr/aMBksXfFoarN7esdOC3JrDTXCYvLt54=;
        b=k4762V7P+gpAZOXTvma0QtK6cMbulop6N5N3Jj/du/QXDpxBGEmBJFxQXEu3N8/DJD
         9Yr5LN5UncoJP06p9uQDzlPp9PxN7jtPpO+0blmai8QNs6gDJiT2WOdqMkaap3wOKSWg
         drrnrocedoDPSQMsxUdu4vIpaphlSoHZoDJXSpLVYzKolZhG2mBIKq5T8QqXcsFICHkN
         5KUq2CDJf3Pm5AXlPiYcwnvSaHks5QtLBdWXVnz507G2g2HtdSah202/jjLGhd0XSidX
         w7ACUJLVdQtVqBlGFXc6E9JfLhPrxjpPI0uVpB7YDnK7wRbnmU2icGSBrysBfOzOtzl3
         kYdw==
X-Gm-Message-State: APjAAAXb9uLPrCiJbSV5lRj+0QujG6Jbt7drbCJWDAnJXWtxpQBjhkkp
        DZs0Eml901ox0T+GpvnQ8WPbhA==
X-Google-Smtp-Source: APXvYqzoA4LwbtnnBuzSK6oNTK/NDfZfKjlub/131L2zT0WCJocyUw/vWpQSURvQ6vvFRW3nBoI8uQ==
X-Received: by 2002:a63:1a5e:: with SMTP id a30mr30791228pgm.299.1573522555349;
        Mon, 11 Nov 2019 17:35:55 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z18sm19268467pfq.182.2019.11.11.17.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:54 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:53 -0800
To:     Cong Wang <amwang@redhat.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: jbd2_journal_write_metadata_buffer(): Concurrent data
 access violations
Message-ID: <201911111735.2426AF50D@keescook>
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

303a8f2afc7b ("jbd2: remove the second argument of k[un]map_atomic()")

Coverity reported the following:

*** CID 1487840:  Concurrent data access violations  (ATOMICITY)
/fs/jbd2/journal.c: 421 in jbd2_journal_write_metadata_buffer()
415     		if (jh_in->b_frozen_data) {
416     			jbd2_free(tmp, bh_in->b_size);
417     			goto repeat;
418     		}
419
420     		jh_in->b_frozen_data = tmp;
vvv     CID 1487840:  Concurrent data access violations  (ATOMICITY)
vvv     Using an unreliable value of "new_page" inside the second locked section. If the data that "new_page" depends on was changed by another thread, this use might be incorrect.
421     		mapped_data = kmap_atomic(new_page);
422     		memcpy(tmp, mapped_data + new_offset, bh_in->b_size);
423     		kunmap_atomic(mapped_data);
424
425     		new_page = virt_to_page(tmp);
426     		new_offset = offset_in_page(tmp);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487840 ("Concurrent data access violations")
Fixes: 303a8f2afc7b ("jbd2: remove the second argument of k[un]map_atomic()")


Thanks for your attention!

-- 
Coverity-bot
