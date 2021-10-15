Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F7442F4D5
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 16:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240073AbhJOOJM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 10:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240022AbhJOOJL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 10:09:11 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C9BC061570
        for <linux-next@vger.kernel.org>; Fri, 15 Oct 2021 07:07:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id d3so38493081edp.3
        for <linux-next@vger.kernel.org>; Fri, 15 Oct 2021 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G51e4PpI8W4J01YSGetHqOIh8jM2l9vK/+9C0iM2DNo=;
        b=fHUEs19RxMoKJwwjVghwqPqKkZv5xTxpAr8yVkHhhWZDTV7DN/o92hr6MO6jLGdWQB
         dj9WXnIiaNFZ/SnGlTjl1MTjhXtmmsEd1bVx6ZPaCvG0W45ZIo9w5NOhuVYgAqbWQSxp
         UVtRLQc+JAYNatbASeIy0nms/0z1z3l9p5FuZ/a/N81Vh98A4Tu1BdtKu8K1ecLQ7C/2
         JtIggMkOmJWku2J3MGpQKeZnKcOoe7y3gROBpvMvzabaW+eQibdd6f8JIs8poc0UiOXl
         cbREoZY0LmQZhWNrBYc5O9qLhBrLz95Ii0PGECPgWt4xl6yYTJ5mKxR7Iqw7KBvSCI5f
         UBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G51e4PpI8W4J01YSGetHqOIh8jM2l9vK/+9C0iM2DNo=;
        b=0o6jFXbS9ZAxqM1M6MfIyK5+2tJzLoFPx/ZhRCZN5SoXlwIv5HmYR27Z6KafFvPu5s
         C0yaNE7bTAFUApHeDR0onXUdaUNOuj9XnODh/4cec4M87lROga4Cd6tjsip0+H1w3Z/y
         EhDJ550EbhbvPtnmicglWF553mQjUIZD+t+qUCOf3jT8CdzxTB9RaVaZn/1yVhsE99R/
         6YOl9Q9eazzUTcOguQtQVovlO+HrQZG0it4bUqNWMQbRnyJY+syohQJRvn65iXFAu/O3
         nAg/sEKpg5U7i+qTpYEqe1T7hhLihtDsysdRWwYMOEMzh2IadeJ4nkfoMs1ANqu07ikP
         JMLg==
X-Gm-Message-State: AOAM5322tcr5DhyQ/COk9u2EtEQpsKshCQT5VGB/wSMa5KaH2BiHT1YH
        h+XrApKvEEkcbMqvrwPVCQBDA1vZUFsK8kf1MDEQ
X-Google-Smtp-Source: ABdhPJwbRs9kfCT3i5xFzNgOWgWfk4DcQOiUAUQOWcfLZkkD6ZWOFbNHIwXqXEyNzmDp+68PEzNbiXB+5+EcQZFoDiQ=
X-Received: by 2002:a17:906:2f16:: with SMTP id v22mr6985604eji.126.1634306791369;
 Fri, 15 Oct 2021 07:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211015144412.08edc8d2@canb.auug.org.au>
In-Reply-To: <20211015144412.08edc8d2@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 15 Oct 2021 10:06:20 -0400
Message-ID: <CAHC9VhTLmzDQPqsj+vyBNua1X13UK_tTcixKZ7WWYEqMXVOXdQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the
 device-mapper, selinux trees
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?Q?Michael_Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 14, 2021 at 11:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the audit tree got a conflict in:
>
>   include/uapi/linux/audit.h
>
> between commits:
>
>   c1d7fa96e74b ("dm: introduce audit event module for device mapper")
>   5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
>
> from the device-mapper, selinux trees and commit:
>
>   571e5c0efcb2 ("audit: add OPENAT2 record to list "how" info")
>
> from the audit tree.
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
> diff --cc include/uapi/linux/audit.h
> index bf3214530439,afa2472ad5d6..000000000000
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@@ -118,9 -118,7 +118,10 @@@
>   #define AUDIT_TIME_ADJNTPVAL  1333    /* NTP value adjustment */
>   #define AUDIT_BPF             1334    /* BPF subsystem */
>   #define AUDIT_EVENT_LISTENER  1335    /* Task joined multicast read socket */
>  -#define AUDIT_OPENAT2         1337    /* Record showing openat2 how args */
>  +#define AUDIT_DM_CTRL         1336    /* Device Mapper target control */
>  +#define AUDIT_DM_EVENT                1337    /* Device Mapper events */
>  +#define AUDIT_URINGOP         1338    /* io_uring operation */
> ++#define AUDIT_OPENAT2         1339    /* Record showing openat2 how args */

Hi all,

We currently have one of those odd situations where we have three
trees all trying to add a new audit record type in the same kernel
release: AUDIT_URINGOP (selinux tree), AUDIT_OPENAT2 (audit tree), and
AUDIT_DM_CTRL/AUDIT_DM_EVENT (device-mapper tree).  In order to ensure
a more successful merge window I'm going to ask we stick with the
following numbering (URINGOP and OPENAT2 get priority since there is
already userspace and test code written):

 #define AUDIT_URINGOP           1336
 #define AUDIT_OPENAT2           1337
 #define AUDIT_DM_CTRL           1338
 #define AUDIT_DM_EVENT          1339

Alasdair or Mike, are you okay with this?  If so, could you update the
AUDIT_DM_CTRL/AUDIT_DM_EVENT numbering in the device-mapper tree?

-- 
paul moore
www.paul-moore.com
