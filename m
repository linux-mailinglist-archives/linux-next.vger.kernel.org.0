Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506DF34CD08
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhC2J2g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhC2J2W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 05:28:22 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978B8C061756
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 02:28:21 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id l8so4698012vsj.13
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PlfJgtRT8nBB4ig4/WqZyrKPRSIskxsk0bidAac7oR0=;
        b=hXGwSHDRv0UvpC2upZ4njNU/tXxfXh7UgVZb8eJWQBSShULE94Nh6Ye8OzzxiRhXq8
         /bzekzhgp/PWs5DAO6KgCovwVzJ+Z4/aunj8pUYYztrjolvqjCee0QS9irtXNyYf0Ilf
         ncAXyf/g7qvBbJqTt325Zf+EHHSqPNhr21g4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PlfJgtRT8nBB4ig4/WqZyrKPRSIskxsk0bidAac7oR0=;
        b=LOVEFDLR/B9iG6fbq+KRLXHSEyxg8EXlXpJ8Mb25N+J27GbVGj3HPeLQVFMaBxANg8
         pwDGTMXOVroV7ZgcsxsIgIKYmNUeE6VP5avDtrWeUh8dhmxxdtMo9KmG2qGvn0NPO4W5
         pKPL5clJj4YCueLfwPTcPYfFH8uvlJYpllz5H6DvCWBFbK77dr9gLITN/n8UyJI3zHpG
         j1+zfZ/nk4btlP20XDPcXkTRxcLxU/pN7ki2C+VinoI/AASqQlReRl9UZZTGAVY+CpH0
         zvw+nXQsxLX756Y0rgTq/q4ecy5SoZayC5u75czYE/8pah6Hs7HTf/AEGvi+TSTE2muC
         H0HQ==
X-Gm-Message-State: AOAM531JiPmIuszXjbJiA61DRegkikfyNzOa3R6CB2yMqZovnmkWbikI
        i+xPlfNm4eAHxXChn26WVMrfEd3//VvmRQTTW2N54Q==
X-Google-Smtp-Source: ABdhPJxyabzZnwOPIy8z8D5saMOlARulAE/muNaXxj/+m5FvlWC8xS5whDZcTzH6ZOraZ+LRzHwnX289BYKF0UqtELA=
X-Received: by 2002:a67:e056:: with SMTP id n22mr6466748vsl.0.1617010100811;
 Mon, 29 Mar 2021 02:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210329201426.78d4b28b@canb.auug.org.au>
In-Reply-To: <20210329201426.78d4b28b@canb.auug.org.au>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 29 Mar 2021 11:28:10 +0200
Message-ID: <CAJfpeguWeWp=648jtvaxNc+RFShTGDa=_gMDuq72qznt5LqQvw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Frank Rowand <frank.rowand@sony.com>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 29, 2021 at 11:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the overlayfs tree, today's linux-next build (htmldocs)

Hi Stephen,

I think you mixed up drivers/of/overlay.c with fs/overlay/.

Thanks,
Miklos
