Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECF8F866E
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfKLBfN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:13 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:39999 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfKLBfM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:12 -0500
Received: by mail-pg1-f173.google.com with SMTP id 15so10699463pgt.7
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Ksrapqq8sv9M/XwBUCP8+P7kJeayJbGHFB7NC7tvyAY=;
        b=JuZaSI3KKrp+UV841peov1Gv6+W9kWCefDUbJB9rQBXRJ0NCMIpK7eek1NYI8RDMXF
         04H5utJAI3akHsdwcLeWkE8KEPagn4PVRb4hhmCtfO9SSElQLy1zTgsPw0uSaaSJJmGu
         xTyon5fF1tPLpF1kZhBWu7/vOEmIO1MVGxBN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Ksrapqq8sv9M/XwBUCP8+P7kJeayJbGHFB7NC7tvyAY=;
        b=pelp+JWKhG9z7mItbLLcUG3F4sKWIu6AQ4iqZPOnQ7kWmhJ9x9mX+YymgBc7xuZbGp
         m4wOsj92iHvPYvnUizpFutpu+fcDpVjs2xNjxKRKJC/cAQMg9XNL29Dir0k0L7HPkj+W
         56ARXbhVGHJRusczJGCM7yfw7mA3THKtPvbzE+13ybt7E/1DSKtjjyAMTY37AYLxCGd/
         I47w+oKcAGwMq1s5hu9KEpM8FEHYFflDk1QMFFZUm7ViiHJUmpIFJI5GpnCRLHguxuI/
         dBWHOp1tTKB7DSFEKC/pnFvjupQ9QiLYsUYfaNCdnIH5DxPF0SzqIKi8crlOBn06fF7l
         rBgg==
X-Gm-Message-State: APjAAAUcB4QX881DSCe6rMfCbF2Yj8MGWZ4Wsa/VUDZFBnPXPeLMkTwZ
        lWVQbJGfhO1Qk3SIApAat3RlvA==
X-Google-Smtp-Source: APXvYqxbz9FLlVp+nj4whvRw9V+DDFmrGSpFcyzQXmmi4cvzCn5aFmC16pYnscy0hZFxAe3ftw4CyQ==
X-Received: by 2002:a17:90a:eb18:: with SMTP id j24mr2845569pjz.85.1573522511942;
        Mon, 11 Nov 2019 17:35:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w19sm10112462pga.83.2019.11.11.17.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:11 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:10 -0800
To:     Kent Overstreet <koverstreet@google.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: bch_cached_dev_run(): Memory - illegal accesses
Message-ID: <201911111735.F5BA37CD@keescook>
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

ee66850642ef ("bcache: Use bd_link_disk_holder()")

Coverity reported the following:

*** CID 1487848:  Memory - illegal accesses  (USE_AFTER_FREE)
/drivers/md/bcache/super.c: 961 in bch_cached_dev_run()
955     		SET_BDEV_STATE(&dc->sb, BDEV_STATE_STALE);
956     		bch_write_bdev_super(dc, &cl);
957     		closure_sync(&cl);
958     	}
959
960     	add_disk(d->disk);
vvv     CID 1487848:  Memory - illegal accesses  (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "dc".
961     	bd_link_disk_holder(dc->bdev, dc->disk.disk);
962     	/*
963     	 * won't show up in the uevent file, use udevadm monitor -e instead
964     	 * only class / kset properties are persistent
965     	 */
966     	kobject_uevent_env(&disk_to_dev(d->disk)->kobj, KOBJ_CHANGE, env);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487848 ("Memory - illegal accesses")
Fixes: ee66850642ef ("bcache: Use bd_link_disk_holder()")


Thanks for your attention!

-- 
Coverity-bot
