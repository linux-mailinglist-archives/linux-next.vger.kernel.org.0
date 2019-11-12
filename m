Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8E81F866B
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfKLBes (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:34:48 -0500
Received: from mail-pg1-f170.google.com ([209.85.215.170]:34575 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLBes (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:34:48 -0500
Received: by mail-pg1-f170.google.com with SMTP id z188so4780634pgb.1
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=VDzCgmuHctJyuOw4UeFsVtAKCX22wEQ5h00+fDGNzTA=;
        b=oWWsUwpBctQWOZQO1EjFC2MfIYYDOwzx4rrAt8jlDppRdjAPK07EyfcTOmZSoM11Wi
         PwwsPYAaGDj017PHNiI8hdZB8NsHaZBeHgApbu3ZFn6YUN08rRx5GJpGPrrpd3kRh5E/
         ZaPrXw1k7Ovu0w2sozMhtNxS/rV0XKlSESI3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=VDzCgmuHctJyuOw4UeFsVtAKCX22wEQ5h00+fDGNzTA=;
        b=FSSEoCjo4dEOk38InNYy6MdYZjGNDEIxP/+tdayYOFbNBPgTyItslHZaDaK0F3sQkO
         3pAP8T8qHbWr/+HzVkxyGJ86IXgIQ8ISQzSn7zt/7bhuFkJ4RUvBp1iBlz/aLsUWkYzj
         YwvF050tNMl24C62DbQeIKAbuLU9RuTFLrgvpkzFp8QZthoH3fGdduH7m25x7sNwBB2q
         pX/C6RSoNg5tk6wpfZHgfVPqVvI+wV2/A2jrYhrjnDIRoDVh9do0q35gvkl57x5QLysz
         rgqKw9J21il/B9aIrXSaLquzebXmORPyhJx/GZQMlTBMoti+HOoYC4zYTMaLCKjVMT+Z
         rMjQ==
X-Gm-Message-State: APjAAAVdEHNQNDDz+w8ZIQejFrbcmo4PSIENLR0ZJ7O9bE8Yi2w+muVn
        H2sbSWLHxACI917XPYXelIG52xDk7fM=
X-Google-Smtp-Source: APXvYqwH+o7vryomgub+pPZsTiioE5CHDLwnm+rtSfqTZSL6uI4c+HBJNGWk5jD/7MerqdRhJvnkmw==
X-Received: by 2002:a63:712:: with SMTP id 18mr21740840pgh.384.1573522485957;
        Mon, 11 Nov 2019 17:34:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c16sm15179738pfo.34.2019.11.11.17.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:34:45 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:34:44 -0800
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: add_ipu_page(): Memory - illegal accesses
Message-ID: <201911111734.21CB897FD@keescook>
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

0b20fcec8651 ("f2fs: cache global IPU bio")

Coverity reported the following:

*** CID 1487851:  Memory - illegal accesses  (USE_AFTER_FREE)
/fs/f2fs/data.c: 604 in add_ipu_page()
598     			break;
599     		}
600     		up_write(&io->bio_list_lock);
601     	}
602
603     	if (ret) {
vvv     CID 1487851:  Memory - illegal accesses  (USE_AFTER_FREE)
vvv     Calling "bio_put" dereferences freed pointer "*bio".
604     		bio_put(*bio);
605     		*bio = NULL;
606     	}
607
608     	return ret;
609     }

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487851 ("Memory - illegal accesses")
Fixes: 0b20fcec8651 ("f2fs: cache global IPU bio")


Thanks for your attention!

-- 
Coverity-bot
