Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5994EF866F
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKLBfW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:35:22 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:38438 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKLBfV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:35:21 -0500
Received: by mail-pf1-f176.google.com with SMTP id c13so12109809pfp.5
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Ax2RFpwoVoGZ52Yf3JQfrTqd1K/Ce1HJTsJ94KxP/ok=;
        b=h9DqGbGa6r7dU3RAlFYw9g2RlkYSCqSkNfQTSXJIxGnBJVeh+bceutT2AssdM5D4kA
         NXvkImvuzExxSdSNGi6hNGe7RSRVdyVhZ8+B+vGRobb7DrIGqpO3nvTMAH8/i1aw77F1
         TgEc2UV7b1W9cOearanIM2IXFwbQSP81OAh7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Ax2RFpwoVoGZ52Yf3JQfrTqd1K/Ce1HJTsJ94KxP/ok=;
        b=GQYzNTZAnrBbc3TO+AaeX84p3eus4ZdFRhNrNtrL47S+Tgb1GYQy7UFqtAQJsrtKFg
         ck7JugmKTfx6/29aEShYiH8q5gW0XVxI5piYY5YkQTF8UUDNpcM2uLAniIstQ4NgVZIv
         d5xybSFYnDWllf84bw18/36WdzmB1/JoNfKjL7fM9/bqII5Z15O7ct1/HyTD/3i3GHT9
         74P1pCCa8Ll7gyY0yKXLk0RHLugqWqYsOMArkQR47N8OfgoLu7c2T/glT3mgUyAs68tQ
         V0JikgXUsfDUcmLtMxhBskPwHJuQr9T3zG9rfKy9wKOyL5rD/tVesvB4VVMAiYdjYfTn
         1vVg==
X-Gm-Message-State: APjAAAXYkKIcpF8JgUJUMnJPZgqaYTdYRiM784nd8Pbmozt6aqEhJ6mF
        vE0QCGEF4eQnu4pFT4cvVoDvVA==
X-Google-Smtp-Source: APXvYqwkelABDv34s1Sio6P34kDaofZWnG9Dhrt0XxRDB91hgmLeE0lcb6NJEs6GK0NW9vQP5qjMRA==
X-Received: by 2002:a17:90a:1b4d:: with SMTP id q71mr2822044pjq.120.1573522519633;
        Mon, 11 Nov 2019 17:35:19 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a28sm10759225pfg.51.2019.11.11.17.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:35:18 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:35:18 -0800
To:     Jan Kara <jack@suse.cz>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: jbd_unlock_bh_journal_head(): Memory - corruptions
Message-ID: <201911111735.5CD206D@keescook>
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

c290ea01abb7 ("fs: Remove ext3 filesystem driver")

Coverity reported the following:

*** CID 1487847:  Memory - corruptions  (ARRAY_VS_SINGLETON)
/include/linux/jbd2.h: 351 in jbd_unlock_bh_journal_head()
345     {
346     	bit_spin_lock(BH_JournalHead, &bh->b_state);
347     }
348
349     static inline void jbd_unlock_bh_journal_head(struct buffer_head *bh)
350     {
vvv     CID 1487847:  Memory - corruptions  (ARRAY_VS_SINGLETON)
vvv     Passing "&bh->b_state" to function "bit_spin_unlock" which uses it as an array. This might corrupt or misinterpret adjacent memory locations.
351     	bit_spin_unlock(BH_JournalHead, &bh->b_state);
352     }
353
354     #define J_ASSERT(assert)	BUG_ON(!(assert))
355
356     #define J_ASSERT_BH(bh, expr)	J_ASSERT(expr)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487847 ("Memory - corruptions")
Fixes: c290ea01abb7 ("fs: Remove ext3 filesystem driver")


Thanks for your attention!

-- 
Coverity-bot
