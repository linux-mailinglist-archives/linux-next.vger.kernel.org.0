Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B782954F8
	for <lists+linux-next@lfdr.de>; Thu, 22 Oct 2020 00:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441886AbgJUW57 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 18:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439137AbgJUW57 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 18:57:59 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28BAC0613CE
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 15:57:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w25so69738edx.2
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+ZoVNjv91OFnQPk8TxICeY1F8FEXDM/PpIvwrVAr3A=;
        b=G1B3B1S+r+GXukOnw5FSJ8HgL8jIehIscl4Tlfg0CeTQt4PRNr/DjaNj2srG+1BhDj
         uBgkPfe5DEisi46kYZiHeJca/PksiTESFUWTqOGVGK+IvNdHG8NYMVIY9axXLHurqRBr
         bv6R+ErJWPtQhlk/J9FrIaFHCry0ukhFnaBXtd2qwxu4gnUUUIdZcAjXLjIFMHUOFldb
         bJFXYqSfBmqmc+9wBdDkiEh5beRVmtWcdaomabn+9GdNzIVfvCRHIwEqnuOOMUyxRzUi
         t/LaJfteBGtl5fxEeZQkAWk3oY3Jdd/4Zi8rl9sd2UBJHB+oh0mudy6d0RYpRc8MT2te
         9aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+ZoVNjv91OFnQPk8TxICeY1F8FEXDM/PpIvwrVAr3A=;
        b=uUqoIZ3ANjB7+anaaAOpUKmMh1oPNwsWomqqpFMoz/Rnq8stMiWltZiRkybazQDDBN
         VlQJSY0MX9JgH6Vr7WaGslw3uDu5NEJNNeqrh+gO/EuEtjD94SPThJPjaehdvdrvvjsc
         RqOYQ9LWc63s9GI8RNggX5/VRKZYOHC7pd4t4zFGd8nSI1NlDsTYxWHMRY52FMW0Ntp1
         ZjJMKrOYk1gSrnnRn52jxy2eGNbOY/UQJWqxOOXGDpeLO1C29QUU2YYvfbQ2IqyZZjQ5
         bjzbWHwGipt95HmGl7WgTI6DUqJ98/G11E2KWKzuywmuHlPr9gCSAPhv8nrNFEdLrCdd
         cNFg==
X-Gm-Message-State: AOAM533HM4yEMurxOT1kxMLu6Fxa+CswM1t/7MQ8hj1yddb1Y/2aUlV5
        BG9I/u1/Vni71Jr2hTcuh84G8K1cYQnUC2ee5VDUqY0XGCw=
X-Google-Smtp-Source: ABdhPJx44KVeOQcByi3BEORCM/h/9NgIXKn+hQctd5AD6XDpE/sC5/8DyV9N8D4AwjyzkqGnraPNO72FIBpzD0bp/MI=
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr5150002edf.18.1603321077446;
 Wed, 21 Oct 2020 15:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200908200950.1368e71b@canb.auug.org.au> <23624101c03e9f60e66bac5c9739769931968c32.camel@intel.com>
 <CAJfpegsFb6SB74ezwqD=5YUw_8XaREm1q88ontkpWzQ+9V0OxQ@mail.gmail.com>
In-Reply-To: <CAJfpegsFb6SB74ezwqD=5YUw_8XaREm1q88ontkpWzQ+9V0OxQ@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 21 Oct 2020 15:57:46 -0700
Message-ID: <CAPcyv4ifFfASkdSG7cjT7FdVC5x8hxFEnMhHpjnGPz_pkMYd9Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "jgross@suse.com" <jgross@suse.com>,
        "bo.liu@linux.alibaba.com" <bo.liu@linux.alibaba.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "stefanha@redhat.com" <stefanha@redhat.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "vgoyal@redhat.com" <vgoyal@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dgilbert@redhat.com" <dgilbert@redhat.com>,
        "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 16, 2020 at 12:45 PM Miklos Szeredi <miklos@szeredi.hu> wrote:
[..]
> > This is broken... it needs to be converted to 'struct range'. I'll take
> > care of that when I respin the series. Sorry for the thrash it seems
> > this is a new memremap_pages() user since the conversion patches
> > landed.
>
> Hi Dan,
>
> I'd like to send this upstream and this conflict needs to be dealt
> with some way or another.   Can you send the correct fixup against
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#for-next

Sorry, I just circled back to this and found your for-next branch is
already merged. The resolution looks good. Apologies for not taking a
look earlier.
