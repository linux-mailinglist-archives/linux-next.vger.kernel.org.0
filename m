Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7164C7841
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 19:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbiB1SpW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 13:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240681AbiB1SpJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 13:45:09 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AB3D3
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 10:43:39 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id j10-20020a17090a94ca00b001bc2a9596f6so12114240pjw.5
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 10:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=sJkhEV59rO2h8a2e2lsSXuhWYpON8Y5Qx+5HjGzzaKI=;
        b=BbINbsLjZnxm+81f8n6xZw36m8MmRCwv1hxJOv+AB9j2yHuBCK1V9+kRgsDBw7KITf
         5sZFLg+lHc70J5PA7qAGKd5WsuiFeWm8+bTFGz3uTrwypL0fyj3akd+gAN+7lSxP/JDX
         CU6QgCtZlRpLKasPb54w1GZ0Ctw8TrnSOzQq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=sJkhEV59rO2h8a2e2lsSXuhWYpON8Y5Qx+5HjGzzaKI=;
        b=ClrNF76R7+vIig9sgFKUBzcOwBzskPzV7YFDBhdMwGX+Zu0mv+74rsJ7jXc3bz73ry
         MUlptzuXEONjbbSX5uHkMXen9F+SPwAPHGxXZqq4cOx6QTiRd4mebnC2F5qEllc2DE57
         RTmWKb5qSjaPFgQrSpi6H/UwFiI+T4SjBxKIMXBb3OUEYDcuj2SMl/FouBwjaZWdY2yS
         f7KbOybUFyIZfzNZYQ3FsVaQpGhASvVIv7JvxpE/n5NHZYNuaeWRXIWvr6sVYaSX0EYk
         0BHs1vLA3kPEuh2//nqi2tERZk+J/6s7mVuChesUlkSxQfQT86TrB1xKHZqqvl4wpxkL
         jE2A==
X-Gm-Message-State: AOAM533Jefa+WnNHLKFLrP95Nl6EXmYdi33qTwm6NICUqtoPPlN8xSGT
        RdDAjup+DIt58kBRIAQv9zhEOtJm3ctVvw==
X-Google-Smtp-Source: ABdhPJy9tKKiijHOD5SUv/RNaXWG3WYJ/RAiTDu0cCVoYxyiuMUH2OLzzCcSgFOKTdgSK9I+jac/ow==
X-Received: by 2002:a17:902:c204:b0:150:15ec:7e83 with SMTP id 4-20020a170902c20400b0015015ec7e83mr20980929pll.3.1646073818747;
        Mon, 28 Feb 2022 10:43:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p30-20020a635b1e000000b0037572b4b9f5sm10761501pgb.39.2022.02.28.10.43.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 10:43:38 -0800 (PST)
Date:   Mon, 28 Feb 2022 10:43:37 -0800
From:   Kees Cook <keescook@chromium.org>
To:     linux-next@vger.kernel.org
Subject: change to Next/SHA1s ?
Message-ID: <202202281042.733E768F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi!

I was curious if it might be possible to emit the commit date along with
the tree/SHA1 map in Next/SHA1s? That would let people trivially scan
the file for relative age of trees, etc.

-Kees

-- 
Kees Cook
