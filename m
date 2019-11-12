Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50FCF8676
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfKLBfr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:47 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:46236 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKLBfr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:47 -0500
Received: by mail-pg1-f169.google.com with SMTP id r18so10669615pgu.13
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uwH8a9L7hqxz+ioL9WhmDhoQ41K/wY9b3RI2PITkZ/s=;
        b=erbDDSVmGmroSvuGktPOxfH2o+8rw6dFiTf9QCv+0JRUlGIIEI8N2v+LZeZbNRmtcQ
         YBxW7DELk9Dw3cKwt45g/ApcirhNJVjeBoE5Ez5tlUXs7fpyNsHmWA+BHeK2cjWZlQSb
         Pu2zTkDF5YaNltTffPUGXltkY+W0eZ9kAsbfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uwH8a9L7hqxz+ioL9WhmDhoQ41K/wY9b3RI2PITkZ/s=;
        b=E54Bucr8/BFWH4aITmPo1WNJPqFVnx0ETxbsHOj8w/mufrNyFN7Sj1AOxxMHzCzt6f
         eJVaUJd89v/jNkXaOzM/w1yVH/6/Uoyjd/810teI+tUPsqZeiVpZUGbY6WpM3zriIeqN
         ScwuyivRPKSKig3tzkN5xJ17lWIsbVtBOSexbtdwFjYrBbQYZwhUX6k3djXz63Rxd2kw
         3bcwBG9+caueQtKhfqyItHXZsoK5C/7lr3GRCdhV2XW/I/FupXG6PC0G8upf6Nto3Qm9
         h624XK6xEOyCaxBm8IITa6xhKIbwtNsY2g9k6fvNweSSpbJjbSOr81OLvkCjdqFbvFtf
         qiPA==
X-Gm-Message-State: APjAAAXTZhHTP2wV8foZ0PWJkjBrXyAaFywLzGJpeW9uJqQySbx1Clgi
        qHbcplHj2NumW8xnMHLLWtNpoQ==
X-Google-Smtp-Source: APXvYqzS7jPdAz3WSQ5qIROjoFCSKjgcXoCntjaov2WUskTHr13cRm1euJRpgV0OcjYTfQ+Ha4Lt6Q==
X-Received: by 2002:a63:395:: with SMTP id 143mr13942651pgd.93.1573522546501;
        Mon, 11 Nov 2019 17:35:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g20sm14952786pgk.46.2019.11.11.17.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:45 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:44 -0800
To:     Matthew Bobrowski <mbobrowski@mbobrowski.org>
Cc:     Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <201911111735.1F45BB0B4@keescook>
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

378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")

Coverity reported the following:

*** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
3382     	/*
3383     	 * We use i_size instead of i_disksize here because delalloc writeback
3384     	 * can complete at any point during the I/O and subsequently push the
3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
3386     	 * happening and thus expose allocated blocks to direct I/O reads.
3387     	 */
vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
3392
3393     	ret = ext4_map_blocks(handle, inode, map, m_flags);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487841 ("Integer handling issues")
Fixes: 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")


Thanks for your attention!

-- 
Coverity-bot
