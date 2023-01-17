Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC1666D73E
	for <lists+linux-next@lfdr.de>; Tue, 17 Jan 2023 08:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjAQHwA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Jan 2023 02:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbjAQHv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Jan 2023 02:51:56 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E821F2529E
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2023 23:51:54 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 78so21334771pgb.8
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2023 23:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmyMeB2zbAxtapcD/wm2OlZOXccSGZb9k0M2Vo9qkN4=;
        b=K/9et2Rg7nat8Dv5fyB95COZ39EMXZJgtRBccrm6ux1Gq+cj35q2bhPEdhpCp9wl8T
         qXjDMe0mgZu8SihT5cgawvLvohd6j9TsIIt6T1K8LusqRtBA6A9LYr9RgZPB6saD1O3W
         JGwJbtzrwkUDn97ycvwAPJwmLw8G29ARb94ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmyMeB2zbAxtapcD/wm2OlZOXccSGZb9k0M2Vo9qkN4=;
        b=FSaM5mw0Is3+2rVDK2cW6DKOjKNPqXGN09g2HgLaFMGTsBQ6axWeA8W/kp/GFyO/Xg
         uNE90Cwv440uuJnFqk6sf8B/VGajV6msJNE35aNOJarsmfy6FN4CqxHrbERBnZWWzYQW
         //pKfw0Yb62ZojZCpeWMgd2M0PlSyK1N6yLgYqZWVaCoKp2UjXRa/of4JvXtLqSuZcnk
         rOkKuI3PRIx3FakLbkGssxGaS0HG2P5cYY22BQuAaPf0o4RtP/YP3Ru9edot+1kPfpa9
         CmrpE51IfhxqbFpwfXqOyC1ZZZEPugferojFr3R9mf1SGu49u5MAsEm8kD7PL0jwjw0Y
         MbHg==
X-Gm-Message-State: AFqh2krKE7OBKEdhkCt7QgnbaUwLK8Xeq/chydFkBGG1vHoHUbMPTX2m
        NYEvfM2j6/MpcWqsHTcmSx0JeQ==
X-Google-Smtp-Source: AMrXdXtgAU66PVvAqVXZ1XENJgmqFAWglW3kYw11lYmpWxSe0IOo4Kzn4R0Y7dxrXQxee4c934ziCw==
X-Received: by 2002:a05:6a00:3254:b0:589:9b8a:9c71 with SMTP id bn20-20020a056a00325400b005899b8a9c71mr2464754pfb.6.1673941914410;
        Mon, 16 Jan 2023 23:51:54 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id 18-20020a621712000000b0058b9c9def36sm9524567pfx.139.2023.01.16.23.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 23:51:53 -0800 (PST)
Date:   Tue, 17 Jan 2023 16:51:49 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        coverity-bot <keescook@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: console_prepend_dropped(): Memory - corruptions
Message-ID: <Y8ZTlVX3HQUVkU13@google.com>
References: <202301131544.D9E804CCD@keescook>
 <Y8KAhaiZQOWTcfyF@google.com>
 <Y8V8tqMJeB7t+rcJ@alley>
 <Y8YRBo7ZmtzWT4J1@google.com>
 <877cxl3abr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cxl3abr.fsf@jogness.linutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (23/01/17 08:16), John Ogness wrote:
> On 2023-01-17, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> > On (23/01/16 17:35), Petr Mladek wrote:
> >> 	len = snprintf(scratchbuf, scratchbuf_sz,
> >> 		       "** %lu printk messages dropped **\n", dropped);
> >
> > Wouldn't
> >
> > 	if (WARN_ON_ONCE(len + PRINTK_PREFIX_MAX >= outbuf_sz))
> > 		return;
> >
> > prevent us from doing something harmful?
> 
> Sure. But @0len is supposed to contain the number of bytes in
> @scratchbuf, which theoretically it does not. snprintf() is the wrong
> function to use here, even if there is not real danger in this
> situation.

Oh, yes, I agree that snprintf() should be replaced. Maybe we can go
even a bit furhter and replace all snprintf()-s in kernel/printk/*
(well, in a similar fashion, just in case). I'm just trying to understand
what type of assumptions does coverity make here and so far everything
looks rather peculiar.
