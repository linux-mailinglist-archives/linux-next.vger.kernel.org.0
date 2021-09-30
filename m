Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C4241DCCD
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 16:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351985AbhI3PA6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 11:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352076AbhI3PA4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 11:00:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AAFC06176E;
        Thu, 30 Sep 2021 07:59:13 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b20so26806497lfv.3;
        Thu, 30 Sep 2021 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXJomLc+ETu87x5gzIXc140k36Eivu7hkRyePjdus5Y=;
        b=l9gVGhDg0hmhy8F+Sv2j0VsBPb/Zu8DwpI+0AgbsIp4CmKA8a09JtKy7XbXcHCSxXQ
         fL704aBtHiUANe4huKhzQB3t5KUiP+MqR6c/0yAFGlEm0Pia3NQqnL1yS+81sXnIPyru
         6dflRV5x0iQ3xHC7FTeX2QcLzVkH4ypNbRcZPxHQKG2Sg80/E7Vc+1r0V8Ocd+AOTAEu
         ml+lVUfMgBEUEYVyYrynyBoAA3JpseOSbDLqsAh7AuvNi75/nCu2jE1+q+HQAz/zJ3tt
         AP1mwdeF2b3yzsIciQ8kYaZOIaaXEX1yIvDbvSPBmB2oUbYaWnbDUYnjvN/DD00xJmtl
         KKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXJomLc+ETu87x5gzIXc140k36Eivu7hkRyePjdus5Y=;
        b=7h20RVUF2W7/Pq1xbk0H4OpVpQY9Lx5dud8uuW4UEGOWa7rHQEcEJg1vpodgRhK2cv
         DYU5JyvNJdgsAIOu+yYU6Q5OKhdGE1tYJ9gNFtU89dQ8AW5bd3e+qp9za+6/cgMQ/YEW
         1cxQw0BlggWY7FI6bHzTdbo2AMNN/t+0Ery0mlKFHxeo78Uxer4mWSz2+s5v/xgPp8uB
         r0KoAapILXSs0yVbLBWqrISNEyG2IrNxKt1LwncrW58lwi8iuGnMy533Dc1Gv/UZ3EBS
         hJzDIM/Mp17WBF3wsjLXto0cnPu1PGRNFCoMyiVcdtOEmYyG7MYUnt6ne8R6dV8z8bjY
         NEJQ==
X-Gm-Message-State: AOAM530+9s5L2iLDQIPmMXV3KfmCiIU97njFX8cRZb4hm4yWRBzXu0MC
        pKV512vkrLHXkwordi6GTyqJQ0xf646aI8aBOun0M2A6
X-Google-Smtp-Source: ABdhPJwDrktxMbpx31KTMixUAoitmdjcxSFGudWWp+Fu53NbxWQcZZymvYSTpJeo7qoCq9wzeSt7P/+VVRGdy7eSbL4=
X-Received: by 2002:a05:6512:dd:: with SMTP id c29mr1721110lfp.601.1633013943138;
 Thu, 30 Sep 2021 07:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210930175606.0d59ce6d@canb.auug.org.au>
In-Reply-To: <20210930175606.0d59ce6d@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 30 Sep 2021 09:58:52 -0500
Message-ID: <CAH2r5msqnFecadKhzbk3sD9cwJmsrkMjUkxeHmERChscNX3_4g@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the ksmbd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fixed.

Signed-off-by:    added

On Thu, Sep 30, 2021 at 2:56 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   fa8050db505a ("ksmbd: fix transform header validation")
>   1557419b2a9d ("ksmbd: add buffer validation for SMB2_CREATE_CONTEXT")
>   b9abf3609fc5 ("ksmbd: add validation in smb2 negotiate")
>   53e5d1b230f5 ("ksmbd: add request buffer validation in smb2_set_info")
>   8e52566602c0 ("ksmbd: use correct basic info level in set_file_basic_info()")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
