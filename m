Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234FAF867D
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKLBgP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:36:15 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:45629 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfKLBgP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:36:15 -0500
Received: by mail-pg1-f173.google.com with SMTP id w11so10678188pga.12
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=VuujP7uki8NS/QxqhGxDKZKi/hxNaTGEizshyIKszLs=;
        b=Ud6kBd0boEJuI1lGw5Z4lFy7O+4hqNjhr+LPi/GIG3VsmfkpD8KYsew9UiOqlYnRd1
         Vod8oxg6/PZEqW8lLjhhxG/8IxYUC/sb7HEuMQioO1tsVdZzZ52g+tY3M1RcUO5pTYvm
         3mbLfErZWX8ptYjpiWtFtA+CH1vssuOxY7GnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=VuujP7uki8NS/QxqhGxDKZKi/hxNaTGEizshyIKszLs=;
        b=p1lOMUIyj2wLobjXynuLO2FhsciaTchfhODBEY94MIsKx+7TMnhTPL5VA9sHE0ai2P
         1tZNwUXQH5IMMwbM5jLGhsHNZXemmwUTHGz9h5WkzuKYiMoUx9JFffnXEidQ0vmuYEFn
         NdNATvGK9TMsm0sQV20EqiPIQey9u5usMwSxyW7VrPRzPV3abq4vxJZZlQML36/11Tvj
         Rcd10gJt1Qv+TBNBWCXH9YY4p/6oP2RiQB5ml++CqXsKdefkTozlnLgiZ7qj+n44O2XC
         T5GHaQ7hfYkM2kjbF3M5xx0NSz6rJQmioD+o85x1L8ZgGzaliW+wfmONdGDXaH3/XCh9
         csyg==
X-Gm-Message-State: APjAAAVC6GjpLthGHc6ySRalUJpJ/9DekYuOGsW3PcQVspRCDT/9MjFe
        qf700H/keQXL1zNjzOKF9fnmSw==
X-Google-Smtp-Source: APXvYqwyy9QOwRmw1N+qvoKcKBlji6cSBlgqVYYBcCNtTvylr5QAgtwRMS+YgtqI/LKfrnuDlKApHQ==
X-Received: by 2002:a17:90a:e50a:: with SMTP id t10mr2750911pjy.67.1573522574914;
        Mon, 11 Nov 2019 17:36:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r184sm18257598pfc.106.2019.11.11.17.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:36:14 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:36:13 -0800
To:     Chris Mason <chris.mason@oracle.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: btrfs_tree_lock(): Program hangs
Message-ID: <201911111736.E1D1C20@keescook>
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

925baeddc5b0 ("Btrfs: Start btree concurrency work.")

Coverity reported the following:

*** CID 1487835:  Program hangs  (LOCK)
/fs/btrfs/locking.c: 437 in btrfs_tree_lock()
431     		goto again;
432     	}
433     	btrfs_assert_spinning_writers_get(eb);
434     	btrfs_assert_tree_write_locks_get(eb);
435     	eb->lock_owner = current->pid;
436     	trace_btrfs_tree_lock(eb, start_ns);
vvv     CID 1487835:  Program hangs  (LOCK)
vvv     Returning without unlocking "eb->lock".
437     }
438
439     /*
440      * Release the write lock, either blocking or spinning (ie. there's no need
441      * for an explicit blocking unlock, like btrfs_tree_read_unlock_blocking).
442      * This also ends the context for nesting, the read lock must have been

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487835 ("Program hangs")
Fixes: 925baeddc5b0 ("Btrfs: Start btree concurrency work.")


Thanks for your attention!

-- 
Coverity-bot
