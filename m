Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4145A9985
	for <lists+linux-next@lfdr.de>; Thu,  1 Sep 2022 15:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbiIAN4r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Sep 2022 09:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbiIAN4r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Sep 2022 09:56:47 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BAA3C155
        for <linux-next@vger.kernel.org>; Thu,  1 Sep 2022 06:56:46 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-11f34610d4aso20904654fac.9
        for <linux-next@vger.kernel.org>; Thu, 01 Sep 2022 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=I6b2BpVPciHMhVZH7YUBZEI4uoChzNOCc33KlKxQssU=;
        b=UfYagmTCEAKlJiF5vi9Lr4zhbHBYRckggijCHnrDqm9tdNhJroir28h2rwqGdpX+sk
         bM9G4RF1NQXxJkb+WSLhb+DNdA4zYtWHOeKkoUJU/gn4R7xXldKgldHrvGWKm0MgsszT
         JNLT7Fipig6CmtfO5qF57rUTh1wjU8SW2aleHywPOZBU4t9AxJy3qSN12N44DvWvqnQI
         qq6IKO+Fz/J1QlCe4s+BhLxonUQdOgBEJQYs4Haq/9MkDWXxBCHkJDIO3z2qDjGcvPQN
         MZ0z0P6jfZILZbGYcWu7kfSNnvvXZB5FPoKcZvG7LNetYcf96Dl398fGyrxEPN5HT1tW
         wHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=I6b2BpVPciHMhVZH7YUBZEI4uoChzNOCc33KlKxQssU=;
        b=nou/jvYEYt87ohDtjxMCgBd2cs1BdoO/TUYWaK+VRh6DucnyRT/WwkfJO+7ffjZ0dk
         xtObUOBYrF6iLuyqnbbpJWAj8j5F7nxgqxHUAQ27tVoJx12x2Zo3kzwlcEW/5KE44b2T
         RzIYqsnFgZuYg6RkPF3NukLlJFhTRDGuts3CWn37iXyKctTR0N1uCwcAhS0dOiskSxSK
         yyoBDZw89kyt3Dl0oI9dTXPo+QDYG2OvIiyWhTrK0HF6bX/wMG6XlneNdLYBRPm+ycjR
         SNoVdLy6TV7P7OHRrUk51UphZsSC19ydVPwEsmW/7FLH89J1fhqt0stAYUP78y0UMxSG
         1k3g==
X-Gm-Message-State: ACgBeo09EjQUhVvPU/ptJYuqlc4Iv7KGZSry7D+pk1ImsfyCepPSKMYV
        Ga/VNXc6z7iMww6Don+kOKFHZ4tGJrEeOp48J7Q7
X-Google-Smtp-Source: AA6agR6sJmqeUCe9RB5vYfnF5hulI5nC7gPvNmZKeMuLtjUoo0UVYScgBw5MsE89TbGdAZbxgapbu7NuE7Gc4/ZtmGk=
X-Received: by 2002:a05:6808:bd1:b0:345:da59:d3ae with SMTP id
 o17-20020a0568080bd100b00345da59d3aemr3525523oik.136.1662040605439; Thu, 01
 Sep 2022 06:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220901122739.6d1a54ef@canb.auug.org.au>
In-Reply-To: <20220901122739.6d1a54ef@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 1 Sep 2022 09:56:34 -0400
Message-ID: <CAHC9VhQV2qW3o_bPnabhfdN_YoY7n7ncU1-8cUpVHhPZ1iLWQw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Frederick Lawler <fred@cloudflare.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 31, 2022 at 10:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the security tree got a conflict in:
>
>   security/selinux/include/classmap.h
>
> between commit:
>
>   f4d653dcaa4e ("selinux: implement the security_uring_cmd() LSM hook")
>
> from Linus' tree and commit:
>
>   ed5d44d42c95 ("selinux: Implement userns_create hook")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc security/selinux/include/classmap.h
> index 1c2f41ff4e55,0bff55bb9cde..000000000000
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@@ -253,7 -253,9 +253,9 @@@ const struct security_class_mapping sec
>         { "anon_inode",
>           { COMMON_FILE_PERMS, NULL } },
>         { "io_uring",
>  -        { "override_creds", "sqpoll", NULL } },
>  +        { "override_creds", "sqpoll", "cmd", NULL } },
> +       { "user_namespace",
> +         { "create", NULL } },
>         { NULL }
>     };

Thanks Stephen, that looks correct.

-- 
paul-moore.com
