Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E652068CC
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 02:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387954AbgFXAHi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 20:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387951AbgFXAHh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 20:07:37 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3630EC061573;
        Tue, 23 Jun 2020 17:07:36 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id d13so122250ybk.8;
        Tue, 23 Jun 2020 17:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qShZDIcN/jFhOwqO29jMZXeHqEdC9ZyhtPQiroLvjyE=;
        b=KGmPGFa43fZf/V6c02MbxHTWqoEWeu62GfXnZr/qc/Kkh1U50EtgVcf1OXjEKiMzFR
         poq0vb9AjdMXC8ioDD2mE1IctXXgXcrM53zgZ2zw0OyuX7c2Dg4+lqt1+mc4lEu3kqfD
         7YJjM4yMbt6xJBc9tL2JD0idrIuosv/hTWPKkKPOv63iy8kiPP7hdkWJjpXeNxLiKGmA
         RvcEssXEpJUW02vNJ2xAu4GRKjdFKHbH31C8R0kFEBPXR+8DMnvBWtQIVhAaVn+3l0va
         J6BU4QHtV6m07YnbMZ5Z+I/3Dl3beqB+31QRC0Zz/HVb7rLxl3iuuVyden+8C8Day4rO
         70BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qShZDIcN/jFhOwqO29jMZXeHqEdC9ZyhtPQiroLvjyE=;
        b=tbys6K/W5l1qVeaC/YQC3jtc0R/FLEqZrjOiP5UIHlLD9FENqWuVmYDCxaDKBQNV2/
         SmjHaDBvgxFB5E2r4TZJXVrMrYwu/c24pnP3sE0cIzYgAc1SzMl1vo7uvUbXti9pAtfe
         2Ct3+DHAhRzuwd61qjQvKoLNvVY+8tOwHJaqGST1OcA89XURnoWrMuubnlKCMxR9zF9j
         +y/uuTHFEdMuvmd0sSTulRwdpNm3kP0t5EmHEjAzx/+YYx+s7GfkMIbkTWtoXgyNO846
         TO4t+25ZYlc2hoTiyos41jCIECwPLjbH6UlKGExQ0+2NB5umsq5HTPsTCAcMY3mxQX2b
         aC4A==
X-Gm-Message-State: AOAM533+JqeAssLVLxDAL7BD1KWJ/+7hi1MEQVdVHhPXSF/rMtxgmg6J
        CiohidaXLt/zFBeuc7EF9goXwU+E0m3bZ55LSdNWtQ==
X-Google-Smtp-Source: ABdhPJyTrja1DJ79D22qD1X1gM/+avVVqpHjXFElnVgpFom29/W+s7ljUPvZyduZ5Mi9RQMl2NreT3cr4NzgwI97g8E=
X-Received: by 2002:a25:bc81:: with SMTP id e1mr37206935ybk.375.1592957255400;
 Tue, 23 Jun 2020 17:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200624083133.466f1f19@canb.auug.org.au>
In-Reply-To: <20200624083133.466f1f19@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Tue, 23 Jun 2020 19:07:24 -0500
Message-ID: <CAH2r5muqFH6zxt+uNt=ySeATj9CGtzpAX1TNFPLzqbJg2uaWoA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

cifs-2.6.git for-next updated

thx

On Tue, Jun 23, 2020 at 5:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   52e2b5b30cee ("cifs/smb3: Fix data inconsistent when punch hole")
>   76f77967b39e ("cifs/smb3: Fix data inconsistent when zero file range")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
