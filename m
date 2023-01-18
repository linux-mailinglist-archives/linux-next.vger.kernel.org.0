Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403AB670EFA
	for <lists+linux-next@lfdr.de>; Wed, 18 Jan 2023 01:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjARAsO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Jan 2023 19:48:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjARArW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Jan 2023 19:47:22 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC24F1A49C
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 16:33:28 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b17so27759554pld.7
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 16:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0iE+dsh4waSmkn1MEyVbCkXwl8Bzu8QOsUC82XsApoo=;
        b=nhX1XkW/QhRJBX0p9KfNqzI69dq97378uAomMfbqO/sUnOOqkekQzxhYY6Wga3nRRB
         CguE7MqJXEndw2rnQ+hpif5cGc86PAgOmYHeP+1gpl3RZ9MD2zZBtrCaSKzZllsq6NCo
         +qNpJNTMZXMoAOgz1lQCJ8Sk6NQZ/d7Bvy+GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iE+dsh4waSmkn1MEyVbCkXwl8Bzu8QOsUC82XsApoo=;
        b=QtVX4xCvHCuWOXDfzEe/VTVeNYBeqctNF0EJuMpJQueyhWjpMJnWK+YTzMjp7GJbdm
         2n8bNxMZlJoJqOcm7+1dw0L46Zd5FQK5h+Vx96OiMikdVMVtx/CiS6M1aSS4o3/JYxWo
         JLJbGvdMs8zfBcWD2VMums4NdKrxj3b/OR9zK31HWAMR27uJITgS+o4kld56OiUORemi
         5Xpd8HscaOotPowQLtcrKJG5NYd+TsaIWlDKMFEsEkhD77AHJoJQA84sFDmxcK0g3H3C
         vZYKXRXSi7JnHW/fnt9a3yFULM1/xlyaL/NJFYtEvGUQiCVZcNqNeShcIKMAcOInfn1o
         g6+g==
X-Gm-Message-State: AFqh2ko53v12vC7CszSBaOyFXRRmR8YEkYQciZcC7dmgOCcmyLMSby1j
        Q7BaVk9Tf41Cvp7eemYNpXaw5A==
X-Google-Smtp-Source: AMrXdXvYsJbsaTkJBEfvmMG+FRPz7yazRrczJz1Q9HCXHHXXBn2kbs+qVV7l7BzaEm/PSsJZQAM5sQ==
X-Received: by 2002:a17:90a:5d87:b0:229:1fa9:6912 with SMTP id t7-20020a17090a5d8700b002291fa96912mr4798949pji.39.1674002008279;
        Tue, 17 Jan 2023 16:33:28 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id j23-20020a17090aeb1700b00219eefe47c7sm122235pjz.47.2023.01.17.16.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:33:27 -0800 (PST)
Date:   Wed, 18 Jan 2023 09:33:22 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        coverity-bot <keescook@chromium.org>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [PATCH] printk: Use scnprintf() to print the message about the
 dropped messages on a console
Message-ID: <Y8c+UsCjTJP31MzD@google.com>
References: <20230117161031.15499-1-pmladek@suse.com>
 <87r0vsq1cq.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0vsq1cq.fsf@jogness.linutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (23/01/17 22:54), John Ogness wrote:
> On 2023-01-17, Petr Mladek <pmladek@suse.com> wrote:
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1530570 ("Memory - corruptions")
> > Fixes: c4fcc617e148 ("printk: introduce console_prepend_dropped() for dropped messages")
> > Link: https://lore.kernel.org/r/202301131544.D9E804CCD@keescook
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> 
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
