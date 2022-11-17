Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C9662E95F
	for <lists+linux-next@lfdr.de>; Fri, 18 Nov 2022 00:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbiKQXOf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Nov 2022 18:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbiKQXOd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2022 18:14:33 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB109716CC
        for <linux-next@vger.kernel.org>; Thu, 17 Nov 2022 15:14:32 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d20so3012297plr.10
        for <linux-next@vger.kernel.org>; Thu, 17 Nov 2022 15:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxh7ZIMAwOf8tQ5bBt1rmaA7jYZVydQJoYO/fiU1FyU=;
        b=AqrwnZuhFVU0aPbl6IZJR1sckJQiFv7nsHmnRXjrQmyy5Clie241H6/UT49hXOVXfZ
         TuDtO4NNlWlIE0MYuxvXRt/ed8k/ohuRSDt4AX9HIZ3lo9bIgnjFVyWuwAl1R/0xyAcL
         MCjNVGLccDlGLaBeO0b4AQ6NlugIF8Ihx3eTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxh7ZIMAwOf8tQ5bBt1rmaA7jYZVydQJoYO/fiU1FyU=;
        b=OWvAA23HCAxzjxdLVKqdlCKOOVtELRnovRJ8vkIRwr7MJCbuDChUoYaSwNUl5sNr62
         IRdvcCaMph+NFNiuQazo0zVIiBb+rOfwPirDIEXOHIOvDA4LNUA1eVaPDZNW/B7ygrC4
         TGMfVV9oKT8ubU5IHD5iAg3wicmuaQ0Jee2XECDayQpFYc4b6DwOu/fgM/yfL3oGMaMl
         DkvR6xrv7LB1IAfLSxe86AzIxwUiMDqP3sbyjDxQVH+AzjHobSF1ZI1ns3KWVeBCLG14
         DL371QTdrgjaXOKE0mnCcc/velCPDrJG8CnvJ2kTbOIVaNLNKCJAMOtPikQ8BX7n29Fm
         Ysrg==
X-Gm-Message-State: ANoB5pmnyoyece5OLCoiYhJPryUZc+S4hflgnGp/YQphR7aPqAQzFzWs
        dtYM14qdFDBIFqWssUIRcnW2lw==
X-Google-Smtp-Source: AA0mqf70nFKYuMRGCOQGuJkKtnuOjfjcKxMd3tjx4JHvxkYbX4cYLXpfT1uIvdiKYUwiSYoduSWqVg==
X-Received: by 2002:a17:90a:6904:b0:208:4bfa:51e1 with SMTP id r4-20020a17090a690400b002084bfa51e1mr10606132pjj.228.1668726872280;
        Thu, 17 Nov 2022 15:14:32 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 19-20020a621513000000b0056c0b98617esm1744204pfv.0.2022.11.17.15.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:14:31 -0800 (PST)
Date:   Thu, 17 Nov 2022 15:14:31 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Eric Dumazet <edumazet@google.com>
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
Subject: Re: Coverity: __sock_gen_cookie(): Error handling issues
Message-ID: <202211171513.28D070E@keescook>
References: <202211171422.7A7A7A9@keescook>
 <CANn89iLQcLNX+x_gJCMy5kD5GW3Xg8U4s0VGHtSuN8iegmhjxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89iLQcLNX+x_gJCMy5kD5GW3Xg8U4s0VGHtSuN8iegmhjxQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 17, 2022 at 02:49:55PM -0800, Eric Dumazet wrote:
> On Thu, Nov 17, 2022 at 2:22 PM coverity-bot <keescook@chromium.org> wrote:
> >
> > Hello!
> >
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20221117 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> >
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> >
> >   Wed Nov 16 12:42:01 2022 +0000
> >     4ebf802cf1c6 ("net: __sock_gen_cookie() cleanup")
> >
> > Coverity reported the following:
> >
> > *** CID 1527347:  Error handling issues  (CHECKED_RETURN)
> > net/core/sock_diag.c:33 in __sock_gen_cookie()
> > 27     {
> > 28      u64 res = atomic64_read(&sk->sk_cookie);
> > 29
> > 30      if (!res) {
> > 31              u64 new = gen_cookie_next(&sock_cookie);
> > 32
> > vvv     CID 1527347:  Error handling issues  (CHECKED_RETURN)
> > vvv     Calling "atomic64_try_cmpxchg" without checking return value (as is done elsewhere 8 out of 9 times).
> > 33              atomic64_try_cmpxchg(&sk->sk_cookie, &res, new);
> 
> 
> Hmmm. for some reason I thought @res was always updated...
> 
> A fix would be to read sk->sk_cookie, but I guess your tool will still
> complain we do not care
> of  atomic64_try_cmpxchg() return value ?
> 
> diff --git a/net/core/sock_diag.c b/net/core/sock_diag.c
> index b11593cae5a09b15a10d6ba35bccc22263cb8fc8..58efb9c1c8dd4f8e5a3009a0176e1b96487daaff
> 100644
> --- a/net/core/sock_diag.c
> +++ b/net/core/sock_diag.c
> @@ -31,6 +31,10 @@ u64 __sock_gen_cookie(struct sock *sk)
>                 u64 new = gen_cookie_next(&sock_cookie);
> 
>                 atomic64_try_cmpxchg(&sk->sk_cookie, &res, new);
> +               /* Another cpu/thread might have won the race,
> +                * reload the final value.
> +                */
> +               res = atomic64_read(&sk->sk_cookie);
>         }
>         return res;
>  }

I think it's saying it was expecting an update loop -- i.e. to make sure
the value actually got swapped (the "try" part...)?

-- 
Kees Cook
