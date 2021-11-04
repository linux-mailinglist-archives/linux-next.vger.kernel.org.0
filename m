Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF60445B82
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 22:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhKDVKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 17:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhKDVKt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 17:10:49 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931ADC061203;
        Thu,  4 Nov 2021 14:08:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu18so14707353lfb.0;
        Thu, 04 Nov 2021 14:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3x8ra5sNrTiTw8qM8NIDlugsWNCkwlsLBa5rW7Dmzw=;
        b=cU8zhucv4Q58CAwoyCTw7SC6WQEnxPbg3jdwhgLYS211esOGAZ3q0BpUn5ilVBIrRi
         nzb66LBeEiPbdDvMB/oXdnrKaO0PZR57A6SGtZTGWZo28yFYOBOtS9v3Vd0s9Ti4WCsJ
         CGcxpLfjV1VEtMf4VxmWygOJG2bp1A7N5sUkP0t3JOx1+uffRuKs8uUflS05Ilnz08qE
         GW7B2Qzw8sRiAv+b2A8wZyQhvPMPByqHse/YGrHPYHIUpphClOKGwkXqbzqt1syZzqLZ
         dzGJzHb+gvzeQet54znhXhA7Ucv7mt31jHktiNKOhSXKbl6Ayksdb2KFfL2ethZb2JVD
         glCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3x8ra5sNrTiTw8qM8NIDlugsWNCkwlsLBa5rW7Dmzw=;
        b=ojhefaOdPyMevWe6bedyo/s9eSZqPEFtyk+bh942QkGW9zZsaShQj4yjRD9fANPjNC
         2eYNZp3WU1sLHMbho/wbJsZ4TrnWFTt6C0CHo0aJj06PDe2z0NM+PHYIpMDOOlwmYXXM
         w+aGrmWQh61M8XVnQGReY0JGUk+QkrB4ByXbHUm0mYOCPcm/iupUFnlZMdnJ5D4O8/Ho
         FUTaMh65u/74X8e90CWIE5aeRKsWkClj86cWa1jpNJiK82+vbRO8bj1U37fyEFvWm8tr
         qODTK/wIOPE5qKUyzrp41mDVtgddpp8/9tX2L2jyoHh2Y2H6bgKJh41wfghj358gQYlQ
         DCQg==
X-Gm-Message-State: AOAM532hQf12ogYXtHvTjhwAMRr8LafGhwsJX9OoH9yYdZCz5UWGrSKX
        3W/OCavXGvxK1inGejve7Dee2KhFzM5uWa9Uzo4=
X-Google-Smtp-Source: ABdhPJzUtNu6HpNLfKsE5QP8GTvju8c6761QXrM2Xh20TAjvQCSvlOtBSVsg35YYg046e5OI7xkqypiAwQYydrsm3+M=
X-Received: by 2002:ac2:4309:: with SMTP id l9mr48883244lfh.667.1636060088866;
 Thu, 04 Nov 2021 14:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211105074627.76ab1526@canb.auug.org.au>
In-Reply-To: <20211105074627.76ab1526@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 4 Nov 2021 16:07:58 -0500
Message-ID: <CAH2r5mu5NLoUMKJ-t8hBVKEuCP5pA9CyJ41YUdggr3RsSNpYgA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the ksmbd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fixed

On Thu, Nov 4, 2021 at 3:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   99f76ea5661e ("ksmbd: change LeaseKey data type to u8 array")
>   f5ab639bc25e ("ksmbd: remove smb2_buf_length in smb2_transform_hdr")
>   1b3bd95c0471 ("ksmbd: remove smb2_buf_length in smb2_hdr")
>   2361911de730 ("ksmbd: remove md4 leftovers")
>   13fe1226bef4 ("ksmbd: set unique value to volume serial field in FS_VOLUME_INFORMATION")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
