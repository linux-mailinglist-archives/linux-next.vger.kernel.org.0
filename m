Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C00206A21
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 04:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387794AbgFXC1n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 22:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387719AbgFXC1n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 22:27:43 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327B2C061573;
        Tue, 23 Jun 2020 19:27:43 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 18so497803otv.6;
        Tue, 23 Jun 2020 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gZQnvXpknW+rN20YHdcJ+Ylfzfin7eHSMN5K0zI8wKM=;
        b=Lu853MjaeLGiuwcz+/VJ4vCOPidwiJ0QXUFF8p8giMtX6IQJi95CCn7a/nGfNLYt9P
         RGpDPgW9qHlT+ZzC4HhwKfD0aRUqkmDMpxrYzUHgwQhJE7eOgk5Cp1CY/osP5xpWJsFg
         2+htiESAWiebk1C57ehAJijBgA3LWDr8P+4GvuzefWIFFV7aBMP79mw+S1ahFDC1+HJC
         fwIqjRRp6yS/W+YhNrKhViHvacTr/WOmUFCpeyeuiXMx7xov/Z0ER8VsVtYI5QbvJODX
         MH6SIyz4GXWAOoO4UND2zJo+B4kWYD/cF2TqVkI+2qU41IHWEbzLO85Wo3O09ow1E19x
         lVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gZQnvXpknW+rN20YHdcJ+Ylfzfin7eHSMN5K0zI8wKM=;
        b=HU/+quPlPAC/XdxTxCDw/yCPcyW/mOCQiUrWvsvgS53iSsAe+awv9J/MayfgOki0Mu
         mKn0C6WmGeJ3rePJieGlJfvyYbI5pCFNE7O1NIgi9Y6g+O1RAKERY9+8jg/BQmx+s+1L
         oFAp0Z5eT7Br8hds4o2j/eO8g6789nUf6K2cFtny/UKpdygF3EhroTlDnPQukeQdAX3b
         CvC+OW14UwV6tq2/Dx5iVYFtalzXxF5hyJnRd0jh4M4uf9tLkZNw2o6Mbz/81RzHJJFL
         9Pdr+/A+NYavDBc43uPvIdoOHLNebpTDRSyamwknWXUcSP7mDWl437DdCKiI7CeOI0v3
         gXBQ==
X-Gm-Message-State: AOAM5303tonGdSOxl2Q307ab2SSuQgF0JBgh1V3LaxenXmW/gObmOiij
        Z4/mAiSL6yVM5WRfiukIC2A=
X-Google-Smtp-Source: ABdhPJySA6GoUbHOYfx6fZOfJBu0OnsW+/ao6svZyzlL6ta5ow0SJTi5nhpXZ+Dsav1Qep4vroZROw==
X-Received: by 2002:a9d:38a:: with SMTP id f10mr22049923otf.230.1592965662408;
        Tue, 23 Jun 2020 19:27:42 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id b2sm4740084ooe.13.2020.06.23.19.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 19:27:41 -0700 (PDT)
Date:   Tue, 23 Jun 2020 19:27:40 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cristian Klein <cristian.klein@elastisys.com>
Subject: Re: linux-next: build failures after merge of the hid tree
Message-ID: <20200624022740.GA199301@ubuntu-n2-xlarge-x86>
References: <20200621140421.7f4552df@canb.auug.org.au>
 <20200623103736.25f67de5@canb.auug.org.au>
 <nycvar.YFH.7.76.2006240012170.13242@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2006240012170.13242@cbobk.fhfr.pm>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jiri and Cristian,

On Wed, Jun 24, 2020 at 12:13:57AM +0200, Jiri Kosina wrote:
> On Tue, 23 Jun 2020, Stephen Rothwell wrote:
> 
> > > I don't know what caused it, but commit
> > > 
> > >   470376737e88 ("HID: allow building hid.ko as an external module")
> > > 
> > > did not fix it.  BTW, I build with "make O=...".
> 
> That's actually the patch that almost certainly broke it.
> 
> CCing Cristian (author of that patch) and Nathan, who apparently sent a 
> fixup patch for this, but I haven't seen it, as our corporate mailserver 
> had severe issues yesterday.
> 
> If there is no resolution by tomorrow, we'll just drop it.
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

Sorry, I was not clear in my message about what I was "fixing", which
was the fact that Cristian's initial reply was top posted, which I moved
to the bottom. I thought that would have been apparent in a mail client,
my bad :( I have not sent a fix for this issue.

Cheers,
Nathan
