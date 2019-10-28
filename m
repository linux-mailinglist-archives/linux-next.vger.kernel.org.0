Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53AF9E7CA0
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbfJ1XCz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:02:55 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:36039 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfJ1XCz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:02:55 -0400
Received: by mail-pg1-f176.google.com with SMTP id j22so2020434pgh.3
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/X2nVsiM6kLboGXl0G45WTrplhAFnu5NRMQGSyjQrvA=;
        b=HQT09vPYlUFy6hLu0wblZprYsUaD4o7Xli/l0NzIbp7EcH4mofJbKycCL9nFWvWZzF
         7UUosr/t89fhO4cxq11KjbWqwEAr23U8Eym2OEfxUOf3Rc3aVLw8xhmg5ml1O87daLyL
         jfO2nmMu/hYFS4Eid95rRd5JqrlGugFMUmqk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/X2nVsiM6kLboGXl0G45WTrplhAFnu5NRMQGSyjQrvA=;
        b=jOUhUeUnQfd9koBqdC85VgPdRiHuwKIFFTqw6ZibEAgoeh6vaEGn2KBGeDV97h2FBk
         YdszQ2kLRLyilwD6fFYd5JBgxwuUIcWxhhvn9Kzu16Qe2aCPqhMi+1i7VO9jdPTzSLC+
         7VClM+Eg4xlDdo79UbKuyHWBU/tCpT4zG5oswytxwMP8JFgUsXTo8yUzoOjPZUiYzy1H
         AToaCni88va6N1SX1EPuZgbmIKzfi3vVaVYE5TwhuAb5TmskniUMSyzub/gcgiFsPoSk
         fFcrU+Roh9vmU2RzNgzsM2SMDIo3hjF0wIGRIKD4VLWue2qa2KBim2v75Lv+NeYlDIKy
         83YA==
X-Gm-Message-State: APjAAAU6MFSSw+y1/D8dtCsWWcqemH6SDdpLaPpmj7cZGysA7sn7dZNK
        qvt8JxgMZksqNbB7Hr3Lehjulw==
X-Google-Smtp-Source: APXvYqwfVwnRk4taLJqLEEQb14bkVTygGF7g6bNhzP/sVcH6PQT12W/d78vZy2O5re1FUZi7O7oAbQ==
X-Received: by 2002:a62:cecf:: with SMTP id y198mr4041629pfg.86.1572303775071;
        Mon, 28 Oct 2019 16:02:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y126sm12807884pfg.74.2019.10.28.16.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:02:54 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:02:53 -0700
To:     Yufen Yu <yuyufen@huawei.com>
Cc:     Song Liu <songliubraving@fb.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: super_1_load(): Memory - illegal accesses
Message-ID: <201910281602.99CA1D4@keescook>
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

6a5cb53aaa4e ("md: no longer compare spare disk superblock events in super_load")

Coverity reported the following:

*** CID 1487373:  Memory - illegal accesses  (NEGATIVE_RETURNS)
/drivers/md/md.c: 1684 in super_1_load()
1678     	}
1679
1680     	if ((le32_to_cpu(sb->feature_map) & MD_FEATURE_RAID0_LAYOUT) &&
1681     	    sb->level != 0)
1682     		return -EINVAL;
1683
vvv     CID 1487373:  Memory - illegal accesses  (NEGATIVE_RETURNS)
vvv     Using variable "rdev->desc_nr" as an index to array "sb->dev_roles".
1684     	role = le16_to_cpu(sb->dev_roles[rdev->desc_nr]);
1685
1686     	if (!refdev) {
1687     		/*
1688     		 * Insist of good event counter while assembling, except for
1689     		 * spares (which don't need an event count)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487373 ("Memory - illegal accesses")
Fixes: 6a5cb53aaa4e ("md: no longer compare spare disk superblock events in super_load")


Thanks for your attention!

-- 
Coverity-bot
