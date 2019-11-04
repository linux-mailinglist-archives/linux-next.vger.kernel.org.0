Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13EEE64E
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfKDRlp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:41:45 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45245 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbfKDRlp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:41:45 -0500
Received: by mail-pg1-f193.google.com with SMTP id w11so1442414pga.12
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5ssjpE9iOeZBGY3VUJz1Er9NEZ0zWkiAV9HGLvYs7II=;
        b=LECkQRUV+cGvUIUAJ043ckH8xei6JG3yo3IrEZIz1QJ28LBsdTfufqgTECmXGfmJXo
         GesYYdDuF5ObOQuKQiWqGtUO4F16wGljijJZZzidSOPTae9eGZgX84c3T4Bk4FwoR8iq
         w8sBGZ9ib2T8qEgwP5vNOoqsLOsC3wbzg3OYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5ssjpE9iOeZBGY3VUJz1Er9NEZ0zWkiAV9HGLvYs7II=;
        b=I4JbKJH6sM93WU4JHM75X3DHGdcL7IgADRP56UV5fg9JRtNyozCgAGNfWthuvxsCGR
         LttFDAGufSVRqMYwzrNhjGAkccUsmIFJdJx1PuUgFh2UudmUTIEeJY4EqkS8MWbqAd1N
         Xcwuy9UkdIdauHuQfUaUELVq7ZEDpmaDmqNX9cVBL+nrqjHY/g9XqMoxrNR8eui7VUxc
         4W+kUKXK3uIyR+PkbYgu3CqMAyByu9UNMNWaHk5loP7faMUIqjCgH6v51Y4g9YyLvrI9
         A5xKxeLmDvWqf9iu6xe/o4SOnsXxcrL8a6+z+s3441GCOofdR6PTopfC16OlZe3CJgzm
         wOOQ==
X-Gm-Message-State: APjAAAXUhfRdIU8EjPW2VDjAd8iOKjmsQNO0YNkc/dceiJz8c2ICXRQk
        z/K3VWe3/+op8SQ4QDQaCgFavw==
X-Google-Smtp-Source: APXvYqznBTe/zMTJRoSS3OM4M2MemN7SJLZYkROW/xdgN5rqbg0U6Wtv5xEoU32h0OWpFhtKqTdqhw==
X-Received: by 2002:a17:90a:858a:: with SMTP id m10mr424016pjn.128.1572889304372;
        Mon, 04 Nov 2019 09:41:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l62sm7397278pgl.24.2019.11.04.09.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:41:43 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:41:42 -0800
To:     Lars Poeschel <poeschel@lemonage.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: pn532_dev_up(): Error handling issues
Message-ID: <201911040941.4AECB815@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

c656aa4c27b1 ("nfc: pn533: add UART phy driver")

Coverity reported the following:

*** CID 1487395:  Error handling issues  (CHECKED_RETURN)
/drivers/nfc/pn533/uart.c: 107 in pn532_dev_up()
101     }
102
103     static void pn532_dev_up(struct pn533 *dev)
104     {
105     	struct pn532_uart_phy *pn532 = dev->phy;
106
vvv     CID 1487395:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "serdev_device_open" without checking return value (as is done elsewhere 10 out of 11 times).
107     	serdev_device_open(pn532->serdev);
108     	pn532->send_wakeup = PN532_SEND_LAST_WAKEUP;
109     }
110
111     static void pn532_dev_down(struct pn533 *dev)
112     {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487395 ("Error handling issues")
Fixes: c656aa4c27b1 ("nfc: pn533: add UART phy driver")


Thanks for your attention!

-- 
Coverity-bot
