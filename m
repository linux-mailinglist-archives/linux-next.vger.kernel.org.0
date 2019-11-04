Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17E8EE66B
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfKDRnb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:43:31 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:34030 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbfKDRnb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:43:31 -0500
Received: by mail-pl1-f179.google.com with SMTP id k7so7914869pll.1
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QmKTGMzrmRbNQnWOwqrew32XiofWSg1ETSgWb9mbBVc=;
        b=P0epqtt5OVFyGtuQKfrQ+8fL/sBrSpvQPXoF+/JEIY5jQloQaF9AhXE5d2h0yLBZfi
         xKzsagVfopWrsJQKD5SzkVgC9pruG4ypGRF1u8vElAF7r7l+ADhCzPewoEGxfVBIob5T
         HF3+xuUXJ+kqNEi56cqrhxRg4zvVbTUWnqnao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QmKTGMzrmRbNQnWOwqrew32XiofWSg1ETSgWb9mbBVc=;
        b=Esg3l1ZCd3aO0fyb9QryepshMVQiL0WDR7O6748uP1zSgK6efH1upwiTdOvh+sgCsx
         J5ypXCO5PB4d8jjbCtF+NBgKFzp5nso6K+z1O4doROOZpn5weRDO2jcwQsthFyaofhc1
         R7ALsfDYh3ZAo1YKARnCTMG/XI8Lz/7+gSDkM+F0Ey6uX7iAlikpdLRMg7QFjGob1poe
         7MCG5/o0uwl0chKuswIrtkIPe8ot7iBcfJBcoOnlguicYsVAGAKrJSj45nBueUGrqxeD
         oMT5k/Hv2LKSyelGzFYa7ThCnjfirjEY7/lYkDHBa9h74mNieQU3GjWsdUoeqmgB8IwU
         LjuA==
X-Gm-Message-State: APjAAAV2sGr9YrcxZ5Clru0Lge8UkUfI/7wE/mbML+W71ML1sVzNFYNi
        xMECTJkPjcQoKt5NAZxgvCMrZYHJGa0=
X-Google-Smtp-Source: APXvYqzm1LWL7T1zmhWM3h5WBKWWqowAhjoX4PN+LeTCq5W5cS5CJuKXNf8q18XBVPFMO6INoFNw9A==
X-Received: by 2002:a17:902:44d:: with SMTP id 71mr29237321ple.320.1572889410539;
        Mon, 04 Nov 2019 09:43:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a145sm9414335pfa.7.2019.11.04.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:43:29 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:43:28 -0800
To:     James Smart <James.Smart@Emulex.Com>
Cc:     James Smart <James.Smart@emulex.com>,
        James Bottomley <James.Bottomley@SteelEye.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: lpfc_cmpl_els_rsp(): Null pointer dereferences
Message-ID: <201911040943.BF367996@keescook>
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

2e0fef85e098 ("[SCSI] lpfc: NPIV: split ports")

Coverity reported the following:

*** CID 101747:  Null pointer dereferences  (FORWARD_NULL)
/drivers/scsi/lpfc/lpfc_els.c: 4439 in lpfc_cmpl_els_rsp()
4433     			kfree(mp);
4434     		}
4435     		mempool_free(mbox, phba->mbox_mem_pool);
4436     	}
4437     out:
4438     	if (ndlp && NLP_CHK_NODE_ACT(ndlp)) {
vvv     CID 101747:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "shost".
4439     		spin_lock_irq(shost->host_lock);
4440     		ndlp->nlp_flag &= ~(NLP_ACC_REGLOGIN | NLP_RM_DFLT_RPI);
4441     		spin_unlock_irq(shost->host_lock);
4442
4443     		/* If the node is not being used by another discovery thread,
4444     		 * and we are sending a reject, we are done with it.

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 101747 ("Null pointer dereferences")
Fixes: 2e0fef85e098 ("[SCSI] lpfc: NPIV: split ports")


Thanks for your attention!

-- 
Coverity-bot
