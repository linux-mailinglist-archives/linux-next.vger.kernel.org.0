Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491EF670F01
	for <lists+linux-next@lfdr.de>; Wed, 18 Jan 2023 01:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjARAsz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Jan 2023 19:48:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjARAsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Jan 2023 19:48:13 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ABD32501
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 16:35:07 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso692298pjt.0
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 16:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akL1ISgHERBfu19IDfIMY0yAhbjaA5tAW8Vf2gv80TI=;
        b=fhpdzYPo7tJdOOLdA0KIYT5MME0zX9pMm17HvNzNDuNFagrQwhyhKFB0t9Awfns1XE
         IOoCHgtCwx90fTxTV7qw7VDlpMG37iJMSKQRZQ+pOiqWFZ6FV1UmBGMnxBra388ZdbMD
         o5TsYRTRrawWTSUD3QGUojwNZA6117upjOcvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akL1ISgHERBfu19IDfIMY0yAhbjaA5tAW8Vf2gv80TI=;
        b=FHAupX1t5T0wpq+73uksNsBIMhEOtUA0EuOqIPIpY/a9ukHSqaDVPM9Z/evvYVrI27
         6QCgWcqlfdymScPSnJBhc6Ep+vmsz9LSxCFU6s+7XMBUppHjW4iOdtRWRlN4dkZxJk9F
         9rS9fE48SiI2n9PT9XosoNs8AWaCHTLFciQFdlFNxfiSDRwLODauXjOvNhcEjkZFr7ZI
         LBPtiOw+DlrxdqnEnxK0GYbnSe4/nlO1tBTJBQOobigKr77YRdqOLeja1epw+CAfxUQ4
         srO5ZDUlNgJuFVNzodsuV6mdJxFApeoPZdKkOa2V1MdmzsjFooEpeQNUS4s5otHKpJ4p
         qgWw==
X-Gm-Message-State: AFqh2krHI1l5CHtvai13xBmn+8cgYAAMx2NJ6DB/fefNnPgw+uSLh9g5
        e3yVAvtqKTHnCZPKE/TF38pNfQ==
X-Google-Smtp-Source: AMrXdXsXpUFrV/O+3ioiidXbSLAauvdYK8JI6ZwWp74sGu8F22srdl8XQ08WwG+RUJaayOO1ZE1QtA==
X-Received: by 2002:a05:6a20:a00d:b0:9d:efbf:6623 with SMTP id p13-20020a056a20a00d00b0009defbf6623mr5985554pzj.49.1674002106618;
        Tue, 17 Jan 2023 16:35:06 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id 35-20020a631563000000b0044ed37dbca8sm17756818pgv.2.2023.01.17.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:35:06 -0800 (PST)
Date:   Wed, 18 Jan 2023 09:35:00 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        John Ogness <john.ogness@linutronix.de>,
        coverity-bot <keescook@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: console_prepend_dropped(): Memory - corruptions
Message-ID: <Y8c+tFWFeH272Z1/@google.com>
References: <202301131544.D9E804CCD@keescook>
 <Y8KAhaiZQOWTcfyF@google.com>
 <Y8V8tqMJeB7t+rcJ@alley>
 <Y8YRBo7ZmtzWT4J1@google.com>
 <877cxl3abr.fsf@jogness.linutronix.de>
 <Y8ZTlVX3HQUVkU13@google.com>
 <Y8aEdDxQrQICQtem@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8aEdDxQrQICQtem@alley>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (23/01/17 12:20), Petr Mladek wrote:
> > Oh, yes, I agree that snprintf() should be replaced. Maybe we can go
> > even a bit furhter and replace all snprintf()-s in kernel/printk/*
> > (well, in a similar fashion, just in case). I'm just trying to understand
> > what type of assumptions does coverity make here and so far everything
> > looks rather peculiar.
> 
> Note that we sometimes need snprintf() to compute the needed size
> of the buffer. For example, vsnprintf() in vprintk_store() is
> correct.

Oh, right, that's an excellebt point.
