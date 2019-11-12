Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E346AF866D
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfKLBfE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:04 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:45220 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfKLBfE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:04 -0500
Received: by mail-pl1-f171.google.com with SMTP id y24so8631392plr.12
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=JACnaMShEzaX/YeaU8n/V7QKxu7zC5H9bDnKSrJqv9c=;
        b=QsNquZqCnmKFD7O1Dg7flaTfbEeWeB8goDCdm2Eyv5ztjo1mO3F+54ziCiFSCpPJTn
         ia5LxuFmxtyH4NlV/t1759AdFHbzy+bhtR+B8k9naW0FmO71p7YFNczY+LOJLt4Cz3+Q
         D/OMjSNnsc1g4kZjRQ4GGCQwgNL2qsNvFIyhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=JACnaMShEzaX/YeaU8n/V7QKxu7zC5H9bDnKSrJqv9c=;
        b=Xq+BDEq4MjP1EuM8F8/NQOJW3Ht6M1hJGsc1wDr2GQSOMsuZ9/E4QAmhYELN5bNPtm
         +53QiOLvO2xXg13mkiX0WzjZDgA1a90KSndhb3sVjYlyjMXu6sOuaodMp+KA8MA5hMvJ
         hmrkHy44M1eOiAlJ9gmIIMp7a4qB5smOj8QZ4Cbuj56sspl7OnGw1IVX3kz7ytWAsoNY
         +QOtx6Xx3xIt8HW4T5P09cUbs4Yd21z2LKtun53Ob8yO762vDRBUDhfp/fyv7xoLan74
         tiUAnISelO4F95gaiX3HOWkfhpQv6QgHuPr/5+2Gl+owHcVgnl80OfQs7Jif6F7Q/uu/
         33Qw==
X-Gm-Message-State: APjAAAV0+iCEhwCkzkUnnwm3OiI2OEF/GdROAjqKWftNbQJrGqkQOQ5q
        ipQ/mXzkBQmKfpkspClKCpeLYA==
X-Google-Smtp-Source: APXvYqy7zbRu7J7aj1GbBNicbnfCbU4/QCC79x015AnLRpsWqEyE4XiFYA+Lcz8LOLLfzasWCAwRwQ==
X-Received: by 2002:a17:902:8a83:: with SMTP id p3mr29242126plo.79.1573522502057;
        Mon, 11 Nov 2019 17:35:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w138sm12717211pfc.68.2019.11.11.17.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:01 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:00 -0800
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.com>,
        Jens Axboe <axboe@kernel.dk>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: blkdev_zone_mgmt(): Memory - illegal accesses
Message-ID: <201911111735.3EA3258CBC@keescook>
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

a2d6b3a2d390 ("block: Improve zone reset execution")

Coverity reported the following:

*** CID 1487849:  Memory - illegal accesses  (USE_AFTER_FREE)
/block/blk-zoned.c: 293 in blkdev_zone_mgmt()
287
288     		/* This may take a while, so be nice to others */
289     		cond_resched();
290     	}
291
292     	ret = submit_bio_wait(bio);
vvv     CID 1487849:  Memory - illegal accesses  (USE_AFTER_FREE)
vvv     Calling "bio_put" dereferences freed pointer "bio".
293     	bio_put(bio);
294
295     	return ret;
296     }
297     EXPORT_SYMBOL_GPL(blkdev_zone_mgmt);
298

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487849 ("Memory - illegal accesses")
Fixes: a2d6b3a2d390 ("block: Improve zone reset execution")


Thanks for your attention!

-- 
Coverity-bot
