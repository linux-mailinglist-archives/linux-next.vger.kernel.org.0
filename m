Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25A25A88F6
	for <lists+linux-next@lfdr.de>; Thu,  1 Sep 2022 00:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbiHaWYE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Aug 2022 18:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiHaWYD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Aug 2022 18:24:03 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E5CEC4FD
        for <linux-next@vger.kernel.org>; Wed, 31 Aug 2022 15:24:03 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id s206so14705251pgs.3
        for <linux-next@vger.kernel.org>; Wed, 31 Aug 2022 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=60GRsUgRkTdPz4xi04kuui22nUenvlMnOmDZsmxfnbM=;
        b=SeKkEP/uI+KNHNJ+acl26/NVRx/7TNlZYddwRjQSKzF4vOGAoUBTBHeXw9ICdx5EWC
         OLf60V13t4uv38fJzIzmk9aUlL/aKLF85pnyWpOpEofGJ27pTmuB6L9eEwVluw5l2w5S
         07T5iQ5Uw0zAytQdSbuzsXn44ckSfSKhyisZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=60GRsUgRkTdPz4xi04kuui22nUenvlMnOmDZsmxfnbM=;
        b=LbQtSUkyUKYQ4QM7oFWP/TdJZppXVuo8CEWcBze4opNkm4k6t0ghlDMdbU3Zw38eqh
         40gxLnA+1hvDrYcW/42c9+UA5qpfGjX4xYeKFTIKK3O1sGSSoKRSmeORH5+drHVCyKvF
         JXc5bnLjTegNjzn45GjcWeqR8Z2scwdCAGSr1UyXfcTLd/nBQgzkwC+B1Yf54lrVg7yP
         E5EqoMQ9LntFR3wQesLJU/BSYPfyNA2LbL0O6jk4W1/41b9hRKVA0qtPzOYfk6IchOci
         TwFX55beBi3PeDX9Ha5S4HhJiOtbBQ1IcbWP4R5Y2oRSGGYsn4ECPre1I8ttqvKRcDmm
         ItFA==
X-Gm-Message-State: ACgBeo2l+mQH9YSlXKLLSbaa4MwEEG4W6BS4bmpdvNbY5Qal6cRVCqnu
        Q7P5aOvYCnkNALVeX0v6PGDi3AnYY0rPGA==
X-Google-Smtp-Source: AA6agR4ZAJy4bx7E5ployD7pPwDkeDmj9tHbuGHviCfyIEVCN0syznS8VROkRIDMBFNIjJ237Y/O1w==
X-Received: by 2002:a05:6a00:1952:b0:537:1bb2:8451 with SMTP id s18-20020a056a00195200b005371bb28451mr28613572pfk.77.1661984642526;
        Wed, 31 Aug 2022 15:24:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u66-20020a626045000000b0052da33fe7d2sm9899424pfb.95.2022.08.31.15.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 15:24:01 -0700 (PDT)
Date:   Wed, 31 Aug 2022 15:24:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mm tree with the kspp tree
Message-ID: <202208311523.D60D78A@keescook>
References: <20220830170051.6c190838@canb.auug.org.au>
 <202208311050.60A8E9C43@keescook>
 <20220901080504.73843b04@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901080504.73843b04@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 01, 2022 at 08:05:04AM +1000, Stephen Rothwell wrote:
> Hi Kees,
> 
> On Wed, 31 Aug 2022 10:51:08 -0700 Kees Cook <keescook@chromium.org> wrote:
> >
> > Thanks! Andrew, can you drop these patches from -mm please? I corrected
> > the filename convention in the above named patch.
> 
> He did that yesterday, so all good.

Thanks! Yeah, I saw the drop right after I sent my email. :) Sorry for
the noise!

-- 
Kees Cook
