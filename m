Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06946389A6A
	for <lists+linux-next@lfdr.de>; Thu, 20 May 2021 02:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhETAXC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 20:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhETAXB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2021 20:23:01 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDD9C061574;
        Wed, 19 May 2021 17:21:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id w15so17617610ljo.10;
        Wed, 19 May 2021 17:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHRerCEF/FbMl+SWJweHH5icQ6pNPVfCm/ZYSJg/O2c=;
        b=lezQj5XeqteFJXdidRoy0sfyeX/EQJAPDUgEBxqjeHtw5T4n5h41t8raaCyaROAsK0
         ZZmILoJJblPIDRS3gt7hM+h5PZCMY0YfbBL6Yp3FkL9iopRyq4HLgZjNVrDC+Wpg2odi
         HvSwHrPB0t2dIT21FiMdPap3saljZLvs7l+svUGUQ9jVi2UW+2eDkgHpFz8Qtfs9JZTk
         bfkjqNw27ghyt9sfgPysDXJs54Kl910bM6Prgg56bSBLi/+23wNlKF7Mg0Sb9r93VyM+
         Bu6vx8XimiAhafUDWu9rwltOrP5L1y0FyTRMYFEfSJzfrCioFNS7dOW0Wc9AuSzFAgfO
         VrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHRerCEF/FbMl+SWJweHH5icQ6pNPVfCm/ZYSJg/O2c=;
        b=Wh25MiZ6q/Qh40KF1h/+qCtmdGKaIz7v80aGiNUqtMLzhug7NJY/wA+D8B+vS6pRWC
         vmbYoODYY3dLSBLJJi6zcOb0/eFCKy50X0BhCYjaHoVkfrdvIMWrYKlGmCI4DOs7WwM6
         1ZicKjyhx2RDGJlXkknY5etnyeWDunp76pM0Pd7zcsVHqPBXVUSM++i2TbWXRtVfTKj7
         6pYgHEANQIO7gOY++zLOZ4khOb2zbNGrrhEW9ohGmpnsgkx3nwUfpF3bCdk1C/OkdUar
         EJDSh1JN4/y5ah79TqI0Dk3RMkz6IboV9ki1k51wqvXms9Kr8JooaOYTvUENrNoD8M8r
         baKw==
X-Gm-Message-State: AOAM531JE2U+j/FQC/eYqu6BmltfFF5jpD7yW9SIqGeJ1dKzflmrDrWx
        +SLIms1+ZL2gyGF86defURb+0m+jaCPBmgIPiQg=
X-Google-Smtp-Source: ABdhPJzMs9Ad0qRpWQVNkw52A9XZTTCnvpFcdRJft986PXjD+lMyrH363aEnY2qCNCPMIRDcWMrXLTqOL6ZSMaOjoe0=
X-Received: by 2002:a2e:9e57:: with SMTP id g23mr1232262ljk.148.1621470098179;
 Wed, 19 May 2021 17:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210520075301.6a2cf55c@canb.auug.org.au>
In-Reply-To: <20210520075301.6a2cf55c@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Wed, 19 May 2021 19:21:27 -0500
Message-ID: <CAH2r5ms=mUQE=kRaRqwJvAFS=tMOQ1V5NLuYStQhhmjM9c0iOA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Patch description ("Fixes: ...") updated as requested.


On Wed, May 19, 2021 at 4:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   158c6b1e3dff ("cifs: fix memory leak in smb2_copychunk_range")
>
> Fixes tag
>
>   Fixes: 9bf0c9cd431440a831e60c0a0fd0bc4f0e083e7f
>
> has these problem(s):
>
>   - missing subject
>
> Pleas just use:
>
>   git log -1 --format='Fixes: %h ("%s")' <commit>
>
> So
>
> Fixes: 9bf0c9cd4314 ("CIFS: Fix SMB2/SMB3 Copy offload support (refcopy) for large files")
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
