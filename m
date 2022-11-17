Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4D962E8B2
	for <lists+linux-next@lfdr.de>; Thu, 17 Nov 2022 23:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240574AbiKQWuO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Nov 2022 17:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240421AbiKQWuK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2022 17:50:10 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEACB65E6F
        for <linux-next@vger.kernel.org>; Thu, 17 Nov 2022 14:50:08 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3704852322fso33404697b3.8
        for <linux-next@vger.kernel.org>; Thu, 17 Nov 2022 14:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oBQqoT8aYHZ0vQjXNPjZ+F7M4m+OJwx56OthzoHvy+Y=;
        b=V/85NRHCgCKO6025dTcmKElFHjJs4o4UrvwFg35hm1KxroNrAGF7AQPOo4PAFFpz/1
         FS3VuVIVF/5YlLLk0sxnl4d97EI1auCMb5+574cvZaCuSN5BiDDIMzJ6YGQGg7mF2+AT
         M4KFp0JqJK0f2A6W27QB6t3TmXruVIwmPoY6t8nvHesVZl7BojEroj9PPAxBg/etlutO
         XyP6d641aLZ4M1/nneKxVrm1aavnuQb6odm5omN3sW9OazWK1It2axj5S9sME0fNfi9B
         aYQ7+zQout9E3QFu4beIntb8LQKs7LmaTBsgg6fZLaPifO/rIvTa+ngGvAVnY5snL4LZ
         BVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBQqoT8aYHZ0vQjXNPjZ+F7M4m+OJwx56OthzoHvy+Y=;
        b=toOUmbNDU1jrrw4h0O03+MrBgyKvYCzAXfp0KHjZZzLwTZ5Zeim7vYb9cRn7dF3msS
         i7Tc1nDSwrBy7qPVvxFFMio2hjpaFijDr7b2hiSYkC78jGzBp4nSsPDRwQ23hYdikjKb
         ZxOS/+orYZ+8lNDsJRfBJV8/SzH9rXMJ3+OuicfyfcavhK1hPR05Ue2wMmMUr2StizQa
         2ds0PnEU40TZDibqkevPlCft+He0/hVoW49YqPmeW/BPRDxfLkSC6B+HZZ3q8StOY0bf
         qC3OUDjFmzDB9h71d84y0zdwyEMBql/lILio2Xc0Lqz4OWssztLoh/XNHlnyefedbpPy
         Ssuw==
X-Gm-Message-State: ANoB5pn6iZp2YNEsbs2/AUMk3zWEPcaN3N9AnbQ9LHBP8yBCmXhS3wEH
        qvAykE9gY1pxVzZGg2ULSRnMJMEm+jOc0RAVJF/nfg==
X-Google-Smtp-Source: AA0mqf7GtacDQKaXHIxqNnE9LxIUJ+gq9okc+66L2C9uDEEJ6ZRBroGBuisOb4OGhCNRp77BS5/k2zxDUOhD/n9aITs=
X-Received: by 2002:a0d:e601:0:b0:356:d0ed:6a79 with SMTP id
 p1-20020a0de601000000b00356d0ed6a79mr3999955ywe.489.1668725407806; Thu, 17
 Nov 2022 14:50:07 -0800 (PST)
MIME-Version: 1.0
References: <202211171422.7A7A7A9@keescook>
In-Reply-To: <202211171422.7A7A7A9@keescook>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 17 Nov 2022 14:49:55 -0800
Message-ID: <CANn89iLQcLNX+x_gJCMy5kD5GW3Xg8U4s0VGHtSuN8iegmhjxQ@mail.gmail.com>
Subject: Re: Coverity: __sock_gen_cookie(): Error handling issues
To:     coverity-bot <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Paolo Abeni <pabeni@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 17, 2022 at 2:22 PM coverity-bot <keescook@chromium.org> wrote:
>
> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221117 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Wed Nov 16 12:42:01 2022 +0000
>     4ebf802cf1c6 ("net: __sock_gen_cookie() cleanup")
>
> Coverity reported the following:
>
> *** CID 1527347:  Error handling issues  (CHECKED_RETURN)
> net/core/sock_diag.c:33 in __sock_gen_cookie()
> 27     {
> 28      u64 res = atomic64_read(&sk->sk_cookie);
> 29
> 30      if (!res) {
> 31              u64 new = gen_cookie_next(&sock_cookie);
> 32
> vvv     CID 1527347:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "atomic64_try_cmpxchg" without checking return value (as is done elsewhere 8 out of 9 times).
> 33              atomic64_try_cmpxchg(&sk->sk_cookie, &res, new);


Hmmm. for some reason I thought @res was always updated...

A fix would be to read sk->sk_cookie, but I guess your tool will still
complain we do not care
of  atomic64_try_cmpxchg() return value ?

diff --git a/net/core/sock_diag.c b/net/core/sock_diag.c
index b11593cae5a09b15a10d6ba35bccc22263cb8fc8..58efb9c1c8dd4f8e5a3009a0176e1b96487daaff
100644
--- a/net/core/sock_diag.c
+++ b/net/core/sock_diag.c
@@ -31,6 +31,10 @@ u64 __sock_gen_cookie(struct sock *sk)
                u64 new = gen_cookie_next(&sock_cookie);

                atomic64_try_cmpxchg(&sk->sk_cookie, &res, new);
+               /* Another cpu/thread might have won the race,
+                * reload the final value.
+                */
+               res = atomic64_read(&sk->sk_cookie);
        }
        return res;
 }
