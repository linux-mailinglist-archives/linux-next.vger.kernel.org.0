Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3764C23A4
	for <lists+linux-next@lfdr.de>; Thu, 24 Feb 2022 06:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiBXFiW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Feb 2022 00:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiBXFiW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 00:38:22 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66477B91D4
        for <linux-next@vger.kernel.org>; Wed, 23 Feb 2022 21:37:53 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gb21so1047559pjb.5
        for <linux-next@vger.kernel.org>; Wed, 23 Feb 2022 21:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2DDiozhVSzQekO9AXYCuVrn3A16qvEAI60NS+DnUsuo=;
        b=IZIGak+w90jTpmv2P0kmx9Z0lGbMGBNXx8a/KM9e6DfpeQd2C86ecWnFsWkcC6ij8W
         fgxGVYJVmB+BUVjxcXAqI1lgNrGceitso6t1PP5lYrJy3hwesGCHrCtOZHbSWwg/WrLi
         ggCP9cmRek3C7Y65tEXw6pcZ8lHbKs0WV2CQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2DDiozhVSzQekO9AXYCuVrn3A16qvEAI60NS+DnUsuo=;
        b=WfZ4J1lQXsAtL2tu/MxLvWe4eapzlVAagR5lJRyIPHl8o0jjjk4LWCz6kwIkfsxEOb
         EGf0kmwy6FGK2E6Q+zmjzTVNU5n29NGb+LrL+LmWltkkUI4lZY9ZaAuVWPKNvMp7JnfT
         6XtVSl+pMTIhqCR2ygh164cTvmEesmm1rEt9z6SpzIg9VF/KIr8rvmUBB68fezoh2haG
         2NKP5JB3PhoaQQSh+YEsSPwhriggvsrhXKJ4URU9a8hYZ03aQ9N8hfSmiTe0i+0r66C3
         Ikh0+CC7fiNPYoSfS0bUWgnio228MR+NCUzmUmnH64vDC5BlNFA2NwR4++wNPOpc0sHl
         lhfg==
X-Gm-Message-State: AOAM530+l+RJrL7PqnY5n5odNbwhQBg/Ba+lMU4Ar85Ua9T/mstNbC5I
        ywqGdEp7yTMHLuFtzwxkrqEPLw==
X-Google-Smtp-Source: ABdhPJw4dpFzl8ElAEreDLwwhROny4X5sXmahSoKVndYA2yo3MuQ5guaqXb8PahfiiQfqbbRX789Yw==
X-Received: by 2002:a17:90b:1a81:b0:1bc:c3e5:27b2 with SMTP id ng1-20020a17090b1a8100b001bcc3e527b2mr1165121pjb.20.1645681072888;
        Wed, 23 Feb 2022 21:37:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 12-20020a17090a01cc00b001bc1e04842fsm4764772pjd.26.2022.02.23.21.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 21:37:52 -0800 (PST)
Date:   Wed, 23 Feb 2022 21:37:51 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Please add for-next/execve
Message-ID: <202202232131.809767F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

As part of Eric and I stepping up to officially[1] be the execve and
binfmt maintainers, please add my for-next/execve tree to linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/execve

This tree currently contains all the exec and binfmt patches from mmotm
as well as at least one newly reviewed change[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS?h=v5.17-rc1#n7223
[2] https://lore.kernel.org/lkml/164486710836.287496.5467210321357577186.b4-ty@chromium.org/

-- 
Kees Cook
