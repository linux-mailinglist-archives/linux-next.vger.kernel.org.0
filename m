Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1975719F927
	for <lists+linux-next@lfdr.de>; Mon,  6 Apr 2020 17:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgDFPth (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Apr 2020 11:49:37 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:42781 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbgDFPtg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2020 11:49:36 -0400
Received: by mail-pg1-f181.google.com with SMTP id g6so92507pgs.9
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2020 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0coe3LgsrJCDs8at3Clm0B4bb5aZxJX2f9C+b2vkajg=;
        b=V5sHzbK/fynBESPKc5aLpqRaD7Rax+0OM/IFwKe6aUqXvQtnFLMWTYMCQiJujFHZs4
         UsyMj3NrpgUeUe8a6dsLZylu/a6y8IJOooVw35we0tYT/ZOdL+jLl2TFS31/Lz9ReBJX
         g5ZMsRMRn3MNxirqpYaf1sUtxcVkgv98vmi/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0coe3LgsrJCDs8at3Clm0B4bb5aZxJX2f9C+b2vkajg=;
        b=kB8Uvil7u9GaDWWcA6sK9K0mbJBp4o75XsK3Me7E3BwCg1SohAfGV0zZePr5CpNnST
         ddGVcAHcT6qjhWRWZmlVwDbwZS8Ub1SKOcngYQS8yZmfzwbvLOOMSo8bnmftQQR6N8aM
         0wuEL9EIHQSGrJlzsMFJPtoaP/Txd8pxSopdWxeaAGPQsrHdUC3SUSg4q83noN5cZ6Rm
         yZDyZ6xYiEr9n4BO4liEUkTDZuYG1yYa8Jdlqhv1jwLwUDcEtd0LjoV3X1DG3oxKXJwo
         MpwsJCWFxqO5QqnBrUWwuxeYPRRshScLbvi1lz01J4FSIS2bxKyTx4nNpSSw3cT1+HdI
         UXxQ==
X-Gm-Message-State: AGi0PuaNWd+LX1r0fj4HwM903OYG9gHN4air2RLFawZnA3DpyyA3UoYS
        BzvukozxI0cEVM7RT7p76bUd4Q==
X-Google-Smtp-Source: APiQypLSSx5NoOHp4P2v0I7roiuXR2miQo4OBf9Hg3GJRGcND4TjU/zyhJHe5EtbLnn21/uUx7j6zg==
X-Received: by 2002:a63:313:: with SMTP id 19mr22214898pgd.340.1586188173677;
        Mon, 06 Apr 2020 08:49:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m2sm23239pjk.4.2020.04.06.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 08:49:32 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 6 Apr 2020 08:49:31 -0700
To:     Sathish Narasimman <sathish.narasimman@intel.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        kbuild test robot <lkp@intel.com>,
        Amit K Bag <amit.k.bag@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        Johan Hedberg <johan.hedberg@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: btusb_work(): Null pointer dereferences
Message-ID: <202004060849.823489FC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200406 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB Endpoints")

Coverity reported the following:

*** CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
/drivers/bluetooth/btusb.c: 1665 in btusb_work()
1659     			}
1660     		} else if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_TRANSP) {
1661
1662     			data->usb_alt6_packet_flow = true;
1663
1664     			/* Check if Alt 6 is supported for Transparent audio */
vvv     CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
vvv     Passing "data" to "btusb_find_altsetting", which dereferences null "data->isoc".
1665     			if (btusb_find_altsetting(data, 6))
1666     				new_alts = 6;
1667     			else
1668     				bt_dev_err(hdev, "Device does not support ALT setting 6");
1669     		}
1670

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492498 ("Null pointer dereferences")
Fixes: baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB Endpoints")


Thanks for your attention!

-- 
Coverity-bot
