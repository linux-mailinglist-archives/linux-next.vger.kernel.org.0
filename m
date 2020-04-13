Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEAE91A69D0
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 18:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbgDMQXZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 12:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731498AbgDMQXY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 12:23:24 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D946DC0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:23:24 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w3so3553712plz.5
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=mDe0ezbcb9wg/jOfCpp4biNm/DTKzDCGqtgL7Qpczjc=;
        b=K3qCeobCKq5E4RP7fgonxIgpjXqVbukdcPTCTt9eZzlnqwpwjc4KxY4cUeFofJlpN6
         tlAG8T3w2pnSoUi53dxNz8shuzwHNjWf6emhJ0Y28a64g/16kt6RCb23BY7czWYJ0b06
         CX4BfROmjlLIaN/4jsOGsHlK7rQz5ZyTGcgsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=mDe0ezbcb9wg/jOfCpp4biNm/DTKzDCGqtgL7Qpczjc=;
        b=KaUDiCFxHJQ3bKxa+fgbF8J/yk7Pk0/fC4oMqEnnTU1qFg+NiFPhXLRb83j4BL81a2
         b9xWIx1LwN9Xe1lUJ+vJV/HQj8LjBRoYx1pNqCq+cu3tPrC4kuCXoDsf6UkjVE8202+r
         QJXZOg5o+bXw3inATC9f7M6giRrBfpqDiN6i33843ylfhLP3sdwCLyPGiedVWjoMJ6Dw
         IKwh6DEw1WC90lwdavU5uhfDkvjH4dnDEaF+CwkYdA7dvWcdZLjvatnPoo81afhgpDv/
         HN0Wm8+N5xIi22KrbBTL2e1Z2Nk/M/n7ZrL18oIYIHNqVX0Qtb1UlEz53b9Lrot6GYk6
         cmpQ==
X-Gm-Message-State: AGi0PuZS7OLqE7AF+lAus/Nrr4wdYRyCP2U6TzMGkN5H5HVNQxal3rV9
        +1nPqkkffWh/J7Hs/a4v3327osp8aGc=
X-Google-Smtp-Source: APiQypIDnSdStgTu+tEKA9zjVkrXTKKS/a06in3/y5T6VuNVt9479qESohde1XdZVtV8FeI6bR2MGg==
X-Received: by 2002:a17:90a:6581:: with SMTP id k1mr22636326pjj.50.1586795004393;
        Mon, 13 Apr 2020 09:23:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e26sm9103296pfj.61.2020.04.13.09.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:23:23 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 13 Apr 2020 09:23:22 -0700
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: pdr_register_listener(): Integer handling issues
Message-ID: <202004130923.13CDE2C9@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20200413 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Mar 12 17:38:40 2020 +0530
    fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")

Coverity reported the following:

*** CID 1461652:  Integer handling issues  (CONSTANT_EXPRESSION_RESULT)
/drivers/soc/qcom/pdr_interface.c: 158 in pdr_register_listener()
152     	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
153     		pr_err("PDR: %s register listener failed: 0x%x\n",
154     		       pds->service_path, resp.resp.error);
155     		return ret;
156     	}
157
vvv     CID 1461652:  Integer handling issues  (CONSTANT_EXPRESSION_RESULT)
vvv     "(int)resp.curr_state < -2147483648 /* -((int)(~0U >> 1)) - 1 */" is always false regardless of the values of its operands. This occurs as the logical first operand of "||".
158     	if ((int)resp.curr_state < INT_MIN || (int)resp.curr_state > INT_MAX)
159     		pr_err("PDR: %s notification state invalid: 0x%x\n",
160     		       pds->service_path, resp.curr_state);
161
162     	pds->state = resp.curr_state;
163

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1461652 ("Integer handling issues")
Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")

Thanks for your attention!

-- 
Coverity-bot
