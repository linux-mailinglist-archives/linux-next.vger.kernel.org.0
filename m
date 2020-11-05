Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387152A7830
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 08:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgKEHpS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 02:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgKEHpR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 02:45:17 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88A9C0613CF
        for <linux-next@vger.kernel.org>; Wed,  4 Nov 2020 23:45:15 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id s10so866289ioe.1
        for <linux-next@vger.kernel.org>; Wed, 04 Nov 2020 23:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gw4vmbm6+5GWDF0o5XQrpTP9RNmsK2gI8aXamFks1M4=;
        b=OKOUfNxNRVhP5T2+TMkFnJ/zGX49hm358GxrWFrjQrThN468dkcuzvhnyvRT5PwMIj
         Y+elqvzOdUbxaF6z6yzus1OIOM1iZ+7acUoDFVo63iCxVriRfze8i+CPCgtLy3Q/g1qM
         EihToU9qbzTfLVJltYXNSZkUWBxxe8erOo4CXWg0SU20A/+zY3GvPx7+XREeZEmvm4Sv
         Z/pYs0ivYeeqs4cdIDaiK9DpjWASjt6lqZkvGlg0NdiWzma+zTnlM1GPw2V4WbE2HVZA
         IIzX/6wKxO5iKlBpccg2uwGiYlSWsGTfgPxSlzR8YA+8j4b5F60TZ53JNRRexxgwnft3
         /+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gw4vmbm6+5GWDF0o5XQrpTP9RNmsK2gI8aXamFks1M4=;
        b=B8m1OslSpierDkE/14cXd5HGor5py50prx0BcBnSMz6lw18lVDeAzwI1Eu4zh9RA8v
         wJSXTYDg0tZFxvNb+63uUXacINQQy6+B/0oPKvLXl4rntjECRq8NDct31TEG5puUBUrh
         PhFra/i7+pmFlkuRahXGvVBjqcGkeZzh8ATa6pe7ocDS4W+krJ73hoBUU2dC/O4S+z1d
         pao5/4R4amzCzrEA902492oVHRf3XTiqtqpTUVHAYKzvWI6cqBVS+au4Cn7TfKEMLAPC
         cKr1AFjJuwY1Kr5AXkXHPsE3YPUWA61nvm/hyNBzHzXdfIWHnDxqFYldpZnD4bx+NguR
         nm3A==
X-Gm-Message-State: AOAM532Dtkc4taaq5nOyRH9i7t1rP1FoVCC84UyyNmuTi1IWde+kjZ/I
        lK37mtLJqN0PbKbgMcQuUa8bIS7zxZjGwpMwZfLBew==
X-Google-Smtp-Source: ABdhPJyDZ5pxgd2Wi2zKaLXYJKjVIIA0f7RlOZgGQat9zzZ2HsLcRi/sUQBYL5mE7CdjUT6xtNJyYJyea0xlUAPCc7Q=
X-Received: by 2002:a02:1783:: with SMTP id 125mr1072347jah.121.1604562315167;
 Wed, 04 Nov 2020 23:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20201105174549.614c2de4@canb.auug.org.au> <20201105070311.GU4879@kernel.org>
 <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
In-Reply-To: <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
From:   "Anand K. Mistry" <amistry@google.com>
Date:   Thu, 5 Nov 2020 18:45:04 +1100
Message-ID: <CAATStaMEn_CSfvc=JTawGhL8yt3L0cci8XK9ru+F6RGzRcYJ7A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SNIPPED

> >
> > Looks like left column became too wide, so rather than shift the right
> > column to the right, I'd suggest to drop underscores in Speculation*.
>
> Hm. That makes it inconsistent with Speculation_Store_Bypass. I guess
> it's the lesser of two evils.

Oh, do you mean renaming the existing Speculation_Store_Bypass? I
thought that was a big no-no for the kernel?
