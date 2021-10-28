Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723E843E6C9
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 19:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhJ1RIW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 13:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJ1RIW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 13:08:22 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8A7C061570
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 10:05:55 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id r11-20020a170902be0b00b0013f4f30d71cso3089048pls.21
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=ErvuDA1ElQaCco+4n4DcJ4OhuycZwOW9DeeX1vLe+30=;
        b=LBOVJZKWIzt1/Nn4r/5uhdXigjSqIetx7K1ikqomJ0bETUkwrxDuZgg+WfjSMWrKhq
         qWmL5e1/UNDZbJKhedETmkVxrSB/qtbZVJEExJ8/vd/t2QFlL+rAoKdViOH1ajwOQn6B
         IuNI+JuQlM+3gSsHMvvKjSvQnLZxHiTEyIBUocZcn8cKH277fccZt2XU5vQ3j3R8rBjq
         B60G/UH+4FSL7M1ttTYXVhfgSD3EeXjpFVXurR8UZVqKIAaPcqjZ2C7IRWUIcsGJcWuy
         J4QPnNWQd3ORx2AAtfX2JDfEUvwIhsjYIp0mRmaK2qZgTAcF6yN19BinYE7JEraKTK3C
         ia4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=ErvuDA1ElQaCco+4n4DcJ4OhuycZwOW9DeeX1vLe+30=;
        b=T7ioCrdYqLfj0IB2us6mep7DS1RV7XT8SecMTJlDqH4g6v22zTBZ7GG8BFs5ktPDrT
         P6mZlfw//ME/c9zvhn05opVFnY7GZjRgcwSwI0VbPn96pE7HRYFLVDGN399D4d8h/alQ
         yFj7Ozxhad1dFySXnTZZlK3VPQhiNhMvtbEDoG+oGDl0CXmOdawwwPHDv0TDefHrdeK0
         wCuStUWTxWTFYgFgW8ENzsvrr7JqA/MbQzMXfkY0Ji4MO9OuT+8hwE/NO8+XKaTUnYMd
         icAjm/JEnDTPm0bnXVKxPzMdW1VCvqJgq2mcVj9Zp/AG8YzwjM1FQ035tZwnwriOmhVR
         RTEw==
X-Gm-Message-State: AOAM533ZQpVB22wbTRtcR0lJe/TRi7RMTgC8aFnSVLFwX0MvZ6DSuLhu
        dpqtGluVjtCWV35zxwhDYm1HPKnWbF2+BWdqDg==
X-Google-Smtp-Source: ABdhPJw1j/ergvA9UHnj1GszoH0Stqyu/UZaI6A+IdNtPA7h4FN9o5otSGwFHwdWozUmeCEhviEYL7XgLG1SbfTyCQ==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:ac51:b6be:9b51:3a7c])
 (user=kaleshsingh job=sendgmr) by 2002:a63:2cf:: with SMTP id
 198mr4141837pgc.274.1635440754464; Thu, 28 Oct 2021 10:05:54 -0700 (PDT)
Date:   Thu, 28 Oct 2021 10:05:48 -0700
In-Reply-To: <20211028091646.15f6e6de@gandalf.local.home>
Message-Id: <20211028170548.2597449-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211028091646.15f6e6de@gandalf.local.home>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH] tracing/histogram: Fix documentation inline emphasis warning
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     surenb@google.com, hridya@google.com, kernel-team@android.com,
        rostedt@goodmis.org, sfr@canb.auug.org.au,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This fixes the warning:

Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis
start-string without end-string

The issue was caused by an unescaped '*' character.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/trace/histogram.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index e12699abaee8..66ec972dfb78 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1764,7 +1764,7 @@ using the same key and variable from yet another event::
   # echo 'hist:key=pid:wakeupswitch_lat=$wakeup_lat+$switchtime_lat ...' >> event3/trigger
 
 Expressions support the use of addition, subtraction, multiplication and
-division operators (+-*/).
+division operators (+-\*/).
 
 Note that division by zero always returns -1.
 
-- 
2.33.0.1079.g6e70778dc9-goog

