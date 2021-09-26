Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B3F418B4C
	for <lists+linux-next@lfdr.de>; Sun, 26 Sep 2021 23:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhIZVsl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Sep 2021 17:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhIZVsl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Sep 2021 17:48:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58724C061570;
        Sun, 26 Sep 2021 14:47:04 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t10so68034057lfd.8;
        Sun, 26 Sep 2021 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jxl3/g6PVeSalPBi76/iMXK21rRE+SBNbk8iMgPB92A=;
        b=QsZJqPJg2fWewB2ZMLqdyORUx3LLGUoppAOQBfZUrYB/5lre/mi9fplLK7Mbq/mC9g
         9wrI0ox3TYESsIb7WvoM7eUR3EWv0uMCM/h2wsenMnlUiReM+b9FGj2XfpcAZjkojW5c
         atfpSfjx+SRo1jBAfnhzz0XJ6W0Roz12T6tyq5vC3IpfUGnxwXEJw9p3FsZ4YRcesdmt
         oDW2uUp68GEyLRpQL+3r0WsskEACJVJ2Iw5n6IFF+gVG3R7OgBd6QIYIq8pCbKWh1koM
         deQ0xd+NOFj0YxVYTh3RdoxhuKxU3XOBVxbArzwHV/QkGFVbE7oallV9FJkupn/MaBDm
         WqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jxl3/g6PVeSalPBi76/iMXK21rRE+SBNbk8iMgPB92A=;
        b=LVottqoZZ62S9v1GImMjkZJy4HVcxf2pI8VlCwY4XJB+IZjAfgU+1wDiQ+WZqX6c9l
         ZTurDJ2TdSSXedIS+QnVdiX3g3JcuJOTZJ5wTtbP+TCLTUmzruAUz26hawuDbfneroIU
         KuYtHUBQpWmjz2Gx1NJs6ujECHLyyKYbiDQOrR6wYrI0diOF8MGFxCLto+on9qyR6zj5
         YVPpxn7QVDZG3NiJA79MHqjCqvXmBU5i8PtDENCGVVa+4ivmhsXMTcThXK3OMSf77b0O
         xg8RehjZQspdSGU1cWi3bYg5XVcOKJtYJQP9qV2fOYUpF8bBWD/KXVoS/VuzZ8KrNjoO
         UhaQ==
X-Gm-Message-State: AOAM532WrG1QY1PXZjGgVcYstOaK9bG5MOHHrAH2OuTbMKx00lAtfrLo
        tKTbUopSXNcD/6kX4T58x88AqhB7psg=
X-Google-Smtp-Source: ABdhPJx1RxwHz37eKQiy/BVclDr7zq8qI79oYiU3HNv9poEuI1m3eSjZg82gAGp2uPVITPe4U4PvcA==
X-Received: by 2002:ac2:4c1a:: with SMTP id t26mr21205090lfq.186.1632692822591;
        Sun, 26 Sep 2021 14:47:02 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id n9sm1393723lfe.188.2021.09.26.14.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 14:47:02 -0700 (PDT)
Date:   Mon, 27 Sep 2021 00:47:00 +0300
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ntfs3 tree
Message-ID: <20210926214700.6mukvekkzqavyczw@kari-VirtualBox>
References: <20210921083158.261517da@canb.auug.org.au>
 <3320944d-8fac-0a22-ee38-f08974fcaed7@paragon-software.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3320944d-8fac-0a22-ee38-f08974fcaed7@paragon-software.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 21, 2021 at 04:50:02PM +0300, Konstantin Komarov wrote:
> 
> 
> On 21.09.2021 01:31, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   0412016e4807 ("fs/ntfs3: Fix wrong error message $Logfile -> $UpCase")
> > 
> > Fixes tag
> > 
> >   Fixes: 203c2b3a406a ("fs/ntfs3: Add initialization of super block")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Maybe you meant
> > 
> > Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> > 
> 
> Hello.
> 
> You are right, correct SHA is 82cae269cfa9.
> Sorry, I've missed this while applying patch.
> 
> As far as I know there is no way to fix this now -
> commit is already in linux-next.

This still is not fixed. Can you Stephen verify that rebase is ok in
situatian like this? Also now we have situation that this thing is 6 day
old already. I actually also do not know if it is ok to rebase anymore,
but, probably is. I have checked every follow up patches which has been
applied after this and they are not affected if we rebase.

  Argillander
