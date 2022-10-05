Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97C75F588C
	for <lists+linux-next@lfdr.de>; Wed,  5 Oct 2022 18:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiJEQqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Oct 2022 12:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiJEQqs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Oct 2022 12:46:48 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA8A2654E
        for <linux-next@vger.kernel.org>; Wed,  5 Oct 2022 09:46:45 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id s9so10523921qkg.4
        for <linux-next@vger.kernel.org>; Wed, 05 Oct 2022 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Hu+OVpd0/huXrOJ+GKu2yG9DB9Gzph8axQcwOQY12bs=;
        b=VYnLidyPMfS5NTqFeZ6ttWJQ4mP10seDu1P6JqHrG/pDjjGbtGApkPFkqS2HIDTzpo
         zkS3RxYis9jbUCTohc6EUokXz269fxSFi4MvcR/0f0Y4IsxYc2TlEO6smw8dCtFbaZlj
         FVQmXvug6EqnGLfjsLP6UoZK80kacX8yt/oBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Hu+OVpd0/huXrOJ+GKu2yG9DB9Gzph8axQcwOQY12bs=;
        b=a3eDWxo8EX0lhidml1+6UKxTj4tKf6Q/eAqc/ifFCogTdGC/T6/Tss4eZh6Fws0mJk
         QIIOs9NB4xih8cOOB4vPYisE8+WV1LQYQkbHvTgpFqXz+/E6p8QFCJqo2dd9/RrPaZcu
         ZfjhXFh4Ec4A48sRXdszdKQHnTTSRuqCUYCgfej86LNbYs1L0oRuFEwuXE37su2t6VjO
         OKEWa9OCjDr7pawc2s02ejqrOrnWVVZeP9jscyzmuGNql1vwHjkKhUp4rVFfS719cUGx
         CTe2DXK5ogISoz053wbwMpXynFFtnfaHxWgb+DXuySJw6HEV8t3d1rTZ7Mm2gvC15LcG
         mosA==
X-Gm-Message-State: ACrzQf0YOZe27U3KG0B4z8ohiyoMlrDfRo7R4/Kg2I4MCDkF0CaPu2yE
        qgfLovITVVRFvDel+bOM3ptvDw==
X-Google-Smtp-Source: AMsMyM7xsfKwCg7c8POu4KN/cW/upOGM1YgB6+8M2Up1acHTJ/cyVsXwqyg6sPsa9yBin5GqXt5WpA==
X-Received: by 2002:a05:620a:b51:b0:6cf:68b2:d86e with SMTP id x17-20020a05620a0b5100b006cf68b2d86emr390536qkg.176.1664988404901;
        Wed, 05 Oct 2022 09:46:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x22-20020a05620a0b5600b006b5c061844fsm16459715qkg.49.2022.10.05.09.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 09:46:44 -0700 (PDT)
Date:   Wed, 5 Oct 2022 12:46:42 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dave Chinner <david@fromorbit.com>
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-xfs@vger.kernel.org, Stephen Zhang <starzhangzsd@gmail.com>,
        Shida Zhang <zhangshida@kylinos.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the xfs tree
Message-ID: <20221005164642.qhzyfmsekgqrerhd@meerkat.local>
References: <20221004072302.345bfd4a@canb.auug.org.au>
 <20221003222103.GM3600936@dread.disaster.area>
 <20221004225012.501e11ed@canb.auug.org.au>
 <YzxX7ks+YD7U1dcl@magnolia>
 <20221004210400.GO3600936@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221004210400.GO3600936@dread.disaster.area>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 05, 2022 at 08:04:00AM +1100, Dave Chinner wrote:
> > That said... I think we should get in the habit of asking patch authors
> > to make sure that at least one of the email or name strings match
> > between the From and SOB tags.  I can see how people who grok even less
> > about how Chinese names work than I do (read: lawyers) might get fussy
> > about this kind of thing.
> 
> As per above, the normal solution is an explicit "From: <foo>" line
> that matches the SOB.  It's just annoying that our new-fangled tools
> haven't encoded this long-standing convention to warn us when we
> pull a patch with a from-tag that doesn't match a sob-tag.

This is the case of "there's multiple opinions of what's right" here. The
logic for matching "person tags" is as follows:

- check that entire email matches (a.smith@intel.com == a.smith@intel.com)
- failing that, check that the name is a full match 
  ("Alex Smith" == "Alex Smith")
- failing that, check if there's a comma in the From and swap it around
  ("Smith, Alex" == "Alex Smith")

The last two checks were added based on a request, I'm pretty sure. Before
that we only did full email check and complained about trailer mismatches if
it was failing. If the previous behaviour was "more right" then I'm happy to
roll back or put this up for a "what is more correct" vote.

-K
