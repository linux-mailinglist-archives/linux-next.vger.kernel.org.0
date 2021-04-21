Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88FA7366BEB
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 15:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240208AbhDUNIj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 09:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241040AbhDUNHk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 09:07:40 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52E1C061346;
        Wed, 21 Apr 2021 06:06:51 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id r20so13641941ejo.11;
        Wed, 21 Apr 2021 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NF62lDVsQt04hH2B9Wki6giRIoml6Qiuq3Q8CuUfCRo=;
        b=XGGIQbuC2dEPTL2EO4Kd7PI8FlwkSywJFMj+ocmrvhn3IU7sX9ehbCOkdI/8WOw4sN
         jDJmEQDff085HRxggLQS0hIK3SmRk8HG4bXnE0ls2LE0UwHJdH66jgXDvS8bILIPd/0k
         BzdamnzuH+ClUZ3444HBACI18mfkjElUGQ/9AusO8VaAxTbRyIEa7sLY4JYkDPpgf+q7
         D9Zr9/n/3DiNfzR5ncdCKVEC18P1RhUoXCfvtSi8D1NMcRWC48Puq1yuNKxHe9PlgkEc
         Ol9ozFGjsKUr96y5HaW9lB1lF1hhDf+9hSq4NEPBriK0+tG5aGOKrWfjKMGcFSke0DuM
         Hulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NF62lDVsQt04hH2B9Wki6giRIoml6Qiuq3Q8CuUfCRo=;
        b=Duo12ch6KnLLjcFuS2FvoHlEXzxJJfE2olr0qTfW56IiwSwCciBfOVHjN0UsGEMBqk
         5ENKYFzYvRcmjIytTyaxOWrpYNa7SPFpGI8bbESa8bKimF8yGItL9Hj/gkKL7If/PlJQ
         7tZCTokBpg4pVKaP3zDiwS4rJODGMazgslnR1L/HvnNZbwdDGxaYfSpT6um063Xb/rtt
         9XSXIEY3kmUoSIXde06FABtzAPrBEE0lGrWqYQ5w3hN3iut1mFa54EwwjMTDHOPHciIX
         4DLj233YRHbEkqHJpqVC4fzKI1WzUWgcnV6OR15gRJNuUOgwEVtVCdGUxEruCxl9YXYM
         GqjQ==
X-Gm-Message-State: AOAM533vrGRh/JHN7eyVktd87WW3CEawMjuxReKlOPeSTqNwRboCASQS
        H+WpiDMKEDc+dxeBIJFu2pnZld7CYWrozPsIFg==
X-Google-Smtp-Source: ABdhPJxoBmUNx9eX0oYOFhSIg2Y4F2e334SIF1OdXk+N9gVrawGwsjSNVDFq7zak9tQ1k0QeymJIbZBah//ut4I4GBc=
X-Received: by 2002:a17:906:9ac5:: with SMTP id ah5mr32008102ejc.360.1619010410401;
 Wed, 21 Apr 2021 06:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210329200348.24a9a8be@canb.auug.org.au> <20210421162320.1e3ff588@canb.auug.org.au>
In-Reply-To: <20210421162320.1e3ff588@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Wed, 21 Apr 2021 08:06:37 -0500
Message-ID: <CAL_Jsq+0aPu75-mfQ+udkWWpJ3734J72V3fuXa_nzK9wfaX30Q@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grant Likely <grant.likely@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 21, 2021 at 1:23 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 29 Mar 2021 20:04:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging Linus' tree, today's linux-next build (htmldocs) produced
> > these warnings:
> >
> > include/linux/of.h:1211: warning: Function parameter or member 'output' not described in 'of_property_read_string_index'
> > include/linux/of.h:1211: warning: Excess function parameter 'out_string' description in 'of_property_read_string_index'
> >
> > Introduced by commit
> >
> >   a87fa1d81a9f ("of: Fix overflow bug in string property parsing functions")
> >
> > I assume that these warnings have turned up now due to better(?) tooling.
>
> I am still seeing these warnings (as of next-20210420).

A fix is now in my tree.

Rob
