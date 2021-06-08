Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2512039FE59
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbhFHSEu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbhFHSEu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:04:50 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55907C061574
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 11:02:46 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u126so12335403pfu.13
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=a9iWjq/r64S1J8jlSLyqDjTNuYB3qfXxk7hqC8TOXSE=;
        b=PwYMiYqnpElV+5zmRrqt6wq6YO2wjcs0ikV3AP6V1uzj6HpMpML4utZX47p1wbIlpz
         cqQoxgdBYGxXe8bcVHFLK/Bufdi+P6NOvK007lxUrz3roMWUCETKooZLlcRc6vsQSLm7
         JjJMCtAMf1q5WRozXYk3cpONC3wKJINbtq2xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=a9iWjq/r64S1J8jlSLyqDjTNuYB3qfXxk7hqC8TOXSE=;
        b=e2S1GlqwGiTtUPg4BUx4AAzEHbE3YlwXWWvLuSEd+qye2W9X78I8sraBduVvp0FouX
         GJrUyulA+sZmPc5GmdL31jie4LQzpCxhTommF7l/kczw/kWfuOXmkxQB+Rc4U/6tIJpT
         1kWjjM+7Xlr0TnGPzwLK7tmv+YXzKj9VKx1E65g217My5OontgVHxB4DX+kED7mgvlQz
         oGwU4yP7ydNDkr+fIMEltB1WIouU7Y30SKJL/mjJSZQikHoKev37d6PCril1kUg49N/s
         glGLfaE0YYU104/I3OHC7lBfyF/9Sn9JzEdW0FXsLwmWehV4KCQbyQtZtk+/s6ilhuEj
         VjpA==
X-Gm-Message-State: AOAM531Zjuqao+1lQtLWGnFL80YEFVOCHkrbjimgOMp3ru1rDiSb/Ytj
        jQ5enqbnVhYvBMrcMHy7mwB9qQ==
X-Google-Smtp-Source: ABdhPJyqhfKSU7llctrt7kGKkCsyqgpWS7m7VFoBEcUercr80RzEASnEqXUpAGiJZHDP8uhbcLCMLA==
X-Received: by 2002:a65:6243:: with SMTP id q3mr24235811pgv.297.1623175365702;
        Tue, 08 Jun 2021 11:02:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id lw3sm8166363pjb.1.2021.06.08.11.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:02:45 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:02:44 -0700
To:     Kyle Tso <kyletso@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: tcpm_handle_alert(): Error handling issues
Message-ID: <202106081102.62B7A8AB00@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210608 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Fri Jun 4 13:24:16 2021 +0200
    063933f47a7a ("usb: typec: tcpm: Properly handle Alert and Status Messages")

Coverity reported the following:

*** CID 1505153:  Error handling issues  (CHECKED_RETURN)
/drivers/usb/typec/tcpm/tcpm.c: 2227 in tcpm_handle_alert()
2221     	}
2222
2223     	/* Just handling non-battery alerts for now */
2224     	if (!(type & USB_PD_ADO_TYPE_BATT_STATUS_CHANGE)) {
2225     		if (port->pwr_role == TYPEC_SOURCE) {
2226     			port->upcoming_state = GET_STATUS_SEND;
vvv     CID 1505153:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "tcpm_ams_start" without checking return value (as is done elsewhere 15 out of 17 times).
2227     			tcpm_ams_start(port, GETTING_SOURCE_SINK_STATUS);
2228     		} else {
2229     			/*
2230     			 * Do not check SinkTxOk here in case the Source doesn't set its Rp to
2231     			 * SinkTxOk in time.
2232     			 */

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505153 ("Error handling issues")
Fixes: 063933f47a7a ("usb: typec: tcpm: Properly handle Alert and Status Messages")

Thanks for your attention!

-- 
Coverity-bot
