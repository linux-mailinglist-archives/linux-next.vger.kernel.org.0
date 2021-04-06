Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28BA35590C
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 18:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhDFQUd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 12:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhDFQUc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 12:20:32 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE8DC06174A
        for <linux-next@vger.kernel.org>; Tue,  6 Apr 2021 09:20:24 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id x189so16840877ybg.5
        for <linux-next@vger.kernel.org>; Tue, 06 Apr 2021 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/BfGN9I6trd5BkeqeFDlqe8gVjdVzdmFU44UO56dxZA=;
        b=FyHsXimFgxNgg4LXZcpB/jQYPZPdVvLWdFqr+x2Q1emEnpcHxOqcf8bFw9699Zti9L
         N0sR2lSJLjyEw4ljxx5/DWU50f+8C3ZdwTpNEYiUM1semfFwCcE57T8AUpewIC3VSKLq
         T3+zQZyE4nHlrmMdBS5Tf4nt7abPowfjltZLkf7M6y72eoexwI0N0UwPkFXu6PzvPU5b
         5oWLBDyRr4Pu+Pd8YMj3dOm05KYmG4UKG1sgu8gNUDT79MxpI4IwKAzI2CcbGM4ORSQQ
         YbrjdY/Tsk6xH9EUipBKayUHOU5t4x0huMldy08I/QWBIyWaQKjuT212cWGQMQ1SP5wH
         aaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/BfGN9I6trd5BkeqeFDlqe8gVjdVzdmFU44UO56dxZA=;
        b=a3PJ8tJZw5PK083/SVigekXPUS8EqY39SY7GNjXrraPoYraWOSY/LC/t7luR6THVPM
         qgjaZryZ+x9m2KaWazq5uXRV/Op6PsvsQK1/j/+L7DcMMHT9hnKngFlWrUE+U490ynkE
         xqsoNIjmD+DK7cVXmkM64oc9Aecs2Covw8I8DeTJ/AqKP7Tn+2WeZnpo1HE5naTATUfX
         kFo8LT2EBPNyc3fMd3N6teoci6ibX9k9tSRWosWjOfVg7qyNCvNSAFXeb60j2ZapIlCL
         WPje0VMHNzxDtCGKbJL4rKcA3yFrALSfL7cFoRdbZ95/eti6jDJgQc14IlZcpJfoYTfD
         G8EA==
X-Gm-Message-State: AOAM530/Vathz6iMnHLrei6QQczcNxGFsVU9ghTttBmtn7A44aXs1XNp
        wEN4XLTmcqo6+/XO6PZfW2AEqsCw7pl5ZDXyeP2E+g==
X-Google-Smtp-Source: ABdhPJymluBRZe0ZRl/0Ybrf9Y3OpI0vaW7hM8e2UvJc8sGk7d30GCtnl4Qw+A7Twj0wuUyAl7G2mgKWdOfasYjUHj8=
X-Received: by 2002:a25:58d5:: with SMTP id m204mr43146231ybb.32.1617726023335;
 Tue, 06 Apr 2021 09:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210406181945.2ae6fed1@canb.auug.org.au> <YGwly0cRvxGpt26D@kroah.com>
In-Reply-To: <YGwly0cRvxGpt26D@kroah.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 6 Apr 2021 09:19:47 -0700
Message-ID: <CAGETcx_JT+1_ZorCeF3CW2T1vGDM2p7uNm3drHeAMFLZTz0JCg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 devicetree tree
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robherring2@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 6, 2021 at 2:11 AM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Apr 06, 2021 at 06:19:45PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the driver-core tree got a conflict in:
> >
> >   drivers/of/property.c
> >
> > between commit:
> >
> >   3915fed92365 ("of: property: Provide missing member description and remove excess param")
> >
> > from the devicetree tree and commit:
> >
> >   f7514a663016 ("of: property: fw_devlink: Add support for remote-endpoint")
> >
> > from the driver-core tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Change looks good to me, thanks!

LGTM too.

-Saravana
