Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C51413558
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 16:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhIUObY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 10:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbhIUObV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 10:31:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64178C061574;
        Tue, 21 Sep 2021 07:29:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y28so80176524lfb.0;
        Tue, 21 Sep 2021 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WCNKwsAyHNtvWyuyUEt95scCqIAWLGx1TnGxilaAev0=;
        b=MudXVZjp8K69x/6TdRNJbQNjthXm4K00PypWcBb8X03iBnWMe9VPdLli/duLtwrNGP
         rV4uBXJNOG2g5KVjHHVZSFYidCAer7K68uxdCrTlz5iYvxdbtitzCKsutQza9TZMx0uh
         IO09ubFZjfW24lJVHkfVpjs7EZor64FvkvSnOLVbF6pZzQpl9ouPvNaVSHtqN0PM1hoV
         Zgk4biSK8D4/7Tf8M6zmG42bj0IjD6ovYWCMivxfMCEPM+ydVU0CkNOjq4JhevzQlkW/
         U8L2vuAkTkMhnoiwgBr5stESWJmnbHVqBS3h1E/iQSAbSblM4ZeSvssFB1MfqRSyy5LC
         V2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WCNKwsAyHNtvWyuyUEt95scCqIAWLGx1TnGxilaAev0=;
        b=pnj5NKwiZlGuS8tX9PF/q0G444YC9dB4tuLsbmHYaWRbyezN3edjX5t0NlJwXN5+6C
         /2EHuRbqkYC8Ntkm3okVQMUTiCUv0BPVA3pe7gGI6+o2IWMesEq0Gs8ORzFsW30smWxV
         0cdrOzFrs+eWXl8kXTxCyXTOsBsABDHdMyXGSR5Ql2CW8MgmZn4fbU/72iMZrXsTuoHk
         8mboBG5s+Zi7tugF0D0orpxoxCqxxN4id+38/Ibrno2nMoS5GnSodbPKrn9M1jUE5aTb
         pL/bl0/h8Wh4Ga/HwPZ+OzZorUE4du2vHRu3JO+Fdh7Ca5snCF0Yph2WKl+DkHEFLUT4
         tvSQ==
X-Gm-Message-State: AOAM533jeDY6ip2vKdqryctwORa8ohpCj8hR5rpisQqFEDqWBnSQZfrO
        U1jv6zDdmSW/gGvZBziJRly9yIaN/1g=
X-Google-Smtp-Source: ABdhPJxXTSJt/ZlSFJtAYESfI97fqxJGpEjO1h4Xb5m6rggdWGrVPuS5jMxXV65Fxd9zAtxJd2xSnQ==
X-Received: by 2002:ac2:5fb2:: with SMTP id s18mr23064668lfe.580.1632234562226;
        Tue, 21 Sep 2021 07:29:22 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id v14sm2152646lji.32.2021.09.21.07.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 07:29:21 -0700 (PDT)
Date:   Tue, 21 Sep 2021 17:29:19 +0300
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ntfs3 tree
Message-ID: <20210921142919.ahfrtqcu7lpenzsz@kari-VirtualBox>
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

Sorry also from my part.

> As far as I know there is no way to fix this now -
> commit is already in linux-next.

But these things needs fixing. Rebase is needed.

