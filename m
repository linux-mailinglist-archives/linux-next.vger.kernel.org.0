Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A77054D286
	for <lists+linux-next@lfdr.de>; Wed, 15 Jun 2022 22:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344540AbiFOU2J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jun 2022 16:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344979AbiFOU2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2022 16:28:08 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30962A24F
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id v17-20020a17090a899100b001ead067eaf9so3255699pjn.0
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yMCklTCfBEfu1+s01fVuvmfQuZAk4CVG1//MJ4TRqY8=;
        b=V9exO7kqwC3fJwLiBdLMNh7e2NTzSQPXYlgtV/Gr15Ud7DWzNv4ABtfWWzkYx6I0d0
         jAE87FSYs1r/hE1VEXszBB3otRDLkzTSY2oD5gVjSL+dr+xqDOWYRbrI8Mza3mLBu9xS
         i1W019LbMw4Eqn/kHzng56gm7n//xzDVnp5qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yMCklTCfBEfu1+s01fVuvmfQuZAk4CVG1//MJ4TRqY8=;
        b=huW1R5jr5zPE2Z6kNbzBRcv9ISDtjUhU8v9yjIqIpXoIb3uDn8S20huKelK8quIb/t
         de7yXSMt3q48vmxNsxMCCU3zV6S+gPSI6L9ktO9Wy5kSZw9liJMZS1znycCyEdqvOL5u
         4jt/7Qr04kYtboj+59/TW3JhhUDc4CfBLdXrfjt0vA0M5IJ3ZIuJnJKseECbLCWDd0WL
         DOf+1qLb5veV0gpvDXepRVGghYYP7euwtzRQwvsiNqXp2DLsj8DmxWx/9D/lsdEiaxf0
         m8QnjiLcGu83aR1DB/dbCFjh8nHWdN6ZebBmXfPkRD6EjlDFXLC+n6CcY1se9Yw0xVMx
         rEvg==
X-Gm-Message-State: AJIora9jWSrG7/ux9wmwt4OeS8scZ2vy46b4Ycwsg7FEyEZwdqGFvhvP
        SnaukcbRS2s8oeFv6aHgRZ7ceg==
X-Google-Smtp-Source: AGRyM1uu5Dj1T24l5+1U0VQ9oLk+j18+zuRzHRA+X9Uf9ODZyTJweqIyHMLMG/GPb6MqP4jTJFW+aw==
X-Received: by 2002:a17:90b:4ac1:b0:1e6:7c82:9aee with SMTP id mh1-20020a17090b4ac100b001e67c829aeemr12042611pjb.234.1655324881349;
        Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x15-20020a63b34f000000b003fe28130b12sm10146453pgt.62.2022.06.15.13.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:28:01 -0700 (PDT)
Date:   Wed, 15 Jun 2022 13:28:00 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Contextual conflict between kspp and rcu trees
Message-ID: <202206151326.E34CDE453@keescook>
References: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 15, 2022 at 12:55:53PM -0700, Nathan Chancellor wrote:
> Per the above RCU commit and commit 6c5218715286 ("context_tracking:
> Take IRQ eqs entrypoints over RCU"), it appears that the following diff
> is the proper fix up. Would you mind applying it to the merge of
> whichever tree comes second if possible? I did build and boot test it
> but it would not be a bad idea for Sami and Frederic to verify that it
> is correct so that Kees/Paul can mention it to Linus :)

Actually, the CFI fix (and a few others) are meant to be sent for
-rc3, so if the ct_irq_enter() change is in -next, this can maybe get
sorted out?

-- 
Kees Cook
