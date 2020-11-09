Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A23B2AB218
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 09:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgKIIEk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 03:04:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:60588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727077AbgKIIEj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Nov 2020 03:04:39 -0500
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B85FF20853;
        Mon,  9 Nov 2020 08:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604909079;
        bh=9Q7Ej8FMdv0rXKtUf/BmiCMGclVMonbVDAszmpw4Rro=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fEv7N4IuoNOKteYwAEk3W8ryvp72P8eJ92KL4FxZMSMtnvXwqCyYt0zVIJ1eV1oN6
         wd2BBlx/2Ysx/Cx/WND0aMqT8ZAD/oedu738XGZnk07thz9FCF+uq2iD7heJw5Fx81
         H8iousTxxHZrwtgEQynVHWT1j8ZeZ4gFCD54U7eg=
Received: by mail-ej1-f53.google.com with SMTP id o21so10894099ejb.3;
        Mon, 09 Nov 2020 00:04:38 -0800 (PST)
X-Gm-Message-State: AOAM531SrU9ZZa5SV0yUEmOGJw8Q4X8v+9l2rq/sp7zP8koGvKrcK2Xq
        N9gRsL5+q6TSmxgGX7H9dzXrIW4+Dv9fIvnq7hI=
X-Google-Smtp-Source: ABdhPJzW3tNsQSux6QOy2AxO7QtsbIO1pcMXUW86gfra2hc05tN5dtDZyrFCj3OBbDZgZifMNlOeSDEuxKBmBJ/s1mY=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr13614998ejx.215.1604909077223;
 Mon, 09 Nov 2020 00:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20201109102300.539961bb@canb.auug.org.au> <82fd8221-f903-2646-4b00-a20ae936ff25@gmail.com>
In-Reply-To: <82fd8221-f903-2646-4b00-a20ae936ff25@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 9 Nov 2020 09:04:25 +0100
X-Gmail-Original-Message-ID: <CAJKOXPebMtfnj4v1j9o32rGfzTDFRq1J1hode4VErBTFLcaWWw@mail.gmail.com>
Message-ID: <CAJKOXPebMtfnj4v1j9o32rGfzTDFRq1J1hode4VErBTFLcaWWw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drivers-memory tree
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 9 Nov 2020 at 02:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 09.11.2020 02:23, Stephen Rothwell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi all,
> >
> > After merging the drivers-memory tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > In file included from drivers/devfreq/tegra20-devfreq.c:18:
> > include/soc/tegra/mc.h: In function 'devm_tegra_memory_controller_get':
> > include/soc/tegra/mc.h:211:1: error: no return statement in function re=
turning non-void [-Werror=3Dreturn-type]
> >   211 | }
> >       | ^
> >
> > Caused by commit
> >
> >   1f1997eb44b1 ("memory: tegra: Add and use devm_tegra_memory_controlle=
r_get()")
> >
> > I have added the following fix patch for today:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 9 Nov 2020 10:19:44 +1100
> > Subject: [PATCH] fix "memory: tegra: Add and use
> >  devm_tegra_memory_controller_get()"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  include/soc/tegra/mc.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> > index 43876216de34..d731407e23bb 100644
> > --- a/include/soc/tegra/mc.h
> > +++ b/include/soc/tegra/mc.h
> > @@ -207,7 +207,7 @@ struct tegra_mc *devm_tegra_memory_controller_get(s=
truct device *dev);
> >  static inline struct tegra_mc *
> >  devm_tegra_memory_controller_get(struct device *dev)
> >  {
> > -     ERR_PTR(-ENODEV);
> > +     return ERR_PTR(-ENODEV);
> >  }
> >  #endif
>
> Krzysztof, will you be able correct this typo locally, or should I add a
> new patch?

Send a new patch please with Stephen's reported-by.

Best regards,
Krzysztof
