Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4E09CFC2
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 14:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfHZMoM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 08:44:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43746 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732014AbfHZMoM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 08:44:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id h15so14897559ljg.10;
        Mon, 26 Aug 2019 05:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=H5el3F7bX5Q0wB1CJCAA8YW2QBLir4E1kpVMw+lIHdQ=;
        b=cFSNPenlSEZb7v7Emrnrwgxx8h4cwZIu01+GjaBiQO9kiFDAkXACuKlBvPIdes0FuO
         LWI+61KSX0iCwYfgvz+TZcJwU76cCIqHdIflj4gTTDTsydS8SlAzqo/jVcfhke7CmZmp
         4QE4nPjfqejD3mJxqhXT0zyOGFBine+RlhmwC1HIG8JLRyDyHLRYY+MbxEFsC0v/7UeD
         bDBRvvQJ4KiRcFp5+cMzRcjJCoBK/mMrLd3h/xoCl7NFJD0hHdsKs2slfQzsF5K2NRTJ
         kANjE+rsPCgihCBkxKBGiWCGYwvTebEnE79TP0mn2FieZp3g8ZWlOCOFqdpwTiK6kcNR
         kgEg==
X-Gm-Message-State: APjAAAVl6jBmZzOqEfe8dLIQ70RNroUXNSIqauluF38ieRbVc7EaxxZl
        sR78MJYEf+GRlXWSb7ajWzmOidCcx9u4ObFPaMHSvg==
X-Google-Smtp-Source: APXvYqyINLLOvIZUbU+T4n5IZJf97uJ8BBGIIlwQEB9a2MzTCMVp3rm1EuJSxMxuFX8dREI7n0dUpUS6/sSdZm3BkNk=
X-Received: by 2002:a2e:81ca:: with SMTP id s10mr10536732ljg.181.1566823450464;
 Mon, 26 Aug 2019 05:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190826215017.02ab0d34@canb.auug.org.au>
In-Reply-To: <20190826215017.02ab0d34@canb.auug.org.au>
Reply-To: myungjoo.ham@gmail.com
From:   MyungJoo Ham <myungjoo.ham@samsung.com>
Date:   Mon, 26 Aug 2019 21:43:34 +0900
Message-ID: <CAJ0PZbTEy3U7Ryj8NoVvd2VePbPBM69t-NPNMTzQH3sS3YD6Qw@mail.gmail.com>
Subject: [PATCH] PM / devfreq: passive: fix compiler warning
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The recent commit of
PM / devfreq: passive: Use non-devm notifiers
had incurred compiler warning, "unused variable 'dev'".

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
 drivers/devfreq/governor_passive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/devfreq/governor_passive.c
b/drivers/devfreq/governor_passive.c
index da48547..be6eeab 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -149,7 +149,6 @@ static int devfreq_passive_notifier_call(struct
notifier_block *nb,
 static int devfreq_passive_event_handler(struct devfreq *devfreq,
                 unsigned int event, void *data)
 {
-    struct device *dev = devfreq->dev.parent;
     struct devfreq_passive_data *p_data
             = (struct devfreq_passive_data *)devfreq->data;
     struct devfreq *parent = (struct devfreq *)p_data->parent;
-- 
2.7.4
