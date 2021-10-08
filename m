Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88B34271C9
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 22:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241974AbhJHUFh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 16:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241919AbhJHUFg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 16:05:36 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC87C061755
        for <linux-next@vger.kernel.org>; Fri,  8 Oct 2021 13:03:41 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g14so9091709pfm.1
        for <linux-next@vger.kernel.org>; Fri, 08 Oct 2021 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+S9WDoHB2ctsz8gJt0x5mA2ZJmsZ+eXZU78CjrUXBMo=;
        b=RVsXQbTV9pwVKNdOocVZrneAFAQRQBRzzkwCm7c0DFFnVR19u3z7rBJhHu8hASsGRe
         9bi6stVBMQCxs6aX+4+BM+y/FclkQ+AtRlok3aEaozwQ3sh+pXfa3yXrk6V9hT7zgsbD
         qsTYIMJurK3aPaGwBha3Xa7XkBgrLfH4Qm1HbxZG3IUWOv4Vdt5/pyPUMj6hAtlS1qVP
         bUDLhCi85Gplzne1WtvBKJEU8qM3Dw5fNDYKLsvZa9H8bYPFq0qzTvO15yWi5zNzW9+j
         I93N6JM8fALbhrcamBJJgA02oTBHIUXqA/mFA0kA0ON/3Eumtn9/wEtrQRqa/dkGcCBY
         9L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+S9WDoHB2ctsz8gJt0x5mA2ZJmsZ+eXZU78CjrUXBMo=;
        b=3x4aOIzTUDH1IlCJHh/e2Gc8dZpZwIeh5qFPVBUcwraouhy9KnEOnRtC5R852r6H8G
         eBu4DoA6nVnFZ299uSLOYtOzHSVCfTeB4++C8Q+PMH8hemw9Z5N/Wgb70QivcfxIIGXs
         2f78HaUSocrOp46W+PfuYB1GBk+O6v+yVVgvkT0QRpTOdHQ0IijSFAYBPAuHBsMA9494
         g1BvD9VgtVdCthxwxFGa2QKpWS+Js087luNiCFkZfCCWJofUD9EIawl1uWS1RDKKgZzC
         KJA/54vJss0SSO5DzvOLZBeBNH444nl6j2umUGD8WMpjxvFO/VQ7bB+WMGDViH66+v1B
         lDGA==
X-Gm-Message-State: AOAM533qMBlYF+EAsufrLxXieKLKeeVO4eblnpXwsX1KIJ/xFDfhjVqm
        KUeKnU0XFf9FaD72VBl4lZUooN8t5jdh7pJAn1WZOQ==
X-Google-Smtp-Source: ABdhPJzXkcaP9PLLmBjsn9tqqkyO3G/0oDwaUxOwFj7quPcPcrA9UpECQPVco+koRgT/SeIjcKwliFYe26XoKyTpcDw=
X-Received: by 2002:aa7:9517:0:b0:44c:7b4a:8073 with SMTP id
 b23-20020aa79517000000b0044c7b4a8073mr12069614pfp.24.1633723420416; Fri, 08
 Oct 2021 13:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211008152930.03787395@canb.auug.org.au> <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
In-Reply-To: <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 8 Oct 2021 13:03:29 -0700
Message-ID: <CAFd5g45g91ZadTJrU3oE+VHxZ_2kgDnZm0uyTiaxR+bP=qg9fA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To:     Daniel Latypov <dlatypov@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 8, 2021 at 9:31 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 10/7/21 10:29 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the kunit-next tree got a conflict in:
> >
> >    tools/testing/kunit/kunit.py
> >
> > between commit:
> >
> >    d8c23ead708b ("kunit: tool: better handling of quasi-bool args (--json, --raw_output)")
> >
> > from the kunit-fixes tree and commit:
> >
> >    6710951ee039 ("kunit: tool: support running each suite/test separately")
> >
> > from the kunit-next tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
>
> Thank you for the fixing it up. I will fix this up in the kunit-next once
> the kunit-fixes pull request goes out.

Thanks for taking care of this everyone.

Daniel, can you double check the merge conflict to make sure it is
done correctly?
